package com.sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class SaleDAO {
	private Connection conn = DBConn.getConnection();
	
	//±Û µî·Ï 
	
	public int insertSale(SaleDTO dto) {
		int result=0;
		String sql; 
		PreparedStatement pstmt = null;
		
		try {
			sql = "SELECT INTO sale(num, id, subject, content, fileName, sale_check) VALUE(sale_seq.NEXTVAL,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getFileName());
			pstmt.setInt(6, dto.getSale_check());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				} 
			}
		}
		
		return result;
		
	}
	
	
	public int dataCount() {
		int result = 0;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql;
		
		
		try {
			sql = "SELECT NVL(COUNT(num),0) cnt FROM sale";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
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
