@echo off
mode con: cols=60 lines=12
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
echo. �����һ��hosts������
echo. 127.0.0.1 update.pan.baidu.com
echo. �������ΰٶ�����ǿ��������
echo.
echo. ����hostsΪϵͳ�ļ�����˸ò����п��ܱ�ɱ��������ء�
echo.
echo. �������������
pause 1>nul 2>nul
cls
echo.
set "str1=127.0.0.1 update.pan.baidu.com"
call :add_hosts "%str1%"
call :check_hosts "%str1%"
echo.
echo. ��������ɣ���������˳���
pause 1>nul 2>nul
exit

:: �޹���ԱȨ��
:not_admin
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
    >>C:\Windows\System32\Drivers\etc\hosts echo.
    >>C:\Windows\System32\Drivers\etc\hosts echo,%~1
)
goto :eof

:: ����Ƿ���ӳɹ�
:check_hosts
findstr /i /c:"%~1" C:\Windows\System32\Drivers\etc\hosts 1>nul 2>nul
if errorlevel 1 (echo. ���ʧ�ܣ�) else (echo. ��ӳɹ���)
goto :eof

