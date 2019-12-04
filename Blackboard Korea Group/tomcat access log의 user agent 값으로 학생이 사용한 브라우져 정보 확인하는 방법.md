# tomcat access log의 user agent 값으로 학생이 사용한 브라우져 정보 확인하는 방법
*Author: Benjamin Jin*  
*Categories: ['[서포트] Known Issues']*  
*Tags: ['user tracking', 'activity', 'access log', 'user agent', 'developer']*  
<hr />
안녕하세요.

최근 학생이 온라인 시험 중 오류가 발생하여 재대로 시험을 못 치루었다는 case를 받은 적이 있습니다.

Tomcat access 로그를 확인 해보니 IE10을 사용하여 이로 인해 브라우져상에 오류가 발생해 시험이 재대로 진행이 되지 않았습니다.

제가 조사한 방법을 공유하려 합니다.

-해당 날짜 학생의 Pk 값 시험 content의 Pk 코스 Pk 값을 찾음 

- grab 이나 findstr 등의 툴을 사용하여 bb-services-log 의 로그 찾습니다. 

- 그리고 User pk 값으로 해당 로그를 정리 합니다.

아래는 user pk 300 과 content pk 1001로 시험을 시작 (launchAssessment.jsp) 를 찾은 예입니다.

10.10.10.10 - connector-17 _300_1 [18/Oct/2017:21:00:11 +0900] "GET /webapps/a
ssessment/take/launchAssessment.jsp?course_id=_1001_1&content_id=_1001_1&mode=
view HTTP/1.1" 200 14652 "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1;
WOW64; Trident/6.0)" "_ga=GA1.3.1389870918.1508326754;
_gid=GA1.3.1826243016.1508326754; _gat=1;
session_id=107CD28E20EA5E00670B38ADC187EB9E;
s_session_id=E91CB4BB9F1E08247FA766FF99C2A90A; web_client_cache_guid=52d99dec-
cc9a-418f-ae9a-41c97e28c8cb; JSESSIONID=EA179B8DA4235A4761458623D78FE475" 695
14652

이 로그에서 Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)
부분이 User agent 값 입니다.

이 값을 웹에서 또는 다음의 사이트 [Parse a user
agent](https://d
evelopers.whatismybrowser.com/useragents/parse/%23parse-useragent) 에서
검색하시면

IE10 on windows 7 을 사용한 것을 찾을 수 있습니다.

