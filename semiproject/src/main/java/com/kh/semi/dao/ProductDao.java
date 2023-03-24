package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductDto;

@Repository
public class ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductDto> mapper = new RowMapper<ProductDto>() {

		@Override
		public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductDto productDto = new ProductDto();
			productDto.setProductNo(rs.getInt("product_no"));
			productDto.setProductName(rs.getString("product_name"));
			productDto.setProductBrand(rs.getString("product_brand"));
			productDto.setProductPrice(rs.getInt("product_price"));
			productDto.setProductStock(rs.getInt("product_stock"));
			productDto.setProductContent(rs.getString("product_content"));
			productDto.setProductDeliveryPrice(rs.getInt("product_delivery_price"));
			productDto.setProductSellCount(rs.getInt("product_sell_count"));
			productDto.setProductJoin(rs.getDate("product_join"));
			return productDto;
		}
	};
	
	public ProductDto selectOne(int productNo) {
		String sql = "select * from product where product_no=?";
		Object[] param = {productNo};
		List<ProductDto> list = jdbcTemplate.query(sql,mapper,param);
		return list.isEmpty() ? null:list.get(0);
	}
	
}