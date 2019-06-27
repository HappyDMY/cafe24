package net.member2;

import java.sql.Timestamp;

public class MemberDataBean {
	private String id; //1아이디, 중복 안됨, 레코드를 구분하는 컬럼 
	private String passwd;//2패스워드
	private String mname;  //3성명
	private String tel;     //4전화번호
	private String email;    //5전자우편 주소, 중복 안됨
	private String zipcode;  //6우편번호, 101-101
	private String address1;//7 주소 1
	private String address2; //8-- 주소 2(나머지주소)
	private String job;     //9직업
	private String mlevel;  //10회원 등급, A1, B1, C1, D1, E1, F1 ************
	private String mdate;    //11가입일    
	
	public MemberDataBean() {}
	public MemberDataBean(String id, String passwd, String mname, String tel, String email, String zipcode,
			String address1, String address2, String job, String mlevel, String mdate) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.mname = mname;
		this.tel = tel;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.job = job;
		this.mlevel = mlevel;
		this.mdate = mdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getMlevel() {
		return mlevel;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	
}//class end
