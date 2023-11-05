package com.email.luanvan.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MailStructure {
    private String subject;
    private String message;
    private BigDecimal totalPrice;
    private String orderStatus;
}
