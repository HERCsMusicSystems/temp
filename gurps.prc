
import studio
import gurps_skills
import gurps_traits

program gurps [`` d build_character
				race name player PC NPC height weight age unspent_points size_modifier point_total
				damage damage_table basic_lift basic_lift_table
				language language_cost languages_cost none broken accented native
				tech_level campaign_tech_level tech_level_cost tech_levels
				cultural_familiarity cultural_familiarities_cost
				status status_cost
				appearance appearance_cost appearances
				Horrific Monstrous Hideous Ugly Unattractive Attractive Handsome Beautiful `Very Handsome` `Very Beautiful` Transcendent
				reputation reputation_cost reputations all allmost most some
				wealth wealths `Dead Broke` Poor Struggling Comfortable Wealthy `Very Wealthy` `Filthy Rich` Multimillionaire
				skill skill_cost skills_cost
				advantages_cost disadvantages_cost
				]

[[build_character *character *attribute : *attributes] [addcl [[*character : *attribute]]] / [build_character *character : *attributes]]
[[build_character *character] [addcl [[*character]]]]

[[tech_level_cost *ch *level *cost] [lazy [tech_level *ch *level] [campaign_tech_level *ch *ctl] [sum *ctl *delta *level] [~ 5 *delta *cost]]]

[[name *ch *name] [*ch name *name]] [[name *name *name]]
[[player *ch *player] [*ch player *player]] [[player * NPC]]
[[age *ch *age] [*ch age *age]] [[age * ``]]
[[height *ch *ht] [*ch height *ht]] [[height * ``]]
[[weight *ch *wt] [*ch weight *wt]] [[weight * ``]]
[[size_modifier *ch *m] [*ch size_modifier *m]] [[size_modifier * 0]]
[[unspent_points *ch *pt] [*ch unspent_points *pt]] [[unspent_points *ch 0]]
[[appearance *ch *a] [*ch appearance *a]] [[appearance * ``]]

[[tech_level *ch *tl] [*ch tech_level *tl] /]
[[tech_level *ch 3]]
[[campaign_tech_level *ch *tl] [*ch campaign_tech_level *tl] /]
[[campaign_tech_level *ch *tl] [tech_level *ch *tl]]
[[status *ch *status *name *cost] [*ch status *status *name] [~ 5 *status *cost]]
[[status *ch *status *name *cost] [*ch status *status *name *cost]]
[[status_cost *ch *cost] [isall *costs *c [status *ch *level *name *c]] [+ *cost 0 : *costs] /]
[[appearance *ch *appearance *name *cost] [*ch appearance *appearance *name] [appearances *appearance *name *cost]]
[[appearance *ch *appearance *name *cost] [*ch appearance *appearance *name *cost]]
[[appearance *ch 0 Average 0] [isall *e *x [*ch appearance * *]] / [= *e []]]
[[appearance_cost *ch *cost] [isall *costs *c [appearance *ch * * *c]] [+ *cost 0 : *costs] /]
[[reputation *ch *reputation *name *group *frequency *cost] [*ch reputation *reputation *name *group *frequency] [reputations *reputation *group *frequency *cost]]
[[reputation *ch *reputation *name *group *frequency *cost] [*ch reputation *reputation *name *group *frequency *cost]]
[[reputation_cost *ch *cost] [isall *costs *c [reputation *ch * * * * *c]] [+ *cost 0 : *costs]]
[[wealth *ch *wealth *multiplier *name *cost]
	[*ch wealth *multiplier *name *cost]
	[campaign_tech_level *ch *tl] [tech_levels *tl * * *start] [~ *wealth *multiplier *start]
]
[[wealth *ch *wealth *multiplier *name *cost]
	[*ch wealth *w]
	[SELECT [[= *w *multiplier]] [[= *w *name]] [[is_integer *w] [= *w *cost]]]
	[wealths *multiplier *name *cost]
	[campaign_tech_level *ch *tl] [tech_levels *tl * * *start] [~ *wealth *multiplier *start]
]
[[wealth *ch *wealth 1.0 Average 0] [campaign_tech_level *ch *tl] [tech_levels *tl * * *wealth]]

[[skill *ch *name *difficulty *attribute *level *relative *cost]
	[SELECT
		[[*ch skill *name *relative] [skills *name *difficulty *attribute]]
		[[*ch skill *name *difficulty *attribute *relative]]
	]
	[ONE [*attribute *ch *attr *]]
	[skill_cost *difficulty *relative *attr *level *cost]
]
[[skill *ch *name *difficulty *attribute *level *relative *cost] [*ch skill *name *difficulty *attribute *level *relative *cost]]

[[skill_cost Average *relative *attr *level *cost] [skill_cost *relative *cost] [+ *level *attr *relative]]
[[skill_cost Easy *relative *attr *level *cost] [+ *relative -1 *r2] [skill_cost *r2 *cost] [+ *level *attr *relative]]
[[skill_cost Hard *relative *attr *level *cost] [+ *relative 1 *r2] [skill_cost *r2 *cost] [+ *level *attr *relative]]
[[skill_cost `Very Hard` *relative *attr *level *cost] [+ *relative 2 *r2] [skill_cost *r2 *cost] [+ *level *attr *relative]]
[[skill_cost -1 1] /]
[[skill_cost 0 2] /]
[[skill_cost *relative *cost] [times *relative 4 *cost] [< 0 *relative *cost]]
[[skills_cost *ch *cost] [isall *costs *c [skill *ch * * * * * *c]] [+ *cost : *costs]]

[[advantages_cost *ch *cost] [isall *costs *c [advantage *ch * *c]] [+ *cost : *costs]]
[[disadvantages_cost *ch *cost] [isall *costs *c [disadvantage *ch * *c]] [+ *cost : *costs]]

[[point_total *ch *pt]
	[strength *ch * *strength]
	[dexterity *ch * *dexterity]
	[intelligence *ch * *intelligence]
	[health *ch * *health]
	[hit_points *ch * *hit_points]
	[will *ch * *will]
	[perception *ch * *perception]
	[fatigue_points *ch * *fatigue_points]
	[basic_speed *ch * *basic_speed]
	[basic_move *ch * *basic_move]
	[tech_level_cost *ch * *tech_level]
	[languages_cost *ch *languages]
	[cultural_familiarities_cost *ch *cultural_familiarities]
	[appearance_cost *ch *appearance]
	[status_cost *ch *status]
	[reputation_cost *ch *reputation]
	[wealth *ch * * * *wealth]
	[skills_cost *ch *skills]
	[advantages_cost *ch *advantages]
	[disadvantages_cost *ch *disadvantages]
	[+ *pt *strength *dexterity *intelligence *health *hit_points *will *perception *fatigue_points *basic_speed *basic_move
		*languages *tech_level *cultural_familiarities *appearance *status *reputation *wealth *skills *advantages *disadvantages]
]

[[damage_table *st [1 d -6] [1 d -5]] [< *st 3] /]
[[damage_table 3 [1 d -5] [1 d -4]]]
[[damage_table 4 [1 d -5] [1 d -4]]]
[[damage_table 5 [1 d -4] [1 d -3]]]
[[damage_table 6 [1 d -4] [1 d -3]]]
[[damage_table 7 [1 d -3] [1 d -2]]]
[[damage_table 8 [1 d -3] [1 d -2]]]
[[damage_table 9 [1 d -2] [1 d -1]]]
[[damage_table 10 [1 d -2] [1 d 0]]]
[[damage_table 11 [1 d -1] [1 d 1]]]
[[damage_table 12 [1 d -1] [1 d 2]]]
[[damage_table 13 [1 d 0] [2 d -1]]]
[[damage_table 14 [1 d 0] [2 d 0]]]
[[damage_table 15 [1 d 1] [2 d 1]]]
[[damage_table 16 [1 d 1] [2 d 2]]]
[[damage_table 17 [1 d 2] [3 d -1]]]
[[damage_table 18 [1 d 2] [3 d 0]]]
[[damage_table 19 [2 d -1] [3 d 1]]]
[[damage_table 20 [2 d -1] [3 d 2]]]
[[damage_table 21 [2 d 0] [4 d -1]]]
[[damage_table 22 [2 d 0] [4 d 0]]]
[[damage_table 23 [2 d 1] [4 d 1]]]
[[damage_table 24 [2 d 1] [4 d 2]]]
[[damage_table 25 [2 d 2] [5 d -1]]]
[[damage_table 26 [2 d 2] [5 d 0]]]

[[damage_table 27 [3 d -1] [5 d 1]]]
[[damage_table 28 [3 d -1] [5 d 1]]]
[[damage_table 29 [3 d 0] [5 d 2]]]
[[damage_table 30 [3 d 0] [5 d 2]]]
[[damage_table 31 [3 d 1] [6 d -1]]]
[[damage_table 32 [3 d 1] [6 d -1]]]
[[damage_table 33 [3 d 2] [6 d 0]]]
[[damage_table 34 [3 d 2] [6 d 0]]]
[[damage_table 35 [4 d -1] [6 d 1]]]
[[damage_table 36 [4 d -1] [6 d 1]]]
[[damage_table 37 [4 d 0] [6 d 2]]]
[[damage_table 38 [4 d 0] [6 d 2]]]
[[damage_table 39 [4 d 1] [7 d -1]]]
[[damage_table *st [4 d 1] [7 d -1]] [< *st 45] /]
[[damage_table *st [5 d 0] [7 d 1]] [< *st 50] /]
[[damage_table *st [5 d 2] [8 d -1]] [< *st 55] /]
[[damage_table *st [6 d 0] [8 d 1]] [< *st 60] /]
[[damage_table *st [7 d -1] [9 d 0]] [< *st 65] /]
[[damage_table *st [7 d 1] [9 d 2]] [< *st 70] /]
[[damage_table *st [8 d 0] [10 d 0]] [< *st 75] /]
[[damage_table *st [8 d 2] [10 d 2]] [< *st 80] /]
[[damage_table *st [9 d 0] [11 d 0]] [< *st 85] /]
[[damage_table *st [9 d 2] [11 d 2]] [< *st 90] /]
[[damage_table *st [10 d 0] [12 d 0]] [< *st 95] /]
[[damage_table *st [10 d 2] [12 d 2]] [< *st 100] /]
[[damage_table *st [*thr d 0] [*sw d 0]] [>= *st 100] / [div *st 10 *st10] [++ *st10 *thr] [+ *st10 3 *sw]]

[[damage *character : *damage] [strength *character *strength *] [damage_table *strength : *damage]]

[[basic_lift_table 5 5]]
[[basic_lift_table 8 13]]
[[basic_lift_table 9 16]]
[[basic_lift_table *st *bl] [>= *st 10] / [~ *bll *st *st 0.2] [+ *bll 0.5 *blll] [trunc *blll *bl]]
[[basic_lift_table *st *bl] [~ *bl *st *st 0.2]]
[[basic_lift *character *bl] [strength *character *strength *] [basic_lift_table *strength *bl]]

[[language_cost none 0]]
[[language_cost broken 1]]
[[language_cost accented 2]]
[[language_cost native 3]]

[[tech_levels 0 "Stone Age" "Prehistory and later" 250]]
[[tech_levels 1 "Bronze Age" "3500 B.C.+" 500]]
[[tech_levels 2 "Iron Age" "1200 B.C.+" 750]]
[[tech_levels 3 "Medieval" "600 A.D.+" 1000]]
[[tech_levels 4 "Age of Sail" "1450+" 2000]]
[[tech_levels 5 "Industrial Revolution" "1730+" 5000]]
[[tech_levels 6 "Mechanized Age" "1880+" 10000]]
[[tech_levels 7 "Nuclear Age" "1940+" 15000]]
[[tech_levels 8 "Digital Age" "1980+" 20000]]
[[tech_levels 9 "Microtech Age" "2025+?" 30000]]
[[tech_levels 10 "Robotic Age" "2070+?" 50000]]
[[tech_levels 11 "Age of Exotic Matter" "?" 75000]]
[[tech_levels * "Whatever the GM likes!" "?" 100000]]

[[wealths 0.0 `Dead Broke` -25]]
[[wealths 0.2 Poor -15]]
[[wealths 0.5 Struggling -10]]
[[wealths 1.0 Average 0]]
[[wealths 2.0 Comfortable 10]]
[[wealths 5.0 Wealthy 20]]
[[wealths 20.0 `Very Wealthy` 30]]
[[wealths 100.0 `Filthy Rich` 50]]
[[wealths *multiplier [Multimillionaire *level] *cost] [mac *level 25 50 *cost] [pow 10 *level *m] [~ *multiplier 100.0 *m]]

[[appearances -6 Horrific -24]]
[[appearances -5 Monstrous -20]]
[[appearances -4 Hideous -16]]
[[appearances -2 Ugly -8]]
[[appearances -1 Unattractive -4]]
[[appearances 0 Average 0]]
[[appearances 1 Attractive 4]]
[[appearances [2 4] Handsome 12]]
[[appearances [2 4] Beautiful 12]]
[[appearances [2 6] `Very Handsome` 16]]
[[appearances [2 6] `Very Beautiful` 16]]
[[appearances [2 8] Transcendent 20]]

[[reputations *reaction all *cost] [~ *reaction 1.0 *cost]]
[[reputations *reaction allmost *cost] [~ *reaction 0.6666 *cost]]
[[reputations *reaction most *cost] [~ *reaction 0.5 *cost]]
[[reputations *reaction some *cost] [~ *reaction 0.3333 *cost]]
[[reputations *reaction *group *frequency *cost] [reputations *reaction *group *r] [reputations *r *frequency *c] [~ 5 *c *cc] [trunc *cc *cost]]

[[languages_cost *ch *cost] [isall *costs *c [language *ch * * * *c]] [+ *cost : *costs]]
[[cultural_familiarities_cost *ch *cost] [isall *costs *c [cultural_familiarity *ch * *c]] [+ *cost 0 : *costs]]

[[language *ch *language native native 0] [*ch language *language]]
[[language *ch *language *spoken *written *cost]
	[*ch language *language : *languages]
	[SELECT
		[[= *languages [*spoken *written]]]
		[[= *languages [*spoken]] [= *languages [*written]]]
	]
	[language_cost *spoken *sc] [language_cost *written *wc] [+ *cost *sc *wc]
]
[[language *ch *language *spoken *written *cost] [*ch language *language *spoken *written *cost]]

[[cultural_familiarity *ch *culture *cost] [*ch cultural_familiarity *culture *cost]]

end := [[command]] .


































