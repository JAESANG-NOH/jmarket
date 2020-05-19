package com.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MainServlet;

@WebServlet("/question/*")
public class QuestionServlet extends MainServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri=req.getRequestURI();
		if(uri.indexOf("faq_list.do")!=-1) {
			faq_list(req, resp);
		}else if(uri.indexOf("faq_created.do")!=-1) {
			faq_createdForm(req, resp);
		}else if(uri.indexOf("faq_created_ok.do")!=-1) {
			faq_createdSubmit(req, resp);
		}
		
	}
	
	protected void faq_list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/page/question/faq_list.jsp");
		
	}
	
	protected void faq_createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/page/question/faq_created.jsp");
		
	}
	
	protected void faq_createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		
		FaqDTO dto=new FaqDTO();
	//	dto.setCategory(req.getParameter("category"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		
	//	System.out.println(req.getParameter("category"));
		System.out.println(req.getParameter("subject"));
		System.out.println(req.getParameter("content"));
		
		FaqDAO dao=new FaqDAO();
	//	dao.insertFaq(dto);
		
		
		resp.sendRedirect(cp+"/question/faq_list.do");
		
	}
	
	
}
