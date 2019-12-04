# Data Integration
*Author: Soomyoung Yi*  
*Categories: ['[시스템 관리] 가이드 및 참고자료']*  
*Tags: ['sis integration', 'data integration', 'sis data integtation', 'feed file', '피드파일', 'developer']*  
<hr />
Blackboard 시스템 에서 중요한 역할을 하는 부분이 바로 학사 데이터 생성 및 연동입니다.

Data Integration Framework 는 Blackboard 와 학사(SIS;Student Information System)과의
데이터 연동을 위한 Framework 입니다.

이 Framework 의 구조와 사용 방법을 알아봅니다.

  * 참고자료
    * [Student Information System (SIS) - Blackboard Help](https://en-us.help.blackboard.com/Learn/9.1_2014_04/Administrator/070_Server_Management_and_Integrations/System_Integration/SIS)
    * [SIS Feed File Headers and Object Types - Blackboard Help](https://help.blackboard.com/ko-kr/Learn/Administrator/Hosting/System_Integration/SIS/SIS_Integration_Legacy/SIS_Feed_File_Headers_and_Object_Types)

  * **Case Study - 수동으로 생성된 코스에 사용자 등록하기**
    1. 코스를 생성합니다.
      * 이때, 코스에 등록할 사용자 수가 많으면 Master/Child 코스로 생성하여 시스템의 부하를 줄여주는 것이 좋습니다.
      * 예를 들면, 코스를   
Course ID: CTL_Course (마스터 코스), CTL_Course1, CTL_Course2, ...

Course Name: CTL Course, CTL Course1, CTL Course2

와 같이 생성합니다.

    2. 학사 데이터 통합을 생성합니다.
      * 시스템 관리자>데이터 통합>학생정보시스템 통합 으로 갑니다.
      * 왼쪽 상단의 "통합 생성" 을 클릭하여 "스냅샷 플랫 파일" 을 선택합니다.
      * 적절한 이름과 설명을 넣고 하단의 데이터 지원>Learn 데이터 소스 에서 "모든 새 인바운드 데이터에 동일한 Learn 데이터 소스 사용" 을 클릭합니다.
      * "새 데이터 소스 키" 항목에 적절한 이름을 넣습니다.(예: ctl_course)
      * 확인을 클릭합니다.
    3. 피드 파일을 생성합니다.
      * 첨부된 07.Crs_User_Simple_Template.csv 파일을 다운로드 하여 Excel 로 엽니다.
      * EXTERNAL_COURSE_KEY 필드와 EXTERNAL_PERSON_KEY 필드, ROLE 필드에 코스/사용자 쌍/역할을 입력합니다.  
이때 Available_ind 는 코스 내 활성 사용자 여부로 Y/N 값을, Row_status 는 데이터베이스에서 완전히 삭제될 사용자
여부를 뜻하며 Enabled/Disabled 값을 가집니다.

(바로 삭제 되지는 않으며 시스템 관리자>데이터 통합>데이터 소스 에서 삭제 가능합니다)

      * 피드 파일을 저장하고 다시 메모장에서 열어 **다른 이름으로 저장 에서 저장 옵션을 UTF-8 로 선택하고 저장**합니다.
      * 예:

EXTERNAL_COURSE_KEY

EXTERNAL_PERSON_KEY

ROLE

ROW_STATUS

AVAILABLE_IND

CTL_Cours

201265509

Student

Enabled

Y

CTL_Course1

107892

Instructor

Enabled

Y

    4. 피드파일 업로드
      * 시스템 관리자>데이터 통합>학생정보시스템 통합 으로 가서 2단계에서 만든 통합의 옵션 버튼을 클릭하여 피드파일 업로드를 선택합니다.
      * 데이터 유형을 "코스 멤버쉽(또는 학습자쉽)" 으로, 작업유형은 "저장" 으로 선택합니다.
      * 해당 코스 내에서 학생이 등록되었는지 확인합니다.
      * 시스템 관리자>로그>SIS 로그 에서 데이터 등록 진행 여부를 확인 할수 있습니다.
  * **Case Study - 기관 조직 구조 생성 및 코스, 사용자 반영 하기  
**
    1. 피드 파일을 생성합니다.
      * 첨부된 Hierarchy_Nodes.csv, course_assc.csv, user_assc.csv 파일을 다운로드 하여 Excel 로 엽니다. **(course_assc.csv, user_assc.csv 파일 내의 코스와 사용자는 이미 생성된 것으로 간주합니다)**
      * EXTERNAL_COURSE_KEY 필드와 EXTERNAL_PERSON_KEY 필드, ROLE 필드에 코스/사용자 쌍/역할을 입력합니다.이때 Available_ind 는 코스 내 활성 사용자 여부로 Y/N 값을, Row_status 는 데이터베이스에서 완전히 삭제될 사용자 여부를 뜻하며 Enabled/Disabled 값을 가집니다.(바로 삭제 되지는 않으며 시스템 관리자>데이터 통합>데이터 소스 에서 삭제 가능합니다)
      * 피드 파일을 저장하고 **피드 파일 내에 한글이 있을 경우** 다시 메모장에서 열어 **다른 이름으로 저장 에서 저장 옵션을 UTF-8 로 선택하고 저장**합니다. 

**데이터 예시**

** - Hierarchy_Nodes.csv 데이터: Blackboard LEARN 시스템의 조직 구조 중, 기본으로 제공되는 최 상위 노드는 키 값이 "TOP" 로 고정되어 있습니다. 대소문자에 유의하시기 바랍니다. 또한, 키 값의 레코드에 Praent_node_key 값이 있으면 해당 키의 하위 키가 됩니다. 아래의 예에서 N01 노드는 LEARN 조직 구조의 기본 최 상위 키의 하위 키가 되고, N01-1 노드는 N01 노드의 하위 노드가 됩니다.**

external_node_key,data_source_key,Description,Name,parent_node_key

_**N01**_,Data_Source_Key-DEMO,N01,N01,_**TOP**_

_**N01-1**_,Data_Source_Key-DEMO,N01-1,N01-1,_**N01**_

**- course_assc.csv 데이터: 코스(C-1)와 노드(N01)를 연결합니다. external_association_key 의 값은 고유값의 조합으로 생성합니다.**

external_association_key,external_course_key,external_node_key,data_source_key
,is_primary_association

C-1-N01,_**C-1,N01**_,Course_Related-DEMO,Y

**- user_assc.csv 데이터: 사용자(std1) 와 노드(N01)를 연결합니다. **external_association_key 의 값은 고유값의 조합으로 생성합니다.****

external_association_key,data_source_key,external_node_key,external_user_key

N01std1,Data_Source_Key-DEMO-USER,_**N01,std1**_

    2. 학사 데이터 통합을 생성합니다.
      * 시스템 관리자>데이터 통합>데이터 소스로 갑니다.
      * 왼쪽 상단의 [데이터 소스] 를 클릭하고, "키" 값으로 "Data_Source_Key-DEMO" 를 입력 후, 확인을 누릅니다.
      * 같은 방법으로 키 값이 "Data_Source_Key-DEMO-USER", "Course_Related-DEMO" 인 데이터 소스를 두개 더 만듭니다.
      * 시스템 관리자>데이터 통합>학생정보시스템 통합 으로 갑니다.
      * 왼쪽 상단의 "통합 생성" 을 클릭하여 "스냅샷 플랫 파일" 을 선택합니다.
      * 적절한 이름과 설명을 넣고 하단의 데이터 지원>Learn 데이터 소스 에서 "인바운드 데이터에 정의된 Learn 데이터 소스 사용" 이 선택되어 있는지 확인합니다.
      * 확인을 클릭합니다.
    3. 피드 파일 업로드
      * 시스템 관리자>데이터 통합>학생정보시스템 통합 으로 가서 2단계에서 만든 통합의 옵션 버튼을 클릭하여 피드 파일 업로드를 선택합니다.
      * 데이터 유형을 다음과 같이 선택합니다.
        1. Hierarchy_Nodes.csv 를 "계층 노드" 으로, 작업유형은 "저장" 으로 선택하고 업로드 합니다.
        2. course_assc.csv 를 "코스 연계" 으로, 작업유형은 "저장" 으로 선택하고 업로드 합니다.
        3. user_assc.csv 를 "사용자 연계" 으로, 작업유형은 "저장" 으로 선택하고 업로드 합니다.
      * 시스템 관리자>조직 구조(또는 Hierarchy) 로 가서, 사용자, 코스 탭에서 피드 파일 내 사용자와 코스가 등록 되었는지 확인합니다. 
      * 시스템 관리자>로그>SIS 로그 에서 데이터 등록 진행 여부를 확인 할수 있습니다.
    4. 스크린샷
      1. 조직이 생성된 상태  
[![FireShot Capture 21 - Blackboard University – Blackboard Lea_ - https___bbk
orea.iptime.org_8443_we.png](https://community.blackboard.com/servlet/JiveServ
let/downloadImage/102-1793-5-117929/FireShot+Capture+21+-+Blackboard+Universit
y+%E2%80%93+Blackboard+Lea_+-+https___bbkorea.iptime.org_8443_we.png)](https:/
/community.blackboard.com/servlet/JiveServlet/showImage/102-1793-5-117929/Fire
Shot+Capture+21+-+Blackboard+University+%E2%80%93+Blackboard+Lea_+-+https___bb
korea.iptime.org_8443_we.png)

      2. 조직에 코스가 등록된 상태  
[![FireShot Capture 24 - N01-1 – Blackboard Learn_ - https___bbkorea.iptime.or
g_8443_we.png](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-1793-5-117932/FireShot+Capture+24+-+N01-1+%E2%80%93+Blackboard+Learn_+
-+https___bbkorea.iptime.org_8443_we.png)](https://community.blackboard.com/se
rvlet/JiveServlet/showImage/102-1793-5-117932/FireShot+Capture+24+-+N01-1+%E2%
80%93+Blackboard+Learn_+-+https___bbkorea.iptime.org_8443_we.png)

      3. 조직에 사용자가 등록된 상태  
[![FireShot Capture 25 - N01-1 – Blackboard Learn_ - https___bbkorea.iptime.or
g_8443_we.png](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-1793-5-117933/FireShot+Capture+25+-+N01-1+%E2%80%93+Blackboard+Learn_+
-+https___bbkorea.iptime.org_8443_we.png)](https://community.blackboard.com/se
rvlet/JiveServlet/showImage/102-1793-5-117933/FireShot+Capture+25+-+N01-1+%E2%
80%93+Blackboard+Learn_+-+https___bbkorea.iptime.org_8443_we.png)

  * 참고: 조직 구조에 해당하는 Open Database Schema는 BBLEARN..mi_node 입니다.

