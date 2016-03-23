package com.james.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.james.dao.DBUtil;
import com.james.dao.Sql;

public class TalkBean{
	
	/**
	 * 检查是否有这个账号
	 * @return
	 */
	public boolean isHasUser(String userName){
		try {
			List<Map<String,Object>> userInfo=DBUtil.select(Sql.GET_USER,new HashMap<String,Object>(){{
				put("userName",userName);
			}});
			if(userInfo==null){
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * 提取用户信息
	 * @param userName
	 * @param password
	 * @return
	 */
	public Map<String,Object> getUserInfo(final String userName,final String password) {

		try {
			//[{password=123, user_name=james, id=1}]
			List<Map<String,Object>> userInfo=DBUtil.select(Sql.GET_USERINFO,new HashMap<String,Object>(){{
				put("userName",userName);
				put("password",password);
			}});
			
			if(userInfo!=null&&userInfo.size()==1){
				return userInfo.get(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	/**
	 * 保存用户信息
	 * @param userName
	 * @param password
	 * @return
	 */
	public boolean saveUser(final String userName,final String password){
		try {
			int count=DBUtil.insert(Sql.SAVE_USER,new HashMap<String,Object>(){{
				put("userName",userName);
				put("password",password);
			}});
			if(count==1){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 保存信息
	 * @param username
	 * @param msg
	 * @param time 
	 */
	public void saveMsg(String username, String msg, String time) {
		try {
			DBUtil.insert(Sql.SAVE_MSG,new HashMap<String,Object>(){{
				put("userName",username);
				put("content",msg);
				put("time",time);
			}});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 得到历史消息记录
	 * @return
	 */
	public List<Map<String,Object>>  getMsg() {
		try {
			List<Map<String,Object>> msgs=DBUtil.select(Sql.GET_MSG,new HashMap<String,Object>());
			return msgs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
}
