package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean flag = dao.deleteBooks(id);
			
			HttpSession session = req.getSession();
			
			if(flag) {
				session.setAttribute("success", "Book Deleted");
				resp.sendRedirect("admin/all_books.jsp");
			}else {
				session.setAttribute("failed", "Book Not Deleted");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
