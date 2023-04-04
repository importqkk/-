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
				+ "member_point, member_join, member_role,"
				+ "agree_tos, agree_privacy, agree_promotion"
			+ ") values("
				+ "?, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate, '일반회원', ?, ?, ?"
			+ ")";
		Object[] param = {
				memberDto.getMemberId(), 
				memberDto.getMemberName(),
				memberDto.getMemberNick(), 
				memberDto.getMemberPw(), 
				memberDto.getMemberPhone(),
				memberDto.getMemberEmail(), 
				memberDto.getMemberPost(),
				memberDto.getMemberBasicAddr(),
				memberDto.getMemberDetailAddr(),
//				memberDto.getMemberPoint(),
//				memberDto.getMemberJoin(), 
//				memberDto.getMemberRole(),
				memberDto.getAgreeTos(), 
				memberDto.getAgreePrivacy(),
				memberDto.getAgreePromotion()
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
			memberDto.setMemberPost(rs.getString("member_post"));
			memberDto.setMemberBasicAddr(rs.getString("member_basic_addr"));
			memberDto.setMemberDetailAddr(rs.getString("member_detail_addr"));
			memberDto.setMemberPoint(rs.getInt("member_point"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));
			return memberDto;
		}
	};
	//비동기
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] param = {memberId};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	public MemberDto selectByNickname(String memberNick) {
		String sql = "select * from member where member_nick = ?";
		Object[] param = {memberNick};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	public MemberDto selectByEmail(String memberEmail) {
		String sql = "select * from member where member_email = ?";
		Object[] param = {memberEmail};
		List<MemberDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
//	이메일로 아이디 찾기
	public String findId(MemberDto memberDto) {
		String sql = "select member_id from member "
				+ "where member_email=?";
		Object[] param = {
			memberDto.getMemberEmail()
			};
		return jdbcTemplate.queryForObject(sql, String.class, param);
	}
//	아이디와 이메일로 비밀번호 찾기
	public String findPw(MemberDto memberDto) {
		String sql = "select member_pw from member "
				+ "where member_id=? and member_email=?";
		Object[] param = {
			memberDto.getMemberId(), memberDto.getMemberEmail()
			};
		return jdbcTemplate.queryForObject(sql, String.class, param);
	}
//	비밀번호 변경 기능
	public boolean changePassword(String memberId, String memberPw) {
		String sql = "update member set member_pw = ? where member_id = ?";
		Object[] param = {memberPw, memberId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
//	비밀번호를 제외한 나머지 정보 변경 기능
	public boolean changeInformation(MemberDto memberDto) {
		String sql = "update member set "
						+ "member_nick=?, member_phone=?, "
						+ "member_email=?,"
						+ "member_post=?, member_basic_addr=?, "
						+ "member_detail_addr=? "
						+ "where member_id = ?";
		Object[] param = {
			memberDto.getMemberNick(), memberDto.getMemberPhone(),
			memberDto.getMemberEmail(), memberDto.getMemberPost(), 
			memberDto.getMemberBasicAddr(),memberDto.getMemberDetailAddr(), 
			memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}

//	회원 삭제(탈퇴)
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] param = {memberId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
	//훈 만든거
	//멤버 포인트조회
		public int point(String memberId) {
			String sql="select member_point from member where member_id= ? ";
			Object[] param= {memberId};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}
	
}