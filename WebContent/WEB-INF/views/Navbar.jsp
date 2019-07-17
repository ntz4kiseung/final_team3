<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String userId = (String)session.getAttribute("userId");
%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="navbar-box">

            <div class="navbar-left flex-row-left-center">
                <div class="logo-box flex-row-left-center">
                	<a href="main.action" class="flex-row-left-center">
	                    <div class="logo-img">
	                        <img src="img/Logo.png" alt="이미지없음">
	                    </div>
	                    <div class="logo-text">
	                        Sagyo
	                    </div>
                    </a>
                </div>
            </div>
            
            
            <div class="navbar-center flex-item-grow flex-row-center-center  ${param.isMain==null ? "" : "hidden"}">
                <form action="search.action" class="flex-row-center-center">
                    <input type="text" placeholder="관심사의 키워드를 입력해주세요" name="keyword" class="form-control flex-item-grow" id="navbar-search-input">
                    <button type="submit" class="btn" id="navbar-search-btn">검색</button>
                </form>
            </div>
            
            
            <div class='navbar-right flex-row-right-center ${userId==null ? "" : "hidden"}'>
                <div>
                    <a href="login.action"><button class="btn btn-border-right">로그인</button></a>
                </div>
                <div>
                    <a href="notice.action"><button class="btn">고객센터</button></a>
                </div>
            </div> 
            
            
            <div class='navbar-right flex-row-right-center ${userId==null ? "hidden" : ""}'>
                <div><img src="img/알람on.png" alt="noimage" /></div>
                <div>
                    <a href="postwrite.action"><button class="btn btn-border-right">모임개설</button></a>
                </div>
                <div>
                    <a href="myprofile.action"><button class="btn btn-border-right">${userId}</button></a>
                </div>
                <div>
                    <a href="notice.action"><button class="btn ">고객센터</button></a>
                </div>
                <div>
                    <a href="logout.action"><button class="btn btn-border-left">로그아웃</button></a>
                </div>
            </div>     
        </div>
