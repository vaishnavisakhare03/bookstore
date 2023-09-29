package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String em = req.getParameter("em");
			int id = Integer.parseInt(req.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			boolean flag = dao.oldBookDelete(em, "Old", id);
			
			HttpSession session = req.getSession();
			if(flag == true) {
				session.setAttribute("success", "Old Book Deleted");
				resp.sendRedirect("old_book.jsp");
			}else {
				session.setAttribute("failed", "Not Deleted");
				resp.sendRedirect("old_book.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
