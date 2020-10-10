package image;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.PreparedStatement;



public class ImageDAO {

	private Connection conn;
	
	public ImageDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	public int upload(String imageName, String imageRealName) {
		String SQL = "INSERT INTO IMAGE VALUES(?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  imageName);
			pstmt.setString(2, imageRealName);
			
			return pstmt.executeUpdate();
			//성공적으로 데이터가 들어가면 1이라는 값이 반환된다

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
}
