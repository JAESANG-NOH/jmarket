package com.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class BuyDAO {
	private Connection conn = DBConn.getConnection();
	
	public int insertBuy(BuyDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "INSERT INTO buy(num,id,subject,content,imagename,buying,productname,price) VALUES(buy_seq.NEXTVAL,?,?,?,?,0,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImageName());
			pstmt.setString(5, dto.getProductName());
			pstmt.setString(6, dto.getPrice());
			
			result = pstmt.executeUpdate();
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
	
	public int dataCount() {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(COUNT(*), 0) FROM buy";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);

		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
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
		
		return result;
	}
	
	public int dataCount(String condition, String keyword) {
        int result=0;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql;

        try {
        	if(condition.equals("created")) {
        		keyword = keyword.replaceAll("(\\-|\\/|\\.)", "");
        		sql="SELECT NVL(COUNT(*), 0) FROM buy b JOIN member1 m ON b.Id=m.Id WHERE TO_CHAR(created, 'YYYYMMDD') = ?  ";
        	} else if(condition.equals("userName")) {
        		sql="SELECT NVL(COUNT(*), 0) FROM buy b JOIN member1 m ON b.Id=m.Id WHERE INSTR(Name, ?) = 1 ";
        	} else {
        		sql="SELECT NVL(COUNT(*), 0) FROM buy b JOIN member1 m ON b.Id=m.Id WHERE INSTR(" + condition + ", ?) >= 1 ";
        	}
        	
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, keyword);

            rs=pstmt.executeQuery();

            if(rs.next())
                result=rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
        return result;
    }
	
	public List<BuyDTO> listbuy(int offset, int rows) {
		List<BuyDTO> list=new ArrayList<BuyDTO>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql =" SELECT name, num, b.id, subject, imagename, TO_CHAR(b.created,'YYYY-MM-DD') created, buying "
			    +" FROM buy b "
			    +" JOIN member1 m ON b.Id=m.Id "
			    +" ORDER BY num DESC "
			    +" OFFSET ? ROWS FETCH FIRST ? ROWS ONLY ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, rows);

			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				BuyDTO dto=new BuyDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setImageName(rs.getString("imagename"));
				dto.setCreated(rs.getString("created"));
				dto.setBuying(rs.getInt("buying"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return list;
	}
}
