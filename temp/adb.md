# Kết nối adb
## Waydroid 
```
adb connect <IP>:5555
```
## Thiết bị khác

### Liệt kê các thiết bị đang kết nối
```
adb devices
```
Ví dụ trả về
```
❯ adb devices

List of devices attached
5e276c41	device
```
Chọn thiết bị để dùng
```
adb -s 5e276c41 <lệnh dùng bình thường>
```

# Ứng dụng trên máy
### Liệt kê các ứng dụng do user cài đặt 
```
adb shell pm list packages -3
```
Ví dụ trả về
```
❯ adb shell pm list packages -3
package:com.microsoft.office.outlook
package:md.obsidian
package:org.torproject.torbrowser
package:com.HoYoverse.hkrpgoversea
package:ru.zdevs.zarchiver
package:org.documentfoundation.libreoffice
package:com.azure.authenticator
package:com.vnpay.Agribank3g
package:com.vnptit.vnedu.parent
package:ch.protonmail.android
package:com.google.android.contactkeys
package:com.anthropic.claude
package:org.mozilla.firefox
package:fr.smarquis.soundquicksettings
package:org.freedownloadmanager.fdm
package:com.github.android
package:com.coloros.note
package:com.nvidia.geforcenow
package:com.niksoftware.snapseed
package:com.deepl.mobiletranslator
package:com.openai.chatgpt
package:com.vnid
package:net.alph4.photowidget
package:org.videolan.vlc
package:com.bryancandi.android.uituner
package:com.zing.zalo
package:com.hoyoverse.cloudgames.GenshinImpact
package:org.telegram.messenger
package:com.google.android.safetycore
package:com.google.android.apps.adm
package:ginlemon.flowerfree
package:com.wallet.crypto.trustapp
package:com.apkpure.aegon
```

### App nào đang được hiển thị
```
adb shell dumpsys window | grep -E 'mCurrentFocus'
```
Ví dụ
```
❯ adb shell dumpsys window | grep -E 'mCurrentFocus'

  mCurrentFocus=Window{bb56de2 u0 NotificationShade}

~
❯ adb shell dumpsys window | grep -E 'mCurrentFocus'
  mCurrentFocus=Window{2eb123b u0 org.mozilla.firefox/org.mozilla.firefox.App}

~
❯ adb shell dumpsys window | grep -E 'mCurrentFocus'
  mCurrentFocus=Window{c588685 u0 com.HoYoverse.hkrpgoversea/com.mihoyo.combosdk.ComboSDKActivity}
```

