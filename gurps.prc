program gurps ['' d
				race name player appearance height weight age unspent_points size_modifier point_total
				strength dexterity intelligence health hit_points current_hit_points will perception fatigue_points current_fatigue_points
				strength_cost dexterity_cost intelligence_cost health_cost hit_points_cost will_cost perception_cost fatigue_points_cost
				damage damage_table basic_lift basic_lift_table
				basic_speed basic_speed_formulae basic_speed_cost basic_move basic_move_formulae basic_move_cost
				language language_cost languages_cost none broken accented native
				]

[[strength_cost *level *cost] [lazy [sum 10 *delta *level] [times *delta 10 *cost]]]
[[health_cost *level *cost] [lazy [sum 10 *delta *level] [times *delta 10 *cost]]]
[[dexterity_cost *level *cost] [lazy [sum 10 *delta *level] [times *delta 20 *cost]]]
[[intelligence_cost *level *cost] [lazy [sum 10 *delta *level] [times *delta 20 *cost]]]

[[strength_cost *ch *level *cost] [lazy [strength *ch *level] [sum 10 *delta *level] [times *delta 10 *cost]]]
[[health_cost *ch *level *cost] [lazy [health *ch *level] [sum 10 *delta *level] [times *delta 10 *cost]]]
[[dexterity_cost *ch *level *cost] [lazy [dexterity *ch *level] [sum 10 *delta *level] [times *delta 20 *cost]]]
[[intelligence_cost *ch *level *cost] [lazy [intelligence *ch *level] [sum 10 *delta *level] [times *delta 20 *cost]]]

[[hit_points_cost *ch *level *cost] [lazy [strength *ch *strength] [hit_points *ch *level] [sum *strength *delta *level] [times 2 *delta *cost]]]
[[will_cost *ch *level *cost] [lazy [intelligence *ch *iq] [will *ch *level] [sum *iq *delta *level] [times 5 *delta *cost]]]
[[perception_cost *ch *level *cost] [lazy [intelligence *ch *iq] [perception *ch *level] [sum *iq *delta *level] [times 5 *delta *cost]]]
[[fatigue_points_cost *ch *level *cost] [lazy [health *ch *health] [fatigue_points *ch *level] [sum *health *delta *level] [times 3 *delta *cost]]]
[[basic_speed_cost *ch *level *cost] [lazy [basic_speed_formulae *ch *formulae] [basic_speed *ch *level] [sum *formulae *delta *level] [~ *cost 20 *delta]]]
[[basic_move_cost *ch *level *cost] [lazy [basic_move_formulae *ch *formulae] [basic_move *ch *level] [sum *formulae *delta *level] [~ *cost 5 *delta]]]

[[name *ch *name] [*ch name *name]] [[name * '']]
[[player *ch *player] [*ch player *player]] [[player * '']]
[[age *ch *age] [*ch age *age]] [[age * '']]
[[height *ch *ht] [*ch height *ht]] [[height * '']]
[[weight *ch *wt] [*ch weight *wt]] [[weight * '']]
[[size_modifier *ch *m] [*ch size_modifier *m]] [[size_modifier * '']]
[[unspent_points *ch *pt] [*ch unspent_points *pt]] [[unspent_points *ch 0]]
[[appearance *ch *a] [*ch appearance *a]] [[appearance * '']]
[[current_hit_points *ch *hp] [*ch current_hit_points *hp]] [[current_hit_points *ch *hp] [hit_points *ch *hp]]
[[current_fatigue_points *ch *fp] [*ch current_fatigue_points *fp]] [[current_fatigue_points *ch *fp] [fatigue_points *ch *fp]]

[[hit_points *ch *hp] [*ch hit_points *hp]] [[hit_points *ch *hp] [strength *ch *hp]]
[[will *ch *will] [*ch will *will]] [[will *ch *will] [intelligence *ch *will]]
[[perception *ch *per] [*ch perception *per]] [[perception *ch *per] [intelligence *ch *per]]
[[fatigue_points *ch *fp] [*ch fatigue_points *fp]] [[fatigue_points *ch *fp] [health *ch *fp]]
[[basic_speed *ch *bs] [*ch basic_speed *bs] /]
[[basic_speed *ch *bs] [basic_speed_formulae *ch *bs]]
[[basic_speed_formulae *ch *bs] [health *ch *health] [dexterity *ch *dexterity] [+ *htdx *health *dexterity] [~ *bs *htdx 0.25]]
[[basic_move *ch *bm] [*ch basic_move *bm] /]
[[basic_move *ch *bm] [basic_move_formulae *ch *bm]]
[[basic_move_formulae *ch *bm] [basic_speed *ch *bmm] [trunc *bmm *bm]]

[[strength *ch *s] [*ch strength *s]] [[strength *ch 10]]
[[dexterity *ch *dx] [*ch dexterity *dx]] [[dexterity *ch 10]]
[[intelligence *ch *iq] [*ch intelligence *iq]] [[intelligence *ch 10]]
[[health *ch *ht] [*ch health *ht]] [[health *ch 10]]

[[point_total *ch *pt]
	[strength_cost *ch * *strength]
	[dexterity_cost *ch * *dexterity]
	[intelligence_cost *ch * *intelligence]
	[health_cost *ch * *health]
	[hit_points_cost *ch * *hit_points]
	[will_cost *ch * *will]
	[perception_cost *ch * *perception]
	[fatigue_points_cost *ch * *fatigue_points]
	[basic_speed_cost *ch * *basic_speed]
	[basic_move_cost *ch * *basic_move]
	[languages_cost *ch *languages]
	[+ *pt *strength *dexterity *intelligence *health *hit_points *will *perception *fatigue_points *basic_speed *basic_move *languages]
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

[[damage *character : *damage] [strength *character *strength] [damage_table *strength : *damage]]

[[basic_lift_table 5 5]]
[[basic_lift_table 8 13]]
[[basic_lift_table 9 16]]
[[basic_lift_table *st *bl] [>= *st 10] / [~ *bll *st *st 0.2] [+ *bll 0.5 *blll] [trunc *blll *bl]]
[[basic_lift_table *st *bl] [~ *bl *st *st 0.2]]
[[basic_lift *character *bl] [strength *character *strength] [basic_lift_table *strength *bl]]

[[language_cost none 0]]
[[language_cost broken 1]]
[[language_cost accented 2]]
[[language_cost native 3]]

[[languages_cost *ch *cost] [isall *costs *c [language *ch * * * *c]] [+ *cost -6 : *costs]]

[[language *ch *language *spoken *written *cost]
	[*ch language *language : *languages] [SELECT [[= *languages [*spoken *written]]] [[= *languages [*spoken]] [= *languages [*written]]]]
	[language_cost *spoken *sc] [language_cost *written *wc] [+ *cost *sc *wc]
]

end .

































