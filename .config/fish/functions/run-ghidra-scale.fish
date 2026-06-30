function run-ghidra-scale --description "Launch Ghidra (installed via yay) optimized for Hyprland/Wayland"
    if not type -q ghidra
        echo (set_color red)"Error: Ghidra is not installed on the system!"(set_color normal)
        echo "Please install it using: yay -S ghidra"
        return 1
    end

    set -gx GDK_SCALE 2
    set -gx J2D_UISCALE 2
    set -gx _JAVA_OPTIONS "-Dsun.java2d.uiScale=2"

    set -gx _JAVA_AWT_WM_NONREPARENTING 1

    set -gx XCURSOR_SIZE 24

    echo (set_color green)"Launch Arch-Ghidra in Hyprland mode..."(set_color normal)

    ghidra >/dev/null 2>&1 &

    if jobs -q
        disown
    end
end
