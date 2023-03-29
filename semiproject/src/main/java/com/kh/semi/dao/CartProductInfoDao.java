package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.CartProductInfoDto;

/*
	장바구니 테이블에 있는 상품 번호로 아래 정보를 조회
	- 장바구니 테이블에서 회원의 아이디
	- 상품 테이블에서 상품의 번호, 브랜드, 이름, 가격, 재고
*/
@Repository
public class CartProductInfoDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<CartProductInfoDto> mapper = new RowMapper<CartProductInfoDto>() {
		@Override
		public CartProductInfoDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return CartProductInfoDto.builder()
						.memberId(rs.getString("member_id"))
						.productNo(rs.getInt("product_no"))
						.productBrand(rs.getString("product_brand"))
						.productName(rs.getString("product_name"))
						.productPrice(rs.getInt("product_price"))
						.productStock(rs.getInt("product_stock"))
						.productCount(rs.getInt("product_count"))
					.build();
		}
	};
	
//	public List<CartProductInfoDto> cartItemInfo(int productNo, String memberId) {
//		String sql = "select * from cart_product_info "
//					+ "where product_no=? and member_id=?";
//		Object[] param = {productNo, memberId};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
	
	public List<CartProductInfoDto> cartItemInfo(String memberId) {
		String sql = "select * from cart_product_info where member_id=?";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	
	
}