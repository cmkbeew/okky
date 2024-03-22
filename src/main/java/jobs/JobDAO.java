package jobs;

import java.util.List;
import java.util.Vector;

import common.ConnectPool;

public class JobDAO extends ConnectPool {
	public JobDAO() {}
	
	// 정규직 공고 전체 갯수
	public int getFulltimeCount() {
		int result = 0;
		
		String sql = "SELECT COUNT(r.recruitIdx) FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx WHERE companyName IS NOT NULL AND contractType = '정규직'";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 total_count 에러 발생");
		}
		
		return result;
	
	}
	// 정규직 공고 리스트 조회
	public List<JobDTO> getFulltimeList(){
		List<JobDTO> list = new Vector<JobDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT m.companyName, m.type, r.position, r.career, r.companyAddr, r.contractType ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE companyName IS NOT NULL AND contractType = '정규직'");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JobDTO dto = new JobDTO();
				
				dto.setCompanyName(rs.getString("companyName"));
				dto.setType(rs.getString("type"));
				dto.setPosition(rs.getString("position"));
				dto.setCareer(rs.getString("career"));
				dto.setCompanyAddr(rs.getString("companyAddr"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 리스트 조회 시 에러 발생");
		}
		
		return list;
	} 
	
	// 계약직 전체 공고 갯수
	public int getContractCount() {
		int result = 0;
		
		String sql = "SELECT COUNT(r.recruitIdx) FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx WHERE companyName IS NOT NULL AND contractType = '계약직'";
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 total_count 에러 발생");
		}
		
		return result;
	
	}
	
	// 계약직 공고 리스트 조회
	public List<JobDTO> getContractList(){
		List<JobDTO> list = new Vector<JobDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT m.companyName, m.type, r.position, r.career, r.companyAddr, r.contractType ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE companyName IS NOT NULL AND contractType = '계약직'");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JobDTO dto = new JobDTO();
				
				dto.setCompanyName(rs.getString("companyName"));
				dto.setType(rs.getString("type"));
				dto.setPosition(rs.getString("position"));
				dto.setCareer(rs.getString("career"));
				dto.setCompanyAddr(rs.getString("companyAddr"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 리스트 조회 시 에러 발생");
		}
		
		return list;
	} 
	
	
	
	// 글 작성 시 필요한 메서드?
	public List<JobDTO> getJobList(String type){
		List<JobDTO> list = new Vector<JobDTO>();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT m.memberId, m.name, m.email, m.nickname, m.`type`, m.companyName, m.managerName, m.managerPhone, ");
		sb.append("r.companyAddr, r.salary, r.position, r.contractType, r.career, r.recruitContent ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE m.type=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setString(1, type);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JobDTO dto = new JobDTO();
				
				dto.setCompanyName(rs.getString("companyName"));
				dto.setCompanyName(rs.getString("position"));
				dto.setCompanyName(rs.getString("r.career"));
				dto.setCompanyName(rs.getString("companyAddr"));
				
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 리스트 조회 시 에러 발생");
		}
		
		return list;
	} 
}
