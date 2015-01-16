// validater.js 数据验证
var validater = {
	isEmpty: function(argStr){
		return argStr == "" || /\s/.test(argStr);
	},
	isEmail: function(argStr){
		return /[a-z0-9]{1,30}@[a-z0-9]{1,30}.[a-z]{1,10}/i.test(argStr);
	},
	isPhone: function(argStr){
		return /[0-9]{11}/.test(argStr);
	},
	isNumber: function(argStr){
		return /[0-9]{1,}/.test(argStr);
	},
	isEqual: function(arg1,arg2){
		return arg1 === arg2;
	},
	testLogin: function($uid,$pid){
		var flag = false;

		if(validater.isEmpty($uid.val())){
			$uid.next().text("请输入用户名");
		}
		else if(validater.isEmpty($pid.val())){
			$pid.next().text("请输入密码");
		}
		else if(!(validater.isPhone($uid.val()) || validater.isEmail($uid.val()) ) ){
			$uid.next().text("格式错误,请输入注册邮箱/手机号");
		}
		else{
			flag = true;
			$pid.next().text(" ");
			$uid.next().text(" ");
		}

		return flag;

	},
	testRegister: function($uid,$pid,$pid2){
		var flag = false;

		if(validater.isEmpty($uid.val())){
			$uid.next().text("请输入用户名");
		}
		else if(validater.isEmpty($pid.val())){
			$pid.next().text("请输入密码");
		}
		else if($pid.val().length<6){
			$pid.next().text("密码太短了,换个牛逼一点的吧");
		}
		else if(!(validater.isPhone($uid.val()) || validater.isEmail($uid.val()) ) ){
			$uid.next().text("用户名必须是邮箱/手机号");
		}
		else if(!validater.isEqual($pid.val(),$pid2.val()) ){
			$pid2.next().text("两次输入密码不一致");
		}
		else{
			flag = true;
			$pid.next().text(" ");
			$uid.next().text(" ");
		}

		return flag;
	}

};
