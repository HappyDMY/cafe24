package net.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class Mycontroller extends HttpServlet {
	
	private Map commandMap = new HashMap();
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("propertyConfig");
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			f= new FileInputStream(props); // commend.properties 파일 가져오기
			pr.load(f); //pr 객체에  commend.properties 파일 저장하기
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if(f!=null) try {f.close();} catch (Exception e2) {System.out.println(e2);}//tryend
		}//try catch finally end
		
		Iterator keyIter=pr.keySet().iterator();  // 커서 생성
		while (keyIter.hasNext()) {
			String key = (String) keyIter.next();
			String value = pr.getProperty(key); // properties로 잘라진=뒤의 문자열  
			System.out.println("key="+key);
			System.out.println("value="+value);	
			
			try {
				Class commandCalss = Class.forName(value);
				Object commandInstance = commandCalss.newInstance();
				commandMap.put(key, commandInstance);
				
				System.out.println("key = " + key);
				System.out.println("commandInstance = " + commandInstance.toString());
				System.out.println();
			} catch (Exception e) {
				System.out.println(e);
			}
		}//while end
		
	}// init() end
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}// doGet end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}// doPost end
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = null; 
		CommandAction com=null;
		try {
			String command = req.getRequestURI();
			com = (CommandAction)commandMap.get(command);
			view = com.requestPro(req, resp);
			System.out.println("command="+command);
			System.out.println("view="+view);
		} catch (Throwable e) {
			throw new ServletException();
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);//~~.java
		dispatcher.forward(req, resp);
		
	}//process end
	
}//class end
