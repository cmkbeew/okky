package member;

import java.util.List;
import java.util.Map;
import java.util.Vector;

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
		if(dto.getType() == "1") {
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
		} else {
			sb.append("INSERT INTO member(memberId, pwd, name, email, nickname, type, ");
			sb.append("companyName, companyNumber, companyAddr, orgCompanyFile, saveCompanyFile, managerName, managerPhone) ");
			sb.append("VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
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
				psmt.setString(9, dto.getCompanyAddr());
				psmt.setString(10, dto.getOrgCompanyFile());
				psmt.setString(11, dto.getSaveCompanyFile());
				psmt.setString(12, dto.getManagerName());
				psmt.setString(13, dto.getManagerPhone());
				
				result = psmt.executeUpdate();
			} catch(Exception e) {
				System.out.println("회원가입 중 에러 발생");
				e.printStackTrace();
			}
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
					dto.setMemberIdx(rs.getInt("memberIdx"));
					dto.setMemberId(rs.getString("memberId"));
					dto.setPwd(rs.getString("pwd"));
					dto.setName(rs.getString("name"));
					dto.setNickname(rs.getString("nickname"));
					dto.setType(rs.getString("type"));
					dto.setCompanyName(rs.getString("companyName"));
					dto.setCompanyAddr(rs.getString("companyAddr"));
					dto.setCompanyNumber(rs.getString("companyNumber"));
					dto.setManagerName(rs.getString("managerName"));
					dto.setManagerPhone(rs.getString("managerPhone"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 시 에러 발생");
		}
		return dto;
	}
//	회사 정보 가져오기
	public MemberDTO getCompanyInfo(String id, String name) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT * FROM member WHERE memberId=?" ;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("name").equals(name)) {
					dto.setMemberId(rs.getString("memberId"));
					dto.setManagerName(rs.getString("managerName"));
					dto.setCompanyName(rs.getString("companyName"));
					dto.setCompanyNumber(rs.getString("companyNumber"));
					dto.setManagerPhone(rs.getString("managerPhone"));
					dto.setEmail(rs.getString("email"));
					dto.setType(rs.getString("type"));
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("기업 회원 조회 시 에러 발생");
		}
		return dto;
	}
// 회사 정보 수정하기
	public int modifyCompany(MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();	
		sb.append("UPDATE member SET managerName=?, managerPhone=?");
		sb.append(" WHERE memberId=?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getManagerName());
			psmt.setString(2, dto.getManagerPhone());
			psmt.setString(3, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("정보 수정 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
// 개인 정보 수정하기
	public int modifyMyInfo(MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();	
		sb.append("UPDATE member SET nickname=?");
		sb.append(" WHERE memberId=?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getNickname());
			psmt.setString(2, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("정보 수정 중 에러 발생");
			e.printStackTrace();
		}
		
		return result;
	}
// 비밀번호 변경	
	public int changePwd(MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();	
		sb.append("UPDATE member SET pwd=?");
		sb.append(" WHERE memberId=?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getPwd());
			psmt.setString(2, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("비밀번호 수정 중 에러 발생");
			e.printStackTrace();
		}
		return result;
	}
// 이메일 변경
	public int changeMail(MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE member SET email=?");
		sb.append(" WHERE memberId=?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("이메일 변경 중 에러 발생");
		}
		return result;
	}
//	계정 삭제
	public int deleteAccount(MemberDTO dto) {
		int result = 0;
		String sql = "DELETE FROM member WHERE memberId=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("계정 삭제 중 에러 발생");
		}
		return result;
	}
//스킬 태그 입력
	public int inputSkill (MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE member SET skill1=?, skill2=?, skill3=?");
		sb.append(" WHERE memberId =?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getSkill1());
			psmt.setString(2, dto.getSkill2());
			psmt.setString(3, dto.getSkill3());
			psmt.setString(4, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("스킬 태그 업로드 중 에러 발생");
		}
		return result;
	}
	
//	이력서 파일 입력
	public int registerResume (MemberDTO dto) {
		int result = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("UPDATE member SET orgCompanyFIle=?, saveCompanyFile=?");
		sb.append(" WHERE memberId =?");
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, dto.getOrgCompanyFile());
			psmt.setString(2, dto.getSaveCompanyFile());
			psmt.setString(3, dto.getMemberId());
			result = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("이력서 파일 업로드 중 에러 발생");
		}
		return result;
	}
	
//개인회원 구인지원 리스트 확인	
	public List<ApplyTableDTO> applyList(Map<String, Object> map) {
		List<ApplyTableDTO> list = new Vector<ApplyTableDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT RC.recruitIdx, RC.recruitTitle, RC.dueDate, RC.memberIdx, MB.memberId");
		sb.append(" FROM recruit AS RC");
		sb.append(" INNER JOIN member AS MB ON RC.memberIdx = MB.memberIdx" );
		sb.append(" WHERE MB.memberId = ?" );
		sb.append(" ORDER BY RC.recruitIdx");
	
		try {			
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, map.get("memberId").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ApplyTableDTO dto = new ApplyTableDTO();
				dto.setMemberIdx(rs.getInt("RC.memberIdx"));
				dto.setRecruitIdx(rs.getInt("RC.recruitIdx"));
				dto.setRecruitTitle(rs.getString("RC.recruitTitle"));
				dto.setDueDate(rs.getString("RC.dueDate"));
		
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println("지원 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;
	}
//	기업회원 지원자 리스트 확인
	public List<ApplyTableDTO> applicantList(Map<String, Object> map) {
		List<ApplyTableDTO> list = new Vector<ApplyTableDTO>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT MB.name, MB.email,MB.memberId, RC.recruitTitle, RC.dueDate, AI.regDate"); 
		sb.append(", RC.recruitIdx, RC.memberIdx, MB.orgCompanyFile, MB.saveCompanyFile"); 
		sb.append(", (SELECT distinct MB.memberId FROM member AS MB");
		sb.append(" INNER JOIN recruit AS RC ON RC.memberIdx = MB.memberIdx WHERE MB.memberId = ? )AS comId") ;
		sb.append(" FROM member AS MB");
		sb.append(" INNER JOIN applyinfo AS AI on MB.memberIdx = AI.memberIdx");
		sb.append(" INNER JOIN recruit AS RC ON RC.recruitIdx = AI.recruitIdx");

		try {			
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, map.get("memberId").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				ApplyTableDTO dto = new ApplyTableDTO();
				dto.setName(rs.getString("MB.name"));
				dto.setRecruitTitle(rs.getString("RC.recruitTitle"));
				dto.setEmail(rs.getString("MB.email"));
				dto.setDueDate(rs.getString("RC.dueDate"));
				dto.setRegDate(rs.getString("AI.regDate"));
				dto.setMemberId((rs.getString("MB.memberId")));
				dto.setOrgCompanyFile(rs.getString("MB.orgCompanyFIle"));
				dto.setSaveCompanyFile(rs.getString("MB.saveCompanyFile"));
		
				list.add(dto);
			}
		} catch(Exception e) {
			System.out.println("지원자 리스트 조회 에러");
			e.printStackTrace();
		}
		return list;
	}

}
