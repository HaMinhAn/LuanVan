package com.luanvan.gatewayservice.configs;

import com.luanvan.gatewayservice.Util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Component;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import com.google.common.net.HttpHeaders;

@Component
public class AuthFilter extends AbstractGatewayFilterFactory<AuthFilter.Config> {
  @Autowired
  private RouteValidator validator;

  //    @Autowired
//    private RestTemplate template;
  @Autowired
  private JwtUtil jwtUtil;

  public AuthFilter() {
    super(Config.class);
  }

  @Override
  public GatewayFilter apply(Config config) {
    return ((exchange, chain) -> {
      if (validator.isSecured.test(exchange.getRequest())) {
        System.out.println("helllo");
        //header contains token or not
        if (!exchange.getRequest().getHeaders().containsKey(HttpHeaders.AUTHORIZATION)) {
          throw new RuntimeException("missing authorization header");
        }

        String authHeader = exchange.getRequest().getHeaders().get(HttpHeaders.AUTHORIZATION).get(0);
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
          authHeader = authHeader.substring(7);
        }
        try {
//                    //REST call to AUTH service
//                    template.getForObject("http://IDENTITY-SERVICE//validate?token" + authHeader, String.class);
          jwtUtil.validateToken(authHeader);

        } catch (Exception e) {
          System.out.println("invalid access...!");
          throw new RuntimeException("un authorized access to application");
        }
      }
      return chain.filter(exchange);
    });
  }

  public static class Config {

  }
}
