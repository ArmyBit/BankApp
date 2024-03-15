package com.bankapp.bank.servlet.authentification;

import com.bankapp.bank.daoImp.doa_ClientBank;
import com.bankapp.bank.model.CommissionModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/Commission")

public class Commission extends HttpServlet {
    doa_ClientBank a=new doa_ClientBank();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        if(session.getAttribute("username")!=null){
            String accountNum=req.getParameter("accountNum");
            req.setAttribute("accountNum",accountNum);
            List<CommissionModel> list=a.getAllBankAccountCommission(accountNum);
            int sum = 0;
            for (CommissionModel Com : list) {
                sum += Com.getVal();

            }
            req.setAttribute("ListOfCommission",list);
                req.setAttribute("SUM",sum);



            req.getRequestDispatcher("/dashboard/Commission.jsp").forward(req,resp);}
        else{
            resp.sendRedirect(req.getContextPath() + "/login");

        }}


}
