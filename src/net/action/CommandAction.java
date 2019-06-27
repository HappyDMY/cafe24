package net.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
	//추상 메소드
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) 
			throws Throwable;
}// interface and
