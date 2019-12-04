# Bulk Course Archive/Restore - Export/Import/Archive/Restore (코스 백업 파일 생성 및 복원하기)
*Author: Soomyoung Yi*  
*Categories: ['[운영] 관리자 배치파일 ', '[시스템 관리] 가이드 및 참고자료']*  
*Tags: ['course archive', 'course restore', 'course export', 'course import', 'developer']*  
<hr />
### 1. Create Feed

(첨부파일: crslist.csv)

  * DB 에서 다음을 실행 후, 실행결과를 .csv 파일로 저장한다.
    * Archive 용
      * MSSQL: select course_id,'.','true','true','true' from BBLEARN..course_main
      * ORACLE: select course_id,'.','true','true','true' from BBLEARN.course_main
    * Export/Import용
        * MSSQL: select course_id,'.' from BBLEARN..course_main
        * ORACLE: select course_id,'.'+'.zip' from BBLEARN.course_main
  * CSV파일 일부   
(C:\blackboard\apps\content-exchange\bin 이 아닌 다른 위치에 zip 파일을 추출하려면 전체 경로를
생성해줘야 한다)

...

201101BM101012,.,true,true,true

20141R0390ECR54100,.,true,true,true

20151R0309DKK500IJ,.,true,true,true

20151R0390ECR54100,.,true,true,true...

### 2. 코스 추출

  * Export / Import Tool 실행  
csv 파일을 C:\blackboard\apps\content-exchange\bin 에 복사 후,

cd C:\blackboard\apps\content-exchange\bin

C:\blackboard\apps\content-exchange\bin>batch_ImportExport.bat -f crslist.csv
-l 1 -t archive

  * 생성된 zip 파일과 csv 파일을 원하는 서버의 x:\blackboard\apps\content-exchange\bin 에 옮긴다.

### 3. 코스 복원

  * 코스 복원을 위해 다음과 같이 실행한다.  
cd C:\blackboard\apps\content-exchange\bin

batch_ImportExport.bat -f crslist.csv -l 1 -t restore (복원)

** Course Archive 의 경우에는 zip 파일 명 이름에 ArchiveFile_ 가 붙으므로, csv 파일에서 zip 파일명을 수정하여야 한다.  
(하단 스크린 샷 참조)

  * 코스 가져오기  
cd C:\blackboard\apps\content-exchange\bin

batch_ImportExport.bat -f crslist.csv -l 1 -t import(가져오기)

** 복원 스크린샷

[![](https://bsk.blackboard.com/bbcswebdav/pid-6408-dt-content-
rid-23224_1/xid-23224_1)](https://bsk.blackboard.com/bbcswebdav/pid-6408-dt-
content-rid-23224_1/xid-23224_1)

### *Case Study - 기존 코스에 메뉴 추가하기

  * 코스에 메뉴를 빠뜨렸을 경우, 다음과 같이 서버 내의 export/archive/import/restore 도구로 추가가 가능합니다.(다만, 추가된 메뉴는 코스의 사용자 메뉴 최 하단에 위치하게 됩니다)
  1. 임의의 코스를 생성하여 모든 메뉴를 삭제하고, 원하는 메뉴만 생성하여 주십시오.
  2. 코스 재활용>코스 내보내기 메뉴를 선택하시고, 코스 내보내기를 합니다.
    1. 이때, 선택할 내용은 모두 취소를 하시고, 설정>내비게이션 설정 만 선택합니다.
    2. 확인을 누르고, 잠시 후, 내보내기 된 zip 파일을 다운로드 합니다.(임의의 테스트 코스에 “가져오기” 를 하여 원하는 메뉴가 추가가 되는지 확인합니다)
  3. Batch Import 작업을 위한 피드 파일을 만듭니다  
(편의상 courselist.csv 라고 하겠습니다). courselist.csv 피드 파일의 포맷은 다음과 같습니다.

    1. 예를 들어 과목이 201620285000ARA0965Z4, 201620285000ARA0965Z3,… 과 같이 있고, 이에 대한 export(내보내기) 파일이 a01.zip 이라면
    2. 201620285000ARA0965Z4,a01.zip201620285000ARA0965Z3,a01.zip…. 과 같이 작성해줍니다. (기존의 vw_course.csv 피드파일을 이용하시면 편하게 작업하실 수 있을 것입니다)
  4. 1번 app server에서 작업 하는 것을 가정하면, a01.zip 압축 파일과 courselist.csv 을 1번 서버의 D:\blackboard\apps\content-exchange\bin 폴더에 모두 복사합니다.
  5. 명령 프롬프트를 띄운 뒤, 다음의 명령을 차례대로 실행해줍니다.cd D:\blackboard\apps\content-exchange\binbatch_ImportExport.bat -f 201620.csv -l 1 -t import
  6. 테스트 서버에서 피드 파일에 한 과목 정도의 데이터만 입력하여 우선 실행해보시면 됩니다.

### * Batch Import/Export/Restore/Archive Tool 매뉴얼

- Batch Import/Export/Restore/Archive Tool

C:\blackboard\apps\content-exchange\bin\batch_ImportExport.bat

Instructions:

-f batch File

The batch file that describes the courses that should be operated upon

as well as the location of files to use. The meanings of these values

change based upon the type of operation being performed.

import/restore - the course id of the target course and the path to

the package file to use for the operation.

optional : The path on the content system where the CS files related to the
course

being restored/imported would be saved. IF this is empty or incorrect

path is specified the CS items related to the course would not be

restored.

export/archive - parameters must be specified in the following order:

1) the course id of the course to operate on (the course must already exist)

2) the path to the directory into which the resulting package file should be
placed.

3) optional: specify true OR false to indicate whether to archive/export

course files found under the course's home directory.

If no value is specified, default is true.

4) optional: specify true or false to indicate whether to archive/export grade
history.

If no value is specified, default is false.

5) optional: specific true or false to indicate whether to archive/export

course files found outside the course's home directory.

If no value is specified, default is false.

Please see the Blackboard Administrator Guide for more information

regarding the expected format of this file.

-l delimiter

The delimiter that is used to separate the values in the provided batch

file. This value can be 1, 2, or 3 (1 = , 2 = ; 3 = tab)

-t operation

The type of action to perform (must be import, export, restore, or

archive).

-n hostname (optional)

The hostname of virtual installation against which the operation should

be performed. If this option is not provided, the default virtual host

will be used.

-c common cartridge version (optional)

The version of common cartridge the operation should export/archive to.

If this option is not provided, the operation handles the package as the Learn
package.

Supported common cartridge versions are 1.0, 1.1 and 1.2.

-help

Generates a list of supported options.

For bash:

bash$ ./batch_ImportExport.sh -f batch file -l delimiter (1, 2,or 3) -t
operation (import/export/restore/archive)

For dos:

d:> batch_ImportExport.bat -f batch file -l delimiter (1, 2,or 3) -t operation
(import/export/restore/archive)

