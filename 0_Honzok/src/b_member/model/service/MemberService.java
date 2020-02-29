package b_member.model.service;

import static a_common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.HashMap;

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
		
		System.out.println("result : " + result);
		
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
	
	public int nickCheck(String userNick) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.nickCheck(conn, userNick);
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


	public Member selectMember(String loginUserId) {
		Connection conn = getConnection();
		MemberDAO mDAO = new MemberDAO();
		Member member = mDAO.selectMember(conn, loginUserId);
		
		close(conn);
		return member;
	}
	public int updatePwd(HashMap<String, String> map) {
		Connection conn = getConnection();
		
		MemberDAO mDAO = new MemberDAO();
		int result = mDAO.updatePwd(conn, map);
		if(result > 0) {
			commit(conn);
		} else {
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

