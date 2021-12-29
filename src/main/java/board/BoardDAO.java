package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/board";
			String dbID = "root";
			String dbPassword = "tmdpiano0816";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // Database Error	
	}
	
	public int getNext() {
		String SQL = "SELECT boardNo FROM BOARD ORDER BY boardNo DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // First Posting
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // Database Error	
	}
	
	public int post(String boardTitle, String userID, String boardContent) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // Database Error	
	}
	
	public ArrayList<Board> getPostingList(int pageNum){
		String SQL = "SELECT * FROM BOARD WHERE boardNo < ? AND boardDeleted = 1 ORDER BY boardNo DESC LIMIT 10";
		ArrayList<Board> plist = new ArrayList<Board>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNum - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()){
				Board b = new Board();
				b.setBoardNo(rs.getInt(1));
				b.setBoardTitle(rs.getString(2));
				b.setUserID(rs.getString(3));
				b.setBoardDate(rs.getString(4));
				b.setBoardContent(rs.getString(5));
				b.setBoardDeleted(rs.getInt(6));
				plist.add(b);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	public boolean hasNextPage(int pageNum) {
		String SQL = "SELECT * FROM BOARD WHERE boardNo < ? AND boardDeleted = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNum - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Board getPost(int boardNo) {
		String SQL = "SELECT * FROM BOARD WHERE boardNo = ?";
		Board b = new Board();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				b.setBoardNo(rs.getInt(1));
				b.setBoardTitle(rs.getString(2));
				b.setUserID(rs.getString(3));
				b.setBoardDate(rs.getString(4));
				b.setBoardContent(rs.getString(5));
				b.setBoardDeleted(rs.getInt(6));
				return b;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int boardNo, String boardTitle, String boardContent) {
		String SQL = "UPDATE BOARD SET boardTitle = ?, boardContent = ? WHERE boardNo = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardNo);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // Database Error	
	}
	
	public int delete(int boardNo) {
		String SQL = "UPDATE BOARD SET boardDeleted = 0 WHERE boardNo = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardNo);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // Database Error	
	}
}
	