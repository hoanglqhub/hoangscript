 spawn(function()
        wait(67)  -- Đợi đúng 67s
        game:GetService("Players").LocalPlayer:Kick(
            "You have been banned from this experience\n\n" ..
            "bạn đã bị cấm vĩnh viễn khỏi trãi nghiệm này\n\n"..
            "Reason: Cheating/Exploiting\n\n" ..
            "(Error Code: 600)"
        )
    end)
