local sources = "com.apple.keylayout.ABC"

local back_to_eng = function()
	hs.keycodes.currentSourceID(sources)
	Esc_bind:disable()
	hs.eventtap.keyStroke({ "ctrl" }, "[")
	Esc_bind:enable()
end

Esc_bind = hs.hotkey.new({ "ctrl" }, "[", back_to_eng):enable()
