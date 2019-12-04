# [Upgrade] 설치 전 준비사항 - JDK / Backup
*Author: Soomyoung Yi*  
*Categories: ['[시스템 관리] 가이드 및 참고자료']*  
*Tags: ['developer']*  
<hr />
  1. OS/DB 버전 확인 - 필요 시, 업그레이드
  2. JDK 8 버전 설치 - 시스템 변수 업데이트(JAVA_HOME)
  3. 시스템 백업 - [https://help.blackboard.com/Learn/Administrator/Hosting/Backup_and_Recovery](https://help.blackboard.com/Learn/Administrator/Hosting/Backup_and_Recovery)
    * 시스템 백업 시에는 콘텐츠/DB 일관성을 위해 모든 시스템을 내리고 백업합니다.
    * Application 서버 - blackboard 설치 디렉토리 전체.   
Blackboard 설치 디렉토리 아래 backup, log 디렉토리, app\tomcat 아래 temp 디렉토리 등은 백업하지 않아도
무방함

    * NAS 서버 - 공유 디렉토리.   
일반적으로 storage 폴더는 사이즈가 크므로 별도의 백업 전략으로 움직여야 함

    * DB 서버 - 모든 Blackboard Database (BBLEARN_*)
  4. **Customization 항목 제외**
    * **client-dirs.txt / client-files.txt 을 config 디렉토리에 생성하여 고객의 custom file/directory 가 upgrade 중에 삭제되지 않도록 함**

