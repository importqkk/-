package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductInfoDto;

@Repository
public class ProductInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductInfoDto> mapper = new RowMapper<ProductInfoDto>() {
		@Override
		public ProductInfoDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductInfoDto.builder()
						.productNo(rs.getInt("product_no"))
						.productBrand(rs.getString("product_brand"))
						.productName(rs.getString("product_name"))
						.productPrice(rs.getInt("product_price"))
						.productSellCount(rs.getInt("product_sell_count"))
						.productJoin(rs.getDate("product_join"))
						.reivewAVG(rs.getFloat("avg"))
						.reivewCNT(rs.getInt("cnt"))
						.imgNo(rs.getInt("img_no"))
					.build();
		}
	};
	
	// 상품 번호로 상품 정보 불러오기
	public List<ProductInfoDto> selectOne(int productNo) {
		String sql = "select * from product_info where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	// 최신상품 순서대로 정렬하기
	public List<ProductInfoDto> newList() {
		String sql = "select * from product_info order by product_join desc, product_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	// 많이 팔린 순서대로 정렬하기
	public List<ProductInfoDto> bestList() {
		String sql = "select * from product_info order by product_sell_count desc, product_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
}
