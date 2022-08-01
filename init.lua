print('==================================================')
configPath = hs.fs.pathToAbsolute(hs.configdir .. '/config.lua')
if configPath then
    -- Load awesomeconfig file if exists
    require('config')
end
require "headphone.headphone"
require "hotkey.hotkey"
require "ime.ime"
require "reload.reload"
require "usb.usb"
require "mouse.mouse"
require "wifi.wifi"
require "window.window"
require "statuslets.statuslets"
