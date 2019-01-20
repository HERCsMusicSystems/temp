
program gurps_traits [trait advantage disadvantage
						Quadruped `Extra Legs` Horizontal `No Fine Manipulators`
						`Wild Animal` Bestial `Cannot Speak` Hidebound
						`Taboo Trait` `Fixed IQ`
						]

[[advantage *ch *description *cost] [*ch advantage *description *cost]]
[[advantage *ch *description 1] [*ch advantage *description]]
[[advantage *ch *description *cost] [*ch trait *trait] [*trait advantage *description *cost]]
[[disadvantage *ch *description *cost] [*ch disadvantage *description *cost]]
[[disadvantage *ch *description -1] [*ch disadvantage *description]]
[[disadvantage *ch *description *cost] [*ch trait *trait] [*trait disadvantage *description *cost]]

[[Quadruped advantage [`Extra Legs` 4] 5]]
[[Quadruped disadvantage Horizontal -10]]
[[Quadruped disadvantage `No Fine Manipulators` -30]]
[[`Wild Animal` disadvantage Bestial -10]]
[[`Wild Animal` disadvantage `Cannot Speak` -15]]
[[`Wild Animal` disadvantage Hidebound -5]]
[[`Wild Animal` disadvantage [`Taboo Trait` `Fixed IQ`] 0]]

end .

