-- หัวข้อ: Get Player Coordinates (หาพิกัด)
-- หมวดหมู่: เครื่องมือนักพัฒนา (Builder)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- พิมพ์พิกัดปัจจุบันลงใน Console (F9) เพื่อให้นักพัฒนาก๊อปปี้ไปใช้ต่อได้ง่าย
local pos = rootPart.Position
local coordString = string.format("Vector3.new(%.2f, %.2f, %.2f)", pos.X, pos.Y, pos.Z)

print("=== พิกัดของคุณคือ ===")
print(coordString)
print("=====================")

game.StarterGui:SetCore("SendNotification", {
    Title = "Studio Builder",
    Text = "พิมพ์พิกัดลงในหน้าต่าง F9 (Console) แล้ว!",
    Duration = 5
})
