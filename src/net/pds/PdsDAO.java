package net.pds;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.security.auth.Subject;

import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

public class PdsDAO {
	private DBOpen dbopen = null;
	private DBClose dbclose = null;

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuilder sql = null;
	int res = 0;

	// Date Access Object : �����ͺ��̽��� �����ϱ� ���� ��ü

	public PdsDAO() {
		dbopen = new DBOpen();
		dbclose = new DBClose();
	}
	
	public boolean insert(PdsDTO dto) {
		boolean flag = false;
		
		try {
			con =dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_pds(wname, subject, passwd, filename, filesize, regdate) ");
			sql.append(" VALUES( ?, ?, ?, ?, ?, now() )  ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			res = pstmt.executeUpdate();
			if (res==1) {
				flag=true;
			}
		} catch (Exception e) {
			System.out.println("�߰� ����"+e);
		} finally {
			dbclose.close(con, pstmt);
		}		
		return flag;		
	}// insert end
	
	public ArrayList<PdsDTO> list() {
		ArrayList<PdsDTO> list = null;
		
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT pdsno, subject, wname, regdate, filename, readcnt ");
			sql.append(" FROM tb_pds order by regdate desc ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();// ��ü ����
				do {
					PdsDTO dto = new PdsDTO(); // ��������
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setSubject(rs.getString("subject"));
					dto.setWname(rs.getString("wname"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setFilename(rs.getString("filename"));
					dto.setReadcnt(rs.getInt("readcnt"));
					list.add(dto);
				} while (rs.next());
			}		
		} catch (Exception e) {
			System.out.println("��ϻ��� ����"+ e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}		
		return list;		
	}// list end-----------------
	
	public ArrayList<PdsDTO> listP(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<PdsDTO> list = null;		

		int startRow = ((nowPage - 1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;

		word = word.trim(); // �˻����� �¿� ���� ����
		
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			String search = "";
			
			if(word.length()==0) { //�˻� ���Ҷ�
				sql.append(" select bb.* ");
				sql.append(" 	from(select aa.*, @rm := @rm + 1 as rm ");				
				sql.append("		from (SELECT * from `tb_pds` ORDER BY pdsno DESC)aa ");				
				sql.append("		join (select @rm := 0)r ");				
				sql.append("		ORDER BY pdsno DESC)bb		 ");				
				sql.append(" WHERE rm>=" + startRow + " AND rm<=" + endRow);				
			}else {
				sql.append(" select bb.* ");
				sql.append(" 	from(select aa.*, @rm := @rm + 1 as rm ");				
				sql.append("		from (SELECT * from `tb_pds`");				
				if (col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%'";
				} else if (col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%'";
				} 
				sql.append(search);
				sql.append("		ORDER BY pdsno DESC)aa ");				
				sql.append("		join (select @rm := 0)r ");				
				sql.append("		ORDER BY pdsno DESC)bb		 ");				
				sql.append(" WHERE rm>=" + startRow + " AND rm<=" + endRow);				
			}
				

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();// ��ü ����
				do {
					PdsDTO dto = new PdsDTO(); // ��������
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setSubject(rs.getString("subject"));
					dto.setWname(rs.getString("wname"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setFilename(rs.getString("filename"));
					dto.setReadcnt(rs.getInt("readcnt"));
					list.add(dto);
				} while (rs.next());
			}		
		} catch (Exception e) {
			System.out.println("��ϻ��� ����"+ e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}		
		return list;		
	}// listP end-----------------
	public PdsDTO read(int pdsno) {
		
		PdsDTO dto = new PdsDTO();
		try {
			con=dbopen.getConnection();
			sql= new StringBuilder();
			sql.append(" SELECT pdsno, subject, wname, regdate, filename, filesize, readcnt, passwd ");
			sql.append(" FROM tb_pds WHERE pdsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setPdsno(rs.getInt("pdsno"));
				dto.setSubject(rs.getString("subject"));
				dto.setWname(rs.getString("wname"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getLong("filesize"));
				dto.setReadcnt(rs.getInt("readcnt"));				
				dto.setPasswd(rs.getString("passwd"));
			}			
			
		} catch (Exception e) {
			System.out.println("���� ����"+ e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		
		return dto;
	}// read end
	
	public int delete(PdsDTO dto, String saveDir) {
		try {
			//�����Ϸ��� ���ϸ� ��������
			//���1) jdk ���ϱ�
			
			String filename= saveDir;
			PdsDTO oldDTO = read(dto.getPdsno()); 
			if (oldDTO!= null) {	
				filename += "/"+oldDTO.getFilename();
			}
			
			File file = new File(filename);
			
			System.out.println(filename);
			
			//---------------------------
			//���2) ��ƿ�� �ϱ�			
			/*
			PdsDTO oldDTO = read(dto.getPdsno()); 
			String filename = "";
			if (oldDTO!= null) {	
				filename = oldDTO.getFilename();
			}
			*/
			con=dbopen.getConnection();
			
			sql= new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE pdsno=? AND passwd=? ");
			
			System.out.println(dto.getPasswd());
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getPdsno());
			pstmt.setString(2, dto.getPasswd());
			res = pstmt.executeUpdate();
			
			if (res==1) {
				//���̺��� ���ڵ尡 ���������� �����Ǹ� ÷�ε� ���ϵ� ����
				//��� 1
				file.delete();
				
				//��� 2
				//Utility.deleteFile(saveDir, filename);
			}
			
			
		} catch (Exception e) {
			System.out.println("���� ����"+ e);
		} finally {
			dbclose.close(con, pstmt);
		}		
		return res;
	}//delete end
	
	public int delete2(PdsDTO dto, String saveDir) {
		try {
			//�����Ϸ��� ���ϸ� ��������
			PdsDTO oldDTO = read(dto.getPdsno()); 
			String filename = "";
			if (oldDTO!= null) {	
				filename = oldDTO.getFilename();
			}
			con=dbopen.getConnection();
			
			sql= new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE pdsno=? AND passwd=? ");
			
			System.out.println(dto.getPasswd());
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getPdsno());
			pstmt.setString(2, dto.getPasswd());
			res = pstmt.executeUpdate();
			
			if (res==1) {
				//���̺��� ���ڵ尡 ���������� �����Ǹ� ÷�ε� ���ϵ� ����
				Utility.deleteFile(saveDir, filename);
			}
			
			
		} catch (Exception e) {
			System.out.println("���� ����"+ e);
		} finally {
			dbclose.close(con, pstmt);
		}		
		return res;
	}//delete 2 end
	public int pwCheck(PdsDTO dto, String saveDir) {
		try {
			con=dbopen.getConnection();
			
			sql= new StringBuilder();
			sql.append(" select pdsno FROM tb_pds ");
			sql.append(" WHERE pdsno=? AND passwd=? ");
			
			System.out.println(dto.getPasswd());
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getPdsno());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				res=1;
			}else {
				res=0;
			}
						
		} catch (Exception e) {
			System.out.println("���� ����"+ e);
		} finally {
			dbclose.close(con, pstmt);
		}		
		return res;
	}//pwcheck end
	
	public int update(PdsDTO dto, String saveDir) {
		try {
			//���� ���ϸ� ��������
			//���1) jdk ���ϱ�
			
			String fileAddr= saveDir;
			PdsDTO oldDTO = read(dto.getPdsno()); 
			if (oldDTO!= null) {	
				fileAddr += "/"+oldDTO.getFilename();
			}
			
			File file = new File(fileAddr);
			System.out.println(saveDir);
			System.out.println(fileAddr);
			boolean tf=file.delete();
			System.out.println(tf);
			
			con=dbopen.getConnection();
			
			sql= new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" set wname=?,subject=? , passwd=?, fileName=?, filesize=?, regdate=now() ");
			sql.append(" where pdsno=? ");
			
			System.out.println(dto.getPasswd());
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			pstmt.setInt(6, dto.getPdsno());
			res = pstmt.executeUpdate();
			
		
		} catch (Exception e) {
			System.out.println("���� ����"+ e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}		
		return res;
	}//update end
	
public int totRec() {
		
		try {
			con=dbopen.getConnection();
			sql= new StringBuilder();
			sql.append(" SELECT count(*) as cnt ");
			sql.append(" FROM tb_pds ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				res=rs.getInt("cnt");
			}			
			
		} catch (Exception e) {
			System.out.println("���� ����"+ e);
		} finally {
			dbclose.close(con, pstmt, rs);
		}
		
		return res;
	}// totRec end
	
	
}// class end
