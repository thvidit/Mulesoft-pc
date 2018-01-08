package com.football.model;

public class Match {
	
	int match_id;
	String fTeam;
	String sTeam;
	int fGoals;
	int sGoals;
	
	public Match() {
		
	}
	public int getMatch_id() {
		return match_id;
	}
	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}
	public String getfTeam() {
		return fTeam;
	}
	public void setfTeam(String fTeam) {
		this.fTeam = fTeam;
	}
	public String getsTeam() {
		return sTeam;
	}
	public void setsTeam(String sTeam) {
		this.sTeam = sTeam;
	}
	public int getfGoals() {
		return fGoals;
	}
	public void setfGoals(int fGoals) {
		this.fGoals = fGoals;
	}
	public int getsGoals() {
		return sGoals;
	}
	public void setsGoals(int sGoals) {
		this.sGoals = sGoals;
	}
	
	
	

}
