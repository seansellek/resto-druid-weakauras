-- Returns true if Lifebloom is missing from raid, false if it is up
function()
    local raid_size = GetNumGroupMembers()
    local lifebloom_up = false
    if raid_size == 0 then
        has_lifebloom = select(1, UnitAura("player", "Lifebloom"))
        if has_lifebloom then
            lifebloom_up = true
        end
    end
    for i=1, raid_size do
        local has_lifebloom = select(1, UnitAura("raid"..i , "Lifebloom"))
        if has_lifebloom then
            lifebloom_up = true
        end
    end
    return not lifebloom_up -- remove 'not' to return true if lifebloom is up
end