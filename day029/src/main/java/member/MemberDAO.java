package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.JDBCUtil;

public class MemberDAO {
    private final String INSERT = "INSERT INTO MEMBER (MID, PASSWORD, NAME, ROLE) VALUES (?, ?, ?, ?)";
    private final String UPDATE = "UPDATE MEMBER SET NAME=? WHERE MID=?";
    private final String DELETE = "DELETE FROM MEMBER WHERE MID=?";
    private final String CHECKID = "SELECT MID, PASSWORD, NAME, ROLE FROM MEMBER WHERE MID=?";
    private final String SELECTONE = "SELECT MID, PASSWORD, NAME, ROLE FROM MEMBER WHERE MID=? AND PASSWORD=?";

    public boolean insert(MemberDTO memberDTO) {
        Connection conn = JDBCUtil.connect();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(INSERT);
            pstmt.setString(1, memberDTO.getMid());
            pstmt.setString(2, memberDTO.getPassword());
            pstmt.setString(3, memberDTO.getName());
            pstmt.setString(4, memberDTO.getRole());
            int result = pstmt.executeUpdate(); // int를 리턴
            if (result <= 0) {
                System.err.println("SQL문은 올바른데 DTO값이 이상할수도 있음");
                return false;
            }
        } catch (SQLException e) {
            System.err.println("[3]단계 실패");
            return false;
        } finally {
            System.err.println("DB에 데이터 write <가입>");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt);
            }
        }
        return true;
    }

    public boolean update(MemberDTO memberDTO) {
        Connection conn = JDBCUtil.connect();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(UPDATE);
            pstmt.setString(1, memberDTO.getName());
            pstmt.setString(2, memberDTO.getMid());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("[3]단계 실패");
            return false;
        } finally {
            System.err.println("DB에 데이터 write <비밀번호변경성공>");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt);
            }
        }
        return true;
    }

    public boolean delete(MemberDTO memberDTO) {
        Connection conn = JDBCUtil.connect();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(DELETE);
            pstmt.setString(1, memberDTO.getMid());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("[3]단계 실패");
            return false;
        } finally {
            System.err.println("DB에 데이터 write <삭제성공>");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt);
            }
        }
        return true;
    }

    public MemberDTO selectOne(MemberDTO memberDTO) {
        Connection conn = JDBCUtil.connect();
        if (conn == null) {
            System.err.println("Database connection failed.");
            return null;
        }

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO data = null;

        try {
            if (memberDTO.getCondition().equals("IDCHECK")) {
                pstmt = conn.prepareStatement(CHECKID);
                pstmt.setString(1, memberDTO.getMid());
                System.out.println("Executing CHECKID for MID: " + memberDTO.getMid());
            } else if (memberDTO.getCondition().equals("LOGIN")) {
                pstmt = conn.prepareStatement(SELECTONE);
                pstmt.setString(1, memberDTO.getMid());
                pstmt.setString(2, memberDTO.getPassword());
                System.out.println("Executing LOGIN for MID: " + memberDTO.getMid());
            }

            rs = pstmt.executeQuery();

            if (rs.next()) {
                data = new MemberDTO();
                data.setMid(rs.getString("MID"));           // MID 열 이름 확인
                data.setPassword(rs.getString("PASSWORD")); // PASSWORD 열 이름 확인
                data.setName(rs.getString("NAME"));         // NAME 열 이름 확인
                data.setRole(rs.getString("ROLE"));         // ROLE 열 이름 확인 (LOGIN 조건에서만 사용)
                System.out.println("Found member: " + data.getMid());
            } else {
                System.out.println("No member found with MID: " + memberDTO.getMid());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("[3] DB 데이터 Read 실패....");
            return null;
        } finally {
            System.err.println("[3] DB 데이터 Read 성공!");
            if (pstmt != null) {
                JDBCUtil.disconnect(conn, pstmt, rs);
            }
        }
        return data;
    }
}
