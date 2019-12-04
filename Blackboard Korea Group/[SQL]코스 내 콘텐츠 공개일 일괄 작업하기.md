# [SQL]코스 내 콘텐츠 공개일 일괄 작업하기
*Author: Nam-Su YI*
*Categories: ['[운영] 관리자 배치파일 ']*
*Tags: ['sql', '일괄작업', '콘텐츠', '공개일 설정', '날짜', 'developer']*
---
안녕하세요 수원대학교 이남수입니다.

저희 학교에서 이용하고 있는 SQL 쿼리 몇가지를 공유하고자 합니다.

목적: 학습자들에게 각각의 강의 콘텐츠의 공개일을 알림으로서 센터 내 업무의 부담을 덜고자 함

코스 설계 형태:

  * 각 주차별 폴더
    * 항목
    * 과제
    * 코스 링크
    * 시험

대상:

  * Blackboard Learn Self-hosted 학교

실행전:

[![이미지 36.png](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-3598-1-108771/%EC%9D%B4%EB%AF%B8%EC%A7%80+36.png)](https://community.b
lackboard.com/servlet/JiveServlet/showImage/102-3598-1-108771/%EC%9D%B4%EB%AF%
B8%EC%A7%80+36.png)

실행후:

[![이미지 37.png](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-3598-1-108772/%EC%9D%B4%EB%AF%B8%EC%A7%80+37.png)](https://community.b
lackboard.com/servlet/JiveServlet/showImage/102-3598-1-108772/%EC%9D%B4%EB%AF%
B8%EC%A7%80+37.png)[![이미지 38.png](https://community.blackboard.com/servlet/Jiv
eServlet/downloadImage/102-3598-1-108773/%EC%9D%B4%EB%AF%B8%EC%A7%80+38.png)](
https://community.blackboard.com/servlet/JiveServlet/showImage/102-3598-1-1087
73/%EC%9D%B4%EB%AF%B8%EC%A7%80+38.png)

쿼리문:

--변수 선언

declare @i int

declare @COURSE int

declare @DEFAULT_WEEKDAY datetime

-- 변수 기본값 정의

set @i = 1

-- 코스 ID값은 해당 코스에 들어가면 주소에 보임

[![이미지 35.png](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-3598-1-108770/%EC%9D%B4%EB%AF%B8%EC%A7%80+35.png)](https://community.b
lackboard.com/servlet/JiveServlet/showImage/102-3598-1-108770/%EC%9D%B4%EB%AF%
B8%EC%A7%80+35.png)

set @COURSE = 43790

-- 해당 학기 시작일

set @DEFAULT_WEEKDAY = '2017-09-04 00:00:00'

--총 15주의 콘텐츠의 공개일을 설정함

while @i <= 15

begin

-------------------------------------------------------

-- 코스 > 콘텐츠 영역 > 각 주차별 폴더

update bblearn..course_contents

set start_date = NULL,

end_date = NULL,

available_ind = 'Y',

reviewable_ind = 'N',

main_data = '<p>강의 공개일은 '+ convert(char(19), @DEFAULT_WEEKDAY, 120) + '부터 ' +
convert(char(19), dateadd(n, 10079, @DEFAULT_WEEKDAY), 120) +'까지 입니다. <br />

출석퀴즈 또는 과제의 제출일은 '+ convert(char(19), @DEFAULT_WEEKDAY, 120) + '부터 ' +
convert(char(19), dateadd(n, 10079, @DEFAULT_WEEKDAY), 120) +'까지 응시할 수
있습니다.</p>'

from BBLEARN..course_main

where crsmain_pk1 = @COURSE and title like cast(@i as varchar) + '주차%' and
cnthndlr_handle = 'resource/x-bb-folder'

-- 코스 > 콘텐츠 영역 > 각 주차별 폴더 > 강의자료, 영상

update bblearn..course_contents

set start_date = @DEFAULT_WEEKDAY,

end_date = dateadd(n, 10079, @DEFAULT_WEEKDAY),

available_ind = 'Y',

reviewable_ind = 'N'

from BBLEARN..course_main

where crsmain_pk1 = @COURSE

and title like cast(@i as varchar) + '주차%' and not cnthndlr_handle =
'resource/x-bb-folder' and not cnthndlr_handle = 'resource/x-bb-assignment'
and not cnthndlr_handle = 'resource/x-bb-asmt-test-link'

-- 코스 > 콘텐츠 영역 > 각 주차별 폴더 > 출석퀴즈 또는 과제

update bblearn..course_contents

set start_date = @DEFAULT_WEEKDAY,

end_date = dateadd(n, 10079, @DEFAULT_WEEKDAY),

available_ind = 'Y'

from BBLEARN..course_main

where (crsmain_pk1 = @COURSE and title like cast(@i as varchar) + '주차%' and
cnthndlr_handle = 'resource/x-bb-assignment') or (crsmain_pk1 = @COURSE and
title like cast(@i as varchar) + '주차%' and cnthndlr_handle = 'resource/x-bb-
asmt-test-link') or

(crsmain_pk1 = @COURSE and title like cast(@i as varchar) + '주차%' and
cnthndlr_handle = 'resource/x-bb-courselink')

update bblearn..eud_item

set due_date = dateadd(n, 10079, @DEFAULT_WEEKDAY)

from bblearn..course_contents cc

where cc.crsmain_pk1 = @COURSE and crs_contents_pk1 = cc.pk1 and cc.title like
cast(@i as varchar) + '주차%' and cnthndlr_handle = 'resource/x-bb-asmt-test-
link'

-------------------------------------------------------

set @i += 1

set @DEFAULT_WEEKDAY = dateadd(d, 7, @DEFAULT_WEEKDAY)

end

commit;

