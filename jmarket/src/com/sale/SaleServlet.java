package com.sale;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.notice.NoticeDTO;
import com.user.SessionInfo;
import com.util.FileServlet;
import com.util.MyUtil;

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
		SaleDAO dao = new SaleDAO();
		MyUtil util = new MyUtil();
		String cp = req.getContextPath();
		
		String page = req.getParameter("page");
		int current_page = 1; 
		if(page!=null) {
			current_page=Integer.parseInt(page);
		}
		
		String condition =req.getParameter("condition");
		String keyword = req.getParameter("keyword");
		if(condition==null) {
			condition = "subject";
			keyword="";
		}
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword,"utf-8");
		}
		
		int rows = 10; 
		String numPerPage = req.getParameter("rows");
		if(numPerPage!=null) {
			rows = Integer.parseInt(numPerPage);
		}
		
		int dataCount;
		if(keyword.length()!=0) {
			dataCount=dao.dataCount(condition,keyword);
		}else {
			dataCount=dao.dataCount();
		}
		
		int total_page = util.pageCount(rows, dataCount);
		
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset = (current_page-1)*rows;
		
		List<SaleDTO> list;
		if(keyword.length()!=0) {
			list=dao.listSale(offset, rows, condition, keyword);
		}else {
			list=dao.listSale(offset, rows);
		}

		//페이징 처리 
		
		String listUrl = cp+"/sale/list.do";
		String articleUrl = cp+"/sale/read.do?page="+current_page;
        String query = "";
        if(keyword.length()!=0) {
           query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
        }
        
		if(query.length()!=0) {
	            listUrl+="&"+query;
	            articleUrl = articleUrl+"&"+query;
	         }
	         
	    String paging = util.paging(current_page, total_page,listUrl);
	    
        req.setAttribute("list", list); 
        req.setAttribute("paging", paging);
        req.setAttribute("total_page", total_page); 
        req.setAttribute("page", current_page); 
        req.setAttribute("dataCount", dataCount); 
        req.setAttribute("articleUrl", articleUrl); 
        req.setAttribute("condition", condition); 
        req.setAttribute("keyword", keyword);
        req.setAttribute("rows", rows);
        
        forward(req, resp, "/WEB-INF/page/sale/list.jsp");
	
	
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
		
	protected void read(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SaleDAO dao = new SaleDAO();
		String cp = req.getContextPath();
		
		int num = Integer.parseInt(req.getParameter("num"));
		String page = req.getParameter("page");
		String rows=req.getParameter("rows");
		
		String condition=req.getParameter("condition");
		String keyword=req.getParameter("keyword");
		if(condition==null) {
			condition="subject";
			keyword="";
		}
		keyword=URLDecoder.decode(keyword, "utf-8");

		String query="page="+page+"&rows="+rows;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		// 조회수
		dao.updateHitCount(num);
		
		// 게시물 가져오기
		SaleDTO dto=dao.readSale(num);
		if(dto==null) {
			resp.sendRedirect(cp+"/sale/list.do?"+query);
			return;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이전글/다음글
		SaleDTO preReadDto = dao.preReadSale(dto.getNum(), condition, keyword);
		SaleDTO nextReadDto = dao.nextReadSale(dto.getNum(), condition, keyword);
		
		req.setAttribute("dto", dto);
		req.setAttribute("preReadDto", preReadDto);
		req.setAttribute("nextReadDto", nextReadDto);
		req.setAttribute("query", query);
		req.setAttribute("page", page);
		req.setAttribute("rows", rows);
		
		forward(req, resp, "/WEB-INF/page/sale/read.jsp");
	}
		
	protected void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	protected void deleteFile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	

	
	
	
	
}



