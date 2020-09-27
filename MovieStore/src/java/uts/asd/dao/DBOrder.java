/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.asd.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import uts.asd.model.Order;
import uts.asd.model.OrderLineItem;

/**
 *
 * @author heeseong
 */
public class DBOrder {
    private Statement st;

    public DBOrder(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    private String createCondition(Order order) {
        StringBuilder sb = new StringBuilder();
        if (order.getOrderID() != null) {
            sb.append(String.format(" AND orderID='%s' ", order.getOrderID()));
        }

//        if (order.getEmail() != null && !order.getEmail().equals("")) {
//            sb.append(String.format(" AND email='%s' ", order.getEmail()));
//        }
        if (order.getStatus() != null && !order.getStatus().equals("")) {
            sb.append(String.format(" AND status='%s' ", order.getStatus()));
        }
//        if (order.getDateStr() != null && !order.getDateStr().equals("")) {
//            sb.append(String.format(" AND orderDate='%s' ", order.getDateStr()));
//        }
        return sb.toString();
    }
    
        //Find user by email and password in the database   
    public List<Order> findOrder(Order order) throws SQLException {
        String sql = "select * from MS.ORDERS  WHERE 1=1 " + createCondition(order);
        ResultSet rs = st.executeQuery(sql);
        List<Order> list = new ArrayList<>();
        while (rs.next()) {
            Object object = rs.getObject(4);
//            Order obj = new Order(rs.getInt("orderID"), rs.getDate("orderDate"), rs.getString("status"), rs.getFloat("total"));
//            list.add(obj);
        }
        return list;
    }
    //Add a user-data into the database
    public Order addOrder(Order order) throws SQLException {                   //code for add-operation       
        String id = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        int orderid = Integer.parseInt(id);
        order.setOrderID(orderid);

        st.execute(String.format("INSERT INTO MS.ORDERS(orderID,order_date,status,total) VALUES('%s',,'%s','%s',%.2f)",
                order.getOrderID(),
                LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")),
                order.getStatus(),
                order.getTotal()
        ));

        return order;
    }
    public void submit(List<OrderLineItem> list, Order order) throws SQLException {
        BigDecimal total = BigDecimal.ZERO;
        for (OrderLineItem item : list) {
            BigDecimal price = BigDecimal.valueOf(Double.valueOf(item.getPrice())).multiply(BigDecimal.valueOf(item.getOrderQuantity()));
            total = total.add(price);
            st.execute(String.format("UPDATE MS.MOVIE SET quantity=quantity-%d WHERE movieID=%d", item.getOrderQuantity(), item.getMovieID()));

        }
        order.setTotal(total.floatValue());
        order.setStatus("unpay");
        order = addOrder(order);
        st.execute(String.format("UPDATE MS.ORDERLINEITEM SET categoryID=1,orderID='%s' WHERE categoryID=0", order.getOrderID()));
    }
}
