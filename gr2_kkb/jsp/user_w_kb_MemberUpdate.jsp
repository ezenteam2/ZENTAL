<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/user_w_kb_memberUpdate.css">
    <title>Document</title>
    

</head>
<body>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function Postcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.querySelector("#Address2").value = extraAddr;
                    
                    } else {
                        document.querySelector("#Address2").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.querySelector("#input_ZipCode").value = data.zonecode;
                    document.querySelector("#Address1").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("#Address3").focus();
                }
            }).open();
        }
    </script>
    <main>
        <div id="kb_title">
            <h2>회원정보 수정</h2>
        </div>
        <form method="post">
            <div id="Member_Basic_Div">
                <div id="Profile_Div"><img src="Image/Profile.png"></div>
                <div id="Member_Infor_Div">
                    <div class="info_Div">
                        <span class="info_Span">아이디 : </span>
                        <span class="info_Span">EZENKB</span>
                    </div>
                    <div class="info_Div">
                        <span class="info_Span">닉네임 : </span>
                        <span class="info_Span">이젠 KB</span>
                    </div>
                </div>
            </div>
            <div id="inputPhone_Div">
                <span class="info_Span">휴대폰번호 : </span>
                <input type="text" id="phone_input" name="phone" placeholder="휴대폰번호">
                <button id="Certification_Btns">인증</button>
            </div>
            <div>
                <span class="info_Span">이메일 : </span>
                <input type="email" name="email" id="input_email" placeholder="이메일">
            </div>
            <div id="Address_Div">
                <div class="address">
                    <span class="info_Span">주소 : </span>
                    <input type="text" name="ZipCode" id="input_ZipCode" placeholder="우편번호">
                    <button id="Search_Zipcode_Btn" onclick="Postcode()">우편번호 검색</button>
                </div>
                <div class="address">
                   <input type="text" name="Address1" id="Address1" placeholder="주소">
                 </div>
                 <div class="address">
                    <input type="text" name="Address2" id="Address2" placeholder="상세주소1">
                    <input type="text" name="Address3" id="Address3" placeholder="상세주소">
                 </div>
            </div>
            <div id="Update_Btns_Div">
                <button id="Update_Btns">수정</button>
            </div>
        </form>
    </main>
  
</body>
</html>