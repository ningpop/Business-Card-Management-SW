package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.cj.exceptions.CJCommunicationsException;


public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static UserDAO instance;

	public static UserDAO getInstance() {
		if (instance == null)
			instance = new UserDAO();
		return instance;

	}
	
	public UserDAO() {
		connect();
	}
	
	private void connect() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/javajo?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean login(HttpServletRequest request, String username, String password) {
		String SQL = "SELECT password, name, id FROM user WHERE username = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(SHA256.encodeSha256(password))) {
					String name = rs.getString(2);
					String id = rs.getString(3);
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("id", id);
					httpSession.setAttribute("name", name);
			        httpSession.setAttribute("username", username);
					return true; // 비밀번호 일치
				}
			}
			return false; // 유저네임 불일치
		} catch(CJCommunicationsException e) {
			connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 에러
	}
	
	public boolean signup(String name, String username, String password) {
		String SQL = "INSERT INTO user(name, username, password) VALUES (?, ?, ?);";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, username);
			pstmt.setString(3, SHA256.encodeSha256(password));
			pstmt.executeUpdate();

			return true;
		} catch(CJCommunicationsException e) {
			connect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private PreparedStatement setString(int i, String username) {
		// TODO Auto-generated method stub
		return null;
	}
}
