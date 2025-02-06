CMD_Q_SAFARI = hs.hotkey.new({ "cmd" }, "q", function()
    local app = hs.application.frontmostApplication()
    local appName = app:name()
    if app:name() == "Safari" then
        local button, text = hs.dialog.blockAlert("Are you sure you want to quit Safari?", "Safari has open windows or tabs.", "Quit", "Cancel")
        if button == "Quit" then
            app:kill() -- This command will close Safari if "Quit" is selected
        end
    else
        CMD_Q_SAFARI:disable()
        hs.eventtap.keyStroke({ "cmd" }, "Q")
        CMD_Q_SAFARI:enable()
    end
end):enable()
