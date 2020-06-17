package model;

public class Member {
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_nickname;
	private String mem_dateofbirth;
	private String mem_gender;
	private String mem_diagnosis;
	private String mem_dgdate;
	private String mem_stage;
	private String mem_docs;
	private String mem_hospital;
	
	
	//getter, setter, toString
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_dateofbirth() {
		return mem_dateofbirth;
	}
	public void setMem_dateofbirth(String mem_birthdate) {
		this.mem_dateofbirth = mem_birthdate;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_diagnosis() {
		return mem_diagnosis;
	}
	public void setMem_diagnosis(String mem_diagnosis) {
		this.mem_diagnosis = mem_diagnosis;
	}
	public String getMem_dgdate() {
		return mem_dgdate;
	}
	public void setMem_dgdate(String mem_dgdate) {
		this.mem_dgdate = mem_dgdate;
	}
	public String getMem_stage() {
		return mem_stage;
	}
	public void setMem_stage(String mem_stage) {
		this.mem_stage = mem_stage;
	}
	public String getMem_docs() {
		return mem_docs;
	}
	public void setMem_docs(String mem_docs) {
		this.mem_docs = mem_docs;
	}
	public String getMem_hospital() {
		return mem_hospital;
	}
	public void setMem_hospital(String mem_hospital) {
		this.mem_hospital = mem_hospital;
	}
	@Override
	public String toString() {
		return "Member [mem_id=" + mem_id + ", mem_pass=" + mem_pass + ", mem_name=" + mem_name + ", mem_nickname="
				+ mem_nickname + ", mem_dateofbirth=" + mem_dateofbirth + ", mem_gender=" + mem_gender + ", mem_diagnosis="
				+ mem_diagnosis + ", mem_dgdate=" + mem_dgdate + ", mem_stage=" + mem_stage + ", mem_docs=" + mem_docs
				+ ", mem_hospital=" + mem_hospital + "]";
	}
	
	
	
	
	
}
