<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="zental.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="CSS/user_w_kb_EmoneyCharge.css">

    <script>
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    </script>
     <script src="http://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
    <script>
          function clickPrice(num){
            var PriceComma = numberWithCommas(num);
            var input_Price=  document.querySelector("#Price_Span")
            input_Price.innerHTML=PriceComma;
            $("#Check_Input").prop("checked", false);
            $("#PriceHidden").val(num);
            console.log(PriceComma);
        }
        function inputPrice(e, obj){

            $("#Check_Input").prop("checked", true);

            if ($(obj).val() == "") {
                $("#PriceHidden").val("0");
                $("#Price_Span").text("0");
            } else {
                $("#PriceHidden").val($(obj).val());
                $("#Price_Span").text(numberWithCommas($(obj).val()));
            }
        }
        
        function checked(obj){
        	obj.style.backgroundColor ="#f6f9fc";
        }
        
    </script>
    <main>
        <div id="kb_title">
            <h2>E머니 충전</h2>
        </div>
        
        <h3>결제 방법</h3>
        <div id="Bank_Btns">
            <div class="bank_menubar"><div class="bank_text">문화상품권</div></div>
            <div class="bank_menubar"><div class="bank_text">모바일(휴대폰)</div></div>
            <div class="bank_menubar"><div class="bank_text">계좌이체</div></div>
            <div class="bank_menubar"><div class="bank_text">신용카드</div></div>
            <div class="bank_menubar"  onclick="checked(this)"><div class="bank_text">무통장입금</div></div>
            <div class="bank_menubar"><div class="bank_text">편의점/포인트</div></div>
        </div>
        <h3>충전 금액</h3>
        <div id="Price_Btns">
            <div class="Price_menubar" onclick="clickPrice(10000)"><div class="Price_text">10,000원</div></div>
            <div class="Price_menubar" onclick="clickPrice(20000)"><div class="Price_text">20,000원</div></div>
            <div class="Price_menubar" onclick="clickPrice(30000)"><div class="Price_text">30,000원</div></div>
            <div class="Price_menubar" onclick="clickPrice(50000)"><div class="Price_text">50,000원</div></div>
            <div class="input_Price_Div">
                <div id="Price_radio_Div">
                    <input type="radio" value="true" id="Check_Input" name="Check_Input">&nbsp;직접 입력 
                </div>
                <div id="input_Price_Div">
                    <input type="number" name="Price" id="input_price" onkeyup="inputPrice(event, this)" placeholder="충전 금액 입력">
                </div>
            </div>
        </div>
        <form method="post">
        <div id="Charge_Price_Text">
            <b>충전 금액 : </b>&nbsp;<span id="Price_Span">5,000</span>&nbsp;<b>원</b>&nbsp;&nbsp;&nbsp;
            <input type="hidden" id="PriceHidden" name="Prices">
        </div>
        <h2>결제 할 계좌번호를 입력하세요</h2>
        <div id="Bank_Account_input_Div">
            <select name="Bank">
                <option></option>
                <option>우리은행</option>
                <option>신한은행</option>
                <option>국민은행</option>
                <option>농협</option>
                <option>하나은행</option>
                <option>IBK기업은행</option>
            </select>&nbsp;
            <input type="text" name="Bank_Account" id="input_Account" placeholder="계좌번호">
        </div>
        <div id="Charge_Btn_Div">
            <button id="Charge_Btn" onclick="submit()">충전하기</button>
        </div>
        </form>
    </main>
    <%

	request.setCharacterEncoding("UTF-8");
	String Price = request.getParameter("Prices");
	String Bank = request.getParameter("Bank");
	String Account = request.getParameter("Bank_Account");
	String emo_cate = "충전";
	Boolean isSuccess = false;
	String LoginId = (String)session.getAttribute("idkey");
	System.out.println("E머니 충전 id : " + LoginId);
	
	int price = 0;
	if(Price != null) price = Integer.parseInt(Price); else price = 0;
	if(Bank == null) Bank = "";
	if(Account == null) Account = "";
	
	
	
	kb_EmoneyInsert emo = new kb_EmoneyInsert();
	if(Price != null && Bank != null && Account != null){
	emo.setEmo_cate(emo_cate);
	emo.setBank(Bank);
	emo.setAccount(Account);
	emo.setPrice(price);
	
	kb_Database db = new kb_Database();
	db.InsertEmoney(emo, LoginId);
  	
  	isSuccess = true;
	} else {
		isSuccess = false;
	}
  	%>
  	<script>
  		console.log(isSuccess);
  		var isSuccess = <%=isSuccess%>
		console.log(isSuccess);
  		if(isSuccess){
  			alert("충전완료");
  		}
  	</script>
 
</body>
</html>