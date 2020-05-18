package com.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MainServlet;

@WebServlet("/user/*")
public class UserServlet extends MainServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		if(uri.indexOf("login.do")!=-1) {
			loginForm(req, resp);
		} else if(uri.indexOf("login_ok.do")!=-1) {
			loginSubmit(req, resp);
		}
	}
	
	protected void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	protected void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		UserDAO dao = new UserDAO();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		UserDTO dto = dao.readUser(id);
		
		if(dto == null || ! dto.getPwd().equals(pwd) || dto.getEnabled() !=1 ) {
			String s = "���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.";
			req.setAttribute("message", s);
			forward(req, resp, "/WEB-INF/page/home/home.jsp");
			return;
		}
		
		HttpSession session=req.getSession();
		session.setMaxInactiveInterval(30*60);
		
		SessionInfo info = new SessionInfo();
		info.setId(dto.getId());
		info.setName(dto.getName());

		session.setAttribute("member", info);
		resp.sendRedirect(cp+"/home/home.do");
	}
}
