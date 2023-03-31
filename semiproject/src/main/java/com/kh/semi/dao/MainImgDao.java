package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.MainImgConnectDto;
import com.kh.semi.dto.MainImgDto;

@Repository
public class MainImgDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<MainImgDto> mapper1 = new RowMapper<MainImgDto>() {
		@Override
		public MainImgDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return MainImgDto.builder()
						.mainNo(rs.getInt("main_no"))
						.imgNo(rs.getInt("img_no"))
						.mainTitle(rs.getString("main_title"))
					.build();
		}
	};
	
	private RowMapper<MainImgConnectDto> mapper2 = new RowMapper<MainImgConnectDto>() {
		@Override
		public MainImgConnectDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return MainImgConnectDto.builder()
						.imgName(rs.getString("img_name"))
						.imgType(rs.getString("img_type"))
						.imgSize(rs.getLong("img_size"))
						.mainNo(rs.getInt("main_no"))
						.mainTitle(rs.getString("main_title"))
						.imgNo(rs.getInt("img_no"))
					.build();
		}
	};
	
	// 메인 번호 뽑기
	public int sequence() {
		String sql = "select main_img_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	// 메인 이미지 등록
	public void mainImgInsert(MainImgDto mainImgDto) {
		String sql = "insert into main_img("
						+ "main_no, img_no, main_title) "
					+ "values(?, ?, ?)";
		Object[] param = {mainImgDto.getMainNo(), mainImgDto.getImgNo(), 
						mainImgDto.getMainTitle()};
		jdbcTemplate.update(sql, param);
	}
	
	// 등록된 메인 이미지 리스트
	public List<MainImgConnectDto> mainImgList() {
		String sql = "select * from main_img_connect order by main_no asc";
		return jdbcTemplate.query(sql, mapper2);
	}
	
	// 단일조회
	public MainImgDto mainImgSelectOne(int mainNo) {
		String sql = "select * from main_img where main_no=?";
		Object[] param = {mainNo};
		List<MainImgDto> list = jdbcTemplate.query(sql, mapper1, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
	// 메인 이미지 정보 삭제
	public void delete(int mainNo) {
		String sql = "delete main_img where main_no=?";
		Object[] param = {mainNo};
		jdbcTemplate.update(sql, param);
	}
	
}
