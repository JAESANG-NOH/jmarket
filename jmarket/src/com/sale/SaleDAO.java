package com.sale;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class SaleDAO {
	private Connection conn = DBConn.getConnection();
	
	//글 등록 
	
	public int insertSale(SaleDTO dto) {
		int result=0;
		String sql; 
		PreparedStatement pstmt = null;
		
		try {
			sql = "INSERT INTO sale(num, id, subject, content, fileName, sold) VALUES(sale_seq.NEXTVAL,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getFileName());
			pstmt.setInt(6, dto.getSold());
			
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
	
	
	
	//전체 데이터 개수
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
	
	
	//검색모드에서 전체 개수 구하기 
	public int dataCount(String condition,String keyword) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			sql = "SELECT NVL(COUNT(*),0) FROM sale s JOIN member1 m ON s.id = m.id";
			if(condition.equalsIgnoreCase("created")) {
				keyword=keyword.replaceAll("-", "");
				sql+="WHERE TO_CHAR(s.created, 'YYYYMMDD')=?";
			}else if(condition.equalsIgnoreCase("name")) {
				sql="WHERE INSTR(name,?)=1";
			}else {
				sql+="WHERE INSTR("+condition+",?)>=1";
			}
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result =rs.getInt(1);
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
	
	
	
	public List<SaleDTO> listSale(int offset, int rows){
		List<SaleDTO> list = new ArrayList<SaleDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SaleDTO dto = null;
		String sql;
		
		try {
			sql = " SELECT num, m.name, subject, hitCount, fileName,s.created "
				+ " FROM sale s "
				+ " JOIN member1 m ON s.id = m.id "
				+ " ORDER BY num DESC "
				+ " OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, rows);
			rs=pstmt.executeQuery();

			while(rs.next()) {
				dto = new SaleDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setFileName(rs.getString("fileName"));
				dto.setCreated(rs.getString("created"));
				list.add(dto);
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
		
		return list;
	}
	
	
	
	
	//검색에서 리스트 
	public List<SaleDTO> listSale(int offset, int rows, String condition, String keyword) {
		List<SaleDTO> list = new ArrayList<SaleDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT num,name,subject,hitCount,fileName, ");
			sb.append(" s.created ");
			sb.append(" FROM sale s ");
			sb.append(" JOIN member1 m ON s.id = m.id ");
			if(condition.equalsIgnoreCase("created")) {
				keyword=keyword.replaceAll("-", "");
				sb.append(" WHERE TO_CHAR(s.created, 'YYYY-MM-DD') =? ");
			}else if(condition.equalsIgnoreCase("name")) {
				sb.append(" WHERE INSTR(name,?)=1");
			}else {
				sb.append(" WHERE INSTR("+condition+", ?)>=1");
			}
			sb.append(" ORDER BY num DESC ");
			sb.append(" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, keyword);
			pstmt.setInt(2, offset);
			pstmt.setInt(3, rows);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SaleDTO dto = new SaleDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
				dto.setFileName(rs.getString("fileName"));
				list.add(dto);
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
		return list;
		
	}
	
	
	
	
	public List<SaleDTO> listSale(){
		List<SaleDTO> list = new ArrayList<SaleDTO>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		StringBuilder sb = new StringBuilder();
		
		try {
			sb.append("SELECT num,name,subject,hitCount,fileName");
			sb.append(" TO_CHAR(s.created, 'YYYY-MM-DD') created");
			sb.append(" FROM sale s ");
			sb.append(" JOIN member1 m ON s.id = m.id");
			sb.append(" WHERE sale =1 ");
			sb.append(" ORDER BY num DESC ");
			
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SaleDTO dto = new SaleDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setFileName(rs.getString("fileName"));
				dto.setCreated(rs.getString("created"));
				list.add(dto);
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
		return list;
	}
	
	
	
	
	
	
	
	
	//글보기 
	public SaleDTO readSale(int num) {
		SaleDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ;
		
		sql = "SELECT num, s.id, m.name, subject, content, fileName, hitCount, s.created ";
		sql += "FROM sale s JOIN member1 ON s.id = m.id WHERE num=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new SaleDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("fileName"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return dto;
	}

	
	//이전글 
	
	public SaleDTO preReadSale(int num, String condition, String keyword) {
		SaleDTO dto = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		PreparedStatement pstmt = null;
		
		try {
			if(keyword.length()!=0) {
				sb.append("SELECT num,subject FROM sale s JOIN member1 m ON s.id = m.id ");
				if(condition.equalsIgnoreCase("created")) {
					keyword=keyword.replaceAll("-", "");
                	sb.append(" WHERE (TO_CHAR(created, 'YYYYMMDD') = ?)  ");
				}else {
                	sb.append(" WHERE (INSTR(" + condition + ", ?) >= 1)  ");
                }
	                sb.append("         AND (num > ? )  ");
	                sb.append(" ORDER BY num ASC  ");
	                sb.append(" FETCH  FIRST  1  ROWS  ONLY");
	
	                pstmt=conn.prepareStatement(sb.toString());
	                pstmt.setString(1, keyword);
	                pstmt.setInt(2, num);
			}else {
				sb.append("SELECT num, subject FROM sale s JOIN member1 m ON s.id=m.id ");
				   sb.append(" WHERE num > ?  ");
	                sb.append(" ORDER BY num ASC  ");
	                sb.append(" FETCH  FIRST  1  ROWS  ONLY");

	                pstmt=conn.prepareStatement(sb.toString());
	                pstmt.setInt(1, num);
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto= new SaleDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
    
        return dto;		
	}
	
	
	//다음글 
	
	public SaleDTO nextReadSale(int num, String condition, String keyword) {
		SaleDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			if(keyword.length()!=0) {
				sb.append("SELECT num,subject FROM sale s JOIN member1 m ON s.id = m.id ");
				sb.append(" WHERE num < ? ");
				 sb.append(" ORDER BY num DESC  ");
	                sb.append(" FETCH  FIRST  1  ROWS  ONLY");
	                pstmt=conn.prepareStatement(sb.toString());
	                pstmt.setInt(1, num);
				}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new SaleDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
			}
				
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
    
        return dto;
		}
	

	
	public int updateHitCount(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = " UPDATE sale SET hitCount= hitCount+1 WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		
		return result;
		}

	//글 수정

	

	
	
}
	
	
	
	
	
	
	
	
	
	
