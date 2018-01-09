package com.mule.encrypt;

import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.Map;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import org.mule.api.MuleEventContext;
import org.mule.api.MuleMessage;
import org.mule.api.lifecycle.Callable;


public class EncryptData implements Callable{
	
	public Object onCall(MuleEventContext eventContext) throws Exception {
		MuleMessage message = eventContext.getMessage();
		Map<String, String> queryParams = message.getInboundProperty("http.query.params");
		String pass = queryParams.get("pass");
		String salt = "dmlkaXRrdW1hcg==";
		String encrypted = getEncryptedPassword(pass,salt);
		return encrypted;

	}

	 public String getEncryptedPassword(String password, String salt) throws Exception {
		String algorithm = "PBKDF2WithHmacSHA1";
		int derivedKeyLength = 160;
		int iterations = 20000;
							 
		byte[] saltBytes = Base64.getDecoder().decode(salt);
		KeySpec spec = new PBEKeySpec(password.toCharArray(), saltBytes, iterations, derivedKeyLength);
							 
		SecretKeyFactory f = SecretKeyFactory.getInstance(algorithm);
		byte[] encBytes = f.generateSecret(spec).getEncoded();
							 
		return Base64.getEncoder().encodeToString(encBytes);
		 
	}

}
