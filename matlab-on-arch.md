# Matlab on arch with Wayland (no X11)

Meine history (bitte lesen sie von unten -> fish):

```bash
/opt/matlab/bin/matlab -nodesktop -nosplash -nojvm -batch "run('file.m')"
/opt/matlab/bin/matlab -batch "run('file.m')"
GDK_BACKEND=x11 \
_JAVA_AWT_WM_NONREPARENTING=1 \
/opt/matlab/bin/matlab
ls -la ~/.matlab
ls -la ~/.MathWorks
~/.MathWorks
~/.matlab
/opt/matlab/bin/matlab
/opt/matlab/bin/matlab -batch "disp(2+2); exit"
ls ~/.matlab
ls ~/.MathWorks
/opt/matlab/bin/matlab -batch "disp(1)"
/opt/matlab/bin/matlab -batch "disp('MATLAB funktioniert')"
/opt/matlab/bin/matlab -nodesktop -nosplash
GDK_BACKEND=x11 \
_JAVA_AWT_WM_NONREPARENTING=1 \
MESA_LOADER_DRIVER_OVERRIDE=zink \
/opt/matlab/bin/matlab -softwareopengl
sudo pacman -S \
    libxcrypt-compat \
    curl \
    openssl \
    krb5 \
    alsa-lib \
    gtk2 \
    nss \
    libxtst \
    libxmu
rm -rf ~/.MathWorks
rm -rf ~/.matlab
rm -rf ~/.config/MathWorks
/opt/matlab/bin/activate_matlab.sh
touch /opt/matlab/licenses/test
sudo chown -R $USER:$USER /opt/matlab/licenses
sudo mkdir -p /opt/matlab/licenses
sudo find /opt/matlab/licenses -type f -delete
sudo rm -f /opt/matlab/licenses/*.lic
rm -rf ~/.MathWorks
rm -rf ~/.matlab
sudo rm -f /opt/matlab/licenses/*
sudo chown -R $USER:$USER /opt/matlab
sudo pacman -S xorg-xwayland
sudo /opt/matlab/bin/matlab
sudo ./mpm install \
  --release=R2024b \
  --destination=/opt/matlab \
  --products=MATLAB
./mpm install --release=R2024b --destination=/opt/matlab MATLAB
./mpm --version
curl -L -o mpm https://www.mathworks.com/mpm/glnxa64/mpm
chmod +x mpm
curl -O https://mathworks.com
mpm install --release=R2024b --destination=/opt/matlab MATLAB
```
