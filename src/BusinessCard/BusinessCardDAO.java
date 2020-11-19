package BusinessCard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BusinessCardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BusinessCardDAO() {
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
	
	/* 현재 시간 구하는 함수 */
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
		String SQL = "SELECT id FROM BUSIENSS_CARD ORDER BY id DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;	// 첫 번째 명함인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<BusinessCard> getLists() {
		String SQL = "SELECT id, name, phone, team, position, email, savedTime FROM business_card ORDER BY id DESC";
		try {
			ArrayList<BusinessCard> list = new ArrayList<BusinessCard>();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BusinessCard bc = new BusinessCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), null, null, null, null, null, null, rs.getDate(7));
				list.add(bc);
			}
			System.out.println(list);
			return list;	// 첫 번째 명함인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	
	/*
	public int write(String name,
			String phone,
			String team,
			String position,
			String email,
			String savedTime,
			String conpany,
			String address,
			String zip,
			String fax,
			String telephone,
			String businessType) {
		String SQL = "INSERT INTO BUSINESS_CARD VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, team);
			pstmt.setString(5, position);
			pstmt.setString(6, email);
			pstmt.setString(7, savedTime);
			pstmt.setString(8, conpany);
			pstmt.setString(9, address);
			pstmt.setString(10, zip);
			pstmt.setString(11, fax);
			pstmt.setString(12, telephone);
			pstmt.setString(13, businessType);
			rs = pstmt.executeQuery();
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	*/
}
