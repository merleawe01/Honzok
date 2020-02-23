package c_information.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;

import java.sql.Connection;

import c_information.model.dao.InformationDAO;

public class RecommendService {

	public String checkRec(int no, String userId) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		String result = dao.checkRec(conn, no, userId);
		
		close(conn);
		
		return result;
	}

}
