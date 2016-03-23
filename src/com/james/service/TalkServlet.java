package com.james.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;

/**
 * 处理消息发送
 * 
 * @author James
 *
 */
public class TalkServlet extends WebServlet {

	public TalkBean talkBean;

	@Override
	public void initPage() {
		Object userInfo = request.getSession().getAttribute("userInfo");
		if (userInfo != null) {
			talkPage();
		} else {
			loginPage();
		}
	}

	// 进入登陆页面
	public void loginPage() {
		show("login.jsp");
	}

	// 进入注册页面
	public void regPage() {
		show("reg.jsp");
	}

	// 登录
	public void login() throws IOException {
		String userName = this.get("userName", "");
		String password = this.get("password", "");
		if (!"".equals(userName) && !"".equals(password)) {
			// 提取当前用户信息
			Map<String, Object> userInfo = talkBean.getUserInfo(userName,password);
			if (userInfo != null) {
				// 将数据存进application
				ServletContext application = request.getSession().getServletContext();
				@SuppressWarnings("unchecked")
				Map<String, String> online = (Map<String, String>) application.getAttribute("online");
				String id = request.getSession().getId();
				online.put(id, userName);
				application.setAttribute("online", online);
				// 将用户信息存入session
				request.getSession().setAttribute("userInfo", userInfo);
				// =============== 提示有人登陆进来==================
				//控制台提醒
				System.out.println("用户"+userName + "已经登录！");
				//消息框提示
				msgNotify("== 提示：我刚刚进入聊天室 ==");
				//在线用户更新
				Event event = Event.createDataEvent("/message/world");
				String count = online.size()+"";
				event.setField("comingUser", new String(userName.getBytes("utf-8"),"iso-8859-1"));
				event.setField("userCount", new String(count.getBytes("utf-8"),"iso-8859-1"));
				Dispatcher.getInstance().multicast(event);
				// 转向页面
				response.sendRedirect("./talkService.srv?action=talkPage");
				return;
			}
		}
		show("login.jsp");
	}

	/**
	 *  注册
	 * @throws IOException
	 */
	public void reg() throws IOException {
		String userName = this.get("userName", "");
		String password = this.get("password", "");
		String passConfirm = this.get("passConfirm", "");
		if (!"".equals(userName) && !"".equals(password)
				&& password.equals(passConfirm)) {
			if (talkBean.saveUser(userName, password)) {
				response.sendRedirect("./talkService.srv?action=loginPage");
				return;
			}
		}
		show("reg.jsp");
	}

	/**
	 * 返回是不是已经存在这个用户
	 * 不存在返回false
	 */
	public void isUser(){
		String userName = this.get("username", "");
		boolean isHasUser =  this.talkBean.isHasUser(userName);
		try {
			PrintWriter out = response.getWriter();
			//存在这个用户
			if(isHasUser){
				out.println("yes");
			}else{
				out.println("no");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 进入聊天页面
	 */
	public void talkPage() {
		//存放当前用户的信息
		Object userInfo = request.getSession().getAttribute("userInfo");
		if (userInfo != null) {
			Map<String, Object> info = (Map<String, Object>) userInfo;
			//设置request 给页面传递值
			this.put("userName", info.get("user_name"));
			show("talk.jsp");
			return;
		}
		show("login.jsp");
	}

	/**
	 * 信息通知
	 */
	public void msgNotify(String msg) throws UnsupportedEncodingException {
		// 如果有内容
		if (!"".equals(msg)) {
			String username = "";
			Event event = Event.createDataEvent("/message/world");
			// 获取用户信息
			Map<String, Object> info = (Map<String, Object>)request.getSession().getAttribute("userInfo");
			if (info != null) {
				// 得到现在的账户名
				username = info.get("user_name").toString();
				//通过使用指定的 charset解码指定的 byte数组，构造一个新的 String。 
				event.setField("userName", new String(username.getBytes("utf-8"),"iso-8859-1"));
				//event.setField("userName", username);
				// 得到要推送的消息
				event.setField("message",new String(msg.getBytes("utf-8"),"iso-8859-1"));
				// 推送
				Dispatcher.getInstance().multicast(event);
				String time = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format( new Date());
				//保存聊天记录
				talkBean.saveMsg(username, msg,time);
			}
		}
	}

	/**
	 * 后台的发送消息服务
	 * 
	 * @throws UnsupportedEncodingException
	 */
	public void sendMsg() throws UnsupportedEncodingException {
		// 默认值为""
		String msg = this.get("message", "");
		Map<String, Object> userInfo = (Map<String, Object>) request.getSession().getAttribute("userInfo");
		String username = userInfo.get("user_name").toString();
		if(username !=null){
			msgNotify(msg);
		}
	}
}
