package com.bankapp.bank.servlet.authentification;

import java.io.*;
import java.util.logging.Logger;

import com.bankapp.bank.daoImp.Doa_user_imp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "auth", value = "/login")
public class auth extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(auth.class.getName());



    public auth() {
        super();
        // TODO Auto-generated constructor stub
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        if(session.getAttribute("username")!=null){
            resp.sendRedirect(req.getContextPath() + "/dashboard");
        }
        else{
        RequestDispatcher dispatcher = req.getRequestDispatcher("login/login.jsp");
        dispatcher.forward(req, resp);}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String username=request.getParameter("username");
        String password=request.getParameter("password");
        Doa_user_imp a = new Doa_user_imp();
        boolean resp_from_db=a.check_user(username, password);
        if (resp_from_db){
            response.sendRedirect(request.getContextPath() + "/dashboard");
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setMaxInactiveInterval(50);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/login?error=true");

        }




    }



}

