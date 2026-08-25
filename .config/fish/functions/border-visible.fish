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

        sed -i 's/colors = { "rgba(cba6f7FF)", "rgba(cba6f7FF)", "rgba(cba6f7FF)" }/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/' $general

        sed -i 's/colors = { "rgba(cba6f733)" }/colors = { "rgba(ffffff18)" }/' $general

        # colors.lua -> DEFAULT
        sed -i 's/active_border = "rgba(cba6f7FF)"/active_border = "rgba(47464877)"/' $colors

        sed -i 's/inactive_border = "rgba(cba6f733)"/inactive_border = "rgba(1c1b1d33)"/' $colors

        sed -i 's/background_color = "rgba(1e1e2eFF)"/background_color = "rgba(131315FF)"/' $colors

        sed -i 's/border_color = "rgba(cba6f7AA) rgba(cba6f777)"/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/' $colors

        notify-send "Border Visible" OFF

    else

        # ============================================================
        # BORDER VISIBLE -> ON / LILA #cba6f7
        # ============================================================

        # general.lua -> LILA #cba6f7
        sed -i 's/border_size = 1,/border_size = 2,/' $general

        sed -i 's/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/colors = { "rgba(cba6f7FF)", "rgba(cba6f7FF)", "rgba(cba6f7FF)" }/' $general

        sed -i 's/colors = { "rgba(ffffff18)" }/colors = { "rgba(cba6f733)" }/' $general

        # colors.lua -> LILA #cba6f7
        sed -i 's/active_border = "rgba(47464877)"/active_border = "rgba(cba6f7FF)"/' $colors

        sed -i 's/inactive_border = "rgba(1c1b1d33)"/inactive_border = "rgba(cba6f733)"/' $colors

        sed -i 's/background_color = "rgba(131315FF)"/background_color = "rgba(1e1e2eFF)"/' $colors

        sed -i 's/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/border_color = "rgba(cba6f7AA) rgba(cba6f777)"/' $colors

        # Status-Marker IMMER erst ganz am Ende setzen
        printf '%s\n' '-- BORDER_VISIBLE_ON' >>$general

        notify-send "Border Visible" ON

    end

    hyprctl reload

end
