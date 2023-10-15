hook.Add("PlayerHurt", "GetAttacker", function(victim, attacker, damageTaken, healthRemaining)
    for _, ply in pairs(player.GetAll()) do
        if ply:IsAdmin() and not attacker:IsAdmin() and attacker:HasGodMode() then
            ply:PrintMessage(HUD_PRINTTALK, attacker:Nick() .. " аттаковал " .. victim:Nick() .. " в годмоде!")
        end
    end
    if attacker:IsAdmin() then return end
    if attacker:IsPlayer() and attacker:HasGodMode() then
        print("123")
        victim:SetHealth(victim:Health() + healthRemaining)
    end
end)
