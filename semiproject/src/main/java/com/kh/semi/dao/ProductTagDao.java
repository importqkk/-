package com.kh.semi.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductTagDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 동일한 태그를 가지는 모든 productNo 출력 
	public List<Integer> selectAllProductNofromTag(String tagNo) {
		
		// product_tag 테이블에서 tag_no를 받고 그것을 포함한 product_no들을 전부 List<integer>로 출력
		String sql = "select product_no from product_tag where tag_no=?";
		Object[] param = {tagNo};
		List<Integer> list = jdbcTemplate.queryForList(sql,Integer.class,param); // 
		return list.isEmpty() ? null:list; // list가 비었으면 null 아니면 integer형태 리스트를 출력 
	}
}
