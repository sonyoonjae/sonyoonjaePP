/**
 * 
 */

function test() {
	let item = document.getElementById('bank_name').value;
	alert(item);
	return null;
}


function success(data) {
	let form = document.getElementById('form');
	sendData = {
		"card_or_account_number": data
	};

	$.ajax({
		url: "/newPaymentWayCheck",
		method: "post",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(sendData),
		success: function(data) {
			if (data) {
				alert("새 결제 수단이 등록되었습니다.");
				form.submit();
			}
			else {
				alert('이미 존재하는 번호입니다.');
				return false;
			}

		}

	});
}

function fail(data) {
	alert(data);
	return false;
}

function disconnect(bankURL) {
	let sendData = {
		"messageType": "disconnect"
	};
	$.ajax({
		url: bankURL,
		contentType: "application/json;charset=UTF-8",
		method: "post",
		data: JSON.stringify(sendData)
	})
}

function payment(password, bankURL) {
	let tempMeans = document.getElementsByClassName('on')[0].innerText;
	let card_or_account_number = "";
	let means = "";
	let cvc = "";
	let pg_code = document.getElementById('pg_code').value;
	let end_date;
	let end_year = "-1";
	let end_month = "-1";
	if (tempMeans == "카드") {
		means = 'card';
		card_or_account_number = document.getElementsByName('card_or_account_number')[0].value;
		cvc = document.getElementById("cvc").value;
		end_date = document.getElementById('end_date').value;
		end_date = end_date.split("/");
		end_year = "20" + end_date[1];
		end_month = end_date[0];

	} else {
		means = 'account';
		card_or_account_number = document.getElementsByName('card_or_account_number')[1].value;
	}


	document.getElementById('end_year').value = end_year;
	document.getElementById('end_month').value = end_month;
	document.getElementById('means').value = means;

	let sendData = {
		"messageType": "paymentWayCheck",
		"pg_code": pg_code,
		"mall_ID": "Joongang",
		"means": means,
		"card_or_account_number": card_or_account_number,
		"payment_password": password,
		"end_month": end_month,
		"end_year": end_year,
		"CVC": cvc
	};

	$.ajax({
		url: bankURL,
		method: "post",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(sendData),
		success: function(data) {
			if (data.messageType == "success") {
				disconnect(bankURL);
				success(card_or_account_number);
			}
			else {
				fail("오류가 발생했습니다: " + data.message);
				return false;
			}
		}
	}).fail(function() {
		alert('접속할 수 없습니다..');

	})
}

function getBankURL(receiveData) {

	let bankName = document.getElementById('bank_name').value;


	let send = {
		"bank_name": bankName
	};

	$.ajax({
		url: "/getBankURL",
		type: "post",
		contentType: "application/json;charset=UTF-8",
		dataType: "text",
		data: JSON.stringify(send),
		success: function(data) {
			payment(receiveData, data);
		},
		error: function() {

		}
	})

}


function paymentway_check() {
	let tempMeans = document.getElementsByClassName('on')[0].innerText;
	let password = "";
	if (tempMeans == "카드") {
		password = document.getElementsByName('payment_password')[0].value;


	} else {
		password = document.getElementsByName('payment_password')[1].value;
	}

	let dataEncrypting = {
		"data": password
	};


	$.ajax({
		url: "/encryption",
		type: "post",
		contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(dataEncrypting),
		dataType: "text",
		success: function(receiveData) {
			getBankURL(receiveData);

		},
		error: function() {
			encrypted_password = null;
		}
	});



}


function payment_ajax() {
	let bankURL = "http://localhost:8081";
	let pg_code = document.getElementById('pg_code').value;
	let mall_account = document.getElementById('mall_account').value;

	let sendData = {
		"messageType": "connect",
		"pg_code": pg_code,
		"mall_ID": "Joongang",
		"mall_account": mall_account
	};


	$.ajax({
		url: bankURL,
		method: "post",
		data: JSON.stringify(sendData),
		contentType: "application/json; charset=UTF-8",
		success: function(data) {
			if (data.messageType == "success") {
				paymentway_check();
			}
			else {
				alert('은행에 접근할 수 없습니다.' + data.message);

				return false;
			}
		}

	}).fail(function() {
		alert('알 수 없는 오류로 거래가 중지되었습니다.');
		return false;
	});
}
