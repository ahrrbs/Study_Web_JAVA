package com.hanul.Score_A;

import java.io.Serializable;

public class ScoreDTO implements Serializable{
	private int quiz;
	private String pass;
	
	public ScoreDTO() {}

	public ScoreDTO(int quiz, String pass) {
		super();
		this.quiz = quiz;
		this.pass = pass;
	}

	public int getQuiz() {
		return quiz;
	}

	public void setQuiz(int quiz) {
		this.quiz = quiz;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	

}
