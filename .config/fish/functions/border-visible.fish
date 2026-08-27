function border-visible

    set colors ~/.config/hypr/hyprland/colors.lua
    set general ~/.config/hypr/hyprland/general.lua

    if grep -q -- "-- BORDER_VISIBLE_ON" $general

        # ============================================================
        # ON -> OFF / DEFAULT
        # ============================================================

        sed -i '/-- BORDER_VISIBLE_ON/d' $general

        # egal welche Farbe vorher war -> DEFAULT
        sed -i -E 's/border_size = [0-9]+,/border_size = 1,/' $general

        sed -i -E 's/colors = \{ "rgba\([^"]+\)", "rgba\([^"]+\)", "rgba\([^"]+\)" \}/colors = { "rgba(ffffff88)", "rgba(61D6FFAA)", "rgba(7BCBFFFF)" }/' $general

        sed -i -E 's/colors = \{ "rgba\([^"]+\)" \}/colors = { "rgba(ffffff18)" }/' $general

        # colors.lua -> DEFAULT egal was vorher drin war
        sed -i -E 's/active_border = ".*"/active_border = "rgba(47464877)"/' $colors

        sed -i -E 's/inactive_border = ".*"/inactive_border = "rgba(1c1b1d33)"/' $colors

        sed -i -E 's/background_color = ".*"/background_color = "rgba(131315FF)"/' $colors

        sed -i -E 's/border_color = ".*"/border_color = "rgba(c6c5d6AA) rgba(c6c5d677)"/' $colors

        notify-send "Border Visible" OFF

    else

        # ============================================================
        # OFF -> ON / LILA
        # ============================================================

        sed -i -E 's/border_size = [0-9]+,/border_size = 2,/' $general

        sed -i -E 's/colors = \{ "rgba\([^"]+\)", "rgba\([^"]+\)", "rgba\([^"]+\)" \}/colors = { "rgba(cba6f7FF)", "rgba(cba6f7FF)", "rgba(cba6f7FF)" }/' $general

        sed -i -E 's/colors = \{ "rgba\([^"]+\)" \}/colors = { "rgba(cba6f733)" }/' $general

        sed -i -E 's/active_border = ".*"/active_border = "rgba(cba6f7FF)"/' $colors

        sed -i -E 's/inactive_border = ".*"/inactive_border = "rgba(cba6f733)"/' $colors

        sed -i -E 's/background_color = ".*"/background_color = "rgba(1e1e2eFF)"/' $colors

        sed -i -E 's/border_color = ".*"/border_color = "rgba(cba6f7AA) rgba(cba6f777)"/' $colors

        printf '%s\n' '-- BORDER_VISIBLE_ON' >>$general

        notify-send "Border Visible" ON

    end

    hyprctl reload

end
