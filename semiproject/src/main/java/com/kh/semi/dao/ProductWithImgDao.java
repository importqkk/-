package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductWIthImgDto;

@Repository
public class ProductWithImgDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductWIthImgDto> mapper = new RowMapper<ProductWIthImgDto>() {
		@Override
		public ProductWIthImgDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductWIthImgDto.builder()
						.productNo(rs.getInt("product_no"))
						.productName(rs.getString("product_name"))
						.productBrand(rs.getString("product_brand"))
						.productPrice(rs.getInt("product_price"))
						.productStock(rs.getInt("product_stock"))
						.productContent(rs.getString("product_content"))
						.productDeleveryPrice(rs.getInt("product_delevery_price"))
						.productSellCount(rs.getInt("product_sell_count"))
						.productJoin(rs.getDate("product_join"))
						.imgNo(rs.getInt("img_no"))
					.build();
		}
	};
	
	public ProductWIthImgDto selectOne(int productNo) {
		String sql = "select * from product_with_img where product_no=?";
		Object[] param = {productNo};
		List<ProductWIthImgDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
}
