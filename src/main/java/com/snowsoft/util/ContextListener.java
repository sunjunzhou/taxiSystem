package com.snowsoft.util;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener{

	//监听ServletContext创建
	public void contextInitialized(ServletContextEvent sce) {
		 ServletContext context = sce.getServletContext();
		 context.setAttribute("path",context.getContextPath());
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	
	}
}
