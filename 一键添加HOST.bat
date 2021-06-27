@echo off
mode con: cols=60 lines=12
color 0a

:: 检测是否以管理员身份运行
net.exe session 1>nul 2>nul && (
    goto as_admin
) || (
    goto not_admin
)

:: 主程序
:as_admin
echo.
echo. 您将向：
echo. C:\Windows\System32\Drivers\etc\hosts
echo. 中添加一条hosts参数：
echo. 127.0.0.1 update.pan.baidu.com
echo. 用于屏蔽百度网盘强制升级。
echo.
echo. 由于hosts为系统文件，因此该操作有可能被杀毒软件拦截。
echo.
echo. 按任意键继续。
pause 1>nul 2>nul
cls
echo.
set "str1=127.0.0.1 update.pan.baidu.com"
call :add_hosts "%str1%"
call :check_hosts "%str1%"
echo.
echo. 操作已完成，按任意键退出。
pause 1>nul 2>nul
exit

:: 无管理员权限
:not_admin
echo.
echo. 错误：请右键"以管理员身份运行"
echo.
echo. 按任意减退出。
pause 1>nul 2>nul
exit

:: 添加host 检测是否重复添加
:add_hosts
findstr /i /c:"%~1" C:\Windows\System32\Drivers\etc\hosts 1>nul 2>nul
if errorlevel 1 (
    >>C:\Windows\System32\Drivers\etc\hosts echo.
    >>C:\Windows\System32\Drivers\etc\hosts echo,%~1
)
goto :eof

:: 检测是否添加成功
:check_hosts
findstr /i /c:"%~1" C:\Windows\System32\Drivers\etc\hosts 1>nul 2>nul
if errorlevel 1 (echo. 添加失败！) else (echo. 添加成功！)
goto :eof

