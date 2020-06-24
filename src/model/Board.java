package model;
import java.util.Date;
// 이 지문은 VO다.
public class Board {
	private int board_no;
	private String mem_id;
	private String board_subject;
	private String board_content;
	private String board_file;
	private Date board_regdate;
	private int board_readcnt;
	private int board_grp;
	private int board_grplevel;
	private int board_grpstep;
	
	
	//getter, setter, toString
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public Date getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getBoard_readcnt() {
		return board_readcnt;
	}
	public void setBoard_readcnt(int board_readcnt) {
		this.board_readcnt = board_readcnt;
	}
	public int getBoard_grp() {
		return board_grp;
	}
	public void setBoard_grp(int board_grp) {
		this.board_grp = board_grp;
	}
	public int getBoard_grplevel() {
		return board_grplevel;
	}
	public void setBoard_grplevel(int board_grplevel) {
		this.board_grplevel = board_grplevel;
	}
	public int getBoard_grpstep() {
		return board_grpstep;
	}
	public void setBoard_grpstep(int board_grpstep) {
		this.board_grpstep = board_grpstep;
	}
	
	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", mem_id=" + mem_id + ", board_subject=" + board_subject
				+ ", board_content=" + board_content + ", board_file=" + board_file + ", board_regdate=" + board_regdate
				+ ", board_readcnt=" + board_readcnt + ", board_grp=" + board_grp + ", board_grplevel=" + board_grplevel
				+ ", board_grpstep=" + board_grpstep + "]";
	}
	
}
