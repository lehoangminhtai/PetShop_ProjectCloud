package com.petshop.servlets.admin.order;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.petshop.hibernate.HibernateUtils;
import com.petshop.hibernate.daos.OrderDAO;
import com.petshop.hibernate.entities.Order;

@WebServlet("/admin/order-management/delete")
public class AdminDeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final OrderDAO orderDAO;
	
    public AdminDeleteOrderServlet() {
        super();
        this.orderDAO = new OrderDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setStatus(405);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));
		
		this.orderDAO.deleteOrderById(orderId);
		
        request.setAttribute("success_messages", new String[] { "Tạo giỏ hàng thành công" });
        
        RequestDispatcher rd = request.getRequestDispatcher("/admin/order-management");
        rd.include(request, response);
        
		response.sendRedirect("/admin/order-management");
	}
}