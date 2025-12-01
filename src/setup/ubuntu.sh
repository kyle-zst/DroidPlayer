#!/bin/bash

set -e

# Parse arguments
ANDROID_TYPE=""
VM_MODE=false

for arg in "$@"; do
  case $arg in
    --android-type=*)
      ANDROID_TYPE="${arg#*=}"
      ;;
    --vm=true)
      VM_MODE=true
      ;;
  esac
done

# Validate android-type
if [ -z "$ANDROID_TYPE" ]; then
  echo "Error: --android-type parameter is required"
  echo "Usage: $0 --android-type=GAPPS|VANILLA|FOSS [--vm=true]"
  exit 1
fi

if [[ ! "$ANDROID_TYPE" =~ ^(GAPPS|VANILLA|FOSS)$ ]]; then
  echo "Error: Invalid android-type. Must be GAPPS, VANILLA, or FOSS"
  exit 1
fi

echo "=== Installing packages with apt ==="
sudo apt update
sudo apt install -y adb git wget python3 wayvnc curl ca-certificates

echo "=== Installing Miriway ==="
sudo snap install miriway --classic

echo "=== Installing and configuring ubuntu-frame-vnc ==="
sudo snap install ubuntu-frame-vnc
sudo snap connect ubuntu-frame-vnc:wayland

echo "=== Adding Waydroid repository ==="
curl -s https://repo.waydro.id | sudo bash

echo "=== Installing Waydroid ==="
sudo apt install waydroid -y

echo "=== Initializing Waydroid with $ANDROID_TYPE ==="
sudo waydroid init \
  --system_channel=https://ota.waydro.id/system \
  --vendor_channel=https://ota.waydro.id/vendor \
  --system_type=$ANDROID_TYPE

# VM mode configuration
if [ "$VM_MODE" = true ]; then
  echo "=== Configuring VM mode ==="
  CONFIG_FILE="/var/lib/waydroid/waydroid.cfg"
  
  if [ -f "$CONFIG_FILE" ]; then
    # Check if VM properties already exist
    if ! grep -q "ro.hardware.gralloc=default" "$CONFIG_FILE"; then
      # Add VM properties after [properties] line
      sudo sed -i '/^\[properties\]/a ro.hardware.gralloc=default\nro.hardware.egl=swiftshader' "$CONFIG_FILE"
      echo "VM properties added to $CONFIG_FILE"
    else
      echo "VM properties already exist in $CONFIG_FILE, skipping..."
    fi
    
    echo "=== Running waydroid upgrade ==="
    sudo waydroid upgrade -o
  else
    echo "Warning: $CONFIG_FILE not found. Skipping VM configuration."
  fi
fi

echo "=== Running SWAY.bash ==="
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/SWAY.bash" ]; then
  bash "$SCRIPT_DIR/SWAY.bash"
else
  echo "Warning: SWAY.bash not found in $SCRIPT_DIR"
fi

echo "=== Copying miriway-shell.config ==="
if [ -f "$SCRIPT_DIR/config/miriway-shell.config" ]; then
  mkdir -p "$HOME/.config"
  cp -f "$SCRIPT_DIR/config/miriway-shell.config" "$HOME/.config/miriway-shell.config"
  echo "Config file copied to $HOME/.config/miriway-shell.config"
else
  echo "Warning: config/miriway-shell.config not found in $SCRIPT_DIR"
fi

echo "=== Setup completed successfully ==="
