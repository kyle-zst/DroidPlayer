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
meson setup build -Dbackend-drm=true -Dbackend-wayland=true -Dbackend-x11=true -Dbackend-headless=true -Dbackend-vnc=true -Dbackend-pipewire=false -Dbackend-rdp=false -Drenderer-gl=true -Drenderer-vulkan=false -Dxwayland=true -Dshell-desktop=true -Dshell-kiosk=true -Dshell-lua=false -Dshell-ivi=false -Dtools=info -Dtools=terminal -Ddemo-clients=false -Dsimple-clients=shm -Dsimple-clients=egl -Dtests=false -Ddoc=false
```
