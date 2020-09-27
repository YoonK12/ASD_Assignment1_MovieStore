/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import uts.asd.model.OrderLineItem;

/**
 *
 * @author heeseong
 */
public class DBOrderItem {
    private Statement st;

    public DBOrderItem(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    private String createCondition(OrderLineItem item) {
        StringBuilder sb = new StringBuilder();
        if (item.getOrderID() != null) {
            sb.append(String.format(" AND TA.orderID='%s' ", item.getOrderID()));
        }
        if (item.getCategoryID() != null) {
            sb.append(String.format(" AND TA.categoryID=%d ", item.getCategoryID()));
        }
//        if (item.getEmail() != null) {
//            sb.append(String.format(" AND TA.email='%s' ", item.getEmail()));
//        }
        if (item.getMovieID() != null) {
            sb.append(String.format(" AND TA.movieID=%d ", item.getMovieID()));

        }
        if (item.getOrderLineID() != null) {
            sb.append(String.format(" AND TA.orderLineID=%d ", item.getOrderLineID()));

        }
        return sb.toString();
    }
    
    public List<OrderLineItem> findOrderItem(OrderLineItem item) throws SQLException {
        ResultSet rs = st.executeQuery("select TA.*,TB.title,TB.price from MS.ORDERLINEITEM TA JOIN MS.MOVIE TB ON TA.movieID=TB.movieID  WHERE 1=1 " + createCondition(item));
        List<OrderLineItem> list = new ArrayList<>();
        while (rs.next()) {
            OrderLineItem obj = new OrderLineItem();
            obj.setOrderID(rs.getString("orderID"));
            obj.setOrderLineID(rs.getInt("orderLineID"));
            obj.setOrderQuantity(rs.getInt("orderQuantity"));
            obj.setPrice(rs.getString("price"));
            obj.setMovieID(rs.getInt("movieID"));
            obj.setTitle(rs.getString("title"));
            obj.setCategoryID(rs.getInt("categoryID"));
            list.add(obj);
        }
        return list;
    }
    
    public OrderLineItem findOneOrderItem(OrderLineItem item) throws SQLException {
        ResultSet rs = st.executeQuery("select * from MS.ORDERLINEITEM TA JOIN MS.MOVIE TB ON TA.movieID=TB.movieID  WHERE 1=1 " + createCondition(item));
        if (rs.next()) {
            OrderLineItem obj = new OrderLineItem();
            obj.setOrderID(rs.getString("orderID"));
            obj.setOrderLineID(rs.getInt("orderLineID"));
            obj.setOrderQuantity(rs.getInt("orderQuantity"));
            obj.setPrice(rs.getString("price"));
            obj.setMovieID(rs.getInt("movieID"));
            obj.setTitle(rs.getString("title"));
            obj.setCategoryID(rs.getInt("categoryID"));
            return obj;
        }
        return null;
    }
    //Add a user-data into the database
    public OrderLineItem addOrderItem(OrderLineItem item) throws SQLException {                   //code for add-operation

        st.execute(String.format("INSERT INTO MS.ORDERLINEITEM(movieID,orderQuantity,email) VALUES(%d,%d,'%s')",
                item.getMovieID(),
                item.getOrderQuantity(),
                item.getEmail()
        ));

        return item;
    }
    
    public void updateOrderItem(OrderLineItem item) throws SQLException {
        String sql = " UPDATE MS.ORDERLINEITEM SET " +
                "orderQuantity = " + item.getOrderQuantity() + ", categoryID= " + item.getCategoryID();
        if (item.getOrderID() != null) {
            sql += String.format(", orderID='%s'", item.getOrderID());
        }
        sql += " WHERE orderLineID=" + item.getOrderLineID();
        System.out.println(sql);
        st.execute(sql);

    }
    
    public void deleteOrderItem(OrderLineItem item) throws SQLException {
        st.execute(String.format("DELETE FROM MS.ORDERLINEITEM WHERE orderLineID=%d", item.getOrderLineID()));
    }
}
