-- หัวข้อ: Super Speed & High Jump
-- หมวดหมู่: สายเกรียน (Troll)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- ตั้งค่าความเร็ว (ปกติคือ 16)
humanoid.WalkSpeed = 150 
-- ตั้งค่าความสูงการกระโดด (ปกติคือ 50)
humanoid.JumpPower = 200 
humanoid.UseJumpPower = true

game.StarterGui:SetCore("SendNotification", {
    Title = "Troll Hub",
    Text = "เปิดโหมดวิ่งไว & กระโดดสูงแล้ว!",
    Duration = 5
})
