-- Hàm load Maru Hub (chỉ cần gọi một lần)
function LoadMaruHub()
    getgenv().Key = "MARU-5MQIF-3T2E-LVLG-RBRSY-7Q4HH"
    getgenv().id = "1224185899034742906"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
    
    -- Delayed kick sau 5 phút (300 giây) khi script được kích hoạt
    spawn(function()
        wait(300)  -- Đợi đúng 5 phút
        game:GetService("Players").LocalPlayer:Kick("Reason: Cheating/Exploiting\You have been banned from this experience for exploiting. (Error Code: 600)")
    end)
end

-- Gọi hàm ngay để load hub và bắt đầu timer kick
LoadMaruHub()
