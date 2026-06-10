@echo off

cd platform-tools
cls

adb kill-server
adb devices
echo Please make sure USB debugging is enabled on your device and grant this computer permission to perform ADB debugging.
echo.
pause
echo.

echo.
echo Replacing... 1/3
echo Browser (org.lineageos.jelly) -> Via (mark.via)
echo.

adb shell pm disable-user org.lineageos.jelly
adb install ../replacing-apks/Browser.apk

echo.
echo Replacing... 2/3
echo Camera (org.lineageos.snap / org.lineageos.aperture) -> Camera (app.grapheneos.camera)
echo.

adb shell pm disable-user org.lineageos.snap
adb shell pm disable-user org.lineageos.aperture
adb install ../replacing-apks/Camera.apk

echo.
echo Replacing... 3/3
echo Music (org.lineageos.twelve) -> Booming Music (com.mardous.booming)
echo.

adb shell pm disable-user org.lineageos.twelve
adb install ../replacing-apks/Music.apk

echo.
echo The pre-installed apps have been replaced.
echo.

echo Installing other apps... 1/4
echo F-Droid Basic (org.fdroid.basic)
echo.

adb install ../other-apks/F-Droid_Basic.apk

echo.
echo Installing other apps... 2/4
echo InstallerX Revived (com.rosan.installer.x.revived)
echo.

adb install ../other-apks/InstallerX_Revived.apk

echo.
echo Installing other apps... 3/4
echo Localsend (org.localsend.localsend_app)
echo.

adb install ../other-apks/LocalSend-arm32.apk
adb install ../other-apks/LocalSend-arm64.apk

echo.
echo Installing other apps... 4/4
echo MT Manager (bin.mt.plus)
echo.

adb install ../other-apks/MT_Manager.apk

echo.
echo All essential apps have been installed.
echo.
pause
exit