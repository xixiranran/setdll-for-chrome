@echo off
:: author 申杰
mode con cols=100 lines=30
color 0a
title setdll for chrome By 申杰
if not exist "%~dp0chrome.exe" (
echo 没找到chrome.exe,请把程序放入chrome.exe所在目录后再执行.
pause
exit
)
echo setdll for chrome By 申杰(QQ:970852638)
echo ===============================================================================
echo 主要功能：
echo * 向chrome.exe注入或移除DLL文件
echo * 可选 [注入]或是[移除]
echo * 可选 32位(x86)、64位(x64)
echo 使用说明：
echo * 所有选择页面，选项 1 均为默认选项
echo * 所有选择页面在倒计时 1 分钟后将自动选择默认选项
echo ===============================================================================
echo 请选择是注入DLL还是移除DLL
echo 1.注入【默认】
echo 2.移除
echo ===============================================================================
choice  /c 12 /n /m "请输入目标选项前的数字：" /d 1 /t 60
if %errorlevel%==2 set arg1=r&set arg2=移除
if %errorlevel%==1 set arg1=d&set arg2=注入
cls
echo ===============================================================================
echo 请选择是%arg2%32位还是64位chrome的DLL
echo 1.32位(x86)【默认】
echo 2.64位(x64)
echo ===============================================================================
choice  /c 12 /n /m "请输入目标选项前的数字：" /d 1 /t 60
if %errorlevel%==2 set arch=64
if %errorlevel%==1 set arch=32
cls
del /s /q GreenChrome.dll
ren GreenChrome%arch%.dll GreenChrome.dll
setdll%arch%.exe /%arg1%:GreenChrome.dll chrome.exe
if exist chrome.exe# echo %arg2%失败，请仔细阅读使用说明.txt文件！&pause&del /s /q chrome.exe#&exit
if exist chrome.exe~ echo %arg2%成功，请仔细阅读使用说明.txt和GreenChrome.ini文件！&pause&del /s /q chrome.exe~
del /s /q setdll*.exe
if %arch%==32 del /s /q GreenChrome64.dll
if %arch%==64 del /s /q GreenChrome32.dll
del /s/q %0
exit