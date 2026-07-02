function run-ghidra-scale --description "Launch Ghidra (installed via yay) optimized for Hyprland/Wayland"

    if not type -q ghidra
        echo (set_color red)"Error: Ghidra is not installed on the system!"(set_color normal)
        echo "Please install it using: yay -S ghidra"
        return 1
    end

    # env \
    #     GDK_SCALE=2 \
    #     GDK_DPI_SCALE=1 \
    #     _JAVA_OPTIONS="-Dsun.java2d.uiScale=2 \
    #                    -Dawt.useSystemAAFontSettings=lcd \
    #                    -Dswing.aatext=true" \
    #     ghidra >/dev/null 2>&1 &

    # env \
    #     GDK_DPI_SCALE=1 \
    #     _JAVA_OPTIONS="-Dsun.java2d.uiScale=2 \
    #                    -Dawt.useSystemAAFontSettings=lcd \
    #                    -Dswing.aatext=true \
    #                    -Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderingEngine" \

    set -gx XCURSOR_SIZE 24

    env \
        GDK_DPI_SCALE=1 \
        _JAVA_OPTIONS="-Dsun.java2d.uiScale=2 -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dsun.java2d.renderer=sun.java2d.marlin.MarlinRenderingEngine" \
        ghidra >/dev/null 2>&1 &

    disown
end
