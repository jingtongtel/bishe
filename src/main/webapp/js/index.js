
function cambiar_login() {
  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";  
document.querySelector('.cont_form_login').style.display = "block";
document.querySelector('.cont_form_sign_up').style.opacity = "0";               

setTimeout(function(){  document.querySelector('.cont_form_login').style.opacity = "1"; },400);  
  
setTimeout(function(){    
document.querySelector('.cont_form_sign_up').style.display = "none";
},200); 

var asd=document.getElementById("userName").value;
var qwe=document.getElementById("userPwd").value;
var projectInfo = {
		userName:asd,
		userPwd:qwe
};

$.ajax({
	type : "post",
	url :'management/index.do',
	async : true,
	timeout : 5000,
	 data :projectInfo,
	
	success : function(data) {
		if(data==1)location='index2.jsp'
                                  
		try {
			
			
		} catch (e) {
		}
	},
	error : function(data) {
		
		$('.mask').fadeOut();
	},
	complete : function(XMLHttpRequest, textStatus) {
		this;
	}
});
  }

function cambiar_sign_up(at) {
  document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
  document.querySelector('.cont_form_sign_up').style.display = "block";
document.querySelector('.cont_form_login').style.opacity = "0";
  
setTimeout(function(){  document.querySelector('.cont_form_sign_up').style.opacity = "1";
},100);  

setTimeout(function(){   document.querySelector('.cont_form_login').style.display = "none";
},400);  
var asd=document.getElementById("User").value;
var qwe=document.getElementById("Password").value;
var projectInfo = {
		userName:asd,
		userPwd:qwe
};

$.ajax({
	type : "post",
	url :'management/register.do',
	async : true,
	timeout : 5000,
	 data :projectInfo,
	
	success : function(data) {
		if(data==1)location='index2.jsp'
                                  
		try {
			
			
		} catch (e) {
		}
	},
	error : function(data) {
		
		$('.mask').fadeOut();
	},
	complete : function(XMLHttpRequest, textStatus) {
		this;
	}
});

}    



function ocultar_login_sign_up() {

document.querySelector('.cont_forms').className = "cont_forms";  
document.querySelector('.cont_form_sign_up').style.opacity = "0";               
document.querySelector('.cont_form_login').style.opacity = "0"; 

setTimeout(function(){
document.querySelector('.cont_form_sign_up').style.display = "none";
document.querySelector('.cont_form_login').style.display = "none";
},500);  
  
  }