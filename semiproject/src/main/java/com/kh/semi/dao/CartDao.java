package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.CartDto;

@Repository
public class CartDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// mapper
	private RowMapper<CartDto> mapper = new RowMapper<CartDto>() {
		@Override
		public CartDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return CartDto.builder()
						.cartNo(rs.getInt("cart_no"))
						.cartCount(rs.getInt("cart_count"))
						.cartPrice(rs.getInt("cart_price"))
						.productNo(rs.getInt("product_no"))
						.memberId(rs.getString("member_id"))
					.build();
		}
	};
	
	// 장바구니에 저장(insert)
	public void cartInsert(CartDto cartDto) {
		String sql = "insert into cart values(cart_seq.nextval, ?, ?, ?, ?)";
		Object[] param = {cartDto.getCartCount(), cartDto.getCartPrice(),
						cartDto.getProductNo(), cartDto.getMemberId()};
		jdbcTemplate.update(sql, param);
	}
	
	// 해당 사용자의 장바구니 찾기(select)
	public List<CartDto> cartList(String memberId) {
		String sql = "select * from cart where member_id=?";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	// 장바구니 내의 상품 찾기
//	public ProductDto cartItem(String memberId) {
//		String sql = "select * from product where product_no = "
//					+ "(select product_no from cart where member_id=?)";
//		Object[] param = {memberId};
//		List<CartDto> list = jdbcTemplate.query(sql, mapper, param);
//		return list.isEmpty() ? null : list.get(0);
//	}
	
	// 장바구니 상품 개수 변경(update - set)
	public boolean cartIncreaseCount(CartDto cartDto) {
		String sql = "update cart set cart_count=? "
					+ "where cart_no=? and product_no=?";
		Object[] param = {cartDto.getCartNo(), cartDto.getProductNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 장바구니에서 상품 삭제(delete)
	public boolean cartDeleteItem(int productNo) {
		String sql = "delete * from cart where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
}
