package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean flag = dao.deleteBook(bid, uid, cid);
		
		HttpSession session = req.getSession();
		if(flag == true) {
			session.setAttribute("success", "Book Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("failed", "Book Not Removed from Cart");
			resp.sendRedirect("checkout.jsp");
		}
		
	}

}
