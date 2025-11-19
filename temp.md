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
