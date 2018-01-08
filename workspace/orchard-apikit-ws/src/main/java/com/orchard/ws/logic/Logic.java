package com.orchard.ws.logic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Map;

import org.mule.DefaultMuleEvent;
import org.mule.DefaultMuleMessage;
import org.mule.MessageExchangePattern;
import org.mule.api.MuleContext;
import org.mule.api.MuleEvent;
import org.mule.api.MuleEventContext;
import org.mule.api.MuleException;
import org.mule.api.MuleMessage;
import org.mule.api.lifecycle.Callable;
import org.mule.construct.Flow;

public class Logic implements Callable{
	
	Database db = new Database();
	String result = "false";
	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {
		MuleMessage message = eventContext.getMessage();
		Map<String, String> queryParams = message.getInboundProperty("http.query.params");
		String leadId = queryParams.get("leadId");
		Connection conn = db.getConnection();
		
		/* System.out.println("Obtained lead id is: " + leadId); */
		
		ResultSet rs = conn.createStatement().executeQuery("Select * from Leads");
		while(rs.next()){
			if(rs.getString("leadsId").equals(leadId)){
				result = "true";
			}
		}
		MuleMessage output = new DefaultMuleMessage(queryParams,eventContext.getMuleContext());
		output.setEncoding("UTF-8");
		output.setPayload(queryParams);
		
		if(result.equals("true")){
			MuleEvent event = invokeMuleFlow(output,eventContext.getMuleContext(),"checked-flow");
		/*	if(event == null)
				return "Some Exception Occured!";
				//Not needed anymore because i have an exception strategy!
			else */
				return "Details Added!";
		}
		else{
			MuleEvent event = invokeMuleFlow(output,eventContext.getMuleContext(),"unchecked-flow");
			/*if(event == null)
				return "Some Exception Occurred!";
			else */
				return "Lead data does not exist for leadId: " + leadId;
		}
		
		
	}
	
	//catching exception using exception strategy in flow
	 public static MuleEvent invokeMuleFlow(MuleMessage muleMessage, MuleContext muleContext,
			  String flowName) throws MuleException{
			  Flow flow = (Flow) muleContext.getRegistry().lookupFlowConstruct(flowName);
			  MuleEvent muleEvent = new DefaultMuleEvent(muleMessage,
			   MessageExchangePattern.REQUEST_RESPONSE, flow);
			   return flow.process(muleEvent);
	 }
}
