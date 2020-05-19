package com.question;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
