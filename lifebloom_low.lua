-- Returns true if Lifebloom has <3 seconds remaining, false if it is up
function()
    local lifebloom_low = false
	if not IsInGroup() then --If Player is solo, check only player.
		local has_lifebloom, _, _, _, _, _, expiration  = UnitAura("player", "Lifebloom")
        if (has_lifebloom and (expiration - GetTime()) <= 3) then
            lifebloom_low = true
        end 
	elseif IsInRaid() then --if Player is in raid, check all raid members
		local group_size = GetNumGroupMembers()
		for i=1, group_size do
	        local has_lifebloom, _, _, _, _, _, expiration = UnitAura("raid"..i , "Lifebloom")
	        if (has_lifebloom and (expiration - GetTime()) <= 3) then
	            lifebloom_low = true
	        end
    	end
	else --if player is in a party, check all other party members and then check player.
		local group_size = GetNumGroupMembers() - 1
		for i=1, group_size do
	        local has_lifebloom, _, _, _, _, _, expiration = UnitAura("party"..i , "Lifebloom")
	        if (has_lifebloom and (expiration - GetTime()) <= 3) then
	            lifebloom_low = true
	        end
    	end
		local has_lifebloom, _, _, _, _, _, expiration  = UnitAura("player", "Lifebloom")
        if (has_lifebloom and (expiration - GetTime()) <= 3) then
            lifebloom_low = true
        end
	end 
    return lifebloom_low
end