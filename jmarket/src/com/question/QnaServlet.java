package com.question;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MainServlet;

@WebServlet("/qna/*")
public class QnaServlet extends MainServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri=req.getRequestURI();
		if(uri.indexOf("qna_list.do")!=-1) {
			qna_list(req, resp);
		}else if(uri.indexOf("qna_created.do")!=-1) {
			qna_createdForm(req, resp);
		}else if(uri.indexOf("qna_created_ok.do")!=-1){
			qna_createdSubmit(req, resp);
		}
		
	}
	protected void qna_list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		forward(req, resp, "/WEB-INF/page/question/qna_list.jsp");
		
	}
	
	protected void qna_createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FaqDAO dao=new FaqDAO();
		String category=req.getParameter("category");
		
		if(category==null) {
			category="goods";
		}
		List<FaqDTO> list=dao.listFaq();
		req.setAttribute("list", list);
		req.setAttribute("listsize", list.size());
		
		
		forward(req, resp, "/WEB-INF/page/question/qna_created.jsp");
		
	}
	
	protected void qna_createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cp=req.getContextPath();
		resp.sendRedirect(cp+"/qna/qna_list.do");
		
	}


}
