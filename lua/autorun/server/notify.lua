if SERVER then
    util.AddNetworkString("NET_GODNOTIFI")

    hook.Add("PlayerHurt", "GetAttacker", function(victim, attacker, damageTaken, healthRemaining)
		for _, ply in pairs(player.GetAll()) do
			if ply:IsAdmin() and attacker:HasGodMode() then
				net.Start("NET_GODNOTIFI")
				net.WriteString(attacker:Nick())
				net.Send(ply)
			end
		end

		if attacker:IsAdmin() then return end
	    if attacker:IsPlayer() and attacker:HasGodMode() then
	        victim:SetHealth(victim:Health() + healthRemaining)
	    end
	end)
end
	
if CLIENT then
	net.Receive("NET_GODNOTIFI", function()
		local attacker = net.ReadString()
        print(attacker .. " attacked in god mode! <<<<<")
        notification.AddLegacy(attacker .. " аттаковал в годмоде!", 3, 7)
	end)
end
