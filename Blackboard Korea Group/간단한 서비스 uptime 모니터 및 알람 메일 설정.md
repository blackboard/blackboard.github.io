# 간단한 서비스 uptime 모니터 및 알람 메일 설정
*Author: Benjamin Jin*
*Categories: ['[시스템 관리] 가이드 및 참고자료']*
*Tags: ['system monitoring', 'developer']*
---
아래의 간단한 방법으로 Learn 서비스 모니터링 및 알람 메일 설정이 가능합니다.

아래의 사이트에서 계정을 만드신 후

[Uptime Robot ](https://community.blackboard.com/external-
link.jspa?url=https%3A//uptimerobot.com/)uptimerobot.com
[https://uptimerobot.com/](https://community.blackboard.com/external-
link.jspa?url=https%3A//uptimerobot.com/)

Dashboard에서 'Add New Monitor' 클릭

아래와 같은 창에서 외부에서 접속이 가능한 Blackboard Learn URL 설정(아래 참고) 및 알람을 받고자 하는 메일 선택 ( 메일
추가 등 설정 변경은 My settings 에서 가능)

*Learn 의 모니터용 주소는 학교 [https://우리학교LearnURL/webapps/portal/healthCheck](https://%EC%9A%B0%EB%A6%AC%ED%95%99%EA%B5%90LearnURL/webapps/portal/healthCheck) 형식입니다. (healthCheck 중는 C 대문자)

예) [https://blackboard.uni.ac.kr/webapps/potal/healthCheck](https://community.
blackboard.com/external-link.jspa?url=https%3A//blackboard.uni.ac.kr/web
apps/potal/healthCheck)

[![Dashboard _ Uptime Robot.jpg](https://community.blackboard.com/servlet/Jive
Servlet/downloadImage/102-3653-4-125493/957-527/Dashboard+_+Uptime+Robot.jpg)]
(https://community.blackboard.com/servlet/JiveServlet/showImage/102-3653-4-125
493/Dashboard+_+Uptime+Robot.jpg)

만약 Learn 서비스가 이루어 지지 않는 경우 아래의 같은 메일이 자동 발송됩니다.

Hi,

The monitor 우리학교Learn ([https://blackboard.uni.ac.kr/webapps/potal/healthCheck
](https://blackb
oard.uni.ac.kr/webapps/potal/healthCheck)) is currently DOWN (Connection
Timeout).

Uptime Robot will alert you when it is back up.

Sincerely,

Uptime Robot

Learn 정상화시 down 타임을 포함한 아래와 같은 메일이 자동 발송됩니다.

Hi,

The monitor 우리학교Learn ([https://blackboard.uni.ac.kr/webapps.potal/healthCheck
](https://blackb
oard.uni.ac.kr/webapps.potal/healthCheck)) is back UP (HTTP 401 -
Unauthorized) (It was down for 1 minutes and 27 seconds).

Have a great day,

Uptime Robot

