package member;

public class ApplyTableDTO {
	private int recruitIdx;
	private String recruitTitle;
	private String dueDate;
	private int memberIdx;
	
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

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

}
