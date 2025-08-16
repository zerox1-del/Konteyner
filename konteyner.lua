--► AYARLAR ◄--
_G.Settings = {
    AutoSell = true,
    MusteriCek = true,
    StokDoldur = true,
    RakipSabotaj = true,
    VIPCagir = true,
    FiyatHack = true,
    AntiBan = true
}

--► FONKSİYONLAR ◄--
function SafeFire(event, ...)
    pcall(function()
        game:GetService("ReplicatedStorage")[event]:FireServer(...)
        wait(math.random(1,3))
    end)
end

--► OTOMATİK SİSTEMLER ◄--
spawn(function() -- OTO SATIŞ
    while _G.Settings.AutoSell do wait(1.5)
        SafeFire("SellAll")
    end
end)

spawn(function() -- STOK
    while _G.Settings.StokDoldur do wait(30)
        SafeFire("RestockAll")
    end
end)

spawn(function() -- SABOTAJ
    while _G.Settings.RakipSabotaj do wait(45)
        SafeFire("SabotageCompetitor", "full")
    end
end)

spawn(function() -- VIP
    while _G.Settings.VIPCagir do wait(10)
        SafeFire("SpawnVIP", "diamond")
    end
end)

spawn(function() -- FİYAT HACK
    while _G.Settings.FiyatHack do wait(7)
        for _,v in pairs(game.Workspace.Products:GetChildren()) do
            if v:FindFirstChild("Price") then
                v.Price.Value = v.Price.Value * 10
            end
        end
    end
end)

--► MOBİL PANEL ◄--
local gui = Instance.new("ScreenGui")
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.25,0,0.08,0)
btn.Position = UDim2.new(0.75,0,0.85,0)
btn.Text = "📱 HİLELER AKTİF"
btn.BackgroundColor3 = Color3.fromRGB(255,50,50)
btn.TextColor3 = Color3.new(1,1,1)
btn.Parent = gui
gui.Parent = game.CoreGui

print("✅ Tüm hileler aktif!")
]]
