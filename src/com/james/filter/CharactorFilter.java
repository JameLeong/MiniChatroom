package com.james.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 设置过滤器设定字符集
 * 
 * @author James
 *
 */
public class CharactorFilter implements Filter {
	// 字符编码
	String encoding = null;

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (encoding != null) {
			try {
				// 设置request字符编码
				request.setCharacterEncoding(encoding);
				// 设置response字符编码
				response.setContentType("text/html;charset=" + encoding);
			} catch (UnsupportedEncodingException e2) {
				try {
					throw new UnsupportedEncodingException("不支持的字符集("+ encoding + ")");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		// 传递给下一个过滤器
		chain.doFilter(request, response);
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// 获取初始化参数
		encoding = filterConfig.getInitParameter("encoding");
	}

	public void destroy() {
		encoding = null;
	}
}