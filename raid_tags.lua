local _, ns = ...
local oUF = ns.oUF or oUF
if not oUF then return end
--[[
local L = {
	--priest
  ["Prayer of Mending"] = GetSpellInfo(33076),
  ["Renew"] = GetSpellInfo(139),
  ["Power Word: Shield"] = GetSpellInfo(17),
  ["Weakened Soul"] = GetSpellInfo(6788),
  ["Power Word: Fortitude"] = GetSpellInfo(21562),
  ["Fear Ward"] = GetSpellInfo(6346),
  ["Clarity of Will"] = GetSpellInfo(152118),
	--druid
  ["Lifebloom"] = GetSpellInfo(33763),
  ["Rejuvenation"] = GetSpellInfo(774),
  ["Rejuvenation (Germination)"] = GetSpellInfo(155777),
  ["Regrowth"] = GetSpellInfo(8936),
  ["Wild Growth"] = GetSpellInfo(48438),
  ["Mark of the Wild"] = GetSpellInfo(1126), -- bok/legacy
	--warrior
  ["Battle Shout"] = GetSpellInfo(6673),
  ["Commanding Shout"] = GetSpellInfo(469),
  ['Shield Wall'] = GetSpellInfo(871),
	--paladin
  ["Beacon of Light"] = GetSpellInfo(53563),
  ["Hand of Sacrifice"] = GetSpellInfo(6940),
  ["Hand of Freedom"] = GetSpellInfo(1044),
  ["Hand of Protection"] = GetSpellInfo(1022),
  ["Greater Blessing of Kings"] = GetSpellInfo(203538),
  ["Greater Blessing of Wisdom"] = GetSpellInfo(203539),
  ["Sacred Shield"] = GetSpellInfo(20925),
  ["Eternal Flame"] = GetSpellInfo(114163),
  ["Forbearance"] = GetSpellInfo(25771),
	--shaman
  ['Earth Shield'] = GetSpellInfo(974),
  ['Riptide'] = GetSpellInfo(61295),
	--monk
  ["Legacy of the White Tiger"] = GetSpellInfo(116781),
  ["Legacy of the Emperor"] = GetSpellInfo(115921),
  ["Enveloping Mist"] = GetSpellInfo(124682),
  ["Renewing Mist"] = GetSpellInfo(119611),
  ["Life Cocoon"] = GetSpellInfo(116849),
	--rogue
  ["Tricks of the Trade"] = GetSpellInfo(57934),
	--warlock
  ["Soulstone"] = GetSpellInfo(20707),
	--mage
  ["Dalaran Brilliance"] = GetSpellInfo(61316),
  ["Arcane Brilliance"] = GetSpellInfo(1459),
  --demon hunter
  ["Soul Fragments"] = GetSpellInfo(203981),
}
]]
local x = "M"

local getTime = function(expirationTime)
	local expire = -1*(GetTime()-expirationTime)
	local timeleft = format("%.0f", expire)
	if expire > 0.5 then
		local spellTimer = "|cffffff00"..timeleft.."|r"
		return spellTimer
	end
end

local function CalcDebuff(uid, debuff) -- to fill some information gaps of UnitDebuff()
	local name, icon, count, dur, expirationTime, caster, sdur, timeleft, start, dname

		dname = GetSpellInfo(debuff);
		if not dname then dname = debuff; end

	name, icon, count, _, dur, expirationTime, caster = AuraUtil.FindAuraByName(dname, uid, "HARMFUL");
	if (name == dname) then
		if dur and dur > 0 then
			sdur = dur;
			start = expirationTime - dur;
			timeleft = GetTime() - start;
		else
			sdur = 0;
			ftimeleft = 0;
			start = 0;
		end
	end
	return name, count, icon, start, sdur, caster, timeleft;
end

-----------------[[ GENERAL TAGS ]]-----------------
oUF.Tags.Methods['raid:wrack'] = function(u) -- Sinestra's specific debuff
	local name,_,_,_,dur,_,remaining = CalcDebuff(u,92956) -- 57724 debug
	if not (name and remaining) then return end
	if remaining > 14 then -- FOAD
		return "|cffFF0000"..x.."|r"
	elseif remaining > 10 then -- criticall! dispel now!
		return "|cffFFCC00"..x.."|r"
	elseif remaining > 8 then -- start thinking about dispel!
		return "|cff00FF00"..x.."|r"
	else
		return "|cffB1C4B9"..x.."|r"
	end
end
oUF.Tags.Events['raid:wrack'] = "UNIT_AURA"

oUF.Tags.Methods['raid:aggro'] = function(u)
	local s = UnitThreatSituation(u) if s == 2 or s == 3 then return "|cffFF0000"..x.."|r" end end
oUF.Tags.Events['raid:aggro'] = "UNIT_THREAT_SITUATION_UPDATE"

-----------------[[ CLASS SPECIFIC TAGS ]]-----------------
--priest
oUF.Tags.Methods['raid:rnw'] = function(u)
    local name, _,_,_,_, expirationTime, fromwho = AuraUtil.FindAuraByName("Renew", u)
    if(fromwho == "player") then
        local spellTimer = GetTime()-expirationTime
        if spellTimer > -2 then
            return "|cffFF0000"..x.."|r"
        elseif spellTimer > -4 then
            return "|cffFF9900"..x.."|r"
        else
            return "|cff33FF33"..x.."|r"
        end
    end
end
oUF.Tags.Events['raid:rnw'] = "UNIT_AURA"
-- rnwtime
oUF.Tags.Methods['raid:rnwTime'] = function(u)
  local name, _,_,_,_, expirationTime, fromwho,_ = AuraUtil.FindAuraByName("Renew", u)
  if fromwho == "player" then return getTime(expirationTime) end
end
oUF.Tags.Events['raid:rnwTime'] = "UNIT_AURA"
oUF.Tags.Methods['raid:pws'] = function(u) if AuraUtil.FindAuraByName("Power Word: Shield", u) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['raid:pws'] = "UNIT_AURA"
oUF.Tags.Methods['raid:ws'] = function(u) if AuraUtil.FindAuraByName("Weakened Soul", u, "HARMFUL") then return "|cffFF9900"..x.."|r" end end
oUF.Tags.Events['raid:ws'] = "UNIT_AURA"
oUF.Tags.Methods['raid:clow'] = function(u) if AuraUtil.FindAuraByName("Clarity of Will", u) then return "|cff33FFFF"..x.."|r" end end
oUF.Tags.Events['raid:clow'] = "UNIT_AURA"
oUF.Tags.Methods['raid:fw'] = function(u) if AuraUtil.FindAuraByName("Fear Ward", u) then return "|cff8B4513"..x.."|r" end end
oUF.Tags.Events['raid:fw'] = "UNIT_AURA"
oUF.Tags.Methods['raid:fort'] = function(u) if not AuraUtil.FindAuraByName("Power Word: Fortitude", u) then return "|cff00A1DE"..x.."|r" end end
oUF.Tags.Events['raid:fort'] = "UNIT_AURA"
oUF.Tags.Methods['raid:wsTime'] = function(u)
  local name, _,_,_,_, expirationTime = AuraUtil.FindAuraByName("Weakened Soul", u, "HARMFUL")
  if name then return getTime(expirationTime) end
end
oUF.Tags.Events['raid:wsTime'] = "UNIT_AURA"

--druid
oUF.Tags.Methods['raid:rejuv'] = function(u)
  local name, _,_,_,_,_, fromwho,_ = AuraUtil.FindAuraByName("Rejuvenation", u)
  if not (fromwho == "player") then return end
  if name then return "|cff00FEBF"..x.."|r" end end
oUF.Tags.Events['raid:rejuv'] = "UNIT_AURA"
-- rejuvtime
oUF.Tags.Methods['raid:rejuvTime'] = function(u)
  local name, _,_,_,_, expirationTime, fromwho,_ = AuraUtil.FindAuraByName("Rejuvenation", u)
  if fromwho == "player" then return getTime(expirationTime) end
end
oUF.Tags.Events['raid:rejuvTime'] = "UNIT_AURA"
oUF.Tags.Methods['raid:regrow'] = function(u) if AuraUtil.FindAuraByName("Regrowth", u) then return "|cff00FF10"..x.."|r" end end
oUF.Tags.Events['raid:regrow'] = "UNIT_AURA"
oUF.Tags.Methods['raid:wg'] = function(u) if AuraUtil.FindAuraByName("Wild Growth", u) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['raid:wg'] = "UNIT_AURA"

--warrior
oUF.Tags.Methods['raid:bsh'] = function(u) if not AuraUtil.FindAuraByName("Battle Shout", u) then return "|cffff0000"..x.."|r" end end
oUF.Tags.Events['raid:bsh'] = "UNIT_AURA"
oUF.Tags.Methods['raid:SW'] = function(u) if AuraUtil.FindAuraByName("Shield Wall", u) then return "|cff9900FF"..x.."|r" end end
oUF.Tags.Events['raid:SW'] = "UNIT_AURA"

--rogue
oUF.Tags.Methods['raid:tricks'] = function(u) if AuraUtil.FindAuraByName("Tricks of the Trade", u) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['raid:tricks'] = "UNIT_AURA"

--demon hunter
oUF.Tags.Methods['raid:sf'] = function(u) if AuraUtil.FindAuraByName("Soul Fragments", u) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['raid:sf'] = "UNIT_AURA"

--paladin
oUF.Tags.Events['raid:beaconTime'] = "UNIT_AURA"
oUF.Tags.Methods['raid:HoS'] = function(u) if AuraUtil.FindAuraByName("Blessing of Sacrifice", u) then return "|cffEB2175"..x.."|r" end end
oUF.Tags.Events['raid:HoS'] = "UNIT_AURA"
oUF.Tags.Methods['raid:HoF'] = function(u) if AuraUtil.FindAuraByName("Blessing of Freedom", u) then return "|cffA7EB21"..x.."|r" end end
oUF.Tags.Events['raid:HoF'] = "UNIT_AURA"
oUF.Tags.Methods['raid:HoP'] = function(u) if AuraUtil.FindAuraByName("Blessing of Protection", u) then return "|cff96470F"..x.."|r" end end
oUF.Tags.Events['raid:HoP'] = "UNIT_AURA"
oUF.Tags.Methods['raid:BoK'] = function(u) if AuraUtil.FindAuraByName("Greater Blessing of Kings", u) then return "|cff00A1DE"..x.."|r" end end
oUF.Tags.Events['raid:BoK'] = "UNIT_AURA"
oUF.Tags.Methods['raid:BoW'] = function(u) if AuraUtil.FindAuraByName("Greater Blessing of Wisdom", u) then return "|cff0001DE"..x.."|r" end end
oUF.Tags.Events['raid:BoW'] = "UNIT_AURA"
oUF.Tags.Methods['raid:beacon'] = function(u)
    local name, _,_,_,_, expirationTime, fromwho =  AuraUtil.FindAuraByName("Beacon of Light", u)

    if not name then return end
    if(fromwho == "player") then
		return "|cffFFCC00"..x.."|r"
    else
		return "|cff996600"..x.."|r" -- other pally's beacon
    end
end
oUF.Tags.Events['raid:beacon'] = "UNIT_AURA"
oUF.Tags.Methods['raid:eflTime'] = function(u)
  local name, _,_,_,_, expirationTime, fromwho,_ = AuraUtil.FindAuraByName("Eternal Flame", u)
  if (fromwho == "player") then return getTime(expirationTime) end
end
oUF.Tags.Events['raid:eflTime'] = "UNIT_AURA"
--[[oUF.Tags.Methods['raid:ssh'] = function(u)
    local name, _,_,_,_,_, expirationTime, fromwho = AuraUtil.FindAuraByName("Sacred Shield", u)
    if not name then return end
	local spellTimer = GetTime()-expirationTime
    if(fromwho == "player") then
        local spellTimer = GetTime()-expirationTime
        if spellTimer > -4 then
            return "|cffEE7070S|r"
        else
            return "|cff70EE70S|r"
        end
    else
		return "|cff60AA60S|r" -- other pally's sacred shield
    end
end
oUF.Tags.Events['raid:ssh'] = "UNIT_AURA"]]
oUF.Tags.Methods['raid:forb'] = function(u) if AuraUtil.FindAuraByName("Forbearance", u) then return "|cffFF0000"..x.."|r" end end
oUF.Tags.Events['raid:forb'] = "UNIT_AURA"

--shaman
oUF.Tags.Methods['raid:rip'] = function(u)
	local name, _,_,_,_,_, fromwho,_ = AuraUtil.FindAuraByName("Riptide", u)
	if not (fromwho == 'player') then return end
	if name then return '|cff00FEBF'..x..'|r' end end
oUF.Tags.Events['raid:rip'] = 'UNIT_AURA'
oUF.Tags.Methods['raid:ripTime'] = function(u)
	local name, _,_,_,_, expirationTime, fromwho,_ = AuraUtil.FindAuraByName("Riptide", u)
	if (fromwho == "player") then return getTime(expirationTime) end
end
oUF.Tags.Events['raid:ripTime'] = 'UNIT_AURA'

--monk
oUF.Tags.Methods['raid:rmTime'] = function(u)
  local name, _,_,_,_, expirationTime, fromwho,_ = AuraUtil.FindAuraByName("Renewing Mist", u)
  if (fromwho == "player") then return getTime(expirationTime) end
end
oUF.Tags.Events['raid:rmTime'] = "UNIT_AURA"
oUF.Tags.Methods['raid:em'] = function(u) if AuraUtil.FindAuraByName("Enveloping Mist", u) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['raid:em'] = "UNIT_AURA"
oUF.Tags.Methods['raid:lc'] = function(u) if AuraUtil.FindAuraByName("Life Cocoon", u) then return "|cffA7EB21"..x.."|r" end end
oUF.Tags.Events['raid:lc'] = "UNIT_AURA"

--warlock
oUF.Tags.Methods['raid:ss'] = function(u) if AuraUtil.FindAuraByName("Soulstone", u) then return "|cff33FF33"..x.."|r" end end
oUF.Tags.Events['raid:ss'] = "UNIT_AURA"

--mage
oUF.Tags.Methods['raid:brill'] = function(u) if not AuraUtil.FindAuraByName("Arcane Brilliance", u) then return "|cff00A1DE"..x.."|r" end end
oUF.Tags.Events['raid:brill'] = "UNIT_AURA"

oUF.classIndicators={
		["DRUID"] = {
				["TL"] = "[raid:regrow][raid:wg]",
				["TR"] = "[raid:lb]",
				["BL"] = "",
--				["BR"] = "[raid:motw]",
				["Cen"] = "[raid:rejuvTime]",
		},
		["PRIEST"] = {
				["TL"] = "[raid:pws][raid:ws][raid:clow]",
				["TR"] = "[raid:pom]",
				["BL"] = "[raid:fw]",
				["BR"] = "[raid:fort]",
				["Cen"] = "[raid:rnwTime]",
		},
		["PALADIN"] = {
				["TL"] = "[raid:HoS][raid:HoF][raid:HoP][raid:forb]",
--				["TR"] = "[raid:ssh]",
				["BL"] = "[raid:beacon]",
				["BR"] = "[raid:BoK][raid:BoW]",
				["Cen"] = "[raid:eflTime]",

		},
		["WARLOCK"] = {
				["TL"] = "[raid:ss]",
				["TR"] = "",
				["BL"] = "",
				["BR"] = "",
				["Cen"] = "",
		},
		["WARRIOR"] = {
				["TL"] = "",
				["TR"] = "",
				["BL"] = "",
				["BR"] = "[raid:bsh]",
				["Cen"] = "",
		},
		["DEATHKNIGHT"] = {
				["TL"] = "",
				["TR"] = "",
				["BL"] = "",
				["Cen"] = "",
		},
		["SHAMAN"] = {
				["TL"] = "",
				["TR"] = "",
				["BL"] = "[raid:wrack]",
				["BR"] = "",
				["Cen"] = "[raid:ripTime]",
		},
		["HUNTER"] = {
				["TL"] = "",
				["TR"] = "",
				["BL"] = "",
				["BR"] = "",
				["Cen"] = "",
		},
		["ROGUE"] = {
				["TL"] = "[raid:tricks]",
				["TR"] = "",
				["BL"] = "",
				["BR"] = "",
				["Cen"] = "",
		},
		["MAGE"] = {
				["TL"] = "",
				["TR"] = "",
				["BL"] = "",
				["BR"] = "[raid:brill]",
				["Cen"] = "",
		},
		["MONK"] = {
				["TL"] = "[raid:em]",
				["TR"] = "",
				["BL"] = "[raid:lc]",
--				["BR"] = "[raid:motw]",
				["Cen"] = "[raid:rmTime]",
		},
    ["DEMONHUNTER"] = {
        ["TL"] = "",
        ["TR"] = "",
        ["BL"] = "",
        ["BR"] = "",
        ["Cen"] = "",
    },
}
