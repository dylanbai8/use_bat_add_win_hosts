@echo off
title һ�����HOST
mode con: cols=60 lines=16
color 0a




:: ����Ƿ��Թ���Ա�������
net.exe session 1>nul 2>nul && (
    goto as_admin
) || (
    goto not_admin
)




:: ������
:as_admin
echo.
echo. ������
echo. C:\Windows\System32\Drivers\etc\hosts
echo. ���3��hosts��¼��
echo.
echo. 127.0.0.1 update.pan.baidu.com
echo. 127.0.0.1 issuecdn.baidupcs.com
echo. 127.0.0.1 wppkg.baidupcs.com
echo.
echo. �������ΰٶ�����ǿ��������
echo.
echo. ����hostsΪϵͳ�ļ�����˸ò����п��ܱ�ɱ��������ء�
echo.
echo. �������������
pause 1>nul 2>nul
cls
echo.
echo. ������Ӽ�¼�����Ժ� ����
echo.
set "str0=# ���¼�¼�������ΰٶ�����ǿ������"
findstr /i /c:"%str0%" C:\Windows\System32\Drivers\etc\hosts 1>nul 2>nul
if errorlevel 1 (
    >>C:\Windows\System32\Drivers\etc\hosts echo.
    >>C:\Windows\System32\Drivers\etc\hosts echo.
    >>C:\Windows\System32\Drivers\etc\hosts echo,%str0%
)
set "str1=127.0.0.1 update.pan.baidu.com"
call :add_hosts "%str1%"
call :check_hosts "%str1%"
set "str2=127.0.0.1 issuecdn.baidupcs.com"
call :add_hosts "%str2%"
call :check_hosts "%str2%"
set "str3=127.0.0.1 wppkg.baidupcs.com"
call :add_hosts "%str3%"
call :check_hosts "%str3%"
echo.
echo. ��������ɣ���������˳���
pause 1>nul 2>nul
exit




:: �޹���ԱȨ��
:not_admin
mode con: cols=60 lines=6
color 0a
echo.
echo. �������Ҽ�"�Թ���Ա�������"
echo.
echo. ��������˳���
pause 1>nul 2>nul
exit




:: ���host ����Ƿ��ظ����
:add_hosts
findstr /i /c:"%~1" C:\Windows\System32\Drivers\etc\hosts 1>nul 2>nul
if errorlevel 1 (
    >>C:\Windows\System32\Drivers\etc\hosts echo,%~1
)
goto :eof




:: ����Ƿ���ӳɹ�
:check_hosts
findstr /i /c:"%~1" C:\Windows\System32\Drivers\etc\hosts 1>nul 2>nul
if errorlevel 1 (
    echo. %~1
    echo. ���ʧ�ܣ�
    echo.
) else (
    echo. %~1
    echo. ��ӳɹ���
    echo.
)
goto :eof



