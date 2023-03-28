package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ProductDto;
import com.kh.semi.dto.TagDto;

@Repository
public class TagDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private RowMapper<TagDto> mapper = new RowMapper<TagDto>() {

		@Override
		public TagDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			TagDto tagDto = new TagDto();
			tagDto.setTagNo(rs.getInt("tag_no"));
			tagDto.setTagName(rs.getString("tag_name"));
			return tagDto;
		}
		
		
	};
	
	// 모든 tagDto 출력 
	public List<TagDto> selectAllfromTag(String tagName) {
		String sql = "select * from tag";
		List<TagDto> list = jdbcTemplate.query(sql,mapper);
		return list.isEmpty() ? null:list;
	}
		
}
