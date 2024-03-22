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
		sb.append("SELECT m.companyName, m.type, r.recruitIdx, r.position, r.career, r.companyAddr, r.contractType ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE companyName IS NOT NULL AND contractType = '정규직'");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				JobDTO dto = new JobDTO();
				
				dto.setCompanyName(rs.getString("companyName"));
				dto.setType(rs.getString("type"));
				dto.setRecruitIdx(rs.getInt("recruitIdx"));
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
	
	// 공고 글 조회
	public JobDTO getJobDetail(int recruitIdx){
		JobDTO dto = new JobDTO();
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT m.companyName, r.regDate, r.readCnt, r.position, r.career, r.companyAddr, r.recruitContent ");
		sb.append("FROM recruit AS r INNER JOIN member AS m ON m.memberIdx = r.memberIdx ");
		sb.append("WHERE r.recruitIdx=?");
		
		try {
			psmt = conn.prepareStatement(sb.toString());
			psmt.setInt(1, recruitIdx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setCompanyName(rs.getString("companyName"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setReadCnt(rs.getInt("readCnt"));
				dto.setPosition(rs.getString("position"));
				dto.setCareer(rs.getString("career"));
				dto.setCompanyAddr(rs.getString("companyAddr"));
				dto.setRecruitContent(rs.getString("recruitContent"));				
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("공고 리스트 조회 시 에러 발생");
		}
		
		return dto;
	}
	
	// 공고 글 작성
	public int insertRecruit(JobDTO dto) {
		int result = 0;
		
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO recruit(companyAddr, salary, position, contractType, career, recruitContent, regDate, memberIdx) ");
		sb.append("VALUES (?, ?, ?, ?, ?, ?, now(), ?)");
		
		if(dto.getMemberIdx() != 0) {
			try {
				psmt = conn.prepareStatement(sb.toString());
				psmt.setString(1, dto.getCompanyAddr());
				psmt.setString(2, dto.getSalary());
				psmt.setString(3, dto.getPosition());
				psmt.setString(4, dto.getContractType());
				psmt.setString(5, dto.getCareer());
				psmt.setString(6, dto.getRecruitContent());
				psmt.setInt(7, dto.getMemberIdx());
				
				result = psmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("공고 글 작성 시 에러 발생");
			}
		} else {
			result = 0;
		}
		
		return result;
	}
	
}
