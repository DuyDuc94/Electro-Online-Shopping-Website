/*
 *     DuyDuc94
 */

package controller;

import dal.User_AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User_Account;

/**
 *
 * @author duy20
 */
//@WebServlet(name = "", urlPatterns = {""})
public class LoginServlet extends HttpServlet {
   

    //response.setContentType("text/html;charset=UTF-8");
    //request.setCharacterEncoding("UTF-8");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession(true);
        if (session.getAttribute("user") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User_AccountDAO user_AccountDAO = new User_AccountDAO();
        User_Account user = user_AccountDAO.checkLogin(username, password);
        System.out.println(username + " " + password);
        System.out.println(user);
        if (user == null) {
            request.setAttribute("message", "Username or Password is Incorrect!<br>Try again!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            //Check if account is not disable
            if (user.isStatus()) {
                //Check if account is user
                if (!user.isRole()) {
                    session.setAttribute("user", user);
                    session.setAttribute("userID", user.getID());
                } else {
                    session.setAttribute("admin", user);
                }
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
            }
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
