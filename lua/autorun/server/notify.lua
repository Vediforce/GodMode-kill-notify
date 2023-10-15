hook.Add("PlayerHurt", "GetAttacker", function(victim, attacker, damageTaken, healthRemaining)
    -- Loop through all players
    for _, ply in pairs(player.GetAll()) do
        -- If the player is an admin and the attacker is not an admin and the attacker has god mode
        if ply:IsAdmin() and not attacker:IsAdmin() and attacker:HasGodMode() then
            -- Print a message to the player that the attacker has attacked them in god mode
            ply:PrintMessage(HUD_PRINTTALK, attacker:Nick() .. " аттаковал " .. victim:Nick() .. " в годмоде!")
        end
    end
    -- If the attacker is an admin, return
    if attacker:IsAdmin() then return end
    -- If the attacker is a player and has god mode, set their health to the health remaining
    if attacker:IsPlayer() and attacker:HasGodMode() then
        victim:SetHealth(victim:Health() + healthRemaining)
    end
end)
