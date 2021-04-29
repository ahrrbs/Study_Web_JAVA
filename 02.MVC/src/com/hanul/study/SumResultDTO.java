package com.hanul.study;

import java.io.Serializable;

public class SumResultDTO implements Serializable{
	private int num1, num2, sum;
	
	public SumResultDTO() {
		
	}

	public SumResultDTO(int num1, int num2, int sum) {
		super();
		this.num1 = num1;
		this.num2 = num2;
		this.sum = sum;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
	
}
