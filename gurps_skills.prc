
program gurps_skills [
						skills Easy Average Hard 'Very Hard' strength dexterity intelligence health perception will
						Fast-Talk Gambling Riding Horse Camel Leadership Dancing Singing Politics Savoir-Faire 'First Aid' Poetry
						Administration Diplomacy Merchant Accounting Economics Law Mathematics
						Fast-Draw Stealth 'Detect Lies' 'Sleight of Hand' Survival Desert Mountain 'Musical Instrument' 'Public Speaking' 'Sex Appeal' Streetwise
						Shield Buckler Force Brawling Running
						Knife Broadsword 'Two-Handed Sword' Bow
					]

[[strength *ch *level *cost] [*ch strength *level] [sum 10 *delta *level] [times *delta 10 *cost]]
[[strength *ch *level *cost] [*ch strength *level *cost]]
[[strength *ch 10 0]]

[[dexterity *ch *level *cost] [*ch dexterity *level] [sum 10 *delta *level] [times *delta 20 *cost]]
[[dexterity *ch *level *cost] [*ch dexterity *level *cost]]
[[dexterity *ch 10 0]]

[[intelligence *ch *level *cost] [*ch intelligence *level] [sum 10 *delta *level] [times *delta 20 *cost]]
[[intelligence *ch *level *cost] [*ch intelligence *level *cost]]
[[intelligence *ch 10 0]]

[[health *ch *level *cost] [*ch health *level] [sum 10 *delta *level] [times *delta 10 *cost]]
[[health *ch *level *cost] [*ch health *level *cost]]
[[health *ch 10 0]]

[[perception *ch *level *cost] [*ch perception *level] [intelligence *ch *iq *] [sum *iq *delta *level] [times 5 *delta *cost]]
[[perception *ch *level *cost] [*ch perception *level *cost]]
[[perception *ch *level 0] [intelligence *ch *level *]]

[[will *ch *level *cost] [*ch will *level] [intelligence *ch *iq *] [sum *iq *delta *level] [times 5 *delta *cost]]
[[will *ch *level *cost] [*ch will *level *cost]]
[[will *ch *level 0] [intelligence *ch *level *]]

[[skills Dancing Average dexterity]]
[[skills Singing Easy health]]
[[skills Fast-Talk Average intelligence]]
[[skills Gambling Average intelligence]]
[[skills [Riding *] Average dexterity]]
[[skills Leadership Average intelligence]]
[[skills [Fast-Draw *] Easy dexterity]]
[[skills Politics Average intelligence]]
[[skills [Savoir-Faire *] Easy intelligence]]
[[skills Stealth Average dexterity]]
[[skills Administration Average intelligence]]
[[skills Diplomacy Hard intelligence]]
[[skills Merchant Average intelligence]]
[[skills Accounting Hard intelligence]]
[[skills Economics Hard intelligence]]
[[skills [Law *] Hard intelligence]]
[[skills 'Sleight of Hand' Hard dexterity]]
[[skills 'Detect Lies' Hard perception]]
[[skills [Survival *] Average perception]]
[[skills ['Musical Instrument' *] Hard intelligence]]
[[skills Mathematics Hard intelligence]]
[[skills 'Public Speaking' Average intelligence]]
[[skills 'Sex Appeal' Average health]]
[[skills Streetwise Average intelligence]]
[[skills ['First Aid' *tl] Easy intelligence]]
[[skills Poetry Average intelligence]]
[[skills Brawling Easy dexterity]]
[[skills Running Average health]]

[[skills Broadsword Average dexterity]]
[[skills Knife Easy dexterity]]
[[skills 'Two-Handed Sword' Average dexterity]]
[[skills Bow Average dexterity]]

[[skills [Shield *] Easy dexterity]]
[[skills Shield Easy dexterity]]

end .
