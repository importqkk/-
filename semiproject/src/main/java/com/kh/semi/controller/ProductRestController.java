package com.kh.semi.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = {"*"})
@RestController
@RequestMapping("/rest")
public class ProductRestController {
	
	private String number = "1"; 
	
	@PostMapping("/number")
	public Map<String, Object> changeNumber(@RequestBody Map<String, String> data) {
		String newNumber = data.get("number");
		number = newNumber;		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("number", number);
		return resultMap;
	}
}