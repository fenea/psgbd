function check(){
	var pwd1 = document.getElementById("pwd1").value;
	var pwd2 = document.getElementById("pwd2").value;
	var warningDivClasses = document.getElementById("warn-psw").classList;
	
	if(pwd1 != pwd2){
		warningDivClasses.remove("display-none");
	}
	else if(warningDivClasses.contains("display-none") == false){
		warningDivClasses.add("display-none");
	}
}

function checkUsername(){
	var xhttp = new XMLHttpRequest();
	var url = "insert-user?username=" + encodeURI(document.getElementById("username").value);
	xhttp.onreadystatechange = function() {
		var warningDivClasses = document.getElementById("warn-username").classList;
		if (this.readyState == 4 && this.status == 202) {
			warningDivClasses.remove("display-none");
		}
		else if (this.readyState == 4 && this.status == 200){
			if(warningDivClasses.contains("display-none") == false){
				warningDivClasses.add("display-none");
			}
		}
	};
	xhttp.open("GET", url, false);
	xhttp.send();
}

function validateForm(){
	var inputs = document.getElementsByTagName("input");
	var i, length = inputs.length;
	
	if(!document.getElementById("warn-username").classList.contains("display-none"))
		return false;
	
	for(i = 0; i < length; ++i){
		if(inputs[i].value == ""){
			alert("Cannot submit! All fields are mandatory");
			return false;
		}
	}
	return true;
}