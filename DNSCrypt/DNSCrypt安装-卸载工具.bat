cls&@echo off&color 2f&cd /d %~dp0

Set Prog=��˹�� DNSCrypt��װ-ж�ع���
Set L1=���������������������q�������������������������������r
Set L2=�������������q�������� %Prog% ���������r
Set L3=���������������������t�������������������������������s����  ��
Set L4=��������������==============================================��
Set L5=��������������ע�����к��������������������֤������Ч��    ��
Set L6=��������������    �����Windows 7 ���Թ���Ա������б��ű�����
Set L7=�������������t�����������������������������������������������s

:���˵�
cls&@echo off&color 2f
Title %Prog%_���˵�
Echo.
Echo %L1%
Echo %L2%
Echo %L3%
Echo             ��                                              ��
Echo ����������������(1) �鿴DNS����  (���Ƿ��Ѱ�װ����ȷ����)   ��
Echo             ��                                              ��
Echo ����������������(2) ��װDNSCrypt����                        ��
Echo             ��                                              ��
Echo ����������������(3) ж��DNSCrypt���񡡡�����������������������
Echo             ��                                              ��
Echo             ��  (4) DNSCrypt˵��                            ��
Echo             ��                                              ��
Echo %L4%
Echo %L5%
Echo %L6%
Echo %L7%

echo.
SET /P psn=                ������ ( ) �е����ּ������س�:
if /I "%psn%"=="1" goto ״̬
if /I "%psn%"=="2" goto ��װ
if /I "%psn%"=="3" goto ж��
if /I "%psn%"=="4" cls&more +113 %~0 &pause&goto :���˵�

:����
goto ���˵�


:״̬
cls
color 0f
Title ��ǰDNS����״̬
echo =============================================
echo dnscrypt-proxy����״̬
echo =============================================
rem net start|findstr "dnscrypt"
sc query dnscrypt-proxy
echo =============================================
echo ��ǰDNS����
echo =============================================
netsh interface ipv show dnsservers
echo --------------------------------------------
echo ipv6 show dnsservers
echo --------------------------------------------
netsh interface ipv6 show dnsservers

echo.���ڰ�������������˵���
pause >nul
goto ���˵�

:��װ
cls
color 0b
Title %Prog%_��װdnscrypt-proxy����
echo.���ڰ�װdnscrypt-proxy����...
echo.
net stop dnscrypt-proxy
dnscrypt-proxy.exe --install
echo.���ñ������� DNS����
netsh interface ip set dns name="��������" source=static addr=127.0.0.1 register=PRIMARY
netsh interface ip add dns name="��������" addr=1.2.4.8
netsh interface ip add dns name="��������" addr=8.8.8.8
netsh interface ipv6 delete dnsservers "��������" all
netsh interface ipv6 add dnsservers "��������" ::1
netsh interface ipv6 add dnsservers "��������" 2001:4860:4860::8888


echo.���������������� DNS����
netsh interface ip set dns name="������������" source=static addr=127.0.0.1 register=PRIMARY
netsh interface ip add dns name="������������" addr=1.2.4.8
netsh interface ip add dns name="������������" addr=8.8.8.8
netsh interface ipv6 delete dnsservers "������������" all
netsh interface ipv6 add dnsservers "������������" ::1
netsh interface ipv6 add dnsservers "������������" 2001:4860:4860::8888


echo.ˢ�� DNS���á���
ipconfig /flushdns
echo.��װ��ɣ��밴������˳���
pause >nul
goto :eof

:ж��
cls
color 0d
Title %Prog%_ж��dnscrypt-proxy����...
echo.
echo.����ж��dnscrypt-proxy����...
net stop dnscrypt-proxy
dnscrypt-proxy.exe --uninstall
echo.���ñ������� DNS����
netsh interface ip set dns name="��������" source=static addr=1.2.4.8 register=PRIMARY
netsh interface ip add dns name="��������" addr=8.8.8.8
netsh interface ipv6 delete dnsservers "��������" all
netsh interface ipv6 add dnsservers "��������" 2001:4860:4860::8888

echo.���������������� DNS����
netsh interface ip set dns name="������������" source=static addr=1.2.4.8 register=PRIMARY
netsh interface ip add dns name="������������" addr=8.8.8.8
netsh interface ipv6 delete dnsservers "������������" all
netsh interface ipv6 add dnsservers "������������" 2001:4860:4860::8888

echo.ˢ�� DNS���á���
ipconfig /flushdns

echo.
echo.dnscrypt-proxy����ж����ɣ��밴������˳���
echo.
pause >nul
goto :eof

==============================================================
DNSCrypt�������ڿͻ��˺�DNS������֮��İ�ȫͨ�ŵĹ���
==============================================================

�ٷ���ַ��http://dnscrypt.org/
��Ŀά��jedisct1�й���GitHub��ҳ-������mattgraham

����
dnscrypt�����ṩ�˿���ֱ����Ϊ��ı�������������D??NSת�������ܺ���֤ʹ��DNSCryptЭ������󣬲����䴫�ݵ����η������ı��ط���

��DNSCryptЭ����ø��ٸ߰�ȫ�Ե���Բ���߼����㷨�ͷǳ�����DNSCurve�����ǲ����ڱ����ͻ��˺����ĵ�һ���ֽ���֮���ͨ�š�

��Ȼû���ṩ�����˵İ�ȫ�ԣ������Ա����������磬������������Ļ�������ͬʱ���������ⷽ����м��˹����������ṩ��һЩ���ܵ�DNS��ѯ��

���أ�
DNSCrypt�������������أ�http://dnscrypt.org/dnscrypt-proxy/downloads/

������Windows
�����أ�dnscrypt-proxy-win32-1.3.3.zip 
��װΪ���񣨽�������Windows��
������԰�װΪWindows����

����dnscrypt-proxy.exe�ļ�������λ�ã��Լ���ص�libsodium-4.dll�ļ������Ƕ�Ӧ������ͬ��λ�á�Ȼ���һ���նˣ����루����������·�� dnscrypt-proxy.exe����

dnscrypt-proxy.exe --install
���ᰲװһ����Ϊ�µķ���dnscrypt����

��ֹͣ�󣬸÷�����뱻ɾ����

dnscrypt-proxy.exe --uninstall
�����ʹ��DNSCrypt��Windows�ļ������йش�����ĸ�����Ϣ��

HOSTIP����
��DNSCrypt��������һ���򵥵Ĺ�����ΪHOSTIP����һ������ΪIPv4��IPv6��ַ��
==============================================================
DNSCrypt��������ǰ�б�
==============================================================
OKTurtles������־�� -��һ����DNSChain��Ŀ��
��������ַ
23.226.227.93:443
�ṩ������
2.dnscrypt-cert.okturtles.com
��Կ
1D85��3953��E34F��AFD0��05F9��4C6F��D1CC��E635��D411��9904:0 D48��D19A��5D35��0B6A��7C81��73CB

OpenDNS��
��������ַ
208.67.220.220:443
�ṩ������
2.dnscrypt-cert.opendns.com
��Կ
B735��1140:206 F��225D��3E2B��D822��D7FD��691E��A1C3��3CC8��D666��8D0C��BE04��BFAB��CA43��FB79

CloudNS��û����־��DNSSEC��
�Ĵ����ǿ�����
��������ַ
113.20.6.2:443��gc2tzw6lbmeagrp3.onion��443
�ṩ������
2.dnscrypt-cert.cloudns.com.au
��Կ
1971:7 C1A��C550��6C09��F09B��ACB1��1AF7��C349��6425:2676:247 F��B738��1C5A��243A��C1CC��89F4

�Ĵ�����Ϥ��
��������ַ
113.20.8.17:443��l65q62lf7wnfme7m.onion��443
�ṩ������
2.dnscrypt-CERT-2.cloudns.com.au
��Կ
67A4��323E��581F��79B9��BC54��825F��54FE��1025:8�����Ĳ㣺37EB��0D07��0BCE��4010:6195��D94F��E330

OpenNIC������־��
�ձ�
��������ַ
106.186.17.181:2053
�ṩ������
2.dnscrypt-cert.ns2.jp.dns.opennic.glue
��Կ
8768��C3DB��F70A��FBC6��3B64��8630:8167:2 FD4��EE6F��E175��ECFD��46C9��22FC��7674��A1AC��2E2A

��������
NovaKing��NS8��
��������ַ
185.19.104.45:443
�ṩ������
2.dnscrypt-cert.ns8.uk.dns.opennic.glue
��Կ
A17C��06FC��BA21��F2AC��F4CD��9374:016��684F��4F56��564A��EB30��A422��3D9D��1580��A461��B6A6

NovaKing��NS9��
��������ַ
185.19.105.6:443
�ṩ������
2.dnscrypt-cert.ns9.uk.dns.opennic.glue
��Կ
E864��80D9������������9DB4��58EA��8063:292 F��EC41��9126:8394��BC44����Fab8��4B6E��B104��8C3B��E0B4

NovaKing��NS10��
��������ַ
185.19.105.14:443
�ṩ������
2.dnscrypt-cert.ns10.uk.dns.opennic.glue
��Կ
B1AB��7025:1119:9 AEE��E42E��1B12��F2EF��12D4��53D9��CD92��E07B��9AF4��4794��F6EB��E5A4��F725

����
��������ַ
173.230.156.28:443
�ṩ������
2.dnscrypt-cert.ns17.ca.us.dns.opennic.glue
��Կ
2342:215 C��409A��85A5��FB63��2A3B��42CD��5089:6 BA8��551A��8BDC��2654��CF57��804F��B1B2��5019

��������ַ
[2600:3 C01 :: F03C��91FF��fe6e��1f6b]��443
�ṩ������
2.dnscrypt-cert.ns18.ca.us.dns.opennic.glue
��Կ
689B��DAF2��6A9F��DB2D��42B4��AA15��1825:89 E8��6FAE��0C2C��522A��D0AA��DD2B��80B4��8D61��0A43

DNSCrypt.eu��û����־��DNSSEC��
����
��������ַ
176.56.237.171:443��[2A00��D880��3:1 :: a6c1��2e89]��443
�ṩ������
2.dnscrypt-cert.resolver1.dnscrypt.eu
��Կ
67C0��0F2C��21C5��5481:45 DD��7CB4��6A27��1AF2��EB96��9931:40 A3��09B6��2B8D��1653:1185:9 C66

����
��������ַ
77.66.84.233:443��[2001:1448:243 :: DC2]��443
�ṩ������
2.dnscrypt-cert.resolver2.dnscrypt.eu
��Կ
3748:5585��E3B9��D088��FD25��AD36��B037��01F5��520C��D648��9E9A��DD52��1457:4955:9 F0A��9955
Soltysiak.com��û����־��DNSSEC��

����������
��������ַ
178.216.201.222:2053
�ṩ������
2.dnscrypt-cert.soltysiak.com
��Կ
25C4��E188��2915:4697:8 F9C��2BBD��B6A7��AFA4��01ED��A051��0508:5 D53��03E7��1928��C066��8F21
