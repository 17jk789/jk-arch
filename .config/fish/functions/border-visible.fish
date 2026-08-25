function border-visible

    set colors ~/.config/hypr/hyprland/colors.lua
    set general ~/.config/hypr/hyprland/general.lua

    if grep -q -- "-- BORDER_VISIBLE_ON" $general

        # ============================================================
        # BORDER VISIBLE -> OFF / DEFAULT
        # ============================================================

        # Status-Marker entfernen
        sed -i '/-- BORDER_VISIBLE_ON/d' $general

        # general.lua -> DEFAULT
        sed -i 's/border_size = 2,/border_size = 1,/' $general

        sed -i 's/colors = { "rgba(b4befeFF)", "rgba(89b4faFF)", "rgba(74c7ecFF)" }/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/' $general

        sed -i 's/colors = { "rgba(89b4fa33)" }/colors = { "rgba(ffffff18)" }/' $general

        # colors.lua -> DEFAULT
        sed -i 's/active_border = "rgba(b4befeFF)"/active_border = "rgba(47464877)"/' $colors

        sed -i 's/inactive_border = "rgba(89b4fa33)"/inactive_border = "rgba(1c1b1d33)"/' $colors

        sed -i 's/background_color = "rgba(1e1e2eFF)"/background_color = "rgba(131315FF)"/' $colors

        sed -i 's/border_color = "rgba(b4befeAA) rgba(89b4fa77)"/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/' $colors

        notify-send "Border Visible" OFF

    else

        # ============================================================
        # BORDER VISIBLE -> ON / CATPPUCCIN BLUE
        # ============================================================

        # general.lua -> CATPPUCCIN BLUE
        sed -i 's/border_size = 1,/border_size = 2,/' $general

        sed -i 's/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/colors = { "rgba(b4befeFF)", "rgba(89b4faFF)", "rgba(74c7ecFF)" }/' $general

        sed -i 's/colors = { "rgba(ffffff18)" }/colors = { "rgba(89b4fa33)" }/' $general

        # colors.lua -> CATPPUCCIN BLUE
        sed -i 's/active_border = "rgba(47464877)"/active_border = "rgba(b4befeFF)"/' $colors

        sed -i 's/inactive_border = "rgba(1c1b1d33)"/inactive_border = "rgba(89b4fa33)"/' $colors

        sed -i 's/background_color = "rgba(131315FF)"/background_color = "rgba(1e1e2eFF)"/' $colors

        sed -i 's/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/border_color = "rgba(b4befeAA) rgba(89b4fa77)"/' $colors

        # Status-Marker IMMER erst ganz am Ende setzen
        printf '%s\n' '-- BORDER_VISIBLE_ON' >>$general

        notify-send "Border Visible" ON

    end

    hyprctl reload

end
