package com.james.listener;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import nl.justobjects.pushlet.core.Dispatcher;
import nl.justobjects.pushlet.core.Event;

/**
 * 通过HttpSessionListener接口或HttpSessionBindingListener接口来实现对session的监控，
 * 通过监听session的新建和销毁来控制
 * 
 * 当用户首次访问网站页面的时候，框架就会生成一个sessionID这时执行 OnlineListener.sessionCreated()方法， 执行操作，
 * 不是对单个session与用户的是对整个全局的session的操作
 * 
 * @author James
 *
 */
public class OnlineListener implements HttpSessionListener {

	/**
	 * 新建session连接
	 */
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		// 获得上下文
		ServletContext application = session.getServletContext();
		// 得到session ID
		String sessionId = session.getId();
		// 如果是新的session
		if (session.isNew()) {
			// 获取登录用户记录表
			Map<String, String> online = (Map<String, String>) application
					.getAttribute("online");
			// 如果还没有则新建
			if (online == null) {
				online = new HashMap<String, String>();
			}
			// 将用户信息存入记录表
			online.put(sessionId, "游客");
			// 存入app
			application.setAttribute("online", online);
		}

	}

	/**
	 * 销毁
	 */
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		String sessionId = session.getId();
		ServletContext application = session.getServletContext();
		Map<String, String> online = (Map<String, String>) application
				.getAttribute("online");
		if (online != null) {
			String user = online.get(sessionId);
			if (user != null) {
				System.out.println("用户" + user + "已经退出！");
				online.remove(sessionId);
				String userCount = online.size() + "";
				Event dataEvent = Event.createDataEvent("/message/world");
				try {
					dataEvent.setField("outingUser", new String(user.getBytes("utf-8"),"iso-8859-1"));
					dataEvent.setField("userCount", new String(userCount.getBytes("utf-8"),"iso-8859-1"));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				Dispatcher.getInstance().multicast(dataEvent);
			}

		}

	}
}