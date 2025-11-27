package org.example.project2_2.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into BOARD (title, writer, email, password, category, content) values (?,?,?,?,?,?)";
    private final String BOARD_UPDATE = "update BOARD set title=?, writer=?, email=?, category=?, content=? where id=?";
    private final String BOARD_DELETE = "delete from BOARD where id=?";
    private final String BOARD_GET = "select * from BOARD where id=?";
    private final String BOARD_LIST = "select * from BOARD order by id desc";
    private final String BOARD_SEARCH = "select * from BOARD where title like ? or writer like ? order by id desc";

    public int insertBoard(BoardVO vo) {
        int result = 0;
        try {
            con = JDBCUtil.getConnection();
            stmt = con.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getEmail());
            stmt.setString(4, vo.getPassword());
            stmt.setString(5, vo.getCategory());
            stmt.setString(6, vo.getContent());
            result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(con);
        }
        return result;
    }

    public int deleteBoard(int id) {
        int result = 0;
        try {
            con = JDBCUtil.getConnection();
            stmt = con.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, id);
            result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(con);
        }
        return result;
    }

    public int updateBoard(BoardVO vo) {
        int result = 0;
        try {
            con = JDBCUtil.getConnection();
            stmt = con.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getTitle());
            stmt.setString(2, vo.getWriter());
            stmt.setString(3, vo.getEmail());
            stmt.setString(4, vo.getCategory());
            stmt.setString(5, vo.getContent());
            stmt.setInt(6, vo.getId());
            result = stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(con);
        }
        return result;
    }

    public BoardVO getBoard(int seq) {
        BoardVO vo = null;
        try {
            con = JDBCUtil.getConnection();
            stmt = con.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()){
                vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setEmail(rs.getString("email"));
                vo.setPassword(rs.getString("password"));
                vo.setCategory(rs.getString("category"));
                vo.setContent(rs.getString("content"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(con);
        }
        return vo;
    }

    public List<BoardVO> getBoardList() {
        return getBoardList(null);
    }

    public List<BoardVO> getBoardList(String keyword) {
        List<BoardVO> list = new ArrayList<BoardVO>();
        try {
            con = JDBCUtil.getConnection();
            if (keyword != null && !keyword.isEmpty()) {
                stmt = con.prepareStatement(BOARD_SEARCH);
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
            } else {
                stmt = con.prepareStatement(BOARD_LIST);
            }
            rs = stmt.executeQuery();
            while(rs.next()){
                BoardVO vo = new BoardVO();
                vo.setId(rs.getInt("id"));
                vo.setTitle(rs.getString("title"));
                vo.setWriter(rs.getString("writer"));
                vo.setEmail(rs.getString("email"));
                vo.setRegdate(rs.getDate("regdate"));
                vo.setCnt(rs.getInt("cnt"));
                vo.setCategory(rs.getString("category"));
                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(con);
        }
        return list;
    }
}
