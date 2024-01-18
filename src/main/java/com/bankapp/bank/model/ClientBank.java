package com.bankapp.bank.model;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder

public class ClientBank {
    private Integer codeClient;
    private String nomClient , prenomClient;
    private Integer telClient;
    private String mailClient;

    public ClientBank(Integer codeClient) {
        this.codeClient = codeClient;
    }

}
