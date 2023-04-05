package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.DetailImgDto;

@Repository
public class DetailImgDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<DetailImgDto> mapper = new RowMapper<DetailImgDto>() {
		@Override
		public DetailImgDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return DetailImgDto.builder()
						.productNo(rs.getInt("product_no"))
						.imgNo(rs.getInt("img_no"))
					.build();
		}
	};
	
	// 상세 이미지 등록
	public void insert(DetailImgDto detailImgDto) {
		String sql = "insert into detail_img values(?, ?)";
		Object[] param = {detailImgDto.getProductNo(), detailImgDto.getImgNo()};
		jdbcTemplate.update(sql, param);
	}
	
	// 상세 이미지 조회
	public DetailImgDto selectOne(int productNo) {
		String sql = "select * from detail_img where product_no=?";
		Object[] param = {productNo};
		List<DetailImgDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
}
