package com.framework.controller.base;

import com.alibaba.fastjson.JSON;
import com.framework.service.base.CommonService;
import org.apache.commons.lang3.reflect.MethodUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by fy on 2016/9/14.
 */
@Controller
@RequestMapping(value = "/common")
public class CommonController extends BaseController {


    @Resource
    private CommonService commonService;

    /**
     * 通用的数量查询方法
     *
     * @param columnName
     * @param columnValue
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/{columnName}Count")
    public ModelAndView columnCount(
            String tableName,
            @PathVariable("columnName") String columnName,
            String columnValue) {
        Integer count = commonService.countColumn(tableName, columnName, columnValue);

        Map<String, Integer> emailMap = new HashMap<>();
        emailMap.put("count", count); // count==0，表示没有发现记录，可以插入数据库，否则不能录入数据库
        return new ModelAndView(new MappingJackson2JsonView(), emailMap);
    }


    /**
     * <p>
     * 通用js调用java service 的方法
     *
     * @param service
     * @param method
     * @param types
     * @param params
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/js2java")
    public Object js2java(
            String service, String method,
            @RequestParam(value = "types[]") String[] types,
            @RequestParam(value = "params[]") String[] params) throws Exception {

        int len = types.length;
        Object[] args = new Object[len];

        for (int i = 0; i < len; i++) {
            String type = types[i];
            String value = params[i];

            if ("java.lang.Integer".equals(type) || "int".equals(type)) {
                args[i] = Integer.parseInt(value);
            } else if ("java.lang.String".equals(type)) {
                args[i] = value;
            } else if ("java.lang.Long".equals(type) || "long".equals(type)) {
                args[i] = Long.parseLong(value);
            } else if ("java.lang.Float".equals(type) || "float".equals(type)) {
                args[i] = Float.parseFloat(value);
            } else if ("java.lang.Double".equals(type) || "double".equals(type)) {
                args[i] = Double.parseDouble(value);
            } else if ("java.lang.Boolean".equals(type) || "boolean".equals(type)) {
                args[i] = Boolean.parseBoolean(value);
            } else if ("java.lang.Byte".equals(type) || "byte".equals(type)) {
                args[i] = Byte.parseByte(value);
            } else if ("java.lang.Short".equals(type) || "short".equals(type)) {
                args[i] = Short.parseShort(value);
            } else { // 认为是封装类型
                args[i] = JSON.parseObject(URLDecoder.decode(value, "UTF-8"), Class.forName(type));
            }
        }

        return MethodUtils.invokeMethod(this.getAC().getBean(service), method, args);
    }
}

