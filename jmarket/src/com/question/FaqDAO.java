package com.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class FaqDAO {
	private Connection conn=DBConn.getConnection();
	
	public int insertFaq(FaqDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="INSERT INTO faq(num,subject,content,category) VALUES(faq_seq.NEXTVAL,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getCategory());
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}
	
	public List<FaqDTO> listFaq(String category){
		List<FaqDTO> list=new ArrayList<FaqDTO>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		FaqDTO dto;
		
		try {
			sql="SELECT num, subject, content, category FROM faq WHERE category=? ORDER BY num";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new FaqDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return list;
	}
	
//	int result=0;
//	PreparedStatement pstmt=null;
//	String sql;
//	
//	try {
//		
//	} catch (Exception e) {
//		e.printStackTrace();
//	} finally {
//		if(pstmt!=null) {
//			try {
//				pstmt.close();
//			} catch (Exception e2) {
//			}
//		}
//	}
//	return result;	

}
