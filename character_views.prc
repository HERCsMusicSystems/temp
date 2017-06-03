
program character_views [chattr decor decormt decorpt view_language view_culture view_appearances view_status view_reputation
						view_skills process_relative view_advantages attrb lgdc
						view_hand_weapons
						]

[[chattr *res *ch *ATTR *attr *value]
	[*attr *ch *value]
	[SELECT [[is_text *value] [= *value *v]] [[= *v [*value]]]]
	[*res *ATTR " &nbsp;<font face='comic sans ms' color=blue><i><u>&nbsp;&nbsp;" *v "&nbsp;&nbsp;&nbsp;</u></i></font>&nbsp;&nbsp;"]
]

[[decor *res *attr] [is_number *attr] / [*res " <font face='comic sans ms' color=blue><u>&nbsp;&nbsp;<i>" [*attr] "</i>&nbsp;&nbsp;</u></font> "]]
[[decor *res *attr] [*res " <font face='comic sans ms' color=blue><u>&nbsp;&nbsp;<i>" *attr "</i>&nbsp;&nbsp;</u></font> "]]
[[decormt *res *attr *times] [~ *attr *times *at] [trunc *at *vv] [max *v *vv 1]
		[*res "<td style='font-family: comic sans ms; color: blue; font-style: italic; border-bottom: 1px solid;'>" [*v] "</td>"]]
[[decorpt *res *attr *delta] [+ *attr *delta *at] [trunc *at *vv] [max *v *vv 1]
		[*res "<td style='font-family: comic sans ms; color: blue; font-style: italic; border-bottom: 1px solid;'>" [*v] "</td>"]]

[[attrb *res *value]
	[*res "<td align=center style=\"border: 2px solid black;\"><font face='comic sans ms' color=blue><i>" [*value] "</i></font></td>"]
]

[[view_character *res *character]
	[SELECT [[is_text *character] [text_term *character *ch] [= *module *character]] [[text_term *module *character] [= *character *ch]]]
	[delallcl *ch] [+ *file_name *module ".prb"] [batch *file_name]
	[*res "<center><table>"]
	[*res "<tr><td colspan=2>"]
	[*res "<div style='float: left;'><img src=/resources/gurps.png width=100% /><br/><font size=+1><b>CHARACTER SHEET</b></font></div>"]
	[*res "<div style='float: left;'>&nbsp;&nbsp;</div>"]
	[*res "<div style='float: left;'>"]
		[chattr *res *ch "Name" name *]
		[chattr *res *ch "Player" player *]
		[chattr *res *ch "Point Total" point_total *]
		[*res "</br>"]
		[chattr *res *ch "Ht" height *]
		[chattr *res *ch "Wt" weight *]
		[chattr *res *ch "Size Modifier" size_modifier *]
		[chattr *res *ch "Age" age *]
		[chattr *res *ch "Unspent Pts" unspent_points *] [*res "<br/>"]
		[chattr *res *ch "Appearance" appearance *]
		[*res "</div>"]
	[*res "</td>"]
	[*res "</tr>"]
	[*res "<tr>"]
	[*res "<td>"]
		[*res "<table width=100% style=\"font-size: 2em;\">"]
		[strength_cost *ch *strength *strength_cost]
		[*res "<tr><td><b>ST</b></td>"] [attrb *res *strength]
		[*res "<td>[" [*strength_cost] "]</td>"]
		[hit_points_cost *ch *hit_points *hit_points_cost] [current_hit_points *ch *chp]
		[*res "<td><b>HP</b></td>"]
			[attrb *res *hit_points] [attrb *res *chp]
			[*res "<td>[" [*hit_points_cost] "]</td></tr>"]
		[dexterity_cost *ch *dexterity *dexterity_cost]
		[*res "<tr><td><b>DX</b></td>"] [attrb *res *dexterity] [*res "<td>[" [*dexterity_cost] "]</td>"]
		[will_cost *ch *will *will_cost]
		[*res "<td><b>WILL</b></td>"] [attrb *res *will] [*res "<td><br/></td><td>[" [*will_cost] "]</td></tr>"]
		[intelligence_cost *ch *intelligence *intelligence_cost]
		[*res "<tr><td><b>IQ</b></td>"] [attrb *res *intelligence] [*res "<td>[" [*intelligence_cost] "]</td>"]
		[perception_cost *ch *perception *perception_cost]
		[*res "<td><b>PER</b></td>"] [attrb *res *perception] [*res "<td><br/></td><td>[" [*perception_cost] "]</td></tr>"]
		[health_cost *ch *health *health_cost]
		[*res "<tr><td><b>HT</b></td>"] [attrb *res *health] [*res "<td>[" [*health_cost] "]</td>"]
		[fatigue_points_cost *ch *fatigue_points *fatigue_points_cost] [current_fatigue_points *ch *cfp]
		[*res "<td><b>FP</b></td>"] [attrb *res *fatigue_points] [attrb *res *cfp] [*res "<td>[" [*fatigue_points_cost] "]</td></tr>"]
		[*res "</table><hr/>"]
		[basic_lift *ch *basic_lift]
		[*res "BASIC LIFT <font size=-1>(ST x ST) / 5</font> "] [decor *res *basic_lift] [*res "&nbsp;&nbsp;&nbsp;&nbsp;"]
		[damage *ch *damage_thr *damage_sw]
		[*res "DAMAGE Thr"] [decor *res *damage_thr] [*res " Sw"] [decor *res *damage_sw] [*res "<br/>"]
		[basic_speed_cost *ch *basic_speed *basic_speed_cost]
		[*res "BASIC SPEED"] [decor *res *basic_speed] [*res "[" [*basic_speed_cost] "] "] [*res "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"]
		[basic_move_cost *ch *basic_move *basic_move_cost]
		[~ *basic_lift2 *basic_lift 2] [~ *basic_lift3 *basic_lift 3] [~ *basic_lift6 *basic_lift 6] [~ *basic_lift10 *basic_lift 10]
		[*res "BASIC MOVE"] [decor *res *basic_move] [*res "[" [*basic_move_cost] "]<br/>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td colspan=2 align=center>ENCUMBERANCE</td><td colspan=2 align=center>MOVE</td><td colspan=2 align=center>DODGE</td></tr>"]
		[*res "<tr><td>None (0) = BL</td>"] [decormt *res *basic_lift 1.0]
			[*res "<td>BM x 1</td>"] [decormt *res *basic_move 1.0]
			[*res "<td>Dodge</td>"] [decorpt *res *basic_speed 3] [*res "</tr>"]
		[*res "<tr><td>Light (1) = 2 x BL</td>"] [decormt *res *basic_lift 2.0]
			[*res "<td>BM x 0.8</td>"] [decormt *res *basic_move 0.8]
			[*res "<td>Dodge - 1</td>"] [decorpt *res *basic_speed 2] [*res "</tr>"]
		[*res "<tr><td>Medium (2) = 3 x BL</td>"] [decormt *res *basic_lift 3.0]
			[*res "<td>BM x 0.6</td>"] [decormt *res *basic_move 0.6]
			[*res "<td>Dodge - 2</td>"] [decorpt *res *basic_speed 1] [*res "</tr>"]
		[*res "<tr><td>Heavy (3) = 6 x BL</td>"] [decormt *res *basic_lift 6.0]
			[*res "<td>BM x 0.4</td>"] [decormt *res *basic_move 0.4]
			[*res "<td>Dodge - 3</td>"] [decorpt *res *basic_speed 0] [*res "</tr>"]
		[*res "<tr><td>X-Heavy (4) = 10 x BL</td>"] [decormt *res *basic_lift 10.0]
			[*res "<td>BM x 0.2</td>"] [decormt *res *basic_move 0.2]
			[*res "<td>Dodge - 4</td>"] [decorpt *res *basic_speed -1] [*res "</tr>"]
		[*res "</table><br/>"]
	[*res "</td>"]
	[tech_level_cost *ch *tech_level *tech_level_cost] [tech_levels *tech_level *tldescription *tldate *start_wealth]
	[wealth *ch *wealth *wealth_m *wealth_n *wealth_cost]
	[languages_cost *ch *languages_cost] [+ *tldec *tech_level " " *tldescription " (" *tldate "). $" *start_wealth]
	[*res "<td>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td>Languages</td><td>Spoken</td><td>Writen</td><td>" [[*languages_cost]] "</td></tr>"]
		[view_language *res *ch]
		[*res "</table>"]
		[*res "<br/>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td width=10% >TL:</td>"] [lgdc *res *tldec] [*res "<td width=10% >" [[*tech_level_cost]] "</td>"] [*res "</tr>"]
		[*res "<tr>"]
		[*res "<td colspan=2 style='font-family: comic sans ms; font-style: italic; border-bottom: 1px solid; color: blue;'>"
			*wealth_n " $" [*wealth] " (= $" [*start_wealth] "*" [*wealth_m] ")</td>"]
		[*res "<td>" [[*wealth_cost]] "</td>"]
		[*res "</tr>"]
		[*res "<tr><td colspan=3>Cultural Familiarities</td></tr>"]
		[view_culture *res *ch]
		[*res "</table>"]
		[*res "<br/>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[appearance_cost *ch *appearance_cost] [status_cost *ch *status_cost] [reputation_cost *ch *reputation_cost]
		[+ *reaction_cost *appearance_cost *status_cost *reputation_cost]
		[*res "<tr><td></td><td align=center>Reaction Modifiers</td><td width=10%>" [[*reaction_cost]] "</td></tr>"]
		[*res "<tr><td colspan=3>Appearance</td></tr>"]
		[view_appearances *res *ch]
		[*res "<tr><td colspan=3>Status</td></tr>"]
		[view_status *res *ch]
		[*res "<tr><td colspan=3>Reputation</td></tr>"]
		[view_reputation *res *ch]
		[*res "</table><br/>"]
	[*res "</td>"]
	[*res "</tr>"]
	[*res "<tr><td>"]
		[advantages_cost *ch *advantages_cost]
		[*res "<table width=100% style=\"border:2px solid;\">"]
		[*res "<tr><td align=center>ADVANTAGES AND PERKS</td><td width=10%>" [[*advantages_cost]] "</td></tr>"]
		[view_advantages advantage *res *ch]
		[*res "</table><br/>"]
		[disadvantages_cost *ch *disadvantages_cost]
		[*res "<table width=100% style=\"border:2px solid;\">"]
		[*res "<tr><td align=center>DISADVANTAGES AND QUIRKS</td><td width=10%>" [[*disadvantages_cost]] "</td></tr>"]
		[view_advantages disadvantage *res *ch]
		[*res "</table>"]
	[*res "</td><td valign=top>"]
		[skills_cost *ch *skills_cost]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td align=center colspan=5>SKILLS</td></tr>"]
		[*res "<tr><td colspan=2>Name</td><td>Level</td><td>Relative</span></td><td width=10%>" [[*skills_cost]] "</td></tr>"]
		[view_skills *res *ch]
		[*res "</table>"]
	[*res "</td></tr>"]
	[*res "<tr><td colspan=2><br/>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td>HAND WEAPONS</td></tr>"]
		[*res "<tr><td>Weapon</td><td>Damage</td><td>Reach</td><td>Parry</td><td>Notes</td><td>Weight</td><td>Cost</td></tr>"]
		[view_hand_weapons *res *ch]
		[*res "</table>"]
	[*res "</td></tr>"]
	[*res "</table></center>"]
]

[[lgdc *res *value] [*res "<td style='font-family: comic sans ms; font-style: italic; border-bottom: 1px solid; color: blue;'>" *value "</td>"]]

[[view_language *res *ch]
	[language *ch *language *spoken *written *cost]
	[ONE
		[*res "<tr>"]
		[lgdc *res *language] [lgdc *res *spoken] [lgdc *res *written]
		[*res "<td>" [[*cost]] "</td>"]
		[*res "</tr>"]
	]
	fail
]
[[view_language : *]]

[[view_culture *res *ch]
	[cultural_familiarity *ch *culture *cost]
	[ONE
		[*res "<tr><td></td>"]
		[lgdc *res *culture]
		[*res "<td>" [[*cost]] "</td>"]
		[*res "</tr>"]
	]
	fail
]
[[view_culture : *]]

[[view_appearances *res *ch]
	[appearance *ch *appearance *name *cost]
	[ONE
		[*res "<tr>"] [lgdc *res [*appearance]]
		[lgdc *res *name]
		[*res "<td>" [[*cost]] "</td>"]
		[*res "</tr>"]
	]
	fail
]
[[view_appearances : *]]

[[view_status *res *ch]
	[status *ch *level *name *cost]
	[ONE
		[*res "<tr>"] [lgdc *res [*level]]
		[lgdc *res *name]
		[*res "<td>" [[*cost]] "</td>"]
		[*res "</tr>"]
	]
	fail
]
[[view_status : *]]

[[view_reputation *res *ch]
	[reputation *ch *reputation *name *group *frequency *cost] [+ *reputation " (" *name ")" *description]
	[ONE
		[*res "<tr>"] [lgdc *res [*reputation]]
		[lgdc *res *name]
		[*res "<td>" [[*cost]] "</td>"]
		[*res "</tr>"]
	]
	fail
]
[[view_reputation : *]]

[[view_skills *res *ch]
	[skill *ch *name *difficulty *attribute *level *relative *cost] [process_relative *attribute *relative *description]
	[ONE
		[*res "<tr>"] [lgdc *res *name] [lgdc *res *difficulty] [lgdc *res [*level]] [lgdc *res *description]
		[*res "<td>" [[*cost]] "</td>"]
		[*res "</tr>"]
	]
	fail
]
[[view_skills : *]]

[[process_relative *level *next] [< *level 0] / [+ "" *level *next]]
[[process_relative *level *next] [+ "+" *level *next]]
[[process_relative strength *level *desc] [process_relative *level *next] [+ "ST" *next *desc]]
[[process_relative dexterity *level *desc] [process_relative *level *next] [+ "DX" *next *desc]]
[[process_relative intelligence *level *desc] [process_relative *level *next] [+ "IQ" *next *desc]]
[[process_relative health *level *desc] [process_relative *level *next] [+ "HT" *next *desc]]
[[process_relative perception *level *desc] [process_relative *level *next] [+ "PER" *next *desc]]
[[process_relative will *level *desc] [process_relative *level *next] [+ "WILL" *next *desc]]

[[view_advantages *advantage *res *ch]
	[*advantage *ch *description *cost]
	[ONE [*res "<tr>"] [lgdc *res *description] [*res "<td>" [[*cost]] "</td></tr>"]]
	fail
]
[[view_advantages : *]]

[[view_hand_weapons *res *ch]
	[weapon *ch *weapon *tl *damage *reach *parry *cost *weight *st *notes]
	[ONE [*res "<tr>"] [lgdc *res *weapon] [lgdc *res *damage] [lgdc *res *reach] [lgdc *res [*parry]]
		[lgdc *res *notes] [lgdc *res [*weight]] [lgdc *res [$ *cost]][*res "</tr>"]]
	fail
]
[[view_hand_weapons : *]]

end .


























