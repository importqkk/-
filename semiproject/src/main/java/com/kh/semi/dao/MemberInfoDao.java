package com.kh.semi.dao;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.MemberInfoDto;

@Repository
public class MemberInfoDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<MemberInfoDto> mapper=(rs,idx)->{
		MemberInfoDto Dto = new MemberInfoDto();
			Dto.setMemberId(rs.getString("member_id"));
			Dto.setMemberName(rs.getString("member_name"));
			Dto.setMemberPhone(rs.getString("member_phone"));
			Dto.setMemberPost(rs.getString("member_post"));
			Dto.setMemberBasicAddr(rs.getString("member_basic_addr"));
			Dto.setMemberDetailAddr(rs.getString("member_detail_addr"));
	        return Dto;
				
	};
	
	//수취인 기본정보를 불러오는 쿼리문
	public MemberInfoDto memberinfo(String memberId) {
		String sql = "select member_id,member_name,member_phone,member_post,member_basic_addr,member_detail_addr from member where member_Id=?";
		Object[] param = {memberId};
		List<MemberInfoDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
}
