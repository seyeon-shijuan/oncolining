package model;

public class Clinicaltrial {
	private String ct_datano;
	private String mem_id;
	private String ct_week;
	private String ct_age;
	private String ct_medicine;
	private String ct_frequency;
	private String ct_otherfqc;
	private String ct_dosage;
	private String ct_treatment;
	private String ct_suppliment;
	private String ct_pain;
	private String ct_fatigue;
	private String ct_side_effect;
	private String ct_tumor_size;
	private String ct_blood_test;
	
	private String mem_nickname;
	private String mem_gender;
	private String mem_diagnosis;
	private String mem_stage;
	
	
	
	//getter, setter, toString
	public String getCt_datano() {
		return ct_datano;
	}
	public void setCt_datano(String ct_datano) {
		this.ct_datano = ct_datano;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCt_week() {
		return ct_week;
	}
	public void setCt_week(String ct_week) {
		this.ct_week = ct_week;
	}
	public String getCt_age() {
		return ct_age;
	}
	public void setCt_age(String ct_age) {
		this.ct_age = ct_age;
	}
	public String getCt_medicine() {
		return ct_medicine;
	}
	public void setCt_medicine(String ct_medicine) {
		this.ct_medicine = ct_medicine;
	}
	public String getCt_frequency() {
		return ct_frequency;
	}
	public void setCt_frequency(String ct_frequency) {
		this.ct_frequency = ct_frequency;
	}
	public String getCt_otherfqc() {
		return ct_otherfqc;
	}
	public void setCt_otherfqc(String ct_otherfqc) {
		this.ct_otherfqc = ct_otherfqc;
	}
	public String getCt_dosage() {
		return ct_dosage;
	}
	public void setCt_dosage(String ct_dosage) {
		this.ct_dosage = ct_dosage;
	}
	public String getCt_treatment() {
		return ct_treatment;
	}
	public void setCt_treatment(String ct_treatment) {
		this.ct_treatment = ct_treatment;
	}
	public String getCt_suppliment() {
		return ct_suppliment;
	}
	public void setCt_suppliment(String ct_suppliment) {
		this.ct_suppliment = ct_suppliment;
	}
	public String getCt_pain() {
		return ct_pain;
	}
	public void setCt_pain(String ct_pain) {
		this.ct_pain = ct_pain;
	}
	public String getCt_fatigue() {
		return ct_fatigue;
	}
	public void setCt_fatigue(String ct_fatigue) {
		this.ct_fatigue = ct_fatigue;
	}
	public String getCt_side_effect() {
		return ct_side_effect;
	}
	public void setCt_side_effect(String ct_side_effect) {
		this.ct_side_effect = ct_side_effect;
	}
	public String getCt_tumor_size() {
		return ct_tumor_size;
	}
	public void setCt_tumor_size(String ct_tumor_size) {
		this.ct_tumor_size = ct_tumor_size;
	}
	public String getCt_blood_test() {
		return ct_blood_test;
	}
	public void setCt_blood_test(String ct_blood_test) {
		this.ct_blood_test = ct_blood_test;
	}
	
	
	// LEFT JOIN 후 추가되는 Member table elements
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
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
	public String getMem_stage() {
		return mem_stage;
	}
	public void setMem_stage(String mem_stage) {
		this.mem_stage = mem_stage;
	}
	
	
	@Override
	public String toString() {
		return "Clinicaltrial [ct_datano=" + ct_datano + ", mem_id=" + mem_id + ", ct_week=" + ct_week + ", ct_age="
				+ ct_age + ", ct_medicine=" + ct_medicine + ", ct_frequency=" + ct_frequency + ", ct_otherfqc="
				+ ct_otherfqc + ", ct_dosage=" + ct_dosage + ", ct_treatment=" + ct_treatment + ", ct_suppliment="
				+ ct_suppliment + ", ct_pain=" + ct_pain + ", ct_fatigue=" + ct_fatigue + ", ct_side_effect="
				+ ct_side_effect + ", ct_tumor_size=" + ct_tumor_size + ", ct_blood_test=" + ct_blood_test
				+ ", mem_nickname=" + mem_nickname + ", mem_gender=" + mem_gender + ", mem_diagnosis=" + mem_diagnosis
				+ ", mem_stage=" + mem_stage + "]";
	}
	
	
	/*
	원래 toString
	@Override
	public String toString() {
		return "Clinicaltrial [ct_datano=" + ct_datano + ", mem_id=" + mem_id + ", ct_week=" + ct_week + ", ct_age="
				+ ct_age + ", ct_medicine=" + ct_medicine + ", ct_frequency=" + ct_frequency + ", ct_otherfqc="
				+ ct_otherfqc + ", ct_dosage=" + ct_dosage + ", ct_treatment=" + ct_treatment + ", ct_suppliment="
				+ ct_suppliment + ", ct_pain=" + ct_pain + ", ct_fatigue=" + ct_fatigue + ", ct_side_effect="
				+ ct_side_effect + ", ct_tumor_size=" + ct_tumor_size + ", ct_blood_test=" + ct_blood_test + "]";
	}
	*/
	
	
	
}
