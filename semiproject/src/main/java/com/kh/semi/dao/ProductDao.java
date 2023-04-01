package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductDto;
import com.kh.semi.vo.ProductListPaginationVo;

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
	
	// 상품 등록
	public int sequence() {
		String sql = "select product_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	public void insert(ProductDto productDto) {
		String sql = "insert into product values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {productDto.getProductNo(), productDto.getProductName(),
				productDto.getProductBrand(), productDto.getProductPrice(),
				productDto.getProductStock(), productDto.getProductContent(),
				productDto.getProductDeliveryPrice(), productDto.getProductSellCount(),
				productDto.getProductJoin()};
		jdbcTemplate.update(sql, param);
	}
	
	// 상품 삭제
	public boolean delete(int productNo) {
		String sql = "delete product where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 상품 목록
	public List<ProductDto> list(ProductListPaginationVo vo) {
		if(vo.isSearch()) {
			String sql = "select * from ("
							+ "select TMP.*, rownum RN from ("
								+ "select * from product where instr(#1, ?) > 0 "
								+ "order by product_no desc"
							+ ")TMP"
						+ ") where RN between ? and ?";
			sql = sql.replace("#1", vo.getColumn());
			Object[] param = {vo.getKeyword(), vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql, mapper, param);
		}
		else {
			String sql = "select * from ("
							+ "select TMP.*, rownum RN from ("
								+ "select * from product "
								+ "order by product_no desc"
							+ ")TMP"
						+ ") where RN between ? and ?";
			Object[] param = {vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql, mapper, param);
		}
	}
	// 상품 개수
	public int selectCount(ProductListPaginationVo vo) {
		// 검색
		if(vo.isSearch()) {
			String sql = "select count(*) from product where instr(#1, ?) > 0";
			sql = sql.replace("#1", vo.getColumn());
			Object[] param = {vo.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}
		// 목록
		else {
			String sql = "select count(*) from product";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
	
	// 상품 재고 불러오기
	public int selectStock(int productNo) {
		String sql = "select product_stock from product where product_no=?";
		Object[] param = {productNo};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 만든거 가져가야함
	//판매수량 +
	public boolean increaseSellCount(int productCount,int productno) {
		String sql="update product set product_sell_count=product_sell_count + ? where product_no=?";
		Object[] param= {productCount,productno};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//상품재고
	public boolean decreaseStock(int productCount,int productno) {
		String sql="update product set product_stock= product_stock - ? where product_no= ?";
		Object[] param= {productCount,productno};
		return jdbcTemplate.update(sql, param) > 0;
	}
}