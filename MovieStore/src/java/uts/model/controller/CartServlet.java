/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.model.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.asd.dao.DBConnector;
import uts.asd.dao.DBOrder;
import uts.asd.dao.DBOrderItem;
import uts.asd.model.Order;
import uts.asd.model.OrderLineItem;
import uts.asd.model.User;
/**
 *
 * @author heeseong
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private DBOrder dbOrder;
    private DBOrderItem dbOrderItem;

    private DBConnector dbConnector;
    
    @Override
    public void init() throws ServletException {
        super.init();
        try {
            dbConnector = new DBConnector();
            dbOrder = new DBOrder(dbConnector.openConnection());
            dbOrderItem = new DBOrderItem(dbConnector.openConnection());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    @Override
    public void destroy() {
        super.destroy();
        try {
            dbConnector.closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if (method.equals("addToCart")) {
            addToCart(request, response);
        } else if (method.equals("toCart")) {
            toCart(request, response);
        } else if (method.equals("deleteCart")) {
            deleteCart(request, response);
        } else if (method.equals("order")) {
            order(request, response);
        }
    }
    
    private void order(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "please login first");
            request.setAttribute("url", request.getContextPath() + "/login.jsp");
            request.getRequestDispatcher("message.jsp").forward(request, response);
            return;
        }

        try {
            OrderLineItem item = new OrderLineItem();
            item.setCategoryID(0);
            item.setEmail(user.getEmail());
            List<OrderLineItem> items = dbOrderItem.findOrderItem(item);
            if (!items.isEmpty()) {
                Order order = new Order();
//                order.setEmail(user.getEmail());
                order.setOrder_date(new Date());
                dbOrder.submit(items, order);
                request.setAttribute("msg", "Order success");
                request.setAttribute("url", request.getContextPath() + "/order?method=toOrder");
            } else {
                request.setAttribute("msg", "Order fail");
                request.setAttribute("url", request.getContextPath() + "/cart?method=toCart");
            }
            request.getRequestDispatcher("message.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "please login first");
            request.setAttribute("url", request.getContextPath() + "/login.jsp");
            request.getRequestDispatcher("message.jsp").forward(request, response);
            return;
        }

        try {
            String id = request.getParameter("id");

            OrderLineItem item = new OrderLineItem();
            item.setOrderLineID(Integer.parseInt(id));
            dbOrderItem.deleteOrderItem(item);
            response.sendRedirect(request.getContextPath() + "/cart?method=toCart");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void toCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "please login first");
            request.setAttribute("url", request.getContextPath() + "/login.jsp");
            request.getRequestDispatcher("message.jsp").forward(request, response);
            return;
        }

        try {
            OrderLineItem item = new OrderLineItem();
            item.setCategoryID(0);
            item.setEmail(user.getEmail());
            List<OrderLineItem> items = dbOrderItem.findOrderItem(item);
            request.setAttribute("items", items);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("msg", "please login first");
            request.setAttribute("url", request.getContextPath() + "/login.jsp");
            request.getRequestDispatcher("message.jsp").forward(request, response);
            return;
        }


        try {
            String productId = request.getParameter("productId");
            OrderLineItem item = new OrderLineItem();
            item.setCategoryID(0);
            item.setMovieID(Integer.parseInt(productId));
            item.setEmail(user.getEmail());
            List<OrderLineItem> items = dbOrderItem.findOrderItem(item);
            if (items.isEmpty()) {
                item.setOrderQuantity(1);
                dbOrderItem.addOrderItem(item);

            } else {
                OrderLineItem target = items.get(0);
                target.setOrderQuantity(target.getOrderQuantity() + 1);
                dbOrderItem.updateOrderItem(target);
            }
            request.setAttribute("msg", "Add to cart success");
            request.setAttribute("url", request.getContextPath() + "/ProductServlet");
            request.getRequestDispatcher("message.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }





}
