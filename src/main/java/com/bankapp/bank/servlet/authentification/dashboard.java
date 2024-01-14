package com.bankapp.bank.servlet.authentification;

import com.bankapp.bank.daoImp.Doa_user_imp;
import com.bankapp.bank.daoImp.doa_ClientBank;
import com.bankapp.bank.daoImp.doa_opImp;
import com.bankapp.bank.model.ClientBank;
import com.bankapp.bank.model.account;
import com.bankapp.bank.model.operation;
import jakarta.annotation.security.DeclareRoles;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.LogRecord;
import java.util.logging.Logger;

@WebServlet("/dashboard")
public class dashboard extends HttpServlet {
    public dashboard() {
        super();
    }
    doa_ClientBank a=new doa_ClientBank();
    doa_opImp b=new doa_opImp();
    Doa_user_imp c=new Doa_user_imp();
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);

        if (session.getAttribute("username") == null) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/login/login.jsp");
            dispatcher.forward(req, resp);
        } else {
            List<account> listtobeSent=a.getAllClientAccounts(String.valueOf(session.getAttribute("username")));
            req.setAttribute("listofaccounts",listtobeSent);
            List<operation> listofops=b.getallClientOps(c.createClientforView(String.valueOf(session.getAttribute("username"))));
            req.setAttribute("listofallops",listofops);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/dashboard/dashboard.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);

        if (session.getAttribute("username") == null) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("/login/login.jsp");
            dispatcher.forward(req, resp);
        } else {
            account act=new account();
            act.setAccountNum(req.getParameter("accountNum"));
            List<operation> listofops=b.getaccountOps(act);
            req.setAttribute("listofallops",listofops);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/dashboard/ops.jsp");
            dispatcher.forward(req, resp);
        }
    }

    }




