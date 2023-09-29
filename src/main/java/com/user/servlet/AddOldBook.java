package com.user.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/add_old_books")
@MultipartConfig
public class AddOldBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			String useremail = req.getParameter("user");
			
			BookDetails b = new BookDetails(bookName, author, price, categories, status, fileName, useremail);					
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			
			boolean flag = dao.addBooks(b);			
			HttpSession session = req.getSession();
			
			if(flag) {	
				String path = "C:\\Users\\nages\\eclipse-workspace\\BookStore\\bookstore\\src\\main\\webapp\\books";
				File file = new File(path);
				part.write(path +"\\"+ fileName);
				
				session.setAttribute("success", "Book Added");
				resp.sendRedirect("sell_book.jsp");
			}else {
				session.setAttribute("failed", "Book Not Added");
				resp.sendRedirect("sell_book.jsp");
			}					
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
