# checkmate

Description
-----------
#### 스터디그룹 매칭 웹사이트
- 스터디그룹을 구하는 카페나 오픈채팅은 있지만 웹사이트는 부재
- 매칭, 채팅, 지도 등 여러 서비스를 지원해주는 웹사이트 개발
- 시간과 공간에 제약이 없는 실시간 스터디 사이트 제안

#### Tech Stack

+ FE(Front-End)

   - JSP
   - CSS
   - Javascript
   - jQuery
   - Ajax
   - bootstrap
   

+ BE(Back-End)

   - Spring
   - Maven
   - jdk 1.8
   - WAS(Web-Application-Server) : Apache Tomcat 8.5
   - Database
     * RDBMS : Oracle 11g XE
   - Developer tool
     * Java : STS
     * Oracle : SQL-Developer

 + Design Pattern

   - 
   
#### 내가 구현기능

   - 스터디그룹(studyGroup,studyGroupApply,studyGroupMember)
    --스터디그룹 상세보기 페이지
    ![스터디그룹1](https://user-images.githubusercontent.com/107820408/182010426-67d9ad89-0556-4d92-8fdd-afc14a861b87.png)
    
    --스터디그룹 현재인원을 누를시에 스터디그룹에 속한 인원 보여주기
    ![스터디그룹2](https://user-images.githubusercontent.com/107820408/182010427-c6a0c025-53fc-495d-b9d9-afdf74093d70.png)
    
    --메세지 전송 버튼을 누르면 메세지 전송 가능
    ![스터디그룹3](https://user-images.githubusercontent.com/107820408/182010428-c5ffa55c-5c0a-45d0-8654-f1b36133af55.png)
    
    --팀장 닉네임 클릭시 간단한 프로필 보여주기
    ![스터디그룹5](https://user-images.githubusercontent.com/107820408/182010431-42a41657-b29d-4c9e-b5bb-3977e98f185f.png)
    
    --팀장 로그인시 지원자 확인기능
     수락 : 수락이 되었다는 메세지 전송과 함께 지원 리스트에서 사라지며, 스터디그룹 인원으로 추가
     거절 : 거절이 되었다는 메세지 전송과 함께 지원 리스트에서 사라짐
    ![스터디그룹6](https://user-images.githubusercontent.com/107820408/182010432-cb07758e-cab4-46c1-871b-c36aa3a2faf5.png)

    
   - 메세지(message)
    --메세지 리스트(수신함, 발신함)
   ![메세지1](https://user-images.githubusercontent.com/107820408/182010666-105c4ddd-34aa-4c18-821b-f02f1add46ff.png)
   ![메세지2](https://user-images.githubusercontent.com/107820408/182010667-1892823e-54dc-45f3-b3bf-e20d9dcffe5a.png)
   
    --메세지 상세보기
   ![메세지3](https://user-images.githubusercontent.com/107820408/182010668-1dbbf151-8501-44cf-b36f-6d3e9aebe335.png)
   
    --메세지 전송(첨부파일 기능포함)
   ![메세지4](https://user-images.githubusercontent.com/107820408/182010669-827c92c4-9216-448a-9c37-a40a47e34c40.png)

   
   - 메인페이지 통합검색
    --통합검색시 스터디그룹, 정보공유, 취업정보 게시판의 모든 정보들을 검색하여 페이지에 표시
    ![통합검색1](https://user-images.githubusercontent.com/107820408/182010561-e4306e27-ab68-4acd-a99a-26cac5344f9d.png)
    
    --원하는 게시글 클릭시 해당하는 게시글로 이동
    ![스터디그룹1](https://user-images.githubusercontent.com/107820408/182010426-67d9ad89-0556-4d92-8fdd-afc14a861b87.png)
    
    --더보기 버튼 클릭시 해당 게시판만을 검색 후 결과 표시
    ![통합검색2](https://user-images.githubusercontent.com/107820408/182010563-f4728b48-25e8-42e9-8763-f3e17489c342.png)
    ![통합검색3](https://user-images.githubusercontent.com/107820408/182010564-fbacd828-2d2d-49ec-92b9-303aa8891a99.png)
    
    --한 게시판에서만 게시글이 존재할시 결과 표시
    ![통합검색5](https://user-images.githubusercontent.com/107820408/182010567-bbe748bd-85c1-4efa-9a67-d7285c0cd7e3.png)

   
   
