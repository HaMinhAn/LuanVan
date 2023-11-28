package com.email.luanvan.Model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MailStatus {
  private String no;
  private String orderStatus;
  private String email;
  private String user;
}
