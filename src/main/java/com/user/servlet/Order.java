package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;

import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class Order extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id")); 
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pinCode");
			String paymentType = req.getParameter("payment");
			
			String fullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> list = dao.getBookByUser(id);
			
			if(list.isEmpty()) {
				session.setAttribute("failed", "You have no orders");
				resp.sendRedirect("checkout.jsp");
			}else {
				BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
				Book_Order o = null;
				int i = dao2.getOrderNo();
				
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				for(Cart c : list) {
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00" + i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderList.add(o);
					i++;
				}
				
				if(paymentType.equals("noselect")) {
					session.setAttribute("failed", "Please Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean flag = dao2.saveOrder(orderList);
					if(flag) {
						resp.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failed", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
