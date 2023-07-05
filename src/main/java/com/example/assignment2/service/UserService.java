package com.example.assignment2.service;

import com.example.assignment2.dao.impl.UserDaoImpl;
import com.example.assignment2.dto.person.extend.User;
import com.example.assignment2.util.ServletType;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserService {


    public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String errorMessage = null;

        // get param from request
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");

        // get session
        HttpSession session = req.getSession();

        // get user from db by userName
        User user = UserDaoImpl.getInstance()
                               .get(userName);

        // Login success
        if (user != null && user.getPassword()
                                .equals(password)) {

            session.setAttribute("user", user);

            // redirect to list-employee servlet
            resp.sendRedirect(req.getContextPath() + "/servlet?type=" + ServletType.LIST_EMPLOYEE);
            return;
        }

        // login with wrong password
        if (user != null && !user.getPassword()
                                 .equals(password)) {
            req.setAttribute("errorMessage", "Your password is not correct! Please try again!");
            req.setAttribute("userName", userName);
            // forward to login page
            req.getRequestDispatcher("/view/login.jsp")
               .forward(req, resp);
            return;
        }

        // login with wrong userName
        req.setAttribute("errorMessage", "Your user name is not correct! Please try again!");
        req.getRequestDispatcher("/view/login.jsp")
           .forward(req, resp);
    }

    public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") != null) {
            req.getSession()
               .removeAttribute("user");

            resp.sendRedirect(req.getContextPath() + "/view/login.jsp");
        }
    }
}