
import gurps

program weapons_and_armour [
				armour
				weapon weapon_table weapon_mod parry_mod wp_mod aff burn cor cr cut fat imp pi- pi+ pi++ spec tox C $ No 'No skill'
					'Large Knife' 'Small Knife'
					Greatsword
					'Regular Bow'
				]

[[weapon *ch *weapon *tl *damage *reach *parry *cost *weight *st *lc *notes] [*ch weapon *weapon *tl *damage *reach *parry *cost *weight *st *lc *notes]]
[[weapon *ch *weapon *tl *damage *reach *parry *cost *weight *st *lc *notes]
	[*ch weapon *weapon] [ONE [damage *ch *thr *sw]]
	[weapon_table *ch *thr *sw *weapon *tl *damage *reach *parry *cost *weight *st *lc *notes]
]

[[weapon *ch *weapon *tl *damage *acc *range *weight *rof *shots *cost *st *bulk *rcl *lc *notes]
	[*ch weapon *weapon *tl *damage *acc *range *weight *rof *shots *cost *st *bulk *rcl *lc *notes]]
[[weapon *ch *weapon *tl *damage *acc *range *weight *rof *shots *cost *st *bulk *rcl *lc *notes]
	[*ch weapon *weapon] [ONE [damage *ch *thr *sw]]
	[weapon_table *ch *thr *sw *weapon *tl *damage *acc *range *weight *rof *shots *cost *st *bulk *rcl *lc *notes]
]

[[weapon_mod [] []]]
[[weapon_mod [[[*d d *s] *mod *type] : *mods] [[*d d *sm *type] : *res]] [+ *s *mod *sm] / [weapon_mod *mods *res]]

[[parry_mod *ch *weapon *shift [*parry [+ *shift]]]
	[skill *ch *weapon * * *level : *] /
	[mac *level 0.5 3.0 *ret]
	[trunc *ret *tr]
	[+ *tr *shift *parry]
]
[[parry_mod *ch *weapon *shift ['No skill' [+ *shift]]]]
[[wp_mod *mod *damage *ch *weapon *shift *parry] [weapon_mod *mod *damage] [parry_mod *ch *weapon *shift *parry]]

[[weapon_table *ch *thr *sw 'Large Knife' 0 *damage [[C 1] [C]] *parry 40 1 6 - "Throwable"] [wp_mod [[*sw -2 cut] [*thr 0 imp]] *damage *ch Knife -1 *parry]]
[[weapon_table *ch *thr *sw 'Small Knife' 0 *damage [[C 1] [C]] *parry 30 0.5 5 - "Throwable"] [wp_mod [[*sw -3 cut] [*thr -1 imp]] *damage *ch Knife -1 *parry]]
[[weapon_table *ch *thr *sw Broadsword 2 *dmg 1 *parry 500 3 10 - ""] [wp_mod [[*sw 1 cut] [*thr 1 cr]] *dmg *ch Broadsword 0 *parry]]
[[weapon_table *ch *thr *sw Greatsword 3 *dmg [[1 2] [2]] *parry 800 7 12 - ""] [wp_mod [[*sw 3 cut] [*thr 2 cr]] *dmg *ch 'Two-Handed Sword' 0 *parry]]

[[weapon_table *ch *thr *sw 'Regular Bow' 0 *dmg 2 [15 20] [2 0.1] 1 [1 2] 100 10 -7 - - "$2 per arrow"] [weapon_mod [[*thr 1 imp]] *dmg]]

[[armour *ch *armour *tl *location *dr *cost *weight *note] [*ch armour *armour *tl *location *dr *cost *weight *note]]

end .

