package com.greathammer.controller.center;

import com.framework.controller.base.BaseController;
import com.greathammer.entity.BizUser;
import com.greathammer.service.BizUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/9/19.
 */
@Controller
@RequestMapping(value = "/center")
public class CenterController extends BaseController {

    @Resource(name = "bizUserService")
    private BizUserService userService;


    /**
     * 回显用户数据
     *
     * @param id bizUser表的主键
     * @param viewName
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goEditBizUser")
    public ModelAndView goEditBizUser(Integer id, String viewName) throws Exception {
        if (null == id) id = getBizUser().getId();

        BizUser bizUser = userService.selectOne(id);

        ModelAndView mv = this.getMV();
        mv.addObject("bizUser", bizUser)
                .addObject("viewName", viewName)
                .setViewName(viewName);
        return mv;

    }

    /**
     * 保存用户数据
     *
     * @param bizUser
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saveBizUser")
    public ModelAndView saveBizUser(BizUser bizUser, String viewName) throws Exception {
        userService.updateSelective(bizUser);

        Integer userId = (Integer) getAttr("bizUser.id");
        if (userId == null) { // 表示系统登录用户在个人中心修改自己的相关信息
            return new ModelAndView("redirect:/center/goEditBizUser", "viewName", viewName);
        } else { // 表示管理员在用户管理模块修改某个用户的相关信息
            Map<String, Object> param = new HashMap<>();
            param.put("viewName", viewName);
            param.put("id", userId);
            return new ModelAndView("redirect:/customer/goEditUser", param);
        }
    }

}
