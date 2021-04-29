package com.hanul.study;

import java.io.Serializable;

public class BookDTO implements Serializable{
	private String title, name, isbn, comp;
	private int cost, su, price;
	
	public BookDTO() {}

	public BookDTO(String title, String name, String isbn, String comp, int cost, int su) {
		super();
		this.title = title;
		this.name = name;
		this.isbn = isbn;
		this.comp = comp;
		this.cost = cost;
		this.su = su;
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getComp() {
		return comp;
	}

	public void setComp(String comp) {
		this.comp = comp;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getSu() {
		return su;
	}

	public void setSu(int su) {
		this.su = su;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}

	
	
}//class
