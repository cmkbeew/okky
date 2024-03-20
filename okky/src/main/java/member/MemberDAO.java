package member;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {}
	
	public MemberDAO(ServletContext application) {
		super(application);
	}

	// 일반 회원 가입
	public int registMember(MemberDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();	
		sb.append("INSERT INTO member(memberId, pwd, name, email, nickname, type)");
		sb.append(" VALUES (?, ?, ?, ?, ?, ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getNickname());
			psmt.setString(6, dto.getType());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("회원가입 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 기업 회원 가입
	public int registMember2(MemberDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();	
		sb.append("INSERT INTO member(memberId, pwd, name, email, nickname, type, ");
		sb.append("companyName, companyNumber, orgCompanyFile, saveCompanyFile, managerName, managerPhone) ");
		sb.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getMemberId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getNickname());
			psmt.setString(6, dto.getType());
			psmt.setString(7, dto.getCompanyName());
			psmt.setString(8, dto.getCompanyNumber());
			psmt.setString(9, dto.getOrgCompanyFile());
			psmt.setString(10, dto.getSaveCompanyFile());
			psmt.setString(11, dto.getManagerName());
			psmt.setString(12, dto.getManagerPhone());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("회원가입 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
