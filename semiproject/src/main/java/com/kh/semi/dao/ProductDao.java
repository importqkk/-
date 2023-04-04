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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ProductInfoDto;

@Repository
public class ProductDao {

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
						.detailImgNo(rs.getInt("detail_img_no"))
					.build();
		}
	};
	private RowMapper<ProductDto> mapper1 = new RowMapper<ProductDto>() {
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
	
	
	// 상품 번호로 상품 정보 불러오기
	public ProductInfoDto selectOne(int productNo) {
			String sql = "select * from product_info where product_no=?";
			Object[] param = {productNo};
			List<ProductInfoDto> list = jdbcTemplate.query(sql,mapper,param);
			return list.isEmpty() ? null:list.get(0);
	}
	
	// 상품 검색
	public String productCount(String keyword) {
		String sql = "select count(*) from Product_info where instr(product_name,?) > 0 order by product_sell_count desc, product_no desc";
		Object[] param = {keyword};
		return jdbcTemplate.queryForObject(sql, String.class, param);
	}	 
	public List<ProductInfoDto> searchBest(String keyword){
		String sql = "select * from Product_info where instr(product_name,?) > 0 order by product_sell_count desc, product_no desc";
		Object[] param = {keyword}; 
		return jdbcTemplate.query(sql, mapper,param);
	}
	public List<ProductInfoDto> searchNew(String keyword){
		String sql = "select * from Product_info where instr(product_name,?) > 0 order by product_join desc, product_no desc";
		Object[] param = {keyword}; 
		return jdbcTemplate.query(sql, mapper,param);
	}
	public List<ProductInfoDto> searchCheap(String keyword){
		String sql = "select * from Product_info where instr(product_name,?) > 0 order by product_price asc, product_no desc";
		Object[] param = {keyword}; 
		return jdbcTemplate.query(sql, mapper,param);
	}
	public List<ProductInfoDto> searchExpensive(String keyword){
		String sql = "select * from Product_info where instr(product_name,?) > 0 order by product_price desc, product_no desc";
		Object[] param = {keyword}; 
		return jdbcTemplate.query(sql, mapper,param);
	}
		
		
	// 상품 전체 리스트 
	public String allCount() {
		String sql = "select count(*) from product";
		return jdbcTemplate.queryForObject(sql, String.class);
	}	
	public List<ProductInfoDto> selectAll(){ // 전체
		String sql = "select * from product_info";
		List<ProductInfoDto> list = jdbcTemplate.query(sql,mapper);
		return list.isEmpty() ? null:list;
	} 
	public List<ProductInfoDto> bestAll(){// 인기순(판매순)
		String sql = "select * from product_info order by product_sell_count desc, product_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	public List<ProductInfoDto> newAll(){ // 최신순
		String sql = "select * from product_info order by product_Join desc";
		return jdbcTemplate.query(sql, mapper);
	}
	public List<ProductInfoDto> cheapAll(){// 낮은 가격순 
		String sql = "select * from product_info order by product_price asc, product_no desc";
		return jdbcTemplate.query(sql, mapper); 
	}
	public List<ProductInfoDto> expensiveAll(){// 높은 가격순  
		String sql = "select * from product_info order by product_price desc, product_no desc";
		return jdbcTemplate.query(sql, mapper); 
	}
	
	
	
	// 태그1111111111111111111111111111111111111111111111111
	public String tag1Count() {
		String sql = "select count(*) from product_info where tag_no=1";
		return jdbcTemplate.queryForObject(sql, String.class);
	}	
	public List<ProductInfoDto> bestTag1(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=1 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag1(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=1 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag1(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=1 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag1(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=1 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
	
	// 태그111111111111111111111111111111111111111111111111111
	
	
	
	// 태그222222222222222222222222222222222222222222222222222
	public String tag2Count() {
		String sql = "select count(*) from product_info where tag_no=2";
		return jdbcTemplate.queryForObject(sql, String.class);
	}	
	public List<ProductInfoDto> bestTag2(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=2 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag2(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=2 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag2(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=2 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag2(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=2 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
	// 태그222222222222222222222222222222222222222222222222222
	
	
	// 태그333333333333333333333333333333333333333333333333333
	public String tag3Count() {
		String sql = "select count(*) from product_info where tag_no=3";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	
	public List<ProductInfoDto> bestTag3(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=3 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag3(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=3 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag3(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=3 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag3(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=3 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 태그333333333333333333333333333333333333333333333333333
	
	
	
	// 태그444444444444444444444444444444444444444444444444444
	public String tag4Count() {
		String sql = "select count(*) from product_info where tag_no=4";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	public List<ProductInfoDto> bestTag4(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=4 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag4(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=4 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag4(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=4 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag4(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=4 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 태그44444444444444444444444444444444444444444444444444444444444
		
	
		
	// 태그555555555555555555555555555555555555555555555555555555555
	public String tag5Count() {
		String sql = "select count(*) from product_info where tag_no=5";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	public List<ProductInfoDto> bestTag5(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=5 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag5(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=5 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag5(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=5 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag5(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=5 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 태그555555555555555555555555555555555555555555555555555
		
	

	
	// 66666666666666666666666666666666666666666666666666
	public String tag6Count() {
		String sql = "select count(*) from product_info where tag_no=6";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	public List<ProductInfoDto> bestTag6(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=6 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag6(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=6 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag6(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=6 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag6(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=6 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 66666666666666666666666666666666666666666666666

	
	
	// 7777777777777777777777777777777777777777777777777
	public String tag7Count() {
		String sql = "select count(*) from product_info where tag_no=7";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	public List<ProductInfoDto> bestTag7(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=7 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag7(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=7 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag7(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=7 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag7(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=7 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 777777777777777777777777777777777777777777777
	
	
	
	// 888888888888888888888888888888888888888888888
	public String tag8Count() {
		String sql = "select count(*) from product_info where tag_no=8";
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	public List<ProductInfoDto> bestTag8(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=8 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag8(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=1 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag8(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=8 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag8(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=8 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
		//8888888888888888888888888888888888888888888
	
	// 서영
		public ProductDto selectOneInfo(int productNo) {
			String sql = "select * from product where product_no=?";
			Object[] param = {productNo};
			List<ProductDto> list = jdbcTemplate.query(sql,mapper1,param);
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
				return jdbcTemplate.query(sql, mapper1, param);
			}
			else {
				String sql = "select * from ("
								+ "select TMP.*, rownum RN from ("
									+ "select * from product "
									+ "order by product_no desc"
								+ ")TMP"
							+ ") where RN between ? and ?";
				Object[] param = {vo.getBegin(), vo.getEnd()};
				return jdbcTemplate.query(sql, mapper1, param);
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
		
		// 상품 수정
		public boolean editInfo(ProductDto productDto) {
			String sql = "update product set product_name=?, product_brand=?, product_price=?, "
							+ "product_stock=?, product_content=?, product_delivery_price=?, "
							+ "product_sell_count=?, product_join=? "
						+ "where product_no=?";
			Object[] param = {productDto.getProductName(), productDto.getProductBrand(),
							productDto.getProductPrice(), productDto.getProductStock(),
							productDto.getProductContent(), productDto.getProductDeliveryPrice(),
							productDto.getProductSellCount(), productDto.getProductJoin(),
							productDto.getProductNo()};
			return jdbcTemplate.update(sql, param) > 0;
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