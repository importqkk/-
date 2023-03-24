package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.MemberDto;

@Repository
public class MemberDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void insert(MemberDto memberDto) {
		String sql = "insert into member("
					+ "member_id, member_name, member_nick, member_pw,"
					+ "member_phone, member_email, member_post,"
					+ "member_basic_addr, member_detail_addr,"
					+ "member_point, member_join, member_role"
				+ ") values("
					+ "?, ?, ?, ?, ?, null, ?, ?, ?, ?, sysdate, '일반회원'"
				+ ")";
		Object[] param = {
			memberDto.getMemberId(), memberDto.getMemberName(),
			memberDto.getMemberNick(), memberDto.getMemberPw(), memberDto.getMemberPhone(),
			memberDto.getMemberEmail(), memberDto.getMemberPost(),
			memberDto.getMemberBasicAddr(),
			memberDto.getMemberDetailAddr(),memberDto.getMemberPoint(),
			memberDto.getMemberJoin(), memberDto.getMemberRole()
		};
		jdbcTemplate.update(sql, param);
	}
	
	//조회를 위한 RowMapper 구현
	private RowMapper<MemberDto> mapper = new RowMapper<MemberDto>() {
		@Override
		public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberNick(rs.getString("member_nick"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberEmail(rs.getString("member_email"));
			memberDto.setMemberPost(rs.getInt("member_post"));
			memberDto.setMemberBasicAddr(rs.getString("member_basic_addr"));
			memberDto.setMemberDetailAddr(rs.getString("member_detail_addr"));
			memberDto.setMemberPoint(rs.getInt("member_point"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));
			return memberDto;
		}
	};
	
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] param = {memberId};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
//	최종 로그인 시각만 갱신하는 기능(로그인 성공 시 호출)
//	public boolean updateMemberLogin(String memberId) {
//		String sql = "update member "
//						+ "set member_login = sysdate "
//						+ "where member_id = ?";
//		Object[] param = {memberId};
//		return jdbcTemplate.update(sql, param) > 0;
//	}
}