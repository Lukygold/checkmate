<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
  <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>스터디센터 예약</title>

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->

    <link href="resources/css/theme1.css" rel="stylesheet" />
    <style>
        #boardList {text-align:center;}
            #boardList>tbody>tr:hover {cursor:pointer;}
    
            #pagingArea {width:fit-content; margin:auto;}
            
            #searchForm {
                width:80%;
                margin:auto;
            }
            #searchForm>* {
                float:left;
                margin:5px;
            }
            .select {width:20%;}
            .text {width:53%;}
            .searchBtn {width:20%;}
    </style>
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      
      <section id="booking">
        <div class="bg-holder" style="background-image:url(resources/img/bg-masthead.jpg);background-position:center;background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row">
            <div class="col-12 py-8 text-white">
              <div class="d-flex flex-column flex-center">
                <h2 class="text-white fs-2 fs-md-3">체크메이트</h2>
                <h1 class="text-white fs-2 fs-sm-4 fs-lg-7 fw-bold">스터디센터 예약</h1>
              </div>
              <form class="row gy-2 gx-md-2 gx-lg-4 flex-center my-6" action="centerList.ro" method="post" >
                <div class="col-6 col-md-3">
                  <label class="visually-hidden" for="inlineFormSelectPref">스터디센터</label>
                  <select class="form-select" id="inlineFormSelectPref">
                    <option selected="" >스터디센터</option>
                  <c:forEach var="r" items="${list}"> 
                    <option value="${r.roomCenterName}">${r.roomCenterName}</option>
                  </c:forEach>
                  </select>
                </div>
               <div class="col-6 col-md-3" id="roomSize">
                  <label class="visually-hidden" for="autoSizingSelect">방크기(인원 수)</label>
                  <select class="form-select" id="autoSizingSelect">
                    <option selected="">방크기(인원 수)</option>
                     
                  </select>
                </div> 
                <div class="col-6 col-md-3" id="roomName">
                  <label class="visually-hidden" for="inlineFormSelectPref2">방이름</label>
                  <select class="form-select" id="inlineFormSelectPref2">
                    <option selected="" >방이름</option>

                  </select>
                </div>
                <div class="col-6 col-md-3">
                  <label class="visually-hidden" for="date" placeholder="시작시간">시작시간</label>
                  <div class="input-group"  placeholder="시작시간">
                    <input type="text" class="form-control" id="date1" placeholder="시작시간"/>
                  </div>
                </div>
                <div class="col-6 col-md-3">
                <lab9ioel class="visually-hidden" for="autoSizingSelect2">시작시간</label>
                <select class="form-select" id="autoSizingSelect2">
                  <option selected="">시작시간</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                </select>
                </div>
                <div class="col-6 col-md-3">
                  <label class="visually-hidden" for="autoSizingSelect3">사용시간</label>
                  <select class="form-select" id="autoSizingSelect3">
                    <option selected="">사용시간</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                  </select>
                  </div>
                <div class="col-6 col-md-auto">
                  <button class="btn btn-lg btn-primary" type="submit">예약</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </section>
      <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2 align="center">예약조회</h2>
            <br>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${not empty loginUser}">
            <a class="btn btn-secondary" style="float:right;" href="enrollForm.bo">예약</a>
            </c:if>
            <p align="center">단, 예약시간은 시간 단위이며 9시 10시 11시...처럼 정시간에 시작시간과 끝나는 시간을 설정해야합니다.</p>
            <br>
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>
                        </th>
                        <th>스터디센터</th>
                        <th>예약일</th>
                        <th>시작시간</th>
                        <th>마치는시간</th>
                        <th>방번호</th>
                        <th>방크기(인원가능)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                          <input type="checkbox">
                        </td>
                        <td>강남a센터</td>
                        <td>2022-07-31</td>
                        <td>오전9시</td>
                        <td>오전10시</td>
                        <td>10a</td>
                        <td>2명</td>
                    </tr>
                    
                </tbody>
            </table>
            <br>
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                   		 <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	 <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage-1}">Previous</a></li>		
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1">
                    	<li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
                    </c:forEach>
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		 <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage+1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <br clear="both"><br>

            <br><br>
        </div>
        <br><br>

    </div>


    </main>

    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200;300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
  </body>
  <script>
    var dtt = document.getElementById('date1')
    dtt.onfocus = function (event) {
        this.type = 'date';
        this.focus();
    }
  </script>
  <script>

  	$(function(){
  		$("#inlineFormSelectPref").change(function(){
  			var temp = $("#inlineFormSelectPref").val();
  			
  			
  			$.ajax({
  				url : "reserveRoomSize.ro",
  				data : {
  					roomCenterName : temp
  				},
  				success: function(list){
  					var roomSizeList ="";

  					for( var i in list){
  						roomSizeList +="<option value='"+list[i].roomSize+"'>"+ list[i].roomSize +"명</option>";
  					}
  					
  					$("#roomSize>select").html(roomSizeList);	
  					
  				},
  				error : function(){
  					alert("실패");
  				}
  			})
  			
  		})
  	})
  	$(function(){
  		$("#autoSizingSelect").change(function(){
  			var temp = $("#inlineFormSelectPref").val();
  			var temp1 = $("#autoSizingSelect").val();
  			alert(temp);
  			alert(temp1);
  			
  			$.ajax({
  				url : "reserveRoomName.ro",
  				data : {
  					roomCenterName : temp,
  					roomSize : temp1 
  				},
  				success: function(list){
  					var roomNameList ="";
  					console.log(list);
  					for( var i in list){
  						roomNameList +="<option value='list[i].roomName'>"+ list[i].roomName +"</option>";
  					}
  					
  					$("#roomName>select").html(roomNameList);	
  					
  				},
  				error : function(){
  					alert("실패");
  				}
  			})
  			
  		})
  	})
  </script>


</html>