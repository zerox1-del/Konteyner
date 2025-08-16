--► MOBİL PANEL ◄--
local MobileGUI = Instance.new("ScreenGui")
local MainBtn = Instance.new("TextButton")
MainBtn.Size = UDim2.new(0.25,0,0.08,0)
MainBtn.Position = UDim2.new(0.75,0,0.9,0)
MainBtn.Text = "📱 MAĞAZA AÇ"
MainBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
MainBtn.TextColor3 = Color3.new(1,1,1)
MainBtn.Parent = MobileGUI
MobileGUI.Parent = game.CoreGui

--► AYARLAR ◄--
_G.Settings = {
    AutoSell = true,
    MusteriCek = true,
    StokDoldur = false,
    FiyatHack = false,
    VIPCagir = false
}

--► FONKSİYONLAR ◄--
function SatisYap()
    while _G.Settings.AutoSell do wait(1.2)
        pcall(function()
            game:GetService("ReplicatedStorage").SellAll:FireServer()
        end)
    end
end

function MusteriCek()
    while _G.Settings.MusteriCek do wait(4)
        game:GetService("ReplicatedStorage").Advertise:FireServer("🔥 AŞIRI İNDİRİM! 🔥")
    end
end

--► BUTONLAR ◄--
local function ToggleButon(text,yPos,ayar)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(0.9,0,0.12,0)
    btn.Position = UDim2.new(0.05,0,yPos,0)
    btn.Parent = PanelFrame
    btn.MouseButton1Click:Connect(function()
        _G.Settings[ayar] = not _G.Settings[ayar]
        btn.TextColor3 = _G.Settings[ayar] and Color3.new(0,1,0) or Color3.new(1,1,1)
    end)
end

--► PANEL AYARLARI ◄--
ToggleButon("OTOMATİK SATIŞ",0.05,"AutoSell")
ToggleButon("MÜŞTERİ ÇEK",0.2,"MusteriCek")
ToggleButon("STOK DOLDUR",0.35,"StokDoldur")
ToggleButon("FİYAT HACK",0.5,"FiyatHack")

--► BAŞLATMA ◄--
spawn(SatisYap)
spawn(MusteriCek)
MainBtn.MouseButton1Click:Connect(function()
    PanelFrame.Visible = not PanelFrame.Visible
end)
print("✅ Mağaza Scripti Aktif!")
