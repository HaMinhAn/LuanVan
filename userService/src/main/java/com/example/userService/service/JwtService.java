package com.example.userService.service;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.userService.model.UserDto;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
@RequiredArgsConstructor
@Component
public class JwtService {

  private final UserService userServices;
  public static final String SECRET = "5367566B59703373367639792F423F4528482B4D6251655468576D5A71347437";


  public void validateToken(final String token) {
    Jwts.parserBuilder().setSigningKey(getSignKey()).build().parseClaimsJws(token);

  }


  public String generateToken(String userName) {
    Map<String, Object> claims = new HashMap<>();
    return createToken(claims, userName);
  }

  private String createToken(Map<String, Object> claims, String userName) {
    return Jwts.builder()
            .setClaims(claims)
            .setSubject(userName)
            .setIssuedAt(new Date(System.currentTimeMillis()))
            .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 30))
            .signWith(getSignKey(), SignatureAlgorithm.HS256).compact();
  }

  private Key getSignKey() {
    byte[] keyBytes = Decoders.BASE64.decode(SECRET);
    return Keys.hmacShaKeyFor(keyBytes);
  }
}