# Q2 2018 이후 Internet Explorer 이용자 대응 제안
*Author: Nam-Su Yi*
*Categories: []*
*Tags: ['developer']*
---
준비

  * [JSHack](https://community.blackboard.com/external-link.jspa?url=http%3A//projects-archive.oscelot.org/gf/project/jshack/frs/%3Faction%3DFrsReleaseView%26release_id%3D991)
  * 스크립트 소스
  * 관련 대응 문서

JSHack 스크립트 소스

    <script type="text/javascript">
        Event.observe(document,"dom:loaded", function() {
            var agent = navigator.userAgent.toLowerCase();
            if ( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1))
            {
                window.open("https://sejong.zendesk.com/hc/ko/articles/360026222971-%ED%81%AC%EB%A1%AC%EC%9D%84-%EA%BC%AD-%EC%9D%B4%EC%9A%A9%ED%95%B4%EC%95%BC-%ED%95%98%EB%82%98%EC%9A%94-","_blank","width=850,height=600,scrollbars=yes,resizable=yes");
                
                //window.alert("현재 이용하고 계신 Internet Explorer는 온라인강의실 시스템\n보안 모듈 업그레이드로 인하여 온라인강의실 이용에 제약이 있습니다.\n기본 이용은 가능하나, 파일 첨부 기능을 보안상의 이유로 지원하지 않습니다.\n\n크롬 또는 윈도우 10의 기본 인터넷 프로그램인 Edge를\n 이용하신다면 원활한 온라인강의실 이용이 가능합니다.\n\n이용문의: 02-3408-4481 온라인강의실 담당자");
                window.history.back();
    }
        });
    </script>

Restriction List

  * URL is .*/webapps/assignment/WEB-INF/jsp/upload_assignment.jsp
  * Advanced Expression is context.courseId.key==*

관련 대응 문서

[크롬을 꼭 이용해야 하나요? – 온라인강의실](https://community.blackboard.com/external-link.jspa
?url=https%3A//sejong.zendesk.com/hc/ko/articles/360026222971-%25E
D%2581%25AC%25EB%25A1%25AC%25EC%259D%2584-%25EA%25BC%25AD-%25EC%259D%25B4%25EC
%259A%25A9%25ED%2595%25B4%25EC%2595%25BC-%25ED%2595%2598%25EB%2582%2598%25EC%2
59A%2594-)

세종대학교에서는 업그레이드 이후 확인하지 못한 인터넷 익스플로러 브라우저 지원에 관련하여 이용자들에게 대응하기 위한 조치사항으로

과제 페이지에 접속할 경우 안내 메시지 또는 대응 문서가 담긴 URL을 띄워 이용자들에게 관련 내용을 전달하고 있습니다.

다른 기관에서도 대응 가이드로 참고하시면 좋을 것 같아서 공유해드립니다.

작동 영상

[https://drive.google.com/open?id=1esQJM2ZiRYqBQkYJo-5DwTi9wn-
Y_K7S](https://d
rive.google.com/open%3Fid%3D1esQJM2ZiRYqBQkYJo-5DwTi9wn-Y_K7S)

감사합니다.

