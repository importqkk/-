package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductCategoryStatDto;

@Repository
public class ProductCategoryStatDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductCategoryStatDto> mapper = new RowMapper<ProductCategoryStatDto>() {
		@Override
		public ProductCategoryStatDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductCategoryStatDto.builder()
						.tagNo(rs.getInt("tag_no"))
						.productCnt(rs.getInt("product_cnt"))
						.sellAvg(rs.getFloat("sell_avg"))
						.sellMax(rs.getInt("sell_max"))
						.priceAvg(rs.getFloat("price_avg"))
						.priceMax(rs.getInt("price_max"))
						.priceMin(rs.getInt("price_min"))
					.build();
		}
	};
	
	public List<ProductCategoryStatDto> list() {
		String sql = "select * from product_category_stat";
		return jdbcTemplate.query(sql, mapper);
	}
	
}
