package com.question;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.util.FileServlet;

@WebServlet("/qna/*")
@MultipartConfig
public class QnaServlet extends FileServlet{
	private static final long serialVersionUID = 1L;
	
	private String pathname;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String root=session.getServletContext().getRealPath("/");
		
		pathname=root+"photo"+File.separator+"qna";
		
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
		QnaDAO dao=new QnaDAO();
		List<QnaDTO> list=dao.listQna();
		
		req.setAttribute("list", list);
		
		List<String> year=new ArrayList<String>();
		for(QnaDTO dto:list) {
			String yy=dto.getCreated().substring(0, 4);
			for(String y:year) {
				if(!y.equals(yy)) {
					year.add(yy);
				}
			}
		}
		req.setAttribute("year", year);
		
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
		QnaDTO dto=new QnaDTO();
		QnaDAO dao=new QnaDAO();
		dto.setCategory(req.getParameter("category"));
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		
		Part p=req.getPart("upload");
		Map<String, String> map=fileUpload(p, pathname);
		if(map!=null) {
			String savefilename=map.get("fileName");
			String originalfilename=map.get("ogFilename");
			
			dto.setSavefilename(savefilename);
			dto.setOriginalfilename(originalfilename);
		}
		
		dao.insertQna(dto);
		
		resp.sendRedirect(cp+"/qna/qna_list.do");
		
	}


}
