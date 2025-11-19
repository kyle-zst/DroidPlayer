# Setup Waydroid 

## Tải img

```
sudo waydroid init \
  --system_channel=https://ota.waydro.id/system \
  --vendor_channel=https://ota.waydro.id/vendor \
  --system_type=GAPPS

```

## Boot lần đầu

```
sudo waydroid container start
```

## Khởi chạy session

```
waydroid session start
```

## Khởi chạy full màn hình

```
waydroid show-full-ui
```

# Get Waydroid to work through a VM
```
nano /var/lib/waydroid/waydroid.cfg
```

thêm vào 
```
ro.hardware.gralloc=default
ro.hardware.egl=swiftshader
```

áp dụng 
```
sudo waydroid upgrade -o
```
