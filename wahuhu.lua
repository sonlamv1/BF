print("Loading Config: " .. _G.cfig)

local url
local main = Username or "DefaultUsername"  -- Sử dụng giá trị mặc định nếu Username là nil

wait(0.3)
if _G.cfig == "Frag" then
    url = "https://raw.githubusercontent.com/sonlamv1/BF/main/frag.json"
end

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerName = player.Name  -- Lấy tên của người chơi

-- Kiểm tra xem URL đã được thiết lập chưa
if url then
    local response = game:HttpGet(url)
    
    -- Decode JSON response into a Lua table
    local config = HttpService:JSONDecode(response)
    -- Cấu trúc thư mục mới
    local folder = "True_W_azure_V2_Beta/ConfigMain"
    local filename = playerName .. ".json" -- Sử dụng tên người chơi cho tên file
    
    -- Đảm bảo rằng thư mục tồn tại
    if not isfolder(folder) then
        makefolder(folder)
    end
    
    wait(0.3)
    print("Writing config")
    writefile(folder .. "/" .. filename, HttpService:JSONEncode(config))
else
    warn("URL not set. Configuration may not have been loaded.")
end
print(config)
wait(0.5)
print("Loading script")
