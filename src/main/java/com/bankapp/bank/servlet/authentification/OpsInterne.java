package com.bankapp.bank.servlet.authentification;

import com.bankapp.bank.daoImp.doa_opImp;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/dashboard/OpsI")
public class OpsInterne extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        if(session.getAttribute("username")!=null){
            String accountNum=req.getParameter("accountNum");
            req.setAttribute("accountNum",accountNum);
            req.getRequestDispatcher("/dashboard/New_ops.jsp").forward(req,resp);}
        else{
            resp.sendRedirect(req.getContextPath() + "/login");

        }}



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer accountRec= Integer.valueOf(req.getParameter("RCAcc"));
        String Amount = req.getParameter("operationAmount");
        String HtAc= req.getParameter("numAcc");
        doa_opImp a=new doa_opImp();
        try {
            String response =a.opsInterne(HtAc, String.valueOf(accountRec), Double.valueOf(Amount));
            req.setAttribute("response",response);

            resp.sendRedirect(req.getContextPath() + "/dashboard?OpsResp="+response);

        } catch (SQLException e) {
            req.setAttribute("response","Error from System");
            System.out.println(e);
            resp.sendRedirect(req.getContextPath() + "/dashboard?OpsResp="+"Error from System");

        }

    }
}
