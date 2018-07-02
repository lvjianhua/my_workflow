package com.springmvc.demo;
 
import java.io.IOException;
import java.util.List;
 

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
 

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.springmvc.param.gson.PersonDto;
 
public class HttpClientDemo {
 
	public static void main(String[] args) {
		HttpClient httpClient = HttpClientBuilder.create().build(); // Use this
																	// instead
		HttpGet request = new HttpGet("http://localhost:8080/clotherdye/api/myTest/list");
		request.addHeader("content-type", "application/json");
		request.addHeader("Accept", "application/json");
		try {
			// get with json
			HttpResponse httpResponse = httpClient.execute(request);
			String response = EntityUtils.toString(httpResponse.getEntity());
			Gson gson = new Gson();
			List<PersonDto> embossList = gson.fromJson(response, new TypeToken<List<PersonDto>>(){}.getType());
			if(embossList != null && embossList.size() > 0)
			{				
				System.out.println("Name = " + embossList.get(0).getName());
				System.out.println("Country = " + embossList.get(0).getCountry());
				System.out.println("dddddddddd");
			}
			
			// post data with json
			HttpPost httpPost = new HttpPost("http://localhost:8080/clotherdye/api/myTest/create");
			httpPost.addHeader("content-type", "application/json");
			httpPost.addHeader("Accept", "application/json");
			PersonDto dto = new PersonDto();
			dto.setName("http-client");
			dto.setHobby("json parser");
			dto.setCountry("US");
			dto.setDegree("本科");
			dto.setOccupy("tester");
			String jsonString = gson.toJson(dto);
			StringEntity entity = new StringEntity(jsonString);
			httpPost.setEntity(entity);
			httpResponse = httpClient.execute(httpPost);
			response = EntityUtils.toString(httpResponse.getEntity());
			System.out.println(response);
			
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
		}
	}
}
