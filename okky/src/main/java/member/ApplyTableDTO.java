package member;

public class ApplyTableDTO {
	private int recruitIdx;
	private String recruitTitle;
	private String dueDate;
	private String regDate;
	private int memberIdx;
	private String memberId;
	private String name;
	private String email;
	private String orgCompanyFile;
	private String saveCompanyFile;

	public ApplyTableDTO() {}

	public int getRecruitIdx() {
		return recruitIdx;
	}

	public void setRecruitIdx(int recruitIdx) {
		this.recruitIdx = recruitIdx;
	}

	public String getRecruitTitle() {
		return recruitTitle;
	}

	public void setRecruitTitle(String recruitTitle) {
		this.recruitTitle = recruitTitle;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOrgCompanyFile() {
		return orgCompanyFile;
	}

	public void setOrgCompanyFile(String orgCompanyFile) {
		this.orgCompanyFile = orgCompanyFile;
	}

	public String getSaveCompanyFile() {
		return saveCompanyFile;
	}

	public void setSaveCompanyFile(String saveCompanyFile) {
		this.saveCompanyFile = saveCompanyFile;
	}

}
