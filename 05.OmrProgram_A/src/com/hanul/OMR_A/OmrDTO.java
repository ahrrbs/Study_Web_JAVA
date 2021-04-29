package com.hanul.OMR_A;

import java.io.Serializable;

public class OmrDTO implements Serializable{
	private int onumber;	//수험번호
	private String name;	//이름
	private int score;		//점수
	private String result;	//결과
	
	public OmrDTO() {}

	public OmrDTO(int onumber, String name, int score, String result) {
		super();
		this.onumber = onumber;
		this.name = name;
		this.score = score;
		this.result = result;
	}

	public int getOnumber() {
		return onumber;
	}

	public void setOnumber(int onumber) {
		this.onumber = onumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
		
}//class
