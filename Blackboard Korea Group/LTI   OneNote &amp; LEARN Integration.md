# LTI / OneNote &amp; LEARN Integration
*Author: Soomyoung Yi*  
*Categories: ['[운영] 가이드 및 참고자료']*  
*Tags: ['lti', 'onenote', 'microsoft onenote', 'developer']*  
<hr />
해당 위치의 설명서를 참고하시기 바랍니다.

  * LEARN LTI 연동 도움말: [ https://help.blackboard.com/ko-kr/Learn/Administrator/SaaS/Integrations/Learning_Tools_Interoperability#add-a-new-lti-to…](https://help.blackboard.com/ko-kr/Learn/Administrator/SaaS/Integrations/Learning_Tools_Interoperability%23add-a-new-lti-tool-provider_OTP-4)
  * MS OneNote LTI 연동 가이드: [https://www.onenote.com/lti/integratelti?omkt=ko-KR](https://na01.safelinks.protection.outlook.com/%3Furl%3Dhttps%253A%252F%252Fwww.onenote.com%252Flti%252Fintegratelti%253Fomkt%253Dko-KR%26data%3D02%257C01%257Csoomyoung.yi%2540blackboard.com%257C104e9450131a455cf07208d62435f91a%257Cbf0b29a25e5c4aaaba4dac988df15ea6%257C0%257C0%257C636736211572484532%26sdata%3DNQePYv%252FkIW7YKS1v2GHSyUa86GehNfJaEiW5DT08Ba0%253D%26reserved%3D0)

OneNote 수업용 전자 필기장을 통합하는 방법>Blackboard 항목의 링크에서 열리는 Youtube 동영상을 참고하시면 됩니다.

동영상 부분은 크게 두 부분으로 나누어져 있습니다. .

  * OneNote 키 값을 얻는 부분과 LEARN 시스템 관리자 설정
  * Contents 에 OneNote 를 불러들이는 설정

이 중에서 OneNote 키 값을 얻는 부분과 LEARN 시스템 관리자 설정 부분은 Original/Ultra 환경과는 무관하므로 진행하시면
됩니다.

동영상을 참고하셔서 위의 다음과 같이 진행합니다

  1. OneNote 에서 Blackboard 등록 및 LTI 관련 정보 수령
  2. 시스템 관리자 패널>LTI 도구 생성자 에서 제공자 도메인 등록 및 추가 설정
  3. 코스의 도서 및 도구 에서 툴 확인

우선 OneNote 키 값을 얻은 후, 시스템 관리자 패널>LTI 도구 생성자 에서 다음 위의 가이드를 따라 설정합니다.

  * A. Manage Global PropertiesConfigure (Help 문서의 LTI tool providers global properties 항목 및 아래 스크린 샷 참고)

[![fig1.lti_global_config_example.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-5257-1-127728/815-900/fig1.lti_global_config_e
xample.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/10
2-5257-1-127728/fig1.lti_global_config_example.png)

  * B. Register Provider Domain 등록 (Help 문서의 Add a new LTI tool provider 항목 및 아래 스크린 샷 참고)

[![fig2.lti_tool_provider_example.png](https://community.blackboard.com/servle
t/JiveServlet/downloadImage/102-5257-1-127729/642-900/fig2.lti_tool_provider_e
xample.png)](https://community.blackboard.com/servlet/JiveServlet/showImage/10
2-5257-1-127729/fig2.lti_tool_provider_example.png)

  * C. 생성된 www.onenote.com>옵션>manage placement(배치 관리)>create placement 항목 (Help 문서의 Manage placements 항목 및 아래 스크린 샷 참고)

[![fig3.lti_create_placement_example.png](https://community.blackboard.com/ser
vlet/JiveServlet/downloadImage/102-5257-1-127730/770-900/fig3.lti_create_place
ment_example.png)](https://community.blackboard.com/servlet/JiveServlet/showIm
age/102-5257-1-127730/fig3.lti_create_placement_example.png)

설정을 마치고 나면 코스 내에서

  * Original Experience: 코스 도구>콘텐츠 생성>도구>추가 도구 에서 OneNote LTI 도구 메뉴 선택
  * Ultra Experience 의 경우: Books & Tools(도서 및 도구)>OneNote LTI 도구 메뉴 선택

를 클릭하시면 해당 LTI 툴을 확인할 수 있습니다.

