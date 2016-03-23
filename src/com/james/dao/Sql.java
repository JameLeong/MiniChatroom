package com.james.dao;

public enum Sql {
	//提取用户信息SQL语句
	//写出 user_name=:userName形式可以在后面直接提取userName这个变量的值，然后注入user_name=?（通过正则匹配得到）
	GET_USERINFO("select id,user_name,password from user where user_name=:userName and password=:password"),
	
	//查出该账户的信息
	GET_USER("select id,user_name,password from user where user_name=:userName"),
	
	//得到聊天记录
	GET_MSG("select username,content,time from chating_record  order by id desc limit 30"),
	
	//保存用户信息SQL语句
	SAVE_USER("insert into user(user_name,password) values(:userName,:password)"),
	
	//保存用户聊天记录
	SAVE_MSG("insert into chating_record(username,content,time) values(:userName,:content,:time)");
	
	private final String value;
	private Sql(String value){
		this.value=value;
	}
	
	public String getValue(){
		return this.value;
	}
	
	@Override
	public String toString() {
		return this.value;
	}
}
