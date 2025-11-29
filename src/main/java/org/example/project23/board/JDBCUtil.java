package org.example.project23.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    public static Connection getConnection(){
        Connection con = null;
        try{
            // mariadb 드라이버
            Class.forName("org.mariadb.jdbc.Driver");
            // 와랩 서버 접속
            con= DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/W25_22400011","W25_22400011","Ohd6ec");
        }catch(ClassNotFoundException e){
            System.out.println(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return con;
    }

    // 연결 해제
    public static void close(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
