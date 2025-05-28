package com.example.routes;

import org.apache.camel.builder.RouteBuilder;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class MyRoute extends RouteBuilder {
    @Override
    public void configure() throws Exception {
        from("platform-http:/hello?httpMethodRestrict=GET")
            .log("Received HTTP GET request")
            .setBody(constant("Hello from Camel Quarkus!"));
    }
}