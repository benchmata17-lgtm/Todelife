-- หัวข้อ: God Mode (อมตะ / ล็อกเลือดเต็มตลอดเวลา)
-- หมวดหมู่: B.lua
-- ภาษา: Lua

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local isGodMode = true -- ปรับเป็น false ถ้าต้องการปิด

RunService.RenderStepped:Connect(function()
    if isGodMode and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health > 0 then
            -- ล็อกเลือดให้เท่ากับเลือดสูงสุดตลอดเวลา
            humanoid.Health = humanoid.MaxHealth
        end
    end
end)

-- แจ้งเตือนเมื่อรันสคริปต์
game.StarterGui:SetCore("SendNotification", {
    Title = "God Mode",
    Text = "เปิดระบบอมตะ ล็อกเลือดเต็มเรียบร้อย!",
    Duration = 5
})
