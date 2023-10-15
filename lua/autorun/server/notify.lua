hook.Add("PlayerHurt", "GetAttacker", function(victim, attacker, damageTaken)
    if IsValid(attacker) and attacker:IsPlayer() and attacker:HasGodMode() then
        for _, ply in ipairs(player.GetAll()) do
            if ply:IsAdmin() then
                ply:Notify(attacker:Nick() .. " аттаковал " .. victim:Nick() .. "в годмоде!")
            end
        end
        victim:SetHealth(victim:Health()+damageTaken)
    end
end)