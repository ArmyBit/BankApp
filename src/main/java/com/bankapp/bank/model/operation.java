package com.bankapp.bank.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class operation {
    private String idOperation ;
    private Date dateOperation ;
    private String typeOperation;
    private String accountNum;
    private Double montant;
}
