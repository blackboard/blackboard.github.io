# Blackboard REST API 사용하기
*Author: Soomyoung Yi*
*Categories: ['[시스템 관리] 가이드 및 참고자료', '[개발] 가이드 및 참고자료']*
*Tags: ['rest api', 'blackboard rest api', 'developer']*
---
Blackboard REST API 를 이용하면 json 타입으로 전반적인 데이터를 받거나 생성할 수 있습니다.

  * REST API REST API 설정하기 - Developer.blackboard.com
    1. [Blackboard API Services](https://developer.blackboard.com%2F) 에서 [REST Register and Manage Your Applications] 섹션의 REGISTER 버튼을 클릭합니다.
    2. Terms & Condition 팝업에서 텍스트박스를 끝까지 스크롤해서 내린 후, Agree & Continue 를 클릭합니다.  

    3. Create New Account 팝업에서 이메일, 비밀번호, 이름 등을 입력하고 하단의 Create Account 버튼을 클릭합니다.  

    4. 로그인 후, Manage your application>My Application 페이지에서 오른쪽 상단의 + 버튼을 클릭합니다.
    5. Register you application 팝업에서 Name, Description 을 입력하고 Group 을 선택한 뒤 Save 합니다. [![FireShot Capture 33 - Manage Your Applicatio_ - https___developer.blackboard.com_portal_applications.png](https://community.blackboard.com/servlet/JiveServlet/downloadImage/102-4210-2-117187/FireShot+Capture+33+-+Manage+Your+Applicatio_+-+https___developer.blackboard.com_portal_applications.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210-2-117187/FireShot+Capture+33+-+Manage+Your+Applicatio_+-+https___developer.blackboard.com_portal_applications.png)
    6. Important 팝업에서 Application Key 와 Secret 을 기록해 둡니다. 이 Secret 값은 다시 확인이 불가하므로 반드시 안전한 곳에 별도로 보관합니다. [![FireShot Capture 34 - Manage Your Applicatio_ - https___developer.blackboard.com_portal_applications.png](https://community.blackboard.com/servlet/JiveServlet/downloadImage/102-4210-2-117188/FireShot+Capture+34+-+Manage+Your+Applicatio_+-+https___developer.blackboard.com_portal_applications.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210-2-117188/FireShot+Capture+34+-+Manage+Your+Applicatio_+-+https___developer.blackboard.com_portal_applications.png)  

    7. 기관의 Blackboard LEARN 으로 가서 REST API 통합 항목을 생성하게 되면 "My Site Registration" 탭 에서 등록 내역을 확인할 수 있습니다. [![FireShot Capture 35 - Manage Site Regis_ - https___developer.blackboard.com_portal_siteRegistrations.png](https://community.blackboard.com/servlet/JiveServlet/downloadImage/102-4210-2-117189/FireShot+Capture+35+-+Manage+Site+Regis_+-+https___developer.blackboard.com_portal_siteRegistrations.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210-2-117189/FireShot+Capture+35+-+Manage+Site+Regis_+-+https___developer.blackboard.com_portal_siteRegistrations.png)
  * REST API 설정하기 - LEARN  

    1. REST API Framework 빌딩블록이 활성화 되어 있는지 확인합니다.  
[![FireShot Capture 26 - Installed Tools – Blackboard Learn_ - https___bsk.bla
ckboard.com_webapps.png](https://community.blackboard.com/servlet/JiveServlet/
downloadImage/102-4210-2-117183/1103-53/FireShot+Capture+26+-+Installed+Tools+
%E2%80%93+Blackboard+Learn_+-+https___bsk.blackboard.com_webapps.png)](https:/
/community.blackboard.com/servlet/JiveServlet/showImage/102-4210-2-117183/Fire
Shot+Capture+26+-+Installed+Tools+%E2%80%93+Blackboard+Learn_+-+https___bsk.bl
ackboard.com_webapps.png)

    2. 시스템 관리자>사용자 에서 REST API 용으로 "제한된 권한"의 사용자를 생성합니다.
    3. 시스템 관리자>빌딩블록>REST API 통합/REST API Integrations 메뉴로 갑니다.  
[![FireShot Capture 31 - System Admin – Blackboard Learn_ - https___bsk.blackb
oard.com_webapps.png](https://community.blackboard.com/servlet/JiveServlet/dow
nloadImage/102-4210-2-117185/FireShot+Capture+31+-+System+Admin+%E2%80%93+Blac
kboard+Learn_+-+https___bsk.blackboard.com_webapps.png)](https://community.bla
ckboard.com/servlet/JiveServlet/showImage/102-4210-2-117185/FireShot+Capture+3
1+-+System+Admin+%E2%80%93+Blackboard+Learn_+-+https___bsk.blackboard.com_weba
pps.png)

    4. 상단의 "통합 생성/Create Integration" 을 클릭하여 생성 화면으로 갑니다.
    5. [Blackboard API Services](https://developer.blackboard.com%2F) 에서 생성한 Application Key 와 2에서 생성한 사용자를 부여합니다.  
[![FireShot Capture 37 - Create Integration – Blackboard Learn_ - https___bsk.
blackboard.com_webapps.png](https://community.blackboard.com/servlet/JiveServl
et/downloadImage/102-4210-2-117194/FireShot+Capture+37+-+Create+Integration+%E
2%80%93+Blackboard+Learn_+-+https___bsk.blackboard.com_webapps.png)](https://c
ommunity.blackboard.com/servlet/JiveServlet/showImage/102-4210-2-117194/FireSh
ot+Capture+37+-+Create+Integration+%E2%80%93+Blackboard+Learn_+-+https___bsk.b
lackboard.com_webapps.png)

    6. 만들어진 통합 항목은 활성/비활성화가 가능합니다.  
[![FireShot Capture 38 - REST API Integ_ -
https___bsk.blackboard.com_webapps_api-gateway_integrations_.png](https://comm
unity.blackboard.com/servlet/JiveServlet/downloadImage/102-4210-2-117195/FireS
hot+Capture+38+-+REST+API+Integ_+-+https___bsk.blackboard.com_webapps_api-gate
way_integrations_.png)](https://community.blackboard.com/servlet/JiveServlet/s
howImage/102-4210-2-117195/FireShot+Capture+38+-+REST+API+Integ_+-+https___bsk
.blackboard.com_webapps_api-gateway_integrations_.png)

  * CASE STUDY - POSTMAN 을 이용한 REST API 로 공지사항 리스트 가져오기
    1. REST Service의 [Explore APIs](https://developer.blackboard.com%2Fportal%2FdisplayApi) 페이지에서 API 리스트를 확인합니다.
    2. POSTMAN 을 [Postman | Supercharge your API workflow](https://www.getpostman.com%2F) 에서 다운로드 받습니다.
    3. 설치 후, POSTMAN 을 실행합니다.  
[![스크린샷 2017-11-03 10.17.12.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-4210-2-117196/%E1%84%89%E1%85%B3%E1%84%8F%E1%8
5%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+10.17.12
.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210
-2-117196/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%8
4%89%E1%85%A3%E1%86%BA+2017-11-03+10.17.12.png)

    4. 오른쪽 탭의 상단의 + 버튼을 클릭하여 새 탭을 생성 후,   
- 전송 방식: POST  
- URL: _기관_HOST_URL_/learn/api/public/v1/oauth2/token  
을 입력합니다.

Authorization 탭을 선택 후,

- TYPE: OAuth 2.0  
을 선택하고, 오른쪽 패널의 "Get New Access Token" 을 클릭합니다.

[![스크린샷 2017-11-03 10.42.02.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-4210-2-117200/%E1%84%89%E1%85%B3%E1%84%8F%E1%8
5%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+10.42.02
.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210
-2-117200/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%8
4%89%E1%85%A3%E1%86%BA+2017-11-03+10.42.02.png)

여기에서 적절한 TOKEN NAME 을 입력하고

- ACCESS TOKEN URL: _기관_HOST_URL_/learn/api/public/v1/oauth2/token  
- Client ID / Client Secret: Application Key 와 Secret  
- Client Authentication: Send as Basic Auth header  
을 입력 후, "Request Token" 을 클릭합니다.

[![스크린샷 2017-11-03 10.39.55.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-4210-2-117199/%E1%84%89%E1%85%B3%E1%84%8F%E1%8
5%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+10.39.55
.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210
-2-117199/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%8
4%89%E1%85%A3%E1%86%BA+2017-11-03+10.39.55.png)

Use Token 버튼을 클릭합니다.

[![스크린샷 2017-11-03 10.49.00.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-4210-2-117201/%E1%84%89%E1%85%B3%E1%84%8F%E1%8
5%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+10.49.00
.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210
-2-117201/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%8
4%89%E1%85%A3%E1%86%BA+2017-11-03+10.49.00.png)

    5. 다음 스크린 샷은 [Explore APIs](https://developer.blackboard.com%2Fportal%2FdisplayApi) 사이트의 공지사항/announcement 의 전체 리스트를 가져오는 API 입니다.   
[![스크린샷 2017-11-03 10.53.35.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-4210-2-117202/815-434/%E1%84%89%E1%85%B3%E1%84
%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+
10.53.35.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/
102-4210-2-117202/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86
%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+10.53.35.png)

GET 방식으로 API URL 은 [/learn/api/public/v1/announcements](https://community.blac
kboard.com/external-
link.jspa?url=https%3A%2F%2Fdeveloper.blackboard.com%2Fassets%2Flib%2Fswagger-
ui%2Fswagger-index.html%3Furl%3D%2Fportal%2Fdocs%2Fapis%2Flearn-
swagger.json%23%21%2Fannouncements%2Fget_learn_api_public_v1_announcements) 인
것을 알 수 있습니다.

    6. 오른쪽 상단의 + 버튼을 클릭하여 새 탭을 만들고, 통신 방식은 GET, URL은 _기관_HOST_URL_ 수 있습니다
    7. Authorization 탭을 선택하고, 오른쪽 패널에서 Available Tokens 드롭박스에서 앞서 만든 Token 을 선택하고 상단의 "Send" 버튼을 클릭하여 아래 패널에서 공지사항 리스트가 나오는지 확인합니다.

[![스크린샷 2017-11-03 11.01.35.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-4210-2-117204/%E1%84%89%E1%85%B3%E1%84%8F%E1%8
5%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA+2017-11-03+11.01.35
.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/102-4210
-2-117204/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%8
4%89%E1%85%A3%E1%86%BA+2017-11-03+11.01.35.png)

