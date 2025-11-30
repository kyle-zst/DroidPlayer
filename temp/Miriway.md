# Setup
### Fedora & OpenSUSE
--> Install `miriway` package
### Ubuntu
```
sudo snap install miriway --classic
sudo snap install ubuntu-frame-vnc && sudo snap connect ubuntu-frame-vnc:wayland
```

### VNC packages
- wayvnc

### Start VNC
```
miriway.vnc-server
```

## Tạo màn hình không UI

Chạy lệnh thực thi trong `example-configs` của `Miriway` là được. 
Sau đó sửa config của `sway` trong 
```
$HOME/.config/miriway-shell.config
```
