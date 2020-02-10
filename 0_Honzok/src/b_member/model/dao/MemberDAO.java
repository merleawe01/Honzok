package b_member.model.dao;

import static a_common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			System.out.println(pstmt);
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
		System.out.println(loginUser);
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
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getEmail());

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
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateMember");		

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
}
