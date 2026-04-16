package exception;

public class ExceptionUtil {
    public static void throwDatabaseException(Exception e) throws DatabaseException {
        throw new DatabaseException("Lỗi thao tác database", e);
    }
}
