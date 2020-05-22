package com.question;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.Session;

import com.user.SessionInfo;
import com.user.UserDAO;
import com.user.UserDTO;
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
		}else if(uri.indexOf("answer_list.do")!=-1){
			answer_list(req, resp);
		}else if(uri.indexOf("answer_created.do")!=-1) {
			answer_createdForm(req, resp);
		}else if(uri.indexOf("answer_created_ok.do")!=-1) {
			answer_createdSubmit(req, resp);
		}
		
		
	}
	protected void qna_list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			forward(req, resp, "/WEB-INF/page/user/login.jsp");
			return;
		}
		
		QnaDAO dao=new QnaDAO();
		List<QnaDTO> list=dao.listQna();
		
		req.setAttribute("list", list);
		
		//��¥���
		//1.�ּҳ�¥�� ���ó�¥ ���ؼ� ���ѵα�->alertâ ����(6���������� ����)
		//2.�ּҳ�¥���� ���ó�¥������ �� �� �� ���� jsp�� �������� �ɼ����� ������ֱ�
		Calendar cal=Calendar.getInstance();  //���糯¥, �ð�
		cal.set(Calendar.MONTH,cal.get(Calendar.MONTH)+1);
		Calendar min=(Calendar)cal.clone();
		min.set(Calendar.MONTH,cal.get(Calendar.MONTH)-6);
		
		req.setAttribute("minyear", min.get(Calendar.YEAR));
		req.setAttribute("maxyear", cal.get(Calendar.YEAR));
		req.setAttribute("minmonth", min.get(Calendar.MONTH));
		req.setAttribute("maxmonth", cal.get(Calendar.MONTH));
		req.setAttribute("minday", min.get(Calendar.DATE));
		req.setAttribute("calday", cal.get(Calendar.DATE));
		
		
		forward(req, resp, "/WEB-INF/page/question/qna_list.jsp");
		
	}
	
	protected void qna_createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			forward(req, resp, "/WEB-INF/page/user/login.jsp");
			return;
		}
		
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
		
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setId(info.getId());
		
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
	
	protected void answer_list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QnaDAO dao=new QnaDAO();
		List<QnaDTO> list=dao.listQna();
		
		req.setAttribute("list", list);
		
		forward(req, resp, "/WEB-INF/page/question/answer_list.jsp");
		
	}
	
	protected void answer_createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FaqDAO dao=new FaqDAO();
		String category=req.getParameter("category");
		
		if(category==null) {
			category="goods";
		}
		
		List<FaqDTO> list=dao.listFaq();
		
		
		req.setAttribute("list", list);
		req.setAttribute("listsize", list.size());
		
		
		
		forward(req, resp, "/WEB-INF/page/question/answer_created.jsp");
		
	}
	
	protected void answer_createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		QnaDAO dao=new QnaDAO();
		QnaDTO dto=new QnaDTO();
		dto.setAn_content(req.getParameter("an_content"));
		dao.answerOk(dto);
		dto.setStatus(1);
		resp.sendRedirect(cp+"/qna/answer_list.do");
		
		
	}


}
