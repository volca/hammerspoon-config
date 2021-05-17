-- Mouse management

function mousemovescreen(how)
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)

    -- hs.mouse.setRelativePosition(center, nextScreen)
    hs.mouse.setAbsolutePosition(center)
end

-------- Key bindings

-- Move between screens
hs.hotkey.bind({"ctrl", "shift"}, "Left",  hs.fnutils.partial(mousemovescreen, "left"))
hs.hotkey.bind({"ctrl", "shift"}, "Right", hs.fnutils.partial(mousemovescreen, "right"))
