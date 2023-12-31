package com.luanvan.apigateway.configs;

import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.function.Predicate;

@Component
public class RouteValidator {
  public static final List<String> openApiEndpoints = List.of(
          "/api/v1/users/register",
          "/api/v1/users/login",
          "/api/book",
          "api/book/category/**",
          "/eureka/**",
          "/api/book/hello"
  );

  public Predicate<ServerHttpRequest> isSecured =
          request -> openApiEndpoints
                  .stream()
                  .noneMatch(uri -> request.getURI().getPath().contains(uri));
}
