package lab.spring.model;

public class ScoreVO {
	
	float score1;
	
	float score2;
	
	float score3;
	
	public float getScore1() {
		return score1;
	}
	public float getScore2() {
		return score2;
	}
	public float getScore3() {
		return score3;
	}
	
	public void setScore1(float score1) {
		this.score1 = score1;
	}
	public void setScore2(float score2) {
		this.score2 = score2;
	}
	public void setScore3(float score3) {
		this.score3 = score3;
	}
	
	@Override
	public String toString() {
		return "ScoreVO [score1=" + score1 + ", score2=" + score2 + ", score3=" + score3 + "]";
	}
	

}
