## Build vnc weston

### Cài gói phụ thuộc 
```
sudo dnf install -y \
  meson ninja-build gcc gcc-c++ pkg-config \
  wayland-devel wayland-protocols-devel \
  libdrm-devel mesa-libEGL-devel mesa-libGLES-devel mesa-libgbm-devel \
  libinput-devel libxkbcommon-devel pixman-devel cairo-devel pango-devel \
  libjpeg-turbo-devel libpng-devel libwebp-devel \
  pam-devel systemd-devel pipewire-devel \
  libevdev-devel libuv-devel libseat-devel libffi-devel \
  wayland-utils
```

### Build vnc weston
```
meson setup build   --prefix=/usr   -Dbackend-vnc=true   -Dbackend-headless=true   -Dbackend-drm=true   -Dbackend-wayland=false   -Dbackend-x11=false   -Dsystemd=false   -Dpipewire=false   -Dremoting=false   -Dcolor-management-lcms=false   -Ddemo-clients=false -Drenderer-vulkan=false -Dbackend-rdp=false -Dxwayland=false -Dshell-lua=false
```
