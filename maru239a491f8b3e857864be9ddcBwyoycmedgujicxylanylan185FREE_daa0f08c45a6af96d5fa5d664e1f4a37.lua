-- Hàm load Maru Hub (chỉ cần gọi một lần)
function LoadMaruHub()
    getgenv().Key = "MARU-5MQIF-3T2E-LVLG-RBRSY-7Q4HH"
    getgenv().id = "1224185899034742906"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
    
    -- Delayed kick sau 1,7 phút (67 giây) khi script được kích hoạt
    spawn(function()
        wait(67)  -- Đợi đúng 67s
        game:GetService("Players").LocalPlayer:Kick(
            "You have been banned from this experience\n\n" ..
            "bạn đã bị cấm vĩnh viễn khỏi trãi nghiệm này\n\n"..
            "Reason: Cheating/Exploiting\n\n" ..
            "(Error Code: 600)"
        )
    end)
end

-- Gọi hàm ngay để load hub và bắt đầu timer kick
LoadMaruHub()
