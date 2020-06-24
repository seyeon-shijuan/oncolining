package model;
import java.util.Date;
// 이 지문은 VO다.
public class Boardcomment {

	private int cm_no;
	private int board_no;
	private String cm_title;
	private String cm_content;
	private String cm_file;
	private Date cm_regdate;
	private String mem_id;
	
	//getter, setter, toString
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getCm_title() {
		return cm_title;
	}
	public void setCm_title(String cm_title) {
		this.cm_title = cm_title;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_file() {
		return cm_file;
	}
	public void setCm_file(String cm_file) {
		this.cm_file = cm_file;
	}
	public Date getCm_regdate() {
		return cm_regdate;
	}
	public void setCm_regdate(Date cm_regdate) {
		this.cm_regdate = cm_regdate;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "Boardcomment [cm_no=" + cm_no + ", board_no=" + board_no + ", cm_title=" + cm_title + ", cm_content="
				+ cm_content + ", cm_file=" + cm_file + ", cm_regdate=" + cm_regdate + ", mem_id=" + mem_id + "]";
	}
	
	
	
}
