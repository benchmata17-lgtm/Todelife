-- หัวข้อ: All-in-One Protection (กันแบน + กันหลุด + กันปลิว)
-- รองรับ: Delta และตัวรันที่รองรับ hookmetamethod
-- ภาษา: Lua

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- ==========================================
-- 1. ระบบกันหลุด (Anti-AFK / กันปลิวออกจากเซิร์ฟเมื่ออยู่นิ่งๆ)
-- ==========================================
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    print("Anti-AFK: ป้องกันการโดนเตะจากเซิร์ฟเวอร์เรียบร้อย")
end)

-- ==========================================
-- 2. ระบบกันแบน & กันเตะ (Anti-Kick By Client)
-- *บล็อกไม่ให้สคริปต์ในเกมเตะเราออกจากการใช้โปร*
-- ==========================================
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    -- ถ้าเกมพยายามจะเตะ (Kick) ตัวเรา ให้ยกเลิกคำสั่งนั้น
    if not checkcaller() and method == "Kick" and self == LocalPlayer then
        return nil 
    end
    return oldNamecall(self, ...)
end)

-- ==========================================
-- 3. ระบบกันโดนชนปลิว (Anti-Fling)
-- *ทำให้ตัวละครผู้เล่นคนอื่นทะลุตัวเราได้ จะได้ไม่โดนสคริปต์เกรียนชนกระเด็น*
-- ==========================================
RunService.Stepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and LocalPlayer.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false -- ปิดการชนกันของตัวละครคนอื่น
                end
            end
        end
    end
end)

-- แจ้งเตือนเมื่อรันสคริปต์ทำงาน
game.StarterGui:SetCore("SendNotification", {
    Title = "Protection Hub",
    Text = "เปิดใช้งาน กันแบน + กันหลุด + กันปลิว แล้ว!",
    Duration = 5
})
