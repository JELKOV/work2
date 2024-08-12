package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.JDBCUtil;

public class ProductDAO {
    private final String INSERT = "INSERT INTO PRODUCT (NUM, NAME, DETAILS, PRICE, CNT, SELLER) VALUES (?, ?, ?, ?, ?, ?)";
    private final String UPDATE = "UPDATE PRODUCT SET CNT = ? WHERE NUM = ?";
    private final String DELETE = "DELETE FROM PRODUCT WHERE NUM = ?";
    private final String SELECTONE = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT WHERE NUM = ?";
    private final String SELECTALL = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT";
    private final String SELECTALL_BY_NAME = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT WHERE NAME LIKE ?";
    private final String SELECTALL_BY_SELLER = "SELECT NUM, NAME, DETAILS, PRICE, CNT, SELLER FROM PRODUCT WHERE SELLER LIKE ?";

 // 가장 높은 NUM 값을 조회하는 메서드
    public int getMaxNum() {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return -1;
        }

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int maxNum = 0;

        try {
            pstmt = conn.prepareStatement("SELECT MAX(NUM) AS MAX_NUM FROM PRODUCT");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                maxNum = rs.getInt("MAX_NUM");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("[3] DB 데이터 Read 실패...");
        } finally {
            System.err.println("[3] DB 데이터 Read 성공!");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt, rs);
            }
        }
        return maxNum;
    }
    
    public boolean insert(ProductDTO productDTO) {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return false;
        }

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 먼저 입력된 NUM이 중복되는지 확인
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setInt(1, productDTO.getNum());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // NUM이 중복된 경우, 가장 높은 NUM을 조회하여 새로운 NUM 설정
                int maxNum = getMaxNum();
                productDTO.setNum(maxNum + 1);
                System.out.println("중복된 NUM이 발견되었습니다. 새로운 NUM으로 설정: " + productDTO.getNum());
            }

            // 상품 추가 쿼리 실행
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setInt(1, productDTO.getNum());
            pstmt.setString(2, productDTO.getName());
            pstmt.setString(3, productDTO.getDetails());
            pstmt.setInt(4, productDTO.getPrice());
            pstmt.setInt(5, productDTO.getCnt());
            pstmt.setString(6, productDTO.getSeller());

            int result = pstmt.executeUpdate();
            if (result <= 0) {
                System.err.println("SQL문은 올바른데 DTO값이 이상할 수 있음");
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("[3]단계 실패");
            return false;
        } finally {
            System.err.println("DB에 데이터 write <상품 등록>");
            if (pstmt != null || rs != null) {
                JDBCUtil.disconnect(conn, pstmt, rs);
            }
        }
        return true;
    }

    public boolean update(ProductDTO productDTO) {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return false;
        }

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 현재 수량을 가져오기 위해 SELECT 쿼리 실행
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setInt(1, productDTO.getNum());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int currentCnt = rs.getInt("CNT");
                int newCnt = currentCnt - productDTO.getCnt();

                if (newCnt < 0) {
                    System.err.println("재고 수량 부족");
                    return false;
                }

                // 수량 업데이트를 위해 UPDATE 쿼리 실행
                pstmt = conn.prepareStatement(UPDATE);
                pstmt.setInt(1, newCnt);
                pstmt.setInt(2, productDTO.getNum());
                int result = pstmt.executeUpdate();

                if (result <= 0) {
                    System.err.println("상품 수량 업데이트 실패");
                    return false;
                }
            } else {
                System.err.println("상품을 찾을 수 없습니다.");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("[3]단계 실패");
            return false;
        } finally {
            System.err.println("DB에 데이터 update <상품 수량 수정>");
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }


    public boolean delete(ProductDTO productDTO) {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return false;
        }

        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(DELETE);
            pstmt.setInt(1, productDTO.getNum());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("[3]단계 실패");
            return false;
        } finally {
            System.err.println("DB에 데이터 삭제 <상품 삭제>");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt);
            }
        }
        return true;
    }

    public ProductDTO selectOne(ProductDTO productDTO) {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return null;
        }

        PreparedStatement pstmt = null;
        ProductDTO data = null;

        try {
            pstmt = conn.prepareStatement(SELECTONE);
            pstmt.setInt(1, productDTO.getNum());
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                data = new ProductDTO();
                data.setNum(rs.getInt("NUM"));
                data.setName(rs.getString("NAME"));
                data.setDetails(rs.getString("DETAILS"));
                data.setPrice(rs.getInt("PRICE"));
                data.setCnt(rs.getInt("CNT"));
                data.setSeller(rs.getString("SELLER"));
            }
        } catch (SQLException e) {
            System.err.println("[3] DB 데이터 Read 실패...");
            return null;
        } finally {
            System.err.println("[3] DB 데이터 Read 성공!");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt);
            }
        }
        return data;
    }

    public ArrayList<ProductDTO> selectAll(ProductDTO productDTO) {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return null;
        }

        PreparedStatement pstmt = null;
        ArrayList<ProductDTO> productList = new ArrayList<>();

        try {
            // 분기: 상품명, 판매자, 또는 전체 검색
            if ("NAME".equals(productDTO.getCondition())) {
                pstmt = conn.prepareStatement(SELECTALL_BY_NAME);
                pstmt.setString(1, "%" + productDTO.getName() + "%");
            } else if ("SELLER".equals(productDTO.getCondition())) {
                pstmt = conn.prepareStatement(SELECTALL_BY_SELLER);
                pstmt.setString(1, "%" + productDTO.getSeller() + "%");
            } else {
                pstmt = conn.prepareStatement(SELECTALL);
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setNum(rs.getInt("NUM"));
                product.setName(rs.getString("NAME"));
                product.setDetails(rs.getString("DETAILS"));
                product.setPrice(rs.getInt("PRICE"));
                product.setCnt(rs.getInt("CNT"));
                product.setSeller(rs.getString("SELLER"));
                productList.add(product);
            }
        } catch (SQLException e) {
            System.err.println("[3] DB 데이터 Read 실패...");
            return null;
        } finally {
            System.err.println("[3] DB 데이터 Read 성공!");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt);
            }
        }
        return productList;
    }
}
