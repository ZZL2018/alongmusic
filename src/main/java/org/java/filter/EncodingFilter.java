package org.java.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//设置客户端向服务器端发送请求时的编码格式
		request.setCharacterEncoding("UTF-8");
		//设置服务器准备响应客户端请求的html页面的编码格式
		response.setContentType("text/html;charset=UTF-8");
		//可能有多个过滤器，因此在将页面响应用户前依次执行
		chain.doFilter(request, response);
		//设置服务器响应给客户端时的编码格式
		response.setCharacterEncoding("UTF-8");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
