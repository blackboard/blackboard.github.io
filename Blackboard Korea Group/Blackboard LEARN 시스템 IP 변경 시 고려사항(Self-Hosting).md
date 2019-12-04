# Blackboard LEARN 시스템 IP 변경 시 고려사항(Self-Hosting)
*Author: Soomyoung Yi*  
*Categories: ['[시스템 관리] 가이드 및 참고자료']*  
*Tags: ['ip address', 'developer']*  
<hr />
* 본 문서는 Self-Hosting(설치형) 고객을 대상으로 합니다.

  * 모든 작업은 Blackboard LEARN 서비스가 중지된 상태에서 작업이 이루어져야 합니다.

*IP Address

일반적으로 LEARN 시스템 구성 시, hostname 기반으로 구성되어 있으므로, IP 정보는 host 파일에만 등록되어 있습니다.

DNS 기반으로 설치된 경우에는 DNS 레코드를 우선 업데이트 합니다.

호스트 파일의 경우, 서버 IP 변경 후에

    * c:\windows\system32\drivers\etc 에 있는 hosts 파일을 열어 (notepad++ 등 3rd Party 툴로 하시는 것이 좋습니다. 메모장으로 열 경우 권한 문제로 권한 수정 후 열어야 합니다)   
IP 주소를 확인해보시기 바랍니다.

    * 이 작업은 모든 App Server / DB 서버 에서 이루어져야 합니다.
    * NAS 의 경우, active directory 서버 주소가 아마 1번 서버로 되어 있을 것입니다.   
Storage 업체의 도움을 받으셔서 Storage 장비의 IP 주소와 Active Directory 주소를 확인하시고, 다시 AD 설정을
갱신하여야 할 것입니다.

만일, 주기적으로 IP 주소가 바뀐다고 하면, 모든 서버의 아이피를 사설 IP 로 구성하여 hosts 파일을 업데이트 후 각 app
server 의 서비스 IP 는 공인 아이피를 추가하여 사용하시는 것도 관리 부담을 줄이는 한 방법이 될 수 있습니다. 이렇게 되면 IP
변경이 발생할 경우, 서비스 IP 만 변경하면 됩니다. 이에 대해서는 VM/OS 담당 업체의 도움을 받으시기 바랍니다.

DBMS (MSSQL/ORACLE) 의 경우, DBMS 서비스에 연동되어 있는 IP 주소가 업데이트 되었는지 확인합니다.

*Firewall/Ports

  * Firewall 에 대해서는 이미 기존에 개방한 내역들이 있을 것입니다. 특히,
    * 각 app server 와 DB/NAS 간의 방화벽
    * 각 app server 와 학사 시스템 간의 방화벽
    * 각 app server 와 학사 DB 간의 방화벽
    * 각 app server 와 SMTP(메일서버) 간의 relay(Trusted Server) 설정

등을 확인하여 로그인이나 학사 데이터 연동에 문제가 발생하지 않도록 합니다.

  * 참고 - Blackboard LEARN 시스템에서 사용하는 IP/Port 정보

[https://help.blackboard.com/Learn/Administrator/Hosting/System_Management/Clo
ud_Management/Cloud_FAQ](https://community.blackboard.com/external-link.jspa?u
rl=https%3A//help.blackboard.com/Learn/Administrator/Hosting/Syste
m_Management/Cloud_Management/Cloud_FAQ)

여기에서 “Connecting to the Cloud and Firewall Configurations” 항목을 확인합니다.

모든 Application IP, Load Balancer IP 에 대해서

  * Application Server 들이 DMZ 에 존재, 즉 Outbound 가 열려 있다면 outbound 는 신경 쓰시지 않으셔도 됩니다.
  * “softwareupdates.blackboard.com or softwareupdates.cloud.bb” 항목부터 보시기 바랍니다.
  * INGRESS(inbound) SOURCE: 107.23.34.151
  * EGRESS(outbound) SOURCE: 69.196.227.60 / [AWS IP Address list](https://blackboard.secure.force.com/btbb_articleview%3Fid%3DkAC70000000008C) ß 해당 링크를 보시면 us-east-1 영역에 대해서 outbound 를 열어주셔야 합니다.
  * Flickr MashUp 부터는 80, 443 포트만 사용하므로, 해당 IP 들에 대해 80, 443 포트를 양방향으로 열어주시면 됩니다. (아마, 대부분의 기관에서 이 포트들은 열려 있을 것입니다.)

이러한 부분들을 확인하시고,

  * Blackboard LEARN 서비스가 잘 올라오는지
  * 로그인이 잘 이루어지는지,
  * 학사 데이터 연동이 주기적으로 잘 이루어지는지
  * 이메일이 LEARN 시스템 내에서 잘 발송되는지 여부 등을 

점검합니다.

