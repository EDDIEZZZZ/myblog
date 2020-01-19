package com.dao;

import java.sql.*;

public class DBUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/myblog";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    public static PreparedStatement pstmt = null;
    public static Connection connection = null;
    public static ResultSet rs = null;
    public static boolean ExecuteUpdate(String sql,Object[] params) {
        try {
            pstmt = createPreparedStatement(sql,params);
            int count = pstmt.executeUpdate();
            if(count>0) {
                return true;
            }else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeAll(null, pstmt, connection);
        }
    }
    public static ResultSet ExecuteQuery(String sql,Object[] params) {
        try {
            pstmt = createPreparedStatement(sql,params);
            rs = pstmt.executeQuery();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }catch(ClassNotFoundException e) {
            e.printStackTrace();
        }catch(SQLException e) {
            e.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static PreparedStatement createPreparedStatement(String sql,Object[] params) {
        try {
            pstmt = getConnection().prepareStatement(sql);
            if(pstmt!=null) {
                for(int i=0;i<params.length;i++) {
                    pstmt.setObject(i+1, params[i]);
                }
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
        return pstmt;
    }
    public static void closeAll(ResultSet rs,Statement stmt,Connection connection) {
        try {
            if(rs!=null)rs.close();
            if(pstmt!=null)pstmt.close();
            if(connection!=null)connection.close();
        }catch(SQLException e){
            e.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    public static int getTotalCount(String sql) {
        int count = -1;
        try {
            pstmt = createPreparedStatement(sql, null);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count =rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            closeAll(rs, pstmt, DBUtil.connection);
        }
        return count;
    }
}
