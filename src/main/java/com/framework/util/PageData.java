package com.framework.util;

import com.sun.tools.corba.se.idl.InvalidArgument;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.StringUtils;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class PageData extends HashMap implements Map {

    private static final long serialVersionUID = 1L;

    Map map = null;
    HttpServletRequest request;

    public PageData(HttpServletRequest request) {
        this.request = request;
        Map properties = request.getParameterMap();
        Map returnMap = new HashMap();
        Iterator entries = properties.entrySet().iterator();
        Entry entry;
        String name = "";
        String value = "";
        while (entries.hasNext()) {
            entry = (Entry) entries.next();
            name = (String) entry.getKey();
            Object valueObj = entry.getValue();
            if (null == valueObj) {
                value = "";
            } else if (valueObj instanceof String[]) {
                String[] values = (String[]) valueObj;
                for (int i = 0; i < values.length; i++) {
                    value = values[i] + ",";
                }
                value = value.substring(0, value.length() - 1);
            } else {
                value = valueObj.toString();
            }
            returnMap.put(name, value);
        }
        map = returnMap;
    }

    public PageData() {
        map = new HashMap();
    }

    @Override
    public Object get(Object key) {
        Object obj = null;
        if (map.get(key) instanceof Object[]) {
            Object[] arr = (Object[]) map.get(key);
            obj = request == null ? arr : (request.getParameter((String) key) == null ? arr : arr[0]);
        } else {
            obj = map.get(key);
        }
        return obj;
    }

    public String getString(Object key) {
        return (String) get(key);
    }

    public Integer getInt(Object key) {
        Object obj = this.get(key);
        if (obj == null) return null;
        String value = obj.toString();
        if (null == value || StringUtils.isBlank(value.toString())) {
            return null;
        }
        return Integer.parseInt(value);
    }


//    public String getString(Object key) /*throws InvalidArgument*/ {
//        Object obj = this.get(keyAndMsgs[0]);
//        if (obj == null) {
//            if (keyAndMsgs.length >= 2) throw new InvalidArgument(keyAndMsgs[1]);
//            return null;
//        }
//        String value = obj.toString();
//        if ("null".equals(value) || StringUtils.isBlank(value.toString())) {
//            if (keyAndMsgs.length >= 2) throw new InvalidArgument(keyAndMsgs[1]);
//            return null;
//        }
//        return value;
//    }

//    /**
//     * 从request对象中取值的方法
//     *
//     * @param keyAndMsgs <pre>
//     *                                      可以有多个字符串参数，分别是：
//     *                                      第一个是key，
//     *                                      第二个是为空时报的异常，
//     *                                      第三个是格式化为具体类型是报的异常消息
//     *                                      </pre>
//     * @return
//     * @throws InvalidArgument
//    public Integer getInt(String... keyAndMsgs) throws InvalidArgument {
//        String value = getString(keyAndMsgs);
//        try {
//            return Integer.parseInt(value);
//        } catch (NumberFormatException e) {
//            if (keyAndMsgs.length >= 3) throw new InvalidArgument(keyAndMsgs[2]);
//        }
//        return null;
//    }*/


    @SuppressWarnings("unchecked")
    @Override
    public Object put(Object key, Object value) {
        return map.put(key, value);
    }

    @Override
    public Object remove(Object key) {
        return map.remove(key);
    }

    public void clear() {
        map.clear();
    }

    public boolean containsKey(Object key) {
        // TODO Auto-generated method stub
        return map.containsKey(key);
    }

    public boolean containsValue(Object value) {
        // TODO Auto-generated method stub
        return map.containsValue(value);
    }

    public Set entrySet() {
        // TODO Auto-generated method stub
        return map.entrySet();
    }

    public boolean isEmpty() {
        // TODO Auto-generated method stub
        return map.isEmpty();
    }

    public Set keySet() {
        // TODO Auto-generated method stub
        return map.keySet();
    }

    @SuppressWarnings("unchecked")
    public void putAll(Map t) {
        // TODO Auto-generated method stub
        map.putAll(t);
    }

    public int size() {
        // TODO Auto-generated method stub
        return map.size();
    }

    public Collection values() {
        // TODO Auto-generated method stub
        return map.values();
    }

}
