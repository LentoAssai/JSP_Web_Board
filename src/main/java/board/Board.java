package board;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String userID;
	private String boardDate;
	private String boardContent;
	private int boardDeleted;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardDeleted() {
		return boardDeleted;
	}
	public void setBoardDeleted(int boardDeleted) {
		this.boardDeleted = boardDeleted;
	}	
}
