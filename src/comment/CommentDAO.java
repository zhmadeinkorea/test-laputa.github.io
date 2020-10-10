package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import reply.Reply;

public class CommentDAO {

	private Connection conn;
	private ResultSet rs;

	public CommentDAO() {
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
		String SQL = "SELECT commentID FROM COMMENT ORDER BY commentID DESC";
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

	public int write(String userID, String commentContent) {
		String SQL = "INSERT INTO COMMENT VALUES(?, ?,?,?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setString(3, commentContent);
			pstmt.setString(4, getDate());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Comment> getList() {
		String SQL = "SELECT * FROM COMMENT WHERE commentID>0 ORDER BY commentID DESC";
		ArrayList<Comment> list = new ArrayList<Comment>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Comment comment = new Comment();

				comment.setCommentID(rs.getInt(1));
				comment.setUserID(rs.getString(2));
				comment.setCommentContent(rs.getString(3));
				comment.setCommentDate(rs.getString(4));
				list.add(comment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Comment getComment() {
		String SQL = "SELECT * FROM COMMENT WHERE commentID>0";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				Comment comment = new Comment();
				comment.setCommentID(rs.getInt(1));
				comment.setUserID(rs.getString(2));
				comment.setCommentContent(rs.getString(3));
				comment.setCommentDate(rs.getString(4));

				return comment;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
