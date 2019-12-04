# Learn 버전 업그래이드 후 SaaS 이동 후 편집기에서 한글 입력시 문제가 발생 할 때
*Author: Benjamin Jin*
*Categories: ['[시스템 관리] 가이드 및 참고자료']*
*Tags: ['language', 'blackboard admin', 'developer']*
---
SaaS 로 마이그레이션 이후 콘텐츠 편집기에서 한글 입력시 문제가 발생하는 경우가 있었습니다.

이 경우 맞춤법 검사기가 기본으로 켜져 있어 문제가 발생한 경우 였습니다.

아래의 위치에서

관리자 패널 -> 도구/유틸리티 -> 도구

[![07-20 14_49_14-관리자.png](https://community.blackboard.com/servlet/JiveServle
t/downloadImage/102-4878-1-125513/1076-383/07-20+14_49_14-%EA%B4%80%EB%A6%AC%E
C%9E%90.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/1
02-4878-1-125513/07-20+14_49_14-%EA%B4%80%EB%A6%AC%EC%9E%90.png)

콘텐츠 편집기 도구의 철자법 확인 기능을 끄기 (사용하지 않음)으로 변경하시면 한글 입력시 이상 증상이 발생하지 않았습니다.

관련 Blackboard Help page -

[Manage Tools | Blackboard Help](https://community.blackboard.com/external-lin
k.jspa?url=https%3A%2F%2Fhelp.blackboard.com%2FLearn%2FAdministrator%2FSaaS%2F
Tools_Management%2FManage_Tools)

