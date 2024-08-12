package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {

    private static final String driverName = "oracle.jdbc.driver.OracleDriver";
    private static final String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String userName = "AHNJAEHO";
    private static final String password = "1234";

    // [1,2]단계: 드라이버 로드 및 연결 객체 확보
    public static Connection connect() {
        Connection conn = null;

        try {
            Class.forName(driverName);
            System.out.println("드라이버를 메모리에 로드(load, 적재) 성공");
        } catch (ClassNotFoundException e) {
            System.err.println("[1]단계 실패: 드라이버 로드 실패 - " + e.getMessage());
        }

        try {
            conn = DriverManager.getConnection(url, userName, password);
            System.out.println("연결 객체 확보 성공");
        } catch (SQLException e) {
            System.err.println("[2]단계 실패: 연결 객체 확보 실패 - " + e.getMessage());
        }

        return conn;
    }

    // [4]단계: 자원 해제 (Connection 및 PreparedStatement)
    public static boolean disconnect(Connection conn, PreparedStatement pstmt) {
        try {
            if (pstmt != null && !pstmt.isClosed()) {
                pstmt.close();
            }
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
            System.out.println("연결 해제 성공");
        } catch (SQLException e) {
            System.err.println("[4]단계 실패: 자원 해제 실패 - " + e.getMessage());
            return false;
        }
        return true;
    }

    // 오버로딩: 자원 해제 (Connection, PreparedStatement 및 ResultSet)
    public static boolean disconnect(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
            return disconnect(conn, pstmt);
        } catch (SQLException e) {
            System.err.println("[4]단계 실패: ResultSet 해제 실패 - " + e.getMessage());
            return false;
        }
    }
}
