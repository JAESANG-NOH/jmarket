package com.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<QnaDTO> listQna(){
		QnaDTO dto=null;
		List<QnaDTO> list=new ArrayList<QnaDTO>();
		PreparedStatement pstmt=null;
		String sql;
		ResultSet rs=null;
		try {
			sql="SELECT num,category,subject,content,created,savefilename,originalfilename,"
					+ "an_created,status,an_content FROM qna ORDER BY num";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto=new QnaDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCategory(rs.getString("category"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				dto.setSavefilename(rs.getString("savefilename"));
				dto.setOriginalfilename(rs.getString("originalfilename"));
				dto.setAn_created(rs.getString("an_created"));
				dto.setStatus(rs.getInt("status"));
				dto.setAn_content(rs.getString("an_content"));
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
	
}





















