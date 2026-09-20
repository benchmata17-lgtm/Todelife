-- หัวข้อ: Max FPS Boost (กราฟิกดินน้ำมัน)
-- หมวดหมู่: สายบูสต์ FPS

local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")

-- ปิดเงาและเอฟเฟกต์แสง
lighting.GlobalShadows = false
lighting.FogEnd = 9e9
lighting.Brightness = 1

-- เปลี่ยนพื้นผิวทุกอย่างให้เป็นพลาสติกเรียบ (ดินน้ำมัน)
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v:Destroy() -- ลบลวดลายทิ้งเพื่อลดการกินสเปค
    end
end

game.StarterGui:SetCore("SendNotification", {
    Title = "FPS Boost",
    Text = "ลดกราฟิกลงต่ำสุดเพื่อรีด FPS แล้ว!",
    Duration = 5
})
