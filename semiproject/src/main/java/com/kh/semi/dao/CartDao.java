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
						.memberId(rs.getString("member_id"))
						.productNo(rs.getInt("product_no"))
						.productCount(rs.getInt("product_count"))
					.build();
		}
	};
	
	// 장바구니에 저장(insert)
	public void cartInsert(CartDto cartDto) {
		String sql = "insert into cart values(?, ?, ?)";
		Object[] param = {cartDto.getMemberId(), cartDto.getProductNo(), 
						cartDto.getProductCount()};
		jdbcTemplate.update(sql, param);
	}
	
	// 장바구니 조회(list)
	public List<CartDto> cartList(String memberId) {
		String sql = "select * from cart where member_id=?";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	// 장바구니 상품 개수 변경(update - set)
	public boolean cartChangeCount(CartDto cartDto) {
		String sql = "update cart set product_count=? "
					+ "where member_id=? and product_no=?";
		Object[] param = {cartDto.getProductCount(), cartDto.getMemberId(), 
						cartDto.getProductNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 장바구니에서 상품 삭제(delete)
	public boolean cartDeleteItem(CartDto cartDto) {
		String sql = "delete cart where member_id=? and product_no=?";
		Object[] param = {cartDto.getMemberId(), cartDto.getProductNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 장바구니에 있는 상품 개수 갱신 기능 (뷰)
	// 금액 정보 업데이트 기능 (뷰)
	
}