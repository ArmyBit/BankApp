package com.bankapp.bank.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class account {
    private String id,accountNum,codeClient;
            private Integer solde;

    public account(String accountNum) {
        this.accountNum = accountNum;
    }
}
