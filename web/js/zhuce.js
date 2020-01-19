// JavaScript Document
 function checkForm(){
 var zhanghaotip = checkUserZhanghao();
 var nicknametip = checkUserNickname();	 
 var passtip = checkPassword();
 var conpasstip = ConfirmPassword();
 return zhanghaotiptip && nicknametip && passtip && conpasstip;
 }


function checkUserZhanghao(obj){
	var userzhanghao=obj.value;
 var errzhanghao = document.getElementById('zhanghaoErr');
 var zhanghaonumber = /^[1-9][0-9]{4,8}$/;
	/*5到8位数字*/
 if(!(zhanghaonumber.test(userzhanghao))){
 obj.style.border="1px solid red";
	errzhanghao.style.color="red";
  errzhanghao.innerHTML="账号不合规范，请重新输入！"
  return false;
  }else{
	  obj.style.border="1px solid #ccc";
	  errzhanghao.style.color="#000000";
   errzhanghao.innerHTML="OK"
   return true;
   }
 }

function checkUserNickname(obj){
	var usernickname=obj.value;
 var errnickname = document.getElementById('nicknameErr');
 var nicknamenumber = /^[a-zA-Z0-9_-]{4,8}$/;
	/*4到8位（字母，数字，下划线，减号）*/
 if(!(nicknamenumber.test(usernickname))){
 obj.style.border="1px solid red";
	errnickname.style.color="red";
  errnickname.innerHTML="昵称不合规范，请重新输入！"
  return false;
  }else{
	  obj.style.border="1px solid #ccc";
	  errnickname.style.color="#000000";
   errnickname.innerHTML="OK"
   return true;
   }
 }




function checkPassword(obj){
	var userpasswd=obj.value;
 var errPasswd = document.getElementById('passwordErr');
 var pattern = /^[a-zA-Z]([a-zA-z0-9]){6,15}$/;
 if(!(pattern.test(userpasswd))){
	obj.style.border="1px solid red";
    errPasswd.style.color="red";
  	errPasswd.innerHTML="密码不合规范"
  	return false;
  }else{
	  obj.style.border="1px solid #ccc";
	  errPasswd.style.color="#000000";
	  errPasswd.innerHTML="OK"
	  return true;
   }
}
function ConfirmPassword(obj){
	var userConPassword=obj.value;
	var userpasswd = document.getElementById('userPasword');
 	var userConPassword = document.getElementById('userConfirmPasword');
 	var errConPasswd = document.getElementById('conPasswordErr');
 if((userpasswd.value)!=(userConPassword.value)||userConPassword.value.length == 0){
	 obj.style.border="1px solid red";
	 errConPasswd.style.color="red";
  	 errConPasswd.innerHTML="上下密码不一致"
  	 return false;
  }else{
	  obj.style.border="1px solid #ccc";
	  errConPasswd.style.color="#000000";
   errConPasswd.innerHTML="输入密码一致"
   return true;
   }
 }