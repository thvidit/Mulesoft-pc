package com.cafe.models;

import java.util.List;

public class FoodModel {
	
	int mealId;
	String mealName;
	String mealDesc;
	int mealPrice;
	List<String> list1;
	
	public FoodModel() {
		//Empty Constructor
	}

	public int getMealId() {
		return mealId;
	}

	public void setMealId(int mealId) {
		this.mealId = mealId;
	}

	public String getMealName() {
		return mealName;
	}

	public void setMealName(String mealName) {
		this.mealName = mealName;
	}

	public String getMealDesc() {
		return mealDesc;
	}

	public void setMealDesc(String mealDesc) {
		this.mealDesc = mealDesc;
	}

	public int getMealPrice() {
		return mealPrice;
	}

	public void setMealPrice(int mealPrice) {
		this.mealPrice = mealPrice;
	}

	public List<String> getList1() {
		return list1;
	}

	public void setList1(List<String> list1) {
		this.list1 = list1;
	}
	
	
}
