package com.kh.semi.component;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Component;

@Component
public class RandomComponent {

	private List<String> data = new ArrayList<>();
	private Random ran = new Random();
	
	@PostConstruct
//	public void init() {
//		for(char i = 'A'; i <= 'Z'; i++) data.add(String.valueOf(i));
//		for(char j = 'a'; j <= 'z'; j++) data.add(String.valueOf(j));
//		for(char k = '0'; k <= '9'; k++) data.add(String.valueOf(k));
//		data.add("!");
//		data.add("@");
//		data.add("#");
//		data.add("$");
//		data.add("%");
//		data.add("^");
//		data.add("&");
//		data.add("*");
//		data.add("?");
//		data.add("=");
//		data.add("+");
//		data.add("_");
//		data.add("-");
	public void init() {
		for(char i='A'; i <= 'Z'; i++) 	data.add(String.valueOf(i));
		for(char i='a'; i <= 'z'; i++) 	data.add(String.valueOf(i));
		for(char i='0'; i <= '9'; i++) 	data.add(String.valueOf(i));
		data.add("!");
		data.add("@");
		data.add("#");
		data.add("$");
	}
	
	public String generateString() {
		StringBuffer buffer = new StringBuffer();
		while(true) {
			int size = ran.nextInt(8, 16);
			buffer.setLength(0);
			for(int i = 0; i < size; i++) {
				int index = ran.nextInt(data.size());
				buffer.append(data.get(index));
			}
			if(buffer.toString().matches("^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*?=+_-])[A-Za-z0-9!@#$%^&*?=+_-]{8,16}$")) {
				System.out.println(buffer);
				break;
			}
		}
		return buffer.toString();
	}
	
}