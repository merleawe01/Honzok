package b_member.model.service;

import static a_common.JDBCTemplate.*;


import java.sql.Connection;

import b_member.model.dao.MemberDAO;
import b_member.model.vo.Member;

public class MemberService {

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		Member loginUser = mDAO.loginMember(member, conn);
		close(conn);
		
		return loginUser;
		
	}
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.idCheck(conn, userId);
		close(conn);
		
		return result;
	}


	public int updateMember(Member member) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.updateMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int nickNameCheck(String nickName) {
		Connection conn = getConnection();
		int result = new MemberDAO().nickNameCheck(conn, nickName);
		
		close(conn);
		
		return result;
	}

	
}

