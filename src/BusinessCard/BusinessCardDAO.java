package BusinessCard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.UserDAO;

public class BusinessCardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BusinessCardDAO instance;
	
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
	
	public static BusinessCardDAO getInstance() {
		if (instance == null)
			instance = new BusinessCardDAO();
		return instance;

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
		String SQL = "SELECT id FROM BUSINESS_CARD ORDER BY id DESC";
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
	
	public ArrayList<BusinessCard> getLists(int page, int userId) {
		String SQL = "SELECT id, name, phone, team, position, email, companyName, companyAddress, companyZip, companyFax, savedTime FROM business_card WHERE user_id = ? ORDER BY id DESC LIMIT " + ((page - 1) * 10) + ", 10;";
		try {
			ArrayList<BusinessCard> list = new ArrayList<BusinessCard>();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BusinessCard bc = new BusinessCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11));
				list.add(bc);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	
	public BusinessCard getOne(int id, int userId) {
		String SQL = "SELECT id, name, phone, team, position, email, companyName, companyAddress, companyZip, companyFax, savedTime FROM business_card WHERE (id = ?) and (user_id = ?);";
		BusinessCard bc = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			pstmt.setInt(2, userId);
			rs = pstmt.executeQuery();
			rs.next();
			bc = new BusinessCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11));
		} catch(Exception e){
			e.printStackTrace();
		}
		ArrayList<String> list = new ArrayList<String>();
		SQL = "SELECT telephone FROM company_telephone WHERE company_id = ?";
		System.out.println(id);
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
				
			}
			bc.setTelephone(list);
			System.out.println(list);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		list = new ArrayList<String>();
		SQL = "SELECT type FROM company_type WHERE company_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
				System.out.println(rs.getString(1));
			}
			bc.setBusinessType(list);
			System.out.println(list);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return bc;
	}
	
	public int getCount() { //데이터 개수 가져오기
		String SQL = "SELECT COUNT(*) FROM business_card;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(SQL);
			rs.next();
			int count = rs.getInt(1);
			return count;
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getCount(String search) { //데이터 개수 가져오기
		String SQL = "SELECT COUNT(*) FROM business_card WHERE name = WHERE name like '%?%';";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, search);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count;
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<BusinessCard> searchByName(String search, int page) {
		String SQL = "SELECT id, name, phone, team, position, email, companyName, companyAddress, companyZip, companyFax, savedTime FROM business_card WHERE name like '%" + search + "%' ORDER BY id DESC LIMIT " + ((page - 1) * 10) +", 10; ";
		try {
			ArrayList<BusinessCard> list = new ArrayList<BusinessCard>();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BusinessCard bc = new BusinessCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getDate(11));
				list.add(bc);
			}
			return list;	// 첫 번째 명함인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	
	
	
	public boolean addCard(String name,
			String phone,
			String team,
			String position,
			String email,
			String company,
			String address,
			String zip,
			String fax,
			ArrayList<String> telephone,
			ArrayList<String> businessType) {
		String SQL = "INSERT INTO BUSINESS_CARD SET id=?, name=?, phone=?, team=?, position=?, email=?, companyName=?, companyAddress=?, companyZip=?, companyFax=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, team);
			pstmt.setString(5, position);
			pstmt.setString(6, email);
			pstmt.setString(7, company);
			pstmt.setString(8, address);
			pstmt.setString(9, zip);
			pstmt.setString(10, fax);
			/*
			pstmt.setString(11, telephone);
			pstmt.setString(12, businessType);
			*/
			// rs = pstmt.executeQuery();
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
	
	public boolean update(int bcId,
			String name,
			String phone,
			String team,
			String position,
			String email,
			String company,
			String address,
			String zip,
			String fax,
			ArrayList<String> telephone,
			ArrayList<String> businessType) {
		String SQL = "UPDATE BUSINESS_CARD SET name=?, phone=?, team=?, position=?, email=?, companyName=?, companyAddress=?, companyZip=?, companyFax=? WHERE id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, team);
			pstmt.setString(4, position);
			pstmt.setString(5, email);
			pstmt.setString(6, company);
			pstmt.setString(7, address);
			pstmt.setString(8, zip);
			pstmt.setString(9, fax);
			pstmt.setInt(10, bcId);
			/*
			pstmt.setString(11, telephone);
			pstmt.setString(12, businessType);
			*/
			// rs = pstmt.executeQuery();
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
	
	public BusinessCard getBusinessCard(int bcId) {
		String SQL = "SELECT * FROM BUSINESS_CARD WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bcId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BusinessCard bc = new BusinessCard();
				bc.setId(rs.getInt(1));
				bc.setName(rs.getString(2));
				bc.setPhone(rs.getString(3));
				bc.setTeam(rs.getString(4));
				bc.setPosition(rs.getString(5));
				bc.setEmail(rs.getString(6));
				bc.setCompany("1");
				/*
				bc.setAddress(rs.getString(8));
				bc.setZip(rs.getString(9));
				bc.setFax(rs.getString(10));
				bc.setTelephone(rs.getString());
				bc.setBusinessType(rs.getString());
				*/
				
				return bc;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 데이터베이스 오류
	}
	
	public boolean delete(int bcId) {
		String SQL = "DELETE FROM BUSINESS_CARD WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bcId);
			
			// rs = pstmt.executeQuery();
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; // 데이터베이스 오류
	}
}
