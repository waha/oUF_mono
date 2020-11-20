-- /dump GetMouseFocus() -- from dungeon journal
-- /dump EJ_GetInstanceInfo(ID)

local L = {
	["Dragon Soul"] = 824,
	["Mogu'shan Vaults"] = 896, -- instanceID 317,
	["Heart of Fear"] = 897, --330, 
	["Terrace of Endless Spring"] = 886, --320,
	["Pandaria"] = 809, --322,
	["Throne of Thunder"] = 930, -- 362
	["Siege of Orgrimmar"] = 953, -- 369
	["Highmaul"] = 994, -- 477
	["Blackrock Foundry"] = 988, -- 457
    ["Hellfire Citadel"] = 1026, -- 669
}

raid_debuffs = {
    ascending = {
        --[GetSpellInfo(92956)] = true, -- Wrack
		--[6788] = true, -- Weakened Soul
    },
	debuffs = {
		-- Any Zone
		--["Weakened Soul"] = 12, -- testing purpposes only
		--[6788] = 12, -- Weakened Soul
		--["Sated"] = 12, -- testing purpposes only
		[GetSpellInfo(12294)] = 8, -- Mortal Strike 
		[GetSpellInfo(19434)] = 8, -- Aimed Shot 
		[GetSpellInfo(2139)] = 10, -- Counterspell 
		[GetSpellInfo(2094)] = 10, -- Blind 
		[GetSpellInfo(33786)] = 10, -- Cyclone 
		[GetSpellInfo(118)] = 7, -- Polymorph 
		[GetSpellInfo(339)] = 7, -- Entangling Roots 
		[GetSpellInfo(25809)] = 6, -- Crippling Poison 
		[GetSpellInfo(1715)] = 5, -- Hamstring 
		[GetSpellInfo(5782)] = 3, -- Fear 
		[GetSpellInfo(8122)] = 3, -- Psychic Scream 
		[GetSpellInfo(5484)] = 3 -- Howl of Terror 
	},
	instances = {
            [L["Hellfire Citadel"]] = {
            -- Hellfire Assault
            [GetSpellInfo(184243)] = 7, -- Slam
            [GetSpellInfo(185806)] = 7, -- Conducted Shock Pulse
            -- Iron Reaer
            [GetSpellInfo(182022)] = 7, -- Pounding
            [GetSpellInfo(182001)] = 7, -- Unstable Orb
            [GetSpellInfo(182074)] = 7, -- Immolation
            [GetSpellInfo(179897)] = 7, -- Blitz
            -- Kormork
            [GetSpellInfo(180244)] = 7, -- Pound
            [GetSpellInfo(181306)] = 7, -- Explosive Eruption
            [GetSpellInfo(181321)] = 7, -- Fel Touch
            [GetSpellInfo(187819)] = 7, -- Crush
            -- Hellfire High Council
            [GetSpellInfo(184450)] = 7, -- Mal of Necro
            [GetSpellInfo(184358)] = 7, -- Fel Rage
            [GetSpellInfo(184355)] = 7, -- Bloodboil
            [GetSpellInfo(184847)] = 7, -- Acidic Wound
            [GetSpellInfo(184357)] = 7, -- Tainted Blood
            [GetSpellInfo(184652)] = 7, -- Reap
            -- Kilrogg Deadeye
            [GetSpellInfo(180372)] = 7, -- Heart Seeker
            [GetSpellInfo(180224)] = 7, -- Death Throes
            [GetSpellInfo(182159)] = 7, -- Fel Corruption
            [GetSpellInfo(183917)] = 7, -- Verwundender Schrei
            [GetSpellInfo(180199)] = 7, -- Shredded Armor
            -- Gorefiend
            [GetSpellInfo(179864)] = 7, -- Shadow of Death
            [GetSpellInfo(179978)] = 7, -- Touch of Doom
            [GetSpellInfo(179909)] = 7, -- Shared Fate
            -- Shadow-Lord Iskar
            [GetSpellInfo(179202)] = 7, -- Eye of Anzu
            [GetSpellInfo(181956)] = 7, -- Phantasmal Winds
            [GetSpellInfo(182323)] = 7, -- Phantasmal Wounds
            [GetSpellInfo(179202)] = 7, -- Eye of Anzu
            [GetSpellInfo(182173)] = 7, -- Fel Chakram
            [GetSpellInfo(181753)] = 7, -- Fel Bomb
            [GetSpellInfo(179218)] = 7, -- Phantasmal Obliteration
            [GetSpellInfo(185239)] = 7, -- Radiance-of-anzu
            -- Fel Lord Zakuun
            [GetSpellInfo(181508)] = 7, -- Seed of destruction
            [GetSpellInfo(189260)] = 7, -- Cloven Soul      
            [GetSpellInfo(179711)] = 7, -- Befouled
            [GetSpellInfo(182008)] = 7, -- Latent Energy
            [GetSpellInfo(179620)] = 7, -- Fel Crystal
            -- Xhul'horac
            [GetSpellInfo(186490)] = 7, -- Chains of Fel
            [GetSpellInfo(186333)] = 7, -- Void Surge
            [GetSpellInfo(186063)] = 7, -- Wasting Void
            [GetSpellInfo(186546)] = 7, -- Black Hole
            -- Socrethar the Eternal
            [GetSpellInfo(182038)] = 7, -- Shattered Defenses
            [GetSpellInfo(182635)] = 7, -- Reverberating Blow
            [GetSpellInfo(184239)] = 7, -- Shadow Word Agony
            [GetSpellInfo(136913)] = 7, -- Overwhelming Power    
            -- Tyrant Velhari
            [GetSpellInfo(180166)] = 7, -- Touch of Harm
            [GetSpellInfo(180128)] = 7, -- Edict of Condemnation
            [GetSpellInfo(179999)] = 7, -- Seal of decay
            [GetSpellInfo(180300)] = 7, -- Infernal tempest
            [GetSpellInfo(180526)] = 7, -- Font of corruption    
            -- Mannoroth
            [GetSpellInfo(181099)] = 7, -- Mark of Doom
            [GetSpellInfo(181597)] = 7, -- Mannoroth's Gaze 
            [GetSpellInfo(181359)] = 7, -- Massive Blast    
            [GetSpellInfo(184252)] = 7, -- Puncture Wound   
            [GetSpellInfo(181116)] = 7, -- Doom Spike   
            -- Archimonde
            [GetSpellInfo(189891)] = 7, -- Nether Tear
            [GetSpellInfo(185590)] = 7, -- Desecrate
            [GetSpellInfo(183864)] = 7, -- Shadow Blast
            [GetSpellInfo(183828)] = 7, -- Death Brand
            [GetSpellInfo(184931)] = 7, -- Shackled Torment     
            [GetSpellInfo(182879)] = 7, -- Doomfire Fixate
            -- Trash
        },
        
		[L["Blackrock Foundry"]] = {
            -- Gruul
            [GetSpellInfo(155080)] = 7, -- Inferno Slice
            [GetSpellInfo(143962)] = 7, -- Inferno Strike 
            [GetSpellInfo(155078)] = 7, -- Overwhelming Blows
            [GetSpellInfo(36240)]  = 7, -- Cave in
            [GetSpellInfo(165300)] = 7, -- Flare (Mythic)
            -- Oregorger
            [GetSpellInfo(156309)] = 7, -- Acid Torrent
            [GetSpellInfo(156203)] = 7, -- Retched Blackrock
            [GetSpellInfo(173471)] = 7, -- Acid Maw
            -- Beastlord Darmac
            [GetSpellInfo(155365)] = 7, -- Pinned Down
            [GetSpellInfo(155061)] = 7, -- Rend and Tear
            [GetSpellInfo(155030)] = 7, -- Seared Flesh
            [GetSpellInfo(155236)] = 7, -- Crush Armor
            [GetSpellInfo(159044)] = 7, -- Epicentre
            [GetSpellInfo(162276)] = 7, -- Unsteady (Mythic)
            [GetSpellInfo(155657)] = 7, -- Flame Infusion
            -- Flamebender Ka'graz
            [GetSpellInfo(155318)] = 7, -- Lava Slash
            [GetSpellInfo(155277)] = 7, -- Blazing Radiance
            [GetSpellInfo(154952)] = 7, -- Fixate
            [GetSpellInfo(155074)] = 7, -- Charring Breath
            [GetSpellInfo(163284)] = 7, -- Rising Flame
            [GetSpellInfo(162293)] = 7, -- Empowered Armament
            -- Hans'gar and Franzok
            [GetSpellInfo(157139)] = 7, -- Shattered Vertebrae
            [GetSpellInfo(161570)] = 7, -- Searing Plates
            [GetSpellInfo(157853)] = 7, -- Aftershock
            -- Operator Thogar
            [GetSpellInfo(155921)] = 7, -- Enkindle
            [GetSpellInfo(165195)] = 7, -- Prototype Pulse Grenade
            [GetSpellInfo(155701)] = 7, -- Serrated Slash
            [GetSpellInfo(156310)] = 7, -- Lava Shock
            [GetSpellInfo(164380)] = 7, -- Burning
            -- The Blast Furnace
            [GetSpellInfo(155240)] = 7, -- Tempered
            [GetSpellInfo(155242)] = 7, -- Heat
            [GetSpellInfo(176133)] = 7, -- Bomb
            [GetSpellInfo(156934)] = 7, -- Rupture
            [GetSpellInfo(175104)] = 7, -- Melt Armor
            [GetSpellInfo(176121)] = 7, -- Volatile Fire
            [GetSpellInfo(158702)] = 7, -- Fixate
            [GetSpellInfo(155225)] = 7, -- Melt
            -- Kromog
            [GetSpellInfo(157060)] = 7, -- Rune of Grasping Earth
            [GetSpellInfo(156766)] = 7, -- Warped Armor
            [GetSpellInfo(161839)] = 7, -- Rune of Crushing Earth
            -- The Iron Maidens
            [GetSpellInfo(164271)] = 7, -- Penetrating Shot
            [GetSpellInfo(158315)] = 7, -- Dark Hunt
            [GetSpellInfo(156601)] = 7, -- Sanguine Strikes
            [GetSpellInfo(170395)] = 7, -- Sorka's Prey
            [GetSpellInfo(170405)] = 7, -- Marak's Blood Calling
            [GetSpellInfo(158692)] = 7, -- Deadly Throw
            [GetSpellInfo(158702)] = 7, -- Fixate
            [GetSpellInfo(158686)] = 7, -- Expose Armor
            [GetSpellInfo(158683)] = 7, -- Corrupted Blood
            -- Blackhand
            [GetSpellInfo(156096)] = 7, -- Marked For Death
            [GetSpellInfo(156107)] = 7, -- Impaled
            [GetSpellInfo(156047)] = 7, -- Slagged
            [GetSpellInfo(156401)] = 7, -- Molten Slag
            [GetSpellInfo(156404)] = 7, -- Burned
            [GetSpellInfo(158054)] = 7, -- Shattering Smash 158054 155992 159142
            [GetSpellInfo(156888)] = 7, -- Overheated
            [GetSpellInfo(157000)] = 7, -- Attach Slag Bombs
            --Trash
		},

		[L["Highmaul"]] = {
            -- Kargath Bladefist
            [GetSpellInfo(159113)] = 5, -- Impale
            [GetSpellInfo(159178)] = 6, -- Open Wounds
            [GetSpellInfo(159213)] = 7, -- Monsters Brawl
            [GetSpellInfo(159410)] = 7, -- Mauling Brew
            [GetSpellInfo(160521)] = 7, -- Vile Breath
            [GetSpellInfo(159386)] = 7, -- Iron Bomb
            [GetSpellInfo(159188)] = 7, -- Grapple
            [GetSpellInfo(162497)] = 7, -- On The Hunt
            [GetSpellInfo(159202)] = 7, -- Flame Jet
            --The Butcher
            [GetSpellInfo(156152)] = 7, -- Gushing Wounds
            [GetSpellInfo(156151)] = 7, -- The Tenderizer
            [GetSpellInfo(156143)] = 7, -- The Cleaver
            [GetSpellInfo(163046)] = 7, -- Pale Vitriol
             --Tectus
            [GetSpellInfo(162892)] = 7, -- Infesting Spores
            --Brackenspore
            [GetSpellInfo(163242)] = 7, -- Infesting Spores
            [GetSpellInfo(163590)] = 7, -- Creeping Moss
            [GetSpellInfo(163241)] = 7, -- Rot
            [GetSpellInfo(159220)] = 7, -- Necrotic Breath
            [GetSpellInfo(160179)] = 7, -- Mind Fungus
            [GetSpellInfo(159972)] = 7, -- Flesh Eater
            --Twin Ogron"] = {
            [GetSpellInfo(158026)] = 7, -- Enfeebling Roar
            [GetSpellInfo(158241)] = 5, -- Blaze
            [GetSpellInfo(155569)] = 7, -- Injured
            [GetSpellInfo(167200)] = 7, -- Arcane Wound
            [GetSpellInfo(159709)] = 7, -- Weakened Defenses 159709 167179
            [GetSpellInfo(163374)] = 7, -- Arcane Volatility
            --Ko'ragh
            [GetSpellInfo(161242)] = 7, -- Caustic Energy
            [GetSpellInfo(161358)] = 7, -- Suppression Field
            [GetSpellInfo(162184)] = 7, -- Expel Magic: Shadow
            [GetSpellInfo(162186)] = 7, -- Expel Magic: Arcane
            [GetSpellInfo(161411)] = 7, -- Expel Magic: Frost
--            [GetSpellInfo(163472)] = 7, -- Dominating Power
            [GetSpellInfo(162185)] = 7, -- Expel Magic: Fel
            --Imperator Mar'gok"] = {
            [GetSpellInfo(156238)] = 7, -- Branded 156238 163990 163989 163988
            [GetSpellInfo(156467)] = 7, -- Destructive Resonance 156467 164075 164076 164077
            [GetSpellInfo(157349)] = 7, -- Force Nova 157349 164232 164235 164240
            [GetSpellInfo(158605)] = 7, -- Mark of Chaos 158605 164176 164178 164191
            [GetSpellInfo(157763)] = 7, -- Fixate
            [GetSpellInfo(158553)] = 7, -- Crush Armor
            --Trash
            [GetSpellInfo(175601)] = 7, -- Trash: Tainted Claws
            [GetSpellInfo(172069)] = 7, -- Trash: Radiating Poison
            [GetSpellInfo(56037)]  = 7, -- Trash: Rune of Destruction
            [GetSpellInfo(175654)] = 7, -- Trash: Rune of Disintegration
		},
	
		[L["Siege of Orgrimmar"]] = {
			-- Immerseus
			[GetSpellInfo(143436)] = 6,    -- Corrosive Blast (Tank switch)
			[GetSpellInfo(143459)] = 5,    -- Sha Residue
			-- The Fallen Protectors
			[GetSpellInfo(143198)] = 5,    -- Garrote (DoT)
			[GetSpellInfo(143434)] = 6,    -- Shadow Word: Bane (Dispel)
			[GetSpellInfo(147383)] = 5,    -- Debilitation (Heroic)
			-- Norushen
			[GetSpellInfo(146124)] = 6,    -- Self Doubt (Tank switch)
			[GetSpellInfo(144514)] = 5,    -- Lingering Corruption (Dispel)
			-- Sha of Pride
			[GetSpellInfo(144358)] = 6,    -- Wounded Pride (Tank switch)
			[GetSpellInfo(144351)] = 5,    -- Mark of Arrogance (Dispel)
			[GetSpellInfo(146594)] = 5,    -- Gift of the Titans
			[GetSpellInfo(147207)] = 5,    -- Weakened Resolve (Heroic)
			-- Galakras
			[GetSpellInfo(146765)] = 5,    -- Flame Arrows (DoT)
			[GetSpellInfo(146902)] = 5,    -- Poison-Tipped Blades (Poison stacks)
			-- Iron Juggernaut
			[GetSpellInfo(144467)] = 6,    -- Ignite Armor (Tank stacks)
			[GetSpellInfo(144459)] = 5,    -- Laser Burn (DoT)
			-- Kor'kron Dark Shaman
			[GetSpellInfo(144215)] = 5,    -- Froststorm Strike (Tank stacks)
			[GetSpellInfo(144089)] = 5,    -- Toxic Mist (DoT)
			[GetSpellInfo(144330)] = 5,    -- Iron Prison (Heroic)
			-- General Nazgrim
			[GetSpellInfo(143494)] = 5,    -- Sundering Blow (Tank stacks)
			[GetSpellInfo(143638)] = 5,    -- Bonecracker (DoT)
			[GetSpellInfo(143431)] = 5,    -- Magistrike (Dispel)
			-- Malkorok
			[GetSpellInfo(142990)] = 5,    -- Fatal Strike (Tank stacks)
			[GetSpellInfo(142913)] = 5,    -- Displaced Energy (Dispel)
			-- Spoils of Pandaria
			[GetSpellInfo(145218)] = 5,    -- Harden Flesh (Dispel)
			[GetSpellInfo(146235)] = 5,    -- Breath of Fire (Dispel)
			-- Thok the Bloodthirsty
			[GetSpellInfo(143766)] = 5,    -- Panic (Tank stacks)
			[GetSpellInfo(143780)] = 5,    -- Acid Breath (Tank stacks)
			[GetSpellInfo(143773)] = 5,    -- Freezing Breath (Tank Stacks)
			[GetSpellInfo(143800)] = 5,    -- Icy Blood (Random Stacks)
			[GetSpellInfo(143767)] = 5,    -- Scorching Breath (Tank Stacks)
			[GetSpellInfo(143791)] = 5,    -- Corrosive Blood (Dispel)
			-- Siegecrafter Blackfuse
			[GetSpellInfo(143385)] = 5,    -- Electrostatic Charge (Tank stacks)
			[GetSpellInfo(144236)] = 5,    -- Pattern Recognition
			-- Paragons of the Klaxxi
			[GetSpellInfo(142929)] = 5,    -- Tenderizing Strikes (Tank stacks)
			[GetSpellInfo(143275)] = 5,    -- Hewn (Tank stacks)
			[GetSpellInfo(143279)] = 5,    -- Genetic Alteration (Tank stacks)
			[GetSpellInfo(143974)] = 5,    -- Shield Bash (Tank stun)
			[GetSpellInfo(142948)] = 5,    -- Aim
			-- Garrosh Hellscream
			[GetSpellInfo(145183)] = 5,    -- Gripping Despair (Tank stacks)
			[GetSpellInfo(145195)] = 5,    -- Empowered Gripping Despair (Tank stacks) 
		},
	
		[L["Throne of Thunder"]] = {
		-- Throne of Thunder
			-- Jin'rokh the Breaker
			[GetSpellInfo(138349)] = 5,	-- Static Wound (Tank stacks)
			[GetSpellInfo(138349)] = 5,	-- Thundering Throw (Tank stun)
			[GetSpellInfo(138732)] = 8,	-- Ionization (Heroic-Dispel)
			[GetSpellInfo(137422)] = 7,	-- Focused Lightning (Fixated - Kiting)
			[GetSpellInfo(138006)] = 6,	-- Electrified Waters (Pool)
			-- Horridon
			[GetSpellInfo(136767)] = 5,	-- Triple Puncture (Tank stacks)
			[GetSpellInfo(136654)] = 7,	-- Rending Charge (DoT)
			[GetSpellInfo(136708)] = 8,	-- Stone Gaze (Stun)
			[GetSpellInfo(136723)] = 7,	-- Sand Trap (Pool)
			[GetSpellInfo(136710)] = 7,	-- Deadly Plague (Dispel)
			[GetSpellInfo(136719)] = 7,	-- Blazing Sunlight (Dispel)
			[GetSpellInfo(136587)] = 7,	-- Venom Bolt Volley (Dispel)
			[GetSpellInfo(136512)] = 8,	-- Hex of Confusion (Dispel)
			-- Council of Elders
			[GetSpellInfo(136903)] = 5,	-- Frigid Assault (Tank stacks)
			[GetSpellInfo(136922)] = 8,	-- Frostbite (DoT + stun)
			[GetSpellInfo(136857)] = 7,	-- Entrapped (Dispel)
			[GetSpellInfo(137359)] = 7,	-- Marked Soul (Fixated - Kiting)
			[GetSpellInfo(137641)] = 7,	-- Soul Fragment (Heroic)
			[GetSpellInfo(137650)] = 6,	-- Shadowed Soul
			-- Tortos
			[GetSpellInfo(136753)] = 5,	-- Slashing Talons (Tank DoT)
			[GetSpellInfo(137633)] = 7,	-- Crystal Shell (Heroic)
			[GetSpellInfo(140701)] = 8, -- Crystal Shell: Full Capacity! (Heroic)
			-- Megaera
			[GetSpellInfo(137731)] = 5,	-- Ignite Flesh (Tank DoT)
			[GetSpellInfo(139843)] = 5,	-- Arctic Freeze (Tank Stun)
			[GetSpellInfo(139840)] = 5,	-- Rot Armor (Tank stacks)
			[GetSpellInfo(134391)] = 8,	-- Cinder (DoT Dispell)
			[GetSpellInfo(139857)] = 7,	-- Torrent of Ice (Fixated - Kiting)
			[GetSpellInfo(140179)] = 7,	-- Suppression (Heroic Dispell)
			[GetSpellInfo(139909)] = 7,	-- Icy Ground (Pool)
			-- Ji-Kun
			[GetSpellInfo(140092)] = 5,	-- Infected Talons (Tank DoT)
			[GetSpellInfo(134256)] = 7,	-- Slimed (DoT)
			-- Durumu the Forgotten
			[GetSpellInfo(133768)] = 4,	-- Arterial Cut (Tank stacks)
			[GetSpellInfo(133767)] = 5,	-- Serious Wound (Tank only)
			[GetSpellInfo(133798)] = 7,	-- Life Drain (Stun)
			[GetSpellInfo(133597)] = 7,	-- Dark Parasite (Heroic Dispel)
			-- Primordius
			[GetSpellInfo(136050)] = 5,	-- Malformed Blood (Tank stacks)
			[GetSpellInfo(136228)] = 8,	-- Volatile Pathogen (DoT)
			[GetSpellInfo(137000)] = 7, -- Black Blood
			-- Dark Animus
			[GetSpellInfo(138569)] = 5,	-- Explosive Slam (Tank stacks)
			[GetSpellInfo(138659)] = 7,	-- Touch of the Animus (DoT)
			[GetSpellInfo(138486)] = 8, -- Crimson Wake Target Debuff
			[GetSpellInfo(138609)] = 8, -- Matter Swap
			[GetSpellInfo(136962)] = 7, -- Anima Ring
			-- Iron Qon
			[GetSpellInfo(134691)] = 5,	-- Impale (Tank stacks)
			[GetSpellInfo(134628)] = 7,	-- Unleashed Flame (Damage staks)
			[GetSpellInfo(136192)] = 7,	-- Lightning Storm (Stun)
			[GetSpellInfo(135145)] = 7,	-- Freeze (Stun+aoe damage)
			[GetSpellInfo(137668)] = 8, -- Burning Cinders
			[GetSpellInfo(137669)] = 8, -- Arcing Lightning
			[GetSpellInfo(135145)] = 8, -- Freeze
			-- Twin Consorts
			[GetSpellInfo(137408)] = 5,	-- Fan of Flames (Tank stacks)
			[GetSpellInfo(136722)] = 7,	-- Slumber Spores (Dispel)
			[GetSpellInfo(137341)] = 7,	-- Beast of Nightmares (Fixate - DON"T HEAL THE TARGET SO MUCH)
			[GetSpellInfo(137360)] = 7,	-- Corrupted Healing (Oh, did you heal the target. So prepare to massive damage, haha)
			[GetSpellInfo(137440)] = 8, -- Icy Shadows
			-- Lei Shen
			--[GetSpellInfo(135000)] = 5,	-- Decapitate (Tank only)
			[GetSpellInfo(136478)] = 5,	-- Fusion Slash (Tank only)
			[GetSpellInfo(136914)] = 5,	-- Electrical Shock (Tank only)
			[GetSpellInfo(135695)] = 7,	-- Static Shock (Damage Split)
			[GetSpellInfo(136295)] = 8, -- Overcharge
			[GetSpellInfo(139011)] = 9, -- Helm of Command
			-- Ra-den
		},
	
		[L["Mogu'shan Vaults"]] = {
			-- The Stone Guard
			[GetSpellInfo(116281)] = 7, -- Cobalt Mine Blast, Magic root

			--Feng the Accursed
			[GetSpellInfo(116040)] = 7, -- Epicenter, roomwide aoe.
			[GetSpellInfo(116784)] = 7, -- Wildfire Spark, Debuff that explodes leaving fire on the ground after 5 sec.
			[GetSpellInfo(116374)] = 7, -- Lightning Charge, Stun debuff.
			[GetSpellInfo(116417)] = 7, -- Arcane Resonance, aoe-people-around-you-debuff.
			[GetSpellInfo(116942)] = 7, -- Flaming Spear, fire damage dot.

			-- Gara'jal the Spiritbinder
			[GetSpellInfo(122151)] = 7,	-- Voodoo Doll, shared damage with the tank.
			[GetSpellInfo(116161)] = 7,	-- Crossed Over, people in the spirit world.

			-- The Spirit Kings
			[GetSpellInfo(117708)] = 7, -- Meddening Shout, The mind control debuff.
			[GetSpellInfo(118303)] = 7, -- Fixate, the once targeted by the shadows.
			[GetSpellInfo(118048)] = 7, -- Pillaged, the healing/Armor/damage debuff.
			[GetSpellInfo(118135)] = 7, -- Pinned Down, Najentus spine 2.0

			--Elegon
			--[GetSpellInfo(117878)] = 7, -- Overcharged, the stacking increased damage taken debuff.	
			--[GetSpellInfo(117870)] = 7, -- Touch of the Titans, the debuff everybody gets increasing damage done and healing taken.
			[GetSpellInfo(117949)] = 7, -- Closed Circuit, Magic Healing debuff.

			--Will of the Emperor
			[GetSpellInfo(116969)] = 7, -- Stomp, Stun from the bosses.
			[GetSpellInfo(116835)] = 7, -- Devestating Arc, Armor debuff from the boss.
			[GetSpellInfo(116778)] = 7, -- Focused Defense, Fixate from the Emperors Courage.
			[GetSpellInfo(117485)] = 7, -- Impending Thrust, Stacking slow from the Emperors Courage.
			[GetSpellInfo(116525)] = 7, -- Focused Assault, Fixate from the Emperors Rage
			[GetSpellInfo(116550)] = 7, -- Energizing Smash, Knockdown from the Emperors Strength
		},
		[L["Heart of Fear"]] = {
			-- Imperial Vizier Zor'lok
			[GetSpellInfo(122761)] = 7, -- Exhale, The person targeted for Exhale. 
			[GetSpellInfo(123812)] = 7, -- Pheromones of Zeal, the gas in the middle of the room.
			[GetSpellInfo(122706)] = 7, -- Noise Cancelling, The "safe zone" from the roomwide aoe.
			[GetSpellInfo(122740)] = 7, -- Convert, The mindcontrol Debuff.

			-- Blade Lord Ta'yak
			[GetSpellInfo(123180)] = 7, -- Wind Step, Bleeding Debuff from stealth.
			[GetSpellInfo(123474)] = 7, -- Overwhelming Assault, stacking tank swap debuff. 

			-- Garalon
			[GetSpellInfo(122774)] = 7, -- Crush, stun from the crush ability.
			--[GetSpellInfo(123426)] = 7, -- Weak Points, Increased damage done to one leg.
			--[GetSpellInfo(123428)] = 7, -- Weak Points, Increased damage to another leg.
			--[GetSpellInfo(123423)] = 7, -- Weak Points, Increased damage to another leg.
			--[GetSpellInfo(123235)] = 7, -- Weak Points, Increased damage to another leg.
			[GetSpellInfo(122835)] = 7, -- Pheromones, The buff indicating who is carrying the pheramone.
			[GetSpellInfo(123081)] = 8, -- Punchency, The stacking debuff causing the raid damage.

			--Wind Lord Mel'jarak
			[GetSpellInfo(122055)] = 7, -- Residue, The debuff after breaking a prsion preventing further breaking.
			[GetSpellInfo(121885)] = 7, -- Amber Prison, The stun that somebody has to click off.
			[GetSpellInfo(121881)] = 7, -- Amber Prison, not sure what the differance is but both were used.
			[GetSpellInfo(122125)] = 7, -- Corrosive Resin pool, the **** on the floor your not supposed to stand in.
			[GetSpellInfo(122064)] = 7, -- Corrosive Resin, the dot you clear by moving/jumping.

			-- Amber-Shaper Un'sok 
			[GetSpellInfo(122370)] = 7, -- Reshape Life, the transformation ala putricide.
			[GetSpellInfo(122784)] = 7, -- Reshape Life, Both were used.
			[GetSpellInfo(124802)] = 7, -- The transformed players increase damage taken cooldown.
			[GetSpellInfo(122395)] = 7, -- Struggle for Control, the self stun used to interupt the channel.
			[GetSpellInfo(122457)] = 7, -- Rough Landing, The stun from being tossed and being hit by the toss from the add in Phase 2.
			[GetSpellInfo(121949)] = 7, -- Parasitic Growth, the dot that scales with healing taken.
			
			-- Empress
			[GetSpellInfo(125390)] = 7, -- Fixate
			[GetSpellInfo(123184)] = 7, -- Dissonance Field
			[GetSpellInfo(123788)] = 6, -- Cry of terror
			[GetSpellInfo(126122)] = 7, -- Corrupted Dissonance Field
			
		},
		[L["Terrace of Endless Spring"]] = {
			--Protectors Of the Endless
			--[GetSpellInfo(117519)] = 7, -- Touch of Sha, Dot that lasts untill Kaolan is defeated.
			--[GetSpellInfo(117235)] = 7, -- Purified, haste buff gained by killing mist and being in range.
			--[GetSpellInfo(117353)] = 7, -- Overwhelming Corruption, stacking raidwide softenrage debuff.
			[GetSpellInfo(118091)] = 7, -- Defiled Ground, Increased damage taken from Defiled ground debuff.
			[GetSpellInfo(117436)] = 12, -- Lightning Prison, Magic stun.

			--Tsulong
			[GetSpellInfo(122768)] = 7, -- Dread Shadows, Stacking raid damage debuff (ragnaros superheated style) 
			[GetSpellInfo(122789)] = 7, -- Sunbeam, standing in the sunbeam, used to clear dread shadows.
			[GetSpellInfo(122858)] = 7, -- Bathed in Light, 500% increased healing done debuff.
			[GetSpellInfo(122752)] = 7, -- Shadow Breath, increased shadow breath damage debuff.
			[GetSpellInfo(123011)] = 7, -- Terrorize, Magical dot dealing % health.
			[GetSpellInfo(123036)] = 7, -- Fright, 2 second fear.
			[GetSpellInfo(122777)] = 7, -- Nightmares, 3 second fear.

			--Lei Shi
			[GetSpellInfo(123121)] = 7, -- Spray, Stacking frost damage taken debuff.

			--Sha of Fear
			[GetSpellInfo(129147)] = 7, -- Ominous Cackle, Debuff that sends players to the outer platforms.
			[GetSpellInfo(119086)] = 7, -- Penetrating Bolt, Increased Shadow damage debuff.
			[GetSpellInfo(119775)] = 7, -- Reaching Attack, Increased Shadow damage debuff.
			[GetSpellInfo(119985)] = 7, -- Dread Spray, stacking magic debuff, fears at 2 stacks.
			[GetSpellInfo(119983)] = 7, -- Dread Spray, is also used.
			[GetSpellInfo(119414)] = 7, -- Breath of Fear, Fear+Massiv damage.
			
			[GetSpellInfo(120629)] = 10, -- Huddle in Terror
		},
		[L["Dragon Soul"]] = {
			-- Morchok
			[GetSpellInfo(103687)] = 7, -- Crush Armor
			-- Warlord Zon'ozz
			[GetSpellInfo(103434)] = 8, -- Disrupting Shadows
			-- some shit boss with blobs
			[GetSpellInfo(104849)] = 8, -- Void Bolt
			[109389] = 12, 				-- Deep Corruption stacks (108220)
			[103628] = 12,				-- Deep Corruption stacks
			-- Hagara the Stormbinder
			[GetSpellInfo(109325)] = 7, -- Frostflake, HC
			[GetSpellInfo(104451)] = 7, -- Ice Tomb
			[GetSpellInfo(105313)] = 7, -- Ice Lance
			[GetSpellInfo(105289)] = 7, -- Shattered Ice
			-- Blackhorn
			-- Ultraxion
			[GetSpellInfo(109075)] = 8, -- Fading Light
			-- Spine of Deathwing
			[GetSpellInfo(109379)] = 7, -- Searing Plasma
			[GetSpellInfo(105490)] = 8, -- Fiery Grip
			-- Madness 
			[GetSpellInfo(105841)] = 7,  -- Degenerative Bite
			[GetSpellInfo(105445)] = 8,  -- Blistering Heat
			[GetSpellInfo(106444)] = 9,  -- Impale
		},
	},
}
