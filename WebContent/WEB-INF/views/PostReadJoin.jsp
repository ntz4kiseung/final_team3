<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- 폰트 (Noto Snas KR + Handlee) -->
    <link href="https://fonts.googleapis.com/css?family=Handlee|Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- sagyo.css -->
    <link href="css/sagyo.css" rel="stylesheet">


</head>
<body>
    <div class="browser flex-col-center-center">
        <div class="navbar-box flex-row-center-center">

            <div class="navbar-left flex-row-left-center">
                <div class="logo-box flex-row-left-center">
                    <div class="logo-img">
                        <img src="img/Logo.png" alt="이미지없음">
                    </div>
                    <div class="logo-text">
                        Sagyo
                    </div>
                </div>
            </div>
            
            <div class="navbar-center flex-item-grow flex-row-center-center">
                <form action="" class="flex-row-center-center">
                    <input type="text" placeholder="관심사의 키워드를 입력해주세요" class="form-control flex-item-grow" id="navbar-search-input">
                    <button class="btn" id="navbar-search-btn">검색</button>
                </form>
            </div>
            
            <div class="navbar-right flex-row-right-center">
                <div>알람</div>
                <div>
                    <button class="btn btn-border-right">모임개설</button>
                </div>
                <div>
                    <button class="btn btn-border-right">nickname</button>
                </div>
                <div>
                    <button class="btn btn-border-right">고객센터</button>
                </div>
            </div>            
        </div>

        <div class="body-box flex-item-grow flex-col-center-up">
            <div class="body flex-item-grow flex-col-center-up">
                <div class="Post flex-item-grow flex-col-center-up">

                    <div class="Post-title">
                        <div>진짜 제목입니다.</div>
                        <div>게시일자입니다.</div>
                    </div>

                    <div class="Post-host flex-row-left-center">
                        <div>
                            <img src="img/badge150pixel_0023_슈퍼방장.png" alt="이미지 없음">
                        </div>
                        <div>
                            <div>usernickname ♡</div>
                            <div>☆☆☆☆☆</div>
                            <div>휴대전화 인증완료</div>
                            <div>이메일 인증완료</div>
                        </div>
                        <div>
                            <div>만 남 일: <span>2019.06.17 오후 5:50</span></div>
                            <div>만남장소: <span>서울특별시 > 송파구 > 가락시장 근처</span></div>
                            <div>관 심 사: <span>IT&테크 > 컴퓨터 > 파이썬 서브프로젝트</span></div>
                            <div>참가제한: <span>Q&A, 동성, 4점이상</span></div>
                        </div>
                    </div>

                    <div class="Post-contents">
                        <div>
                            Hi David,
                            Iste minus et. Non necessitatibus ut est est id amet. Officiis sequi dolorum assumenda ipsam magnam cum possimus. Laudantium nulla amet tempore excepturi id expedita dolorum quisquam deserunt. Odit vel sint dolor eos. Ea blanditiis animi. Quibusdam unde unde. Perspiciatis vel pariatur qui. Deleniti omnis est quae. Laboriosam numquam amet aliquid.
                        
                            Iste minus et. Non necessitatibus ut est est id amet. Officiis sequi dolorum assumenda ipsam magnam cum possimus. Laudantium nulla amet tempore excepturi id expedita dolorum quisquam deserunt. Odit vel sint dolor eos. Ea blanditiis animi. Quibusdam unde unde. Perspiciatis vel pariatur qui. Deleniti omnis est quae. Laboriosam numquam amet aliquid.Iste minus et. Non necessitatibus ut est est id amet. Officiis sequi dolorum 
                            
                            Iste minus et. Non necessitatibus ut est est id amet. Officiis sequi dolorum assumenda ipsam magnam cum possimus. Laudantium nulla amet tempore excepturi id expedita dolorum </div>
                        </div>

                    <div class="Post-report flex-row-right-center">
                        <button class="btn">신고하기</button>
                    </div>

                    <div class="Post-join">
                        <div>현재 참가 신청인원 (3/4~6)</div>
                        <div class="flex-row-left-center">
                            <div><textarea name="" id=""></textarea></div>
                            <div><button class="btn btn-outline-secondary">참가신청</button></div>
                        </div>
                    </div>

                    <div class="Post-joinList">
<!-- 
                        <div class="comments flex-row-left-center">
                            대댓글인 경우 활성화
                            <div class="comments-reply"> 
                                <img src="img/img6.png" alt="">
                            </div>

                            <div class="comments-user"> 코멘트 유저 뱃지 + 닉네임
                                <div> 뱃지
                                    <img src="img/badge150pixel_0005_우수참석러.png" alt="">
                                </div>
                                <div> 닉네임
                                    nickname
                                </div>
                            </div>
                            <div class="comments-else flex-item-grow">
                                <div class="comments-buttons flex-row-left-center">
                                    <div>2019.09.08 17:05</div>
                                    <div>
                                        <button class="btn">신고하기</button>
                                    </div>
                                    <div>
                                        <button class="btn btn-border-right">댓글달기</button>
                                        <button class="btn">신청취소</button>
                                    </div>
                                </div>
                                <div>
                                    신청합니다~ 댓글 본문 입력
                                </div>
                            </div>
                        </div>
 -->
 						<c:forEach var="join" items="${list}">
 							<div class="comments flex-row-left-center">
	                            <!-- 대댓글인 경우 활성화 -->
	                            <!-- <div class="comments-reply"> 
	                                <img src="img/img6.png" alt="">
	                            </div> -->
	
	                            <div class="comments-user"> <!-- 코멘트 유저 뱃지 + 닉네임 -->
	                                <div> <!-- 뱃지 -->
	                                    <img src="img/badge150pixel_0001_뉴비.png" alt="">
	                                </div>
	                                <div> <!-- 닉네임 -->
	                                    ${join.nickname}
	                                </div>
	                            </div>
	                            <div class="comments-else flex-item-grow">
	                                <div class="comments-buttons flex-row-left-center">
	                                    <div>${join.joinDate}</div>
	                                    <div>
	                                        <button class="btn">신고하기</button>
	                                    </div>
	                                    <div>
	                                        <button class="btn btn-border-right">댓글달기</button>
	                                        <button class="btn">신청취소</button>
	                                    </div>
	                                </div>
	                                <div>
	                                    ${join.contents}
	                                </div>
	                            </div>
	                        </div>
 						</c:forEach>
                        <div class="comments flex-row-left-center">
                            <div class="comments-reply"> <!-- 대댓글인 경우 활성화 -->
                                <img src="img/img6.png" alt="">
                            </div>
                            <div class="comments-user"> <!-- 코멘트 유저 뱃지 + 닉네임 -->
                                <div> <!-- 뱃지 -->
                                    <img src="img/badge150pixel_0005_우수참석러.png" alt="">
                                </div>
                                <div> <!-- 닉네임 -->
                                    nickname
                                </div>
                            </div>
                            <div class="comments-else flex-item-grow">
                                <div class="comments-buttons flex-row-left-center">
                                    <div>2019.09.08 17:05</div>
                                    <div>
                                        <button class="btn">신고하기</button>
                                    </div>
                                    <div>
                                        <button class="btn btn-border-right">댓글달기</button>
                                        <button class="btn">신청취소</button>
                                    </div>
                                </div>
                                <div>
                                    신청합니다~ 댓글 본문 입력
                                </div>
                            </div>
                        </div>

                        <div class="Post-footer flex-row-right-center">
                            <button class="btn btn-outline-orange btn-120-35">목록으로</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>