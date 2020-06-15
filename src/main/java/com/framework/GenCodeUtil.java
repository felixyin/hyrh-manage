package com.framework;

import com.framework.util.Freemarker;
import org.apache.commons.lang3.StringUtils;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.framework.DBUtil.*;


/**
 * Created by fy on 2016/9/13.
 */
public class GenCodeUtil {

    private static Connection con;

    static {
        try {
            con = openConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private static List<Map<String, Object>> getColumns(String table) throws Exception {
        return queryMapList(con,
                "SELECT \n" +
                        "    c.`COLUMN_NAME`,\n" +
                        "    c.DATA_TYPE,\n" +
                        "    c.IS_NULLABLE,\n" +
                        "    c.COLUMN_KEY,\n" +
                        "    c.COLUMN_COMMENT\n" +
                        "FROM\n" +
                        "    information_schema.COLUMNS AS c\n" +
                        "WHERE\n" +
                        "    c.table_schema = 'hyrh'\n" +
                        "        AND c.table_name = '" + table + "'\n" +
                        "ORDER BY ordinal_position ASC"
        );
    }

    /**
     * System.out.println(tuoFeng("dic_production_xx_jlksdjflk"));
     * System.out.println(tuoFeng("dic_production_xx"));
     * System.out.println(tuoFeng("dic_production"));
     *
     * @param str
     * @return
     */
    private static String tuoFeng(String str) {
        Pattern p = Pattern.compile(".*(_[a-z]?).*");
        Matcher m = p.matcher(str);
        if (m.find()) {
            String under = m.group(1);
            if (null == under) return str;
            String upper = under.replace("_", "").toUpperCase();
            str = str.replace(under, upper);
        }
        if (str.contains("_")) str = tuoFeng(str);
        return str;
    }

    public static void main(String[] args) throws Exception {
        String ftlPath = "C:/workspaces/website/hyrh-manage/src/main/resources/createCode/";

        String tableName = "biz_contract";
        String objectName = tuoFeng(tableName);

        List<Map<String, Object>> columnList = getColumns(tableName);

        for (Map<String, Object> map : columnList) {
            String columnName = map.get("COLUMN_NAME").toString();
            map.put("FILED_NAME", tuoFeng(columnName));
            System.out.println(map);
        }

        Map<String, Object> root = new HashMap<>();
        root.put("columnList", columnList);
        root.put("tableName", tableName);
        root.put("objectName", objectName);
        root.put("d", "$");

        Freemarker.print("jsp_edit.ftl", root, ftlPath);
        Freemarker.print("jsp_list.ftl", root, ftlPath);
        Freemarker.print("data_table.ftl", root, ftlPath);

        closeConnection(con);
    }
}

interface IResultSetCall<T> {

    public T invoke(ResultSet rs) throws SQLException;

}

class DBUtil {

    public static Connection openConnection() throws SQLException, ClassNotFoundException, IOException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(
                "jdbc:mysql://114.215.151.15:3306/hyrh",
                "root",
                "hzc2016.");
    }

    public static void closeConnection(Connection con) throws SQLException {
        try {
            if (null != con)
                con.close();
        } finally {
            con = null;
            System.gc();
        }
    }

    public static List<Map<String, Object>> queryMapList(Connection con, String sql) throws SQLException,
            InstantiationException, IllegalAccessException {
        List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
        Statement preStmt = null;
        ResultSet rs = null;
        try {
            preStmt = con.createStatement();
            rs = preStmt.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (null != rs && rs.next()) {
                Map<String, Object> map = new HashMap<String, Object>();
                for (int i = 0; i < columnCount; i++) {
                    String name = rsmd.getColumnName(i + 1);
                    Object value = rs.getObject(name);
                    map.put(name, value);
                }
                lists.add(map);
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != preStmt)
                preStmt.close();
        }
        return lists;
    }

    public static List<Map<String, Object>> queryMapList(Connection con, String sql, Object... params)
            throws SQLException, InstantiationException, IllegalAccessException {
        List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();
        PreparedStatement preStmt = null;
        ResultSet rs = null;
        try {
            preStmt = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                preStmt.setObject(i + 1, params[i]);// 下标从1开始
            rs = preStmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while (null != rs && rs.next()) {
                Map<String, Object> map = new HashMap<String, Object>();
                for (int i = 0; i < columnCount; i++) {
                    String name = rsmd.getColumnName(i + 1);
                    Object value = rs.getObject(name);
                    map.put(name, value);
                }
                lists.add(map);
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != preStmt)
                preStmt.close();
        }
        return lists;
    }

    public static <T> List<T> queryBeanList(Connection con, String sql, Class<T> beanClass) throws SQLException,
            InstantiationException, IllegalAccessException {
        List<T> lists = new ArrayList<T>();
        Statement stmt = null;
        ResultSet rs = null;
        Field[] fields = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            fields = beanClass.getDeclaredFields();
            for (Field f : fields)
                f.setAccessible(true);
            while (null != rs && rs.next()) {
                T t = beanClass.newInstance();
                for (Field f : fields) {
                    String name = f.getName();
                    try {
                        Object value = rs.getObject(name);
                        setValue(t, f, value);
                    } catch (Exception e) {
                    }
                }
                lists.add(t);
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != stmt)
                stmt.close();
        }
        return lists;
    }

    public static <T> List<T> queryBeanList(Connection con, String sql, Class<T> beanClass, Object... params)
            throws SQLException, InstantiationException, IllegalAccessException {
        List<T> lists = new ArrayList<T>();
        PreparedStatement preStmt = null;
        ResultSet rs = null;
        Field[] fields = null;
        try {
            preStmt = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                preStmt.setObject(i + 1, params[i]);// 下标从1开始
            rs = preStmt.executeQuery();
            fields = beanClass.getDeclaredFields();
            for (Field f : fields)
                f.setAccessible(true);
            while (null != rs && rs.next()) {
                T t = beanClass.newInstance();
                for (Field f : fields) {
                    String name = f.getName();
                    try {
                        Object value = rs.getObject(name);
                        setValue(t, f, value);
                    } catch (Exception e) {
                    }
                }
                lists.add(t);
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != preStmt)
                preStmt.close();
        }
        return lists;
    }

    public static <T> List<T> queryBeanList(Connection con, String sql, IResultSetCall<T> qdi) throws SQLException {
        List<T> lists = new ArrayList<T>();
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            while (null != rs && rs.next())
                lists.add(qdi.invoke(rs));
        } finally {
            if (null != rs)
                rs.close();
            if (null != stmt)
                stmt.close();
        }
        return lists;
    }

    public static <T> List<T> queryBeanList(Connection con, String sql, IResultSetCall<T> qdi, Object... params)
            throws SQLException {
        List<T> lists = new ArrayList<T>();
        PreparedStatement preStmt = null;
        ResultSet rs = null;
        try {
            preStmt = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                preStmt.setObject(i + 1, params[i]);
            rs = preStmt.executeQuery();
            while (null != rs && rs.next())
                lists.add(qdi.invoke(rs));
        } finally {
            if (null != rs)
                rs.close();
            if (null != preStmt)
                preStmt.close();
        }
        return lists;
    }

    public static <T> T queryBean(Connection con, String sql, Class<T> beanClass) throws SQLException,
            InstantiationException, IllegalAccessException {
        List<T> lists = queryBeanList(con, sql, beanClass);
        if (lists.size() != 1)
            throw new SQLException("SqlError：期待一行返回值，却返回了太多行！");
        return lists.get(0);
    }

    public static <T> T queryBean(Connection con, String sql, Class<T> beanClass, Object... params)
            throws SQLException, InstantiationException, IllegalAccessException {
        List<T> lists = queryBeanList(con, sql, beanClass, params);
        if (lists.size() != 1)
            throw new SQLException("SqlError：期待一行返回值，却返回了太多行！");
        return lists.get(0);
    }

    public static <T> List<T> queryObjectList(Connection con, String sql, Class<T> objClass) throws SQLException,
            InstantiationException, IllegalAccessException {
        List<T> lists = new ArrayList<T>();
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);
            label:
            while (null != rs && rs.next()) {
                Constructor<?>[] constor = objClass.getConstructors();
                for (Constructor<?> c : constor) {
                    Object value = rs.getObject(1);
                    try {
                        lists.add((T) c.newInstance(value));
                        continue label;
                    } catch (Exception e) {
                    }
                }
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != stmt)
                stmt.close();
        }
        return lists;
    }

    public static <T> List<T> queryObjectList(Connection con, String sql, Class<T> objClass, Object... params)
            throws SQLException, InstantiationException, IllegalAccessException {
        List<T> lists = new ArrayList<T>();
        PreparedStatement preStmt = null;
        ResultSet rs = null;
        try {
            preStmt = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                preStmt.setObject(i + 1, params[i]);
            rs = preStmt.executeQuery();
            label:
            while (null != rs && rs.next()) {
                Constructor<?>[] constor = objClass.getConstructors();
                for (Constructor<?> c : constor) {
                    String value = rs.getObject(1).toString();
                    try {
                        T t = (T) c.newInstance(value);
                        lists.add(t);
                        continue label;
                    } catch (Exception e) {
                    }
                }
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != preStmt)
                preStmt.close();
        }
        return lists;
    }

    public static <T> T queryObject(Connection con, String sql, Class<T> objClass) throws SQLException,
            InstantiationException, IllegalAccessException {
        List<T> lists = queryObjectList(con, sql, objClass);
        if (lists.size() != 1)
            throw new SQLException("SqlError：期待一行返回值，却返回了太多行！");
        return lists.get(0);
    }

    public static <T> T queryObject(Connection con, String sql, Class<T> objClass, Object... params)
            throws SQLException, InstantiationException, IllegalAccessException {
        List<T> lists = queryObjectList(con, sql, objClass, params);
        if (lists.size() != 1)
            throw new SQLException("SqlError：期待一行返回值，却返回了太多行！");
        return lists.get(0);
    }

    public static int execute(Connection con, String sql) throws SQLException {
        Statement stmt = null;
        try {
            stmt = con.createStatement();
            return stmt.executeUpdate(sql);
        } finally {
            if (null != stmt)
                stmt.close();
        }
    }

    public static int execute(Connection con, String sql, Object... params) throws SQLException {
        PreparedStatement preStmt = null;
        try {
            preStmt = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                preStmt.setObject(i + 1, params[i]);// 下标从1开始
            return preStmt.executeUpdate();
        } finally {
            if (null != preStmt)
                preStmt.close();
        }
    }

    public static int[] executeAsBatch(Connection con, List<String> sqlList) throws SQLException {
        return executeAsBatch(con, sqlList.toArray(new String[]{}));
    }

    public static int[] executeAsBatch(Connection con, String[] sqlArray) throws SQLException {
        Statement stmt = null;
        try {
            stmt = con.createStatement();
            for (String sql : sqlArray) {
                stmt.addBatch(sql);
            }
            return stmt.executeBatch();
        } finally {
            if (null != stmt) {
                stmt.close();
            }
        }
    }

    public static int[] executeAsBatch(Connection con, String sql, Object[][] params) throws SQLException {
        PreparedStatement preStmt = null;
        try {
            preStmt = con.prepareStatement(sql);
            for (int i = 0; i < params.length; i++) {
                Object[] rowParams = params[i];
                for (int k = 0; k < rowParams.length; k++) {
                    Object obj = rowParams[k];
                    preStmt.setObject(k + 1, obj);
                }
                preStmt.addBatch();
            }
            return preStmt.executeBatch();
        } finally {
            if (null != preStmt) {
                preStmt.close();
            }
        }
    }

    private static <T> void setValue(T t, Field f, Object value) throws IllegalAccessException {
        // TODO 以数据库类型为准绳，还是以java数据类型为准绳？还是混合两种方式？
        if (null == value)
            return;
        String v = value.toString();
        String n = f.getType().getName();
        if ("java.lang.Byte".equals(n) || "byte".equals(n)) {
            f.set(t, Byte.parseByte(v));
        } else if ("java.lang.Short".equals(n) || "short".equals(n)) {
            f.set(t, Short.parseShort(v));
        } else if ("java.lang.Integer".equals(n) || "int".equals(n)) {
            f.set(t, Integer.parseInt(v));
        } else if ("java.lang.Long".equals(n) || "long".equals(n)) {
            f.set(t, Long.parseLong(v));
        } else if ("java.lang.Float".equals(n) || "float".equals(n)) {
            f.set(t, Float.parseFloat(v));
        } else if ("java.lang.Double".equals(n) || "double".equals(n)) {
            f.set(t, Double.parseDouble(v));
        } else if ("java.lang.String".equals(n)) {
            f.set(t, value.toString());
        } else if ("java.lang.Character".equals(n) || "char".equals(n)) {
            f.set(t, (Character) value);
        } else if ("java.lang.Date".equals(n)) {
            f.set(t, new Date(((java.sql.Date) value).getTime()));
        } else if ("java.lang.Timer".equals(n)) {
            f.set(t, new Time(((java.sql.Time) value).getTime()));
        } else if ("java.sql.Timestamp".equals(n)) {
            f.set(t, (java.sql.Timestamp) value);
        } else {
            System.out.println("SqlError：暂时不支持此数据类型，请使用其他类型代替此类型！");
        }
    }

    public static void executeProcedure(Connection con, String procedureName, Object... params) throws SQLException {
        CallableStatement proc = null;
        try {
            proc = con.prepareCall(procedureName);
            for (int i = 0; i < params.length; i++) {
                proc.setObject(i + 1, params[i]);
            }
            proc.execute();
        } finally {
            if (null != proc)
                proc.close();
        }
    }

    public static boolean executeProcedureReturnErrorMsg(Connection con, String procedureName, StringBuffer errorMsg,
                                                         Object... params) throws SQLException {
        CallableStatement proc = null;
        try {
            proc = con.prepareCall(procedureName);
            proc.registerOutParameter(1, JDBCType.VARCHAR);
            for (int i = 0; i < params.length; i++) {
                proc.setObject(i + 2, params[i]);
            }
            boolean b = proc.execute();
            errorMsg.append(proc.getString(1));
            return b;
        } finally {
            if (null != proc)
                proc.close();
        }
    }

    public static <T> List<T> executeProcedureReturnCursor(Connection con, String procedureName, Class<T> beanClass,
                                                           Object... params) throws SQLException, InstantiationException, IllegalAccessException {
        List<T> lists = new ArrayList<T>();
        CallableStatement proc = null;
        ResultSet rs = null;
        try {
            proc = con.prepareCall(procedureName);
            proc.registerOutParameter(1, JDBCType.REF_CURSOR);
            for (int i = 0; i < params.length; i++) {
                proc.setObject(i + 2, params[i]);
            }
            boolean b = proc.execute();
            if (b) {
                rs = (ResultSet) proc.getObject(1);
                while (null != rs && rs.next()) {
                    T t = beanClass.newInstance();
                    Field[] fields = beanClass.getDeclaredFields();
                    for (Field f : fields) {
                        f.setAccessible(true);
                        String name = f.getName();
                        try {
                            Object value = rs.getObject(name);
                            setValue(t, f, value);
                        } catch (Exception e) {
                        }
                    }
                    lists.add(t);
                }
            }
        } finally {
            if (null != rs)
                rs.close();
            if (null != proc)
                proc.close();
        }
        return lists;
    }

    public static <T> List<List<T>> listLimit(List<T> lists, int pageSize) {
        List<List<T>> llists = new ArrayList<List<T>>();
        for (int i = 0; i < lists.size(); i = i + pageSize) {
            try {
                List<T> list = lists.subList(i, i + pageSize);
                llists.add(list);
            } catch (IndexOutOfBoundsException e) {
                List<T> list = lists.subList(i, i + (lists.size() % pageSize));
                llists.add(list);
            }
        }
        return llists;
    }

	/*
     * public static void executeProcedure(Connection con, String sql) {
	 * CallableStatement callStmt = null;
	 * try {
	 * callStmt = con.prepareCall(sql);
	 * callStmt.exe
	 * } catch (Exception e) {
	 * e.printStackTrace();
	 * }
	 *
	 * }
	 */

}