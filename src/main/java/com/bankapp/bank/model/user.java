package com.bankapp.bank.model;





import org.apache.commons.codec.digest.DigestUtils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @NoArgsConstructor @AllArgsConstructor @ToString

public class user {
private String Username,Password;
public static String toHash(String input) {
	
	String a=DigestUtils.md5Hex(input);
	System.out.println(a);
    return a;
}

}
