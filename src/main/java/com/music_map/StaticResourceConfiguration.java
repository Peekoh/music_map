package com.music_map;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SuppressWarnings("deprecation")
@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter {      
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/pngFiles/**")
        .addResourceLocations("file:ext-resources/")
        .setCachePeriod(0);
    }
}