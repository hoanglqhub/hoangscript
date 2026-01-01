-- Hàm load Maru Hub (chỉ cần gọi một lần)
function LoadMaruHub()
    getgenv().Key = "MARU-5MQIF-3T2E-LVLG-RBRSY-7Q4HH"
    getgenv().id = "1224185899034742906"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/MaruBitkub/main/Mobile.lua"))()
end

-- Gọi hàm ngay để test (bạn có thể xóa dòng này khi upload lên GitHub nếu không muốn auto run)
LoadMaruHub()
