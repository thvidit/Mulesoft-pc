package com.football.java;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jws.WebService;

import org.json.JSONArray;
import org.json.JSONObject;

import com.football.database.Database;
import com.football.model.Match;

@WebService(endpointInterface="com.football.java.MethodsInterface", serviceName="getAllMatches")
public class MethodsImplementation implements MethodsInterface{

	Database db = new Database();
	
	@Override
	public List<Match> getAllMatches() {
		try {
			Connection conn =  db.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM MATCHES";
			ResultSet rs = stmt.executeQuery(query);
			List<Match> matches = new ArrayList();
			while(rs.next()){
				Match match = new Match();
				match.setMatch_id(rs.getInt(1));
				match.setfTeam(rs.getString(3));
				match.setsTeam(rs.getString(4));
				match.setfGoals(rs.getInt(5));
				match.setsGoals(rs.getInt(6));
				matches.add(match);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public List<Match> getMatches(String team) {
		try {
			Connection conn =  db.getConnection();
			Statement stmt = conn.createStatement();
			String query = "SELECT * FROM MATCHES where first_team_name= '" + team + "'";
			ResultSet rs = stmt.executeQuery(query);
			List<Match> matches = new ArrayList();
			while(rs.next()){
				Match match = new Match();
				match.setMatch_id(rs.getInt(1));
				match.setfTeam(rs.getString(3));
				match.setsTeam(rs.getString(4));
				match.setfGoals(rs.getInt(5));
				match.setsGoals(rs.getInt(6));
				matches.add(match);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public Match addMatch(Match match) {
		Connection con;
		try {
			con = db.getConnection();
			Statement stmt = con.createStatement();
			String query = "INSERT INTO matches (MATCH_DATE,FIRST_TEAM_NAME,SECOND_TEAM_NAME,FIRST_TEAM_GOALS,SECOND_TEAM_GOALS) VALUES (" +"Timestamp " + 
					   "'2013-02-16 04:30:00" + "', '" +  match.getfTeam() + "', '" + match.getsTeam() + "', '" + match.getfGoals() +"', '" + match.getsGoals() +"')";
			stmt.executeUpdate(query);
			return match;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
