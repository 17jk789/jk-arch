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

        sed -i 's/colors = { "rgba(c5aaf1FF)", "rgba(c5aaf1FF)", "rgba(c5aaf1FF)" }/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/' $general

        sed -i 's/colors = { "rgba(c5aaf133)" }/colors = { "rgba(ffffff18)" }/' $general

        # colors.lua -> DEFAULT
        sed -i 's/active_border = "rgba(c5aaf1FF)"/active_border = "rgba(47464877)"/' $colors

        sed -i 's/inactive_border = "rgba(c5aaf133)"/inactive_border = "rgba(1c1b1d33)"/' $colors

        sed -i 's/background_color = "rgba(1e1e2eFF)"/background_color = "rgba(131315FF)"/' $colors

        sed -i 's/border_color = "rgba(c5aaf1AA) rgba(c5aaf177)"/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/' $colors

        notify-send "Border Visible" OFF

    else

        # ============================================================
        # BORDER VISIBLE -> ON / LILA #c5aaf1
        # ============================================================

        # general.lua -> LILA #c5aaf1
        sed -i 's/border_size = 1,/border_size = 2,/' $general

        sed -i 's/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/colors = { "rgba(c5aaf1FF)", "rgba(c5aaf1FF)", "rgba(c5aaf1FF)" }/' $general

        sed -i 's/colors = { "rgba(ffffff18)" }/colors = { "rgba(c5aaf133)" }/' $general

        # colors.lua -> LILA #c5aaf1
        sed -i 's/active_border = "rgba(47464877)"/active_border = "rgba(c5aaf1FF)"/' $colors

        sed -i 's/inactive_border = "rgba(1c1b1d33)"/inactive_border = "rgba(c5aaf133)"/' $colors

        sed -i 's/background_color = "rgba(131315FF)"/background_color = "rgba(1e1e2eFF)"/' $colors

        sed -i 's/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/border_color = "rgba(c5aaf1AA) rgba(c5aaf177)"/' $colors

        # Status-Marker IMMER erst ganz am Ende setzen
        printf '%s\n' '-- BORDER_VISIBLE_ON' >>$general

        notify-send "Border Visible" ON

    end

    hyprctl reload

end
