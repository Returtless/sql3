package com.example.sql3;

import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.stream.Collectors;

@Repository
public class SQLRepository {
    public static final String SQL_FILENAME = "script.sql";

    private final String sql;

    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;


    public SQLRepository(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.sql = read();
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }


    private static String read() {
        try (InputStream is = new ClassPathResource(SQLRepository.SQL_FILENAME).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String getProductName(String name){
        return namedParameterJdbcTemplate.queryForObject(sql, Map.of("parameter", name), String.class);
    }
}
