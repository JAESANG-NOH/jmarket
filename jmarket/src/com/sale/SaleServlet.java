package com.sale;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.user.SessionInfo;
import com.util.FileServlet;

@MultipartConfig
@WebServlet("/sale/*")
public class SaleServlet extends FileServlet{

	private static final long serialVersionUID = 1L;
	private String pathname;

	
	

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		
		if(uri.indexOf("list.do")==-1 && info == null) {
			resp.sendRedirect(cp+"/user/login.do");
			return;
		}
		
		String root = session.getServletContext().getRealPath("/");
		pathname = root+"uploads"+File.separator+"sale";
		
		if(uri.indexOf("list.do")!=-1) {
			list(req, resp);
		}else if(uri.indexOf("write.do")!=-1) {
			writeForm(req, resp);
		}else if(uri.indexOf("write_ok.do")!=-1) {
			writeSubmit(req, resp);
		}else if(uri.indexOf("update.do")!=-1) {
			updateForm(req, resp);
		}else if(uri.indexOf("update_ok.do")!=-1) {
			updateSubmit(req, resp);
		}else if(uri.indexOf("read.do")!=-1) {
			read(req, resp);
		}else if(uri.indexOf("delete.do")!=-1) {
			delete(req, resp);
		}else if(uri.indexOf("deleteFile.do")!=-1) {
			deleteFile(req, resp);
		}
		
		
	}


	protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void writeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		SaleDTO dto = new SaleDTO();
		if(! info.getId().contains(dto.getId())) {
			resp.sendRedirect(req.getContextPath()+"/sale/list.do");
			return;
		}
		
		String rows = req.getParameter("rows");
		
		req.setAttribute("mode", "write");
		req.setAttribute("rows", rows);
		forward(req, resp, "/WEB-INF/page/sale/write.jsp");
	}
	
	
	protected void writeSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SaleDAO dao = new SaleDAO();
		String cp = req.getContextPath();
		SaleDTO dto = new SaleDTO();
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("user");
		String rows = req.getParameter("rows");
		
		if(! info.getId().contains(dto.getId())) {
			resp.sendRedirect(req.getContextPath()+"/sale/list.do");
			return;
		}
		
		dto.setId(info.getId());
		dto.setSubject(req.getParameter("subject"));
		dto.setContent(req.getParameter("content"));
		
		String fileName = null;
		Part p = req.getPart("uploads");
		Map<String, String> map = fileUpload(p, pathname);
		if(map !=null) {
			fileName = map.get("fileName");
		}
		
		
		if(fileName!=null) {
			dto.setFileName(fileName);
		}		
			
		dao.insertSale(dto);
		resp.sendRedirect(cp+"/sale/list.do?rows="+rows);
		
		}
		
	
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void read(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void deleteFile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	

	
	
	
	
}



