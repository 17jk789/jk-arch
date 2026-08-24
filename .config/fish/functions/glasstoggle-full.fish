function glasstoggle-full

    set file ~/.config/hypr/hyprland/rules.lua

    if grep -q GLASS_MODE_START $file

        sed -i '/-- GLASS_MODE_START/,/-- GLASS_MODE_END/d' $file
        notify-send "Glass Toggle" AUS

    else

        printf '%s\n' '-- GLASS_MODE_START
-- Alle Apps: 90% Transparenz + globaler Blur aus decoration.blur
hl.window_rule({
	match = {
		class = ".*",
	},
	opacity = 0.9,
})

-- Keine Transparenz für diese Apps
hl.window_rule({
	match = {
        class = "^(kitty|Alacritty)$",
	},
	opacity = 1.0,
})
-- GLASS_MODE_END' >>$file

        notify-send "Glass Toggle" AN

    end

    hyprctl reload

end
