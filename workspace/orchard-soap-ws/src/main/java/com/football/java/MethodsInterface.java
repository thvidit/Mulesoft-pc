package com.football.java;

import java.sql.ResultSet;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;
import com.football.model.Match;

@WebService
public interface MethodsInterface {
	
	@WebMethod
	public List<Match> getAllMatches();
	
	@WebMethod
	public List<Match> getMatches(String team);
	
	@WebMethod
	public Match addMatch(Match match);
	
}
