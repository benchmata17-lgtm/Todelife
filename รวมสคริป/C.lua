-- หัวข้อ: Universal Auto Clicker
-- หมวดหมู่: สายฟาร์ม

local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local autoClick = true -- เปลี่ยนเป็น false ถ้าต้องการปิด

RunService.RenderStepped:Connect(function()
    if autoClick then
        -- สั่งจำลองการคลิกเมาส์ซ้ายหรือแตะหน้าจอรัวๆ
        VirtualUser:ClickButton1(Vector2.new(0,0))
    end
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Auto Farm",
    Text = "Auto Clicker เริ่มทำงานแล้ว!",
    Duration = 5
})
