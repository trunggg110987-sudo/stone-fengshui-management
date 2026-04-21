package com.example.stonefengshuimanagement.exception;

public class ExceptionUtil {
    public static void throwDatabaseException(Exception e) throws DatabaseException {
        throw new DatabaseException("loi thao tac db" , e);
    }
}
