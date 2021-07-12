/**
 * 
 */
window.onload=function(){
	let paymentButton=document.getElementsByClassName('sbtnMini iw0140')[0];
	paymentButton.addEventListener("click",paymentToPG);
}

function pgOpen(mall_code) {
	let total_price = document.getElementById('total_price').value;
	let mall_account = document.getElementById('mall_account').value;
	let url = "http://localhost:8082?total_price=" + total_price + "&mall_code=" + mall_code;
	url = url + "&mall_account=" + mall_account;

	window.open(url, "Payment's", "top=100px, left=100px, height=800px, width=770px");

	

}
function paymentToPG() {
	let url = 'http://localhost:8082/connect';
	let mall_code = "-1";

	sendData = {
		"messageType": 'connect',
		"mall_code": mall_code,
	}

	$.ajax({
		url: url,
		type: "post",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(sendData),
		success: function(data) {
			pgOpen(mall_code);
		},
		error: function(XHR) {
			alert('통신 실패');
		}
	});

}