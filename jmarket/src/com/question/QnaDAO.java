package com.question;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.util.DBConn;

public class QnaDAO {
	private Connection conn=DBConn.getConnection();
	
	public int insertQna(QnaDTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql="INSERT INTO qna(num,category,subject,content,savefilename,originalfilename,an_created,an_content) "
					+ "VALUES(qna_seq.NEXTVAL,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSavefilename());
			pstmt.setString(5, dto.getOriginalfilename());
			pstmt.setString(6, dto.getAn_created());
			pstmt.setString(7, dto.getAn_content());
			
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
}
