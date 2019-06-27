package net.bbs;

public class BbsDTO {
	// Date Transfer Object 데이터 전송 객체]
	// value Object

	// 테이블 칼럼과 1:1 매칭되는
	// field를 private 접근제어로 선언
	private int bbsno; // 일련번호
	private String wname; // 이름-
	private String subject; // 제목-
	private String content; // 내용-
	private String passwd; // 비번
	private int readcnt; // 조회수-
	private String regdt; // 작성일-
	private int grpno; // 그룹번호
	private int indent; // 들여쓰기
	private int ansnum; // 답글수-
	private String ip; // IP-
	private int comment;
	
	//default constructor 기본 생성자
	public BbsDTO() {}

	public BbsDTO(int bbsno, String wname, String subject, String content, String passwd, int readcnt, String regdt,
			int grpno, int indent, int ansnum, String ip) {
		super();
		this.bbsno = bbsno;
		this.wname = wname;
		this.subject = subject;
		this.content = content;
		this.passwd = passwd;
		this.readcnt = readcnt;
		this.regdt = regdt;
		this.grpno = grpno;
		this.indent = indent;
		this.ansnum = ansnum;
		this.ip = ip;
	}

	public int getBbsno() {
		return bbsno;
	}

	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	public int getGrpno() {
		return grpno;
	}

	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getAnsnum() {
		return ansnum;
	}

	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "BbsDTO [bbsno=" + bbsno + ", wname=" + wname + ", subject=" + subject + ", content=" + content
				+ ", passwd=" + passwd + ", readcnt=" + readcnt + ", regdt=" + regdt + ", grpno=" + grpno + ", indent="
				+ indent + ", ansnum=" + ansnum + ", ip=" + ip + "]";
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	

}// class end
