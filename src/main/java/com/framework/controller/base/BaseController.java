package com.framework.controller.base;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.framework.entity.AjaxPaging;
import com.framework.entity.system.BizUser;
import com.framework.entity.system.User;
import com.greathammer.entity.DicProduction;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import com.framework.entity.Page;
import com.framework.util.Const;
import com.framework.util.Logger;
import com.framework.util.PageData;
import com.framework.util.UuidUtil;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseController {


    protected Logger logger = Logger.getLogger(this.getClass());

    private static final long serialVersionUID = 6357869213649815390L;

    /**
     * 得到PageData
     */
    public PageData getPageData() {
        return new PageData(this.getRequest());
    }

    /**
     * 得到ModelAndView
     */
    public ModelAndView getMV() {
        return new ModelAndView();
    }

    /**
     * 得到request对象
     */
    public HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * 得到32位的uuid
     *
     * @return
     */
    public String get32UUID() {

        return UuidUtil.get32UUID();
    }

    /**
     * 得到分页列表的信息
     */
    public Page getPage() {

        return new Page();
    }

    public static void logBefore(Logger logger, String interfaceName) {
        logger.info("");
        logger.info("start");
        logger.info(interfaceName);
    }

    public static void logAfter(Logger logger) {
        logger.info("end");
        logger.info("");
    }


    /**
     * 获取当前用户的Session
     *
     * @return
     */
    public Session getSession() {
        return SecurityUtils.getSubject().getSession();
    }

    /**
     * 从Session中取值
     *
     * @param key
     * @return
     */
    public Object getAttr(String key) {
        return getSession().getAttribute(key);
    }

    /**
     * 向Session中放值
     *
     * @param key
     * @param value
     */
    public void setAttr(String key, Object value) {
        getSession().setAttribute(key, value);
    }

    /**
     * 获取当前用户在Session中存储的SysUser对象
     * <pre>
     *     获取session中的User
     * </pre>
     *
     * @return
     */
    public User getSysUser() {
        Session session = SecurityUtils.getSubject().getSession();
        return (User) session.getAttribute(Const.SESSION_USER);
    }

    /**
     * 获取当前用户在Session中存储的BizUser对象
     * <pre>
     *     获取session中的BizUser
     * </pre>
     *
     * @return
     */
    public BizUser getBizUser() {
        Session session = getSession();
        return (BizUser) session.getAttribute(Const.SESSION_BIZ_USER);
    }

    /**
     * spring 应用程序上下文
     */
    private ApplicationContext applicationContext;

    public ApplicationContext getAC() {
        if (applicationContext == null) { //懒汉单利模式
            WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
            ServletContext sc = webApplicationContext.getServletContext();
            applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
        }
        return applicationContext;
    }

    /**
     * 后台java调用前台js代码
     * @param script
     * @return
     */
    public String callJs(String script) {
        return "<html><head><script>\n\n" + script + "\n\n</script></head><body></body></html>";
    }


    /**
     * 如果关闭多个窗口，先关闭最下面的窗口，最后关闭上面的窗口
     *
     * @param dialogId
     * @return
     */
    public String closeDialog(String dialogId) {
        String closeDialog = "function closeDialog(dialogId) {\n" +
                "    top.Dialog.getInstance(dialogId).close();\n" +
                "  }";
        return closeDialog + "\n\ncloseDialog('" + dialogId + "');\n\n";
    }

    public String exeAtDialog(String dialogId, String script) {
        String exeAtparentWin = "function exeAtDialog(dialogId, func) {\n" +
                "    with (top.Dialog.getInstance(dialogId).innerFrame.contentWindow) {\n" +
                "      func();\n" +
                "    }\n" +
                "  }\n\n";

        return (exeAtparentWin + "\n\nexeAtDialog('" + dialogId + "', function(){" + script + "});\n\n");
    }

    /**
     * 如果关闭多个窗口，先关闭最下面的窗口，最后关闭上面的窗口
     * @param dialogId
     * @param script
     * @return
     */
    public String exeAtDialogParentWinAndCloseDialog(String dialogId, String script) {
        return exeAtDialogParentWin(dialogId, script) +
                closeDialog(dialogId);
    }

    public String exeAtDialogParentWin(String dialogId, String script) {
        return "with(top.Dialog.getInstance('" + dialogId + "').MyParentWin){\n" +
                "   " + script +
                "}\n\n";
    }

    public ModelAndView getAjaxPagingMV(AjaxPaging<?> ajaxPaging, List<?> list) {
        Map<String, Object> ajaxJsonMap = new HashMap<>();
        ajaxJsonMap.put("dataList", list);
        ajaxJsonMap.put("draw", ajaxPaging.getDraw());
        ajaxJsonMap.put("recordsTotal", ajaxPaging.getRecordsTotal());
        ajaxJsonMap.put("recordsFiltered", ajaxPaging.getRecordsFiltered());

        ajaxJsonMap.put("sEcho", ajaxPaging.getsEcho());
        ajaxJsonMap.put("iDisplayLength", ajaxPaging.getiDisplayLength());
        ajaxJsonMap.put("iDisplayStart", ajaxPaging.getiDisplayStart());
        ajaxJsonMap.put("count", ajaxPaging.getCount());

        return new ModelAndView(new MappingJackson2JsonView(), ajaxJsonMap);
    }
}
