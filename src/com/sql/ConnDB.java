package com.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnDB {
    public static Connection conn;
    //静态方法可以直接使用类名调用
    public static Connection getConn(){
        try {
            Class.forName("com.mysql.jdbc.Driver");        //查找驱动
            String url="jdbc:mysql://localhost:3306/myblog";  //构建URL
            conn=DriverManager.getConnection(url, "root", "root"); //获取数据库连接
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            System.err.println("请查看数据库连接驱动包有无导入");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.err.println("请查看数据库url是否正确，账号密码是否正确");
        }

        return conn;
    }
       

}
