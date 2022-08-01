local enabled = hs.execute("networksetup -getsocksfirewallproxy 'Wi-fi'"):find("Enabled: Yes")

proxyMenu = hs.menubar.new()
                :setTitle(enabled == 1 and "☎︎" or "☏")
                :setTooltip("proxy switch")

function toggleProxy()
    enabled = enabled == false and true or false
    if enabled then
        hs.execute("networksetup -setsocksfirewallproxystate 'Wi-fi' on")
        proxyMenu:setTitle("☎︎")
    else
        hs.execute("networksetup -setsocksfirewallproxystate 'Wi-fi' off")
        proxyMenu:setTitle("☏")
    end
end

proxyMenu:setClickCallback(toggleProxy)

function ssidChangedCallback()
    ssid = hs.wifi.currentNetwork()
    if (ssid ~= nil) then
        print("ssid = "..(ssid))
    end

    -- See config.lua for CONFIG_WIFI_SSID
    if (ssid ~= CONFIG_WIFI_SSID) then
        hs.execute("networksetup -setsocksfirewallproxystate 'Wi-fi' off")
    else
        hs.execute("networksetup -setsocksfirewallproxystate 'Wi-fi' on")
    end
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()

