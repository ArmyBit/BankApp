package com.bankapp.bank.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommissionModel {
    private Integer IdCommission ;
    private Integer id_Op;
    private String accountNum;
    private Float Val;
}
