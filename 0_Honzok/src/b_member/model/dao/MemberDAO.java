package b_member.model.dao;

import static a_common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import b_member.model.vo.Member;


public class MemberDAO {
private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/b_member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
	}
	
public Member loginMember(Member member, Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginUser");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member( rset.getString("USER_ID"),
										rset.getString("USER_PWD"),
									    rset.getString("USER_NAME"),
									    rset.getString("NICKNAME"),
									    rset.getInt("POSTAL_CODE"),
									    rset.getString("B_ADDRESS"),
									    rset.getString("L_ADDRESS"),
									    rset.getString("PHONE"),
									    rset.getString("EMAIL"),
									    rset.getString("NAVER_YN"),
									    rset.getDate("ENROLL_DATE"),
										rset.getString("STATUS"),
										rset.getInt("POINT"));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
		
		
		
	}
public int insertMember(Connection conn, Member member) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("insertMember");
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, member.getUserId());
		pstmt.setString(2, member.getUserPwd());
		pstmt.setString(3, member.getUserName());
		pstmt.setString(4, member.getNickName());
		pstmt.setInt(5, member.getPostalCode());
		pstmt.setString(6, member.getbAddr());
		pstmt.setString(7, member.getlAddr());
		pstmt.setString(8, member.getPhone());
		pstmt.setString(9, member.getEmail());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	return result;
}
public int idCheck(Connection conn, String userId) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	
	String query = prop.getProperty("idCheck");
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
	}catch (SQLException e) {
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	return result;
}

public int nickCheck(Connection conn, String userNick) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	
	String query = prop.getProperty("nickCheck");
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userNick);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rs);
		close(pstmt);
	}
	
	return result;
}

	


public int updateMember(Connection conn, Member member) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("updateMember");		
	
	try {
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1, member.getUserName());
		pstmt.setString(2, member.getNickName());
		pstmt.setInt(3, member.getPostalCode());
		pstmt.setString(4, member.getbAddr());
		pstmt.setString(5, member.getlAddr());
		pstmt.setString(6, member.getPhone());
		pstmt.setString(7, member.getEmail());
		pstmt.setInt(8, member.getPoint());
		pstmt.setString(9, member.getUserId());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	return result;
}

public Member selectMember(Connection conn, String loginUserId) {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Member member = null;
	
	String query = prop.getProperty("selectMember");
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, loginUserId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			member = new Member(rs.getString("user_id"),
					rs.getString("user_pwd"),
					rs.getString("user_Name"),
					rs.getString("nickName"),
					rs.getInt("postal_Code"),
					rs.getString("b_Address"),
					rs.getString("l_Address"),
					rs.getString("phone"),
					rs.getString("email"),
					rs.getString("naver_Yn"),
					rs.getDate("enroll_Date"),
					rs.getString("status"),
					rs.getInt("point"));
					
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(rs);
		close(pstmt);
	}
	return member;
}
  
public int updatePwd(Connection conn, HashMap<String, String> map) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("updatePwd");
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, map.get("new"));
		pstmt.setString(2, map.get("id"));
		pstmt.setString(3, map.get("old"));
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
}

	public int nickNameCheck(Connection conn, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("nickNameCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
}
