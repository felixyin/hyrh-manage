package com.framework.util;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

/**
 * Created by fy on 2016/8/25.
 */
public class JspIncludeUtil {

    private static String cssBeginFlag = "<!-- --------------css begin-------------- -->";
    private static String cssEndFlag = "<!-- --------------css end-------------- -->";

    private static String scriptBeginFlag = "<!-- --------------script begin-------------- -->";
    private static String scriptEndFlag = "<!-- --------------script end-------------- -->";

    private static String cssIncludeCode = "<%@ include file=\"/include/css.jsp\" %>";
    private static String scriptIncludeCode = "<%@ include file=\"/include/script.jsp\" %>";


    public static void main(String[] args) throws IOException {
        String rootPath = JspIncludeUtil.class.getClass().getResource("/").getFile().toString() + "../../../../";
        rootPath = "C:\\workspaces\\website\\hyrh-manage\\src\\main\\webapp";

//        目录可以随便修改
        String folder = rootPath + "/WEB-INF/jsp/customer";

        String includeCssPath = rootPath + "/include/css.jsp";
        String includeScriptPath = rootPath + "/include/script.jsp";

//        生产部署模式，打开此注释运行
//        toProductionModel(folder);

//        开发模式，打开此注释运行
        toDevelopModel(folder, includeCssPath, includeScriptPath);
    }

    private static void toProductionModel(String folder) throws IOException {
        System.out.println("开始切换到生产模式");
        Collection<File> files = FileUtils.listFiles(new File(folder), new String[]{"jsp"}, true);
        for (File file : files) {
            String code = FileUtils.readFileToString(file);
            if (!code.contains(cssBeginFlag)) continue;

            System.out.println("");
            System.out.println("begin:" + file.getName());

            String first = code.substring(0, code.indexOf(cssBeginFlag));
            String body = code.substring(code.lastIndexOf(cssEndFlag) + cssEndFlag.length(), code.indexOf(scriptBeginFlag));
            String last = code.substring(code.indexOf(scriptEndFlag) + scriptEndFlag.length());

            String jspCode = first + cssIncludeCode + body + scriptIncludeCode + last;

            FileUtils.writeStringToFile(file, jspCode);

            System.out.println("end" + file.getName());
        }
        System.out.println("结束切换到生产模式");
    }


    private static void toDevelopModel(String folder, String includeCssPath, String includeScriptPath) throws IOException {
        System.out.println("开始切换到开发模式");
        String includeCss = FileUtils.readFileToString(new File(includeCssPath));
        String includeScript = FileUtils.readFileToString(new File(includeScriptPath));
        Collection<File> files = FileUtils.listFiles(new File(folder), new String[]{"jsp"}, true);
        for (File file : files) {
            String code = FileUtils.readFileToString(file);
            if (!code.contains(cssIncludeCode)) continue;

            System.out.println("");
            System.out.println("begin:" + file.getName());

            String first = code.substring(0, code.indexOf(cssIncludeCode));
            String body = code.substring(code.lastIndexOf(cssIncludeCode) + cssIncludeCode.length(), code.indexOf(scriptIncludeCode));
            String last = code.substring(code.indexOf(scriptIncludeCode) + scriptIncludeCode.length());

            String jspCode = first + includeCss + body + includeScript + last;

            FileUtils.writeStringToFile(file, jspCode);

            System.out.println("end" + file.getName());
        }
        System.out.println("结束切换到开发模式");
    }
}
