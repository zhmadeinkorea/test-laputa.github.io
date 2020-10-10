package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

public class ReplyDAO {

	private Connection conn;
	private ResultSet rs;

	public ReplyDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "SELECT replyID FROM REPLY ORDER BY replyID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 댓글

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	
	public int write(int bbsID, String userID, String replyContent) {
		String SQL = "INSERT INTO REPLY VALUES(?, ?,?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, bbsID);
			pstmt.setString(3, userID);
			pstmt.setString(4, replyContent);
			pstmt.setString(5, getDate());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Reply> getList() {
		String SQL = "SELECT * FROM REPLY WHERE replyID>0 ORDER BY replyID DESC";
		ArrayList<Reply> list = new ArrayList<Reply>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setBbsID(rs.getInt(2));
				reply.setUserID(rs.getString(3));
				reply.setReplyContent(rs.getString(4));
				reply.setReplyDate(rs.getString(5));

				list.add(reply);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public Reply getReply(int bbsID) {
		String SQL = "SELECT * FROM REPLY WHERE bbsID =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  bbsID);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Reply reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setBbsID(rs.getInt(2));
				reply.setUserID(rs.getString(3));
				reply.setReplyContent(rs.getString(4));
				reply.setReplyDate(rs.getString(5));

				return reply;
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
