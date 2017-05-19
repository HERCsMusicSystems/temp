
program character_views [chattr decor decormt decorpt view_language view_culture lgdc]

[[chattr *res *ch *ATTR *attr *value]
	[*attr *ch *value]
	[SELECT [[is_text *value] [= *value *v]] [[= *v [*value]]]]
	[*res *ATTR " &nbsp;<u>&nbsp;&nbsp;<font face='comic sans ms'><i>" *v "</i></font>&nbsp;&nbsp;</u>&nbsp;&nbsp;&nbsp;"]
]

[[decor *res *attr] [is_number *attr] / [*res " <font face='comic sans ms'><u>&nbsp;&nbsp;<i>" [*attr] "</i>&nbsp;&nbsp;</u></font> "]]
[[decor *res *attr] [*res " <font face='comic sans ms'><u>&nbsp;&nbsp;<i>" *attr "</i>&nbsp;&nbsp;</u></font> "]]
[[decormt *res *attr *times] [~ *attr *times *at] [trunc *at *vv] [max *v *vv 1]
		[*res "<td style='font-family: comic sans ms; font-style: italic; border-bottom: 1px solid;'>" [*v] "</td>"]]
[[decorpt *res *attr *delta] [+ *attr *delta *at] [trunc *at *vv] [max *v *vv 1]
		[*res "<td style='font-family: comic sans ms; font-style: italic; border-bottom: 1px solid;'>" [*v] "</td>"]]

[[view_character *res *character]
	[SELECT [[is_text *character] [text_term *character *ch] [= *module *character]] [[text_term *module *character] [= *character *ch]]]
	[delallcl *ch] [load *module]
	[*res "<center><table>"]
	[*res "<tr><td colspan=2>"]
	[*res "<div style='float: left;'><img src=resources/gurps.png width=100% /><br/><font size=+1><b>CHARACTER SHEET</b></font></div>"]
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
		[*res "<tr><td><b>ST</b></td><td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*strength]
											"</i></font></td><td>[" [*strength_cost] "]</td>"]
		[hit_points_cost *ch *hit_points *hit_points_cost] [current_hit_points *ch *chp]
		[*res "<td><b>HP</b></td>"]
			[*res "<td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*hit_points] "</i></font></td>"]
			[*res "<td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*chp] "</i></font></td>"]
			[*res "<td>[" [*hit_points_cost] "]</td></tr>"]
		[dexterity_cost *ch *dexterity *dexterity_cost]
		[*res "<tr><td><b>DX</b></td><td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*dexterity]
											"</i></font></td><td>[" [*dexterity_cost] "]</td>"]
		[will_cost *ch *will *will_cost]
		[*res "<td><b>WILL</b></td><td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>"]
		[*res [*will] "</i></font></td><td><br/></td><td>[" [*will_cost] "]</td></tr>"]
		[intelligence_cost *ch *intelligence *intelligence_cost]
		[*res "<tr><td><b>IQ</b></td><td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>"]
		[*res [*intelligence] "</i></font></td><td>[" [*intelligence_cost] "]</td>"]
		[perception_cost *ch *perception *perception_cost]
		[*res "<td><b>PER</b></td><td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>"]
		[*res [*perception] "</i></font></td><td><br/></td><td>[" [*perception_cost] "]</td></tr>"]
		[health_cost *ch *health *health_cost]
		[*res "<tr><td><b>HT</b></td><td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*health]
											"</i></font></td><td>[" [*health_cost] "]</td>"]
		[fatigue_points_cost *ch *fatigue_points *fatigue_points_cost] [current_fatigue_points *ch *cfp]
		[*res "<td><b>FP</b></td>"]
			[*res "<td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*fatigue_points] "</i></font></td>"]
			[*res "<td align=center style=\"border: 2px solid black;\"><font face='comic sans ms'><i>" [*cfp] "</i></font></td>"]
			[*res "<td>[" [*fatigue_points_cost] "]</td></tr>"]
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
		[*res "</table>"]
	[*res "</td>"]
	[tech_level_cost *ch *tech_level *tech_level_cost] [tech_levels *tech_level *tldescription *tldate : *]
	[languages_cost *ch *languages_cost] [+ *tldec *tech_level " " *tldescription " (" *tldate ")."]
	[*res "<td>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td width=10% >TL:</td>"] [lgdc *res *tldec] [*res "<td width=10% >" [[*tech_level_cost]] "</td>"] [*res "</tr>"]
		[*res "<tr><td colspan=3>Cultural Familiarities</td></tr>"]
		[view_culture *res *ch]
		[*res "</table>"]
		[*res "<br/>"]
		[*res "<table width=100% style=\"border:2px solid;\" >"]
		[*res "<tr><td>Languages</td><td>Spoken</td><td>Writen</td><td>" [[*languages_cost]] "</td></tr>"]
		[view_language *res *ch]
		[*res "</table>"]
	[*res "</td>"]
	[*res "</tr>"]
	[*res "</table></center>"]
]

[[lgdc *res *value] [*res "<td style='font-family: comic sans ms; font-style: italic; border-bottom: 1px solid;'>" *value "</td>"]]

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
;[[view_culture *res *ch] [*res "<tr><td>Sputnik</td></tr>"]]



end .


























