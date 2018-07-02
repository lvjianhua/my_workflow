package com.springmvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.param.gson.PersonDto;
 
@Controller
@RequestMapping("/api/myTest")
public class RestfulAPIController {
	
	
	@RequestMapping("/list")
	public @ResponseBody List<PersonDto> getList() {
		List<PersonDto> persons = new ArrayList<PersonDto>();
		PersonDto p1 = new PersonDto();
		p1.setCountry("中国");
		p1.setDegree("本科");
		p1.setHobby("编程");
		p1.setName("zhigang");
		p1.setOccupy("程序员");
		
		PersonDto p2 = new PersonDto();
		p2.setCountry("中国");
		p2.setDegree("本科");
		p2.setHobby("图像处理");
		p2.setName("jia20003");
		p2.setOccupy("码农");
		
		persons.add(p1);
		persons.add(p2);
		System.out.println("start to get PersonDto list");
		return persons;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createMember(@RequestBody PersonDto dto)
	{
		System.out.println(dto.getName());
		System.out.println(dto.getOccupy());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", dto.getName() + "创建成功!");
		return map;
	}
}
