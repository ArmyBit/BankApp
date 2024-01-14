package com.bankapp.bank.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class ClientBank {
    private Integer codeClient;
    private String nomClient , prenomClient;
    private Integer telClient;
    private String mailClient;

    public ClientBank(Integer codeClient) {
        this.codeClient = codeClient;
    }
}
