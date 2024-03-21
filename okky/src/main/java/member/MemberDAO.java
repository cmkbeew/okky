package member;

import common.ConnectPool;

public class MemberDAO extends ConnectPool {
	// 중복 회원 조회
	public int getMemberCount(String memberId) {
		int result = 0;
		String sql = "SELECT COUNT(memberId) FROM member WHERE memberId=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memberId);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원 조회 시 에러 발생");
		}
		
		return result;
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
	
	// 로그인 - 회원 조회
	public MemberDTO getMemberInfo(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		
		String sql = "SELECT * FROM member WHERE memberId=?"; 
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)) {
					dto.setMemberId(rs.getString("memberId"));
					dto.setName(rs.getString("name"));
					dto.setNickname(rs.getString("nickname"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 시 에러 발생");
		}
		
		return dto;
	}
	
	public MemberDTO getCompanyInfo(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * FROM member WHERE memberId=?" ;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)) {
					dto.setMemberId(rs.getString("memberId"));
					dto.setManagerName(rs.getString("managerName"));
					dto.setCompanyName(rs.getString("companyName"));
					dto.setCompanyNumber(rs.getString("companyNo"));
					dto.setManagerPhone(rs.getString("managerPhone"));
					dto.setType(rs.getString("type"));
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("기업 회원 조회 시 에러 발생");
		}
		
		
		return dto;
	}
}
