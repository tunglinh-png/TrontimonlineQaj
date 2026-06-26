-- Khởi tạo Giao diện và Bo góc nâng cao
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner_Main = Instance.new("UICorner")
local UIGradient_Main = Instance.new("UIGradient")
local UIStroke_Main = Instance.new("UIStroke")

local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local UICorner_Input = Instance.new("UICorner")
local UIStroke_Input = Instance.new("UIStroke")

local CheckBtn = Instance.new("TextButton")
local UICorner_Check = Instance.new("UICorner")
local GetKeyBtn = Instance.new("TextButton")
local UICorner_Get = Instance.new("UICorner")

local ErrorMsg = Instance.new("TextLabel")

-- Cấu hình gốc
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Thân máy (Main Frame)
MainFrame.Name = "ModernKeySystem"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.5, -160, 0.4, -110)
MainFrame.Size = UDim2.new(0, 320, 0, 220)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true

UICorner_Main.CornerRadius = UDim.new(0, 12)
UICorner_Main.Parent = MainFrame

UIStroke_Main.Thickness = 1.5
UIStroke_Main.Color = Color3.fromRGB(55, 55, 65)
UIStroke_Main.Parent = MainFrame

UIGradient_Main.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 20))
})
UIGradient_Main.Rotation = 45
UIGradient_Main.Parent = MainFrame

-- Tiêu đề WONDER PREMIUM SYSTEM
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "WONDER PREMIUM SYSTEM"
Title.TextColor3 = Color3.fromRGB(240, 240, 255)
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold

-- Khung Nhập Key
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
KeyInput.Position = UDim2.new(0.06, 0, 0.28, 0)
KeyInput.Size = UDim2.new(0.88, 0, 0, 38)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Nhập Key bí mật tại đây..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.Font = Enum.Font.Gotham

UICorner_Input.CornerRadius = UDim.new(0, 8)
UICorner_Input.Parent = KeyInput

UIStroke_Input.Thickness = 1
UIStroke_Input.Color = Color3.fromRGB(50, 50, 70)
UIStroke_Input.Parent = KeyInput

-- Nút Xác Nhận
CheckBtn.Parent = MainFrame
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
CheckBtn.Position = UDim2.new(0.06, 0, 0.52, 0)
CheckBtn.Size = UDim2.new(0.42, 0, 0, 38)
CheckBtn.Text = "XÁC NHẬN"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextSize = 13
CheckBtn.Font = Enum.Font.GothamBold

UICorner_Check.CornerRadius = UDim.new(0, 8)
UICorner_Check.Parent = CheckBtn

-- Nút Lấy Key
GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
GetKeyBtn.Position = UDim2.new(0.52, 0, 0.52, 0)
GetKeyBtn.Size = UDim2.new(0.42, 0, 0, 38)
GetKeyBtn.Text = "LẤY KEY"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
GetKeyBtn.TextSize = 13
GetKeyBtn.Font = Enum.Font.GothamBold

UICorner_Get.CornerRadius = UDim.new(0, 8)
UICorner_Get.Parent = GetKeyBtn

-- Dòng thông báo trạng thái
ErrorMsg.Parent = MainFrame
ErrorMsg.BackgroundTransparency = 1
ErrorMsg.Position = UDim2.new(0.06, 0, 0.76, 0)
ErrorMsg.Size = UDim2.new(0.88, 0, 0, 30)
ErrorMsg.Text = "Vui lòng nhập key để tiếp tục"
ErrorMsg.TextColor3 = Color3.fromRGB(150, 150, 160)
ErrorMsg.TextSize = 13
ErrorMsg.Font = Enum.Font.GothamMedium

---------------------------------------------------------
-- HỆ THỐNG HIỆU ỨNG VÀ XỬ LÝ LOGIC
---------------------------------------------------------
local TweenService = game:GetService("TweenService")
local CorrectKey = "CX15GameRoblox"
local KeyLink = "https://link4m.net/go/bEKRHg4M" -- Link vượt key Link4M của bạn

-- Hover chuột đổi màu nút
local function AddHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
    end)
end

AddHoverEffect(CheckBtn, Color3.fromRGB(0, 120, 255), Color3.fromRGB(0, 150, 255))
AddHoverEffect(GetKeyBtn, Color3.fromRGB(40, 40, 50), Color3.fromRGB(50, 50, 65))

KeyInput.Focused:Connect(function()
    TweenService:Create(UIStroke_Input, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 120, 255)}):Play()
end)
KeyInput.FocusLost:Connect(function()
    TweenService:Create(UIStroke_Input, TweenInfo.new(0.2), {Color = Color3.fromRGB(50, 50, 70)}):Play()
end)

-- Hàm hiện chữ thông báo chuẩn
local function ShowMessage(text, color)
    ErrorMsg.Text = text
    ErrorMsg.TextColor3 = color
    ErrorMsg.TextTransparency = 1
    TweenService:Create(ErrorMsg, TweenInfo.new(0.15), {TextTransparency = 0}):Play()
end

-- Tắt giao diện mượt và chạy Script chính
local function CloseUIAndLoad()
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -160, 1.1, 0)
    }):Play()
    wait(0.4)
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lavakin404-debug/Paint-And-Seek/refs/heads/main/MainLoader.lua"))()
end

-- Bấm Kiểm Tra Key
CheckBtn.MouseButton1Click:Connect(function()
    -- Hiệu ứng nhấn nút thu nhỏ
    CheckBtn.Size = UDim2.new(0.4, 0, 0, 36)
    delay(0.05, function() CheckBtn.Size = UDim2.new(0.42, 0, 0, 38) end)

    if KeyInput.Text == CorrectKey then
        ShowMessage("✔ Key chính xác! Đang tải dữ liệu...", Color3.fromRGB(0, 255, 150))
        CheckBtn.Visible = false
        GetKeyBtn.Visible = false
        wait(0.8)
        CloseUIAndLoad()
    else
        -- Hiển thị thông báo lỗi rõ ràng trước
        ShowMessage("❌ Sai Key! Vui lòng thử lại.", Color3.fromRGB(255, 70, 70))
        
        -- Chạy hiệu ứng rung lắc (Shake UI) song song
        spawn(function()
            local originalPos = MainFrame.Position
            for i = 1, 3 do
                MainFrame.Position = originalPos + UDim2.new(0, 8, 0, 0)
                wait(0.04)
                MainFrame.Position = originalPos - UDim2.new(0, 8, 0, 0)
                wait(0.04)
            end
            MainFrame.Position = originalPos
        end)
    end
end)

-- Bấm Get Key
GetKeyBtn.MouseButton1Click:Connect(function()
    GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 36)
    delay(0.05, function() GetKeyBtn.Size = UDim2.new(0.42, 0, 0, 38) end)
    
    -- Sao chép link vào bộ nhớ tạm
    setclipboard(KeyLink)
    
    -- Tự động mở link trên trình duyệt của máy (Hỗ trợ hầu hết các Exploit hiện nay như Wave, Solara, Celery...)
    if AnyAsit and AnyAsit.request then
        -- Dự phòng cho một số bản thực thi cũ
    elseif request then
        request({Url = KeyLink, Method = "GET"})
    elseif syn and syn.request then
        syn.request({Url = KeyLink, Method = "GET"})
    end
    
    ShowMessage("📋 Đã sao chép và mở link lấy Key!", Color3.fromRGB(200, 200, 255))
end)

-- Hiệu ứng bung màn hình khi mở script lên
MainFrame.Size = UDim2.new(0, 320, 0, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 320, 0, 220)
}):Play()
