package com.framework.service.system.user;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.framework.entity.system.BizUser;
import com.framework.util.UuidUtil;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Service;

import com.framework.dao.DaoSupport;
import com.framework.entity.Page;
import com.framework.entity.system.User;
import com.framework.util.PageData;


@Service("userService")
public class UserService {

    @Resource(name = "daoSupport")
    private DaoSupport dao;

    //======================================================================================

    /*
    * 通过id获取数据
    */
    public PageData findByUiId(PageData pd) throws Exception {
        return (PageData) dao.findForObject("UserXMapper.findByUiId", pd);
    }

    /*
    * 通过loginname获取数据
    */
    public PageData findByUId(PageData pd) throws Exception {
        return (PageData) dao.findForObject("UserXMapper.findByUId", pd);
    }

    /*
    * 通过邮箱获取数据
    */
    public PageData findByUE(PageData pd) throws Exception {
        return (PageData) dao.findForObject("UserXMapper.findByUE", pd);
    }

    /*
    * 通过编号获取数据
    */
    public PageData findByUN(PageData pd) throws Exception {
        return (PageData) dao.findForObject("UserXMapper.findByUN", pd);
    }

    /*
    * 保存用户
    */
    public void saveU(PageData pd) throws Exception {
        dao.save("UserXMapper.saveU", pd);
    }

    /*
    * 修改用户
    */
    public void editU(PageData pd) throws Exception {
        dao.update("UserXMapper.editU", pd);
    }

    /*
    * 换皮肤
    */
    public void setSKIN(PageData pd) throws Exception {
        dao.update("UserXMapper.setSKIN", pd);
    }

    /*
    * 删除用户
    */
    public void deleteU(PageData pd) throws Exception {
        dao.delete("UserXMapper.deleteU", pd);
    }

    /*
    * 批量删除用户
    */
    public void deleteAllU(String[] USER_IDS) throws Exception {
        dao.delete("UserXMapper.deleteAllU", USER_IDS);
    }

    /*
    *用户列表(用户组)
    */
    public List<PageData> listPdPageUser(Page page) throws Exception {
        return (List<PageData>) dao.findForList("UserXMapper.userListPage", page);
    }

    /*
    *用户列表(全部)
    */
    public List<PageData> listAllUser(PageData pd) throws Exception {
        return (List<PageData>) dao.findForList("UserXMapper.listAllUser", pd);
    }

    /*
    *用户列表(供应商用户)
    */
    public List<PageData> listGPdPageUser(Page page) throws Exception {
        return (List<PageData>) dao.findForList("UserXMapper.userGlistPage", page);
    }

    /*
    * 保存用户IP
    */
    public void saveIP(PageData pd) throws Exception {
        dao.update("UserXMapper.saveIP", pd);
    }

    /*
    * 登录判断
    */
    public PageData getUserByNameAndPwd(PageData pd) throws Exception {
        return (PageData) dao.findForObject("UserXMapper.getUserInfo", pd);
    }

    /*
    * 跟新登录时间
    */
    public void updateLastLogin(PageData pd) throws Exception {
        dao.update("UserXMapper.updateLastLogin", pd);
    }

    /*
    *通过id获取数据
    */
    public User getUserAndRoleById(String USER_ID) throws Exception {
        return (User) dao.findForObject("UserMapper.getUserAndRoleById", USER_ID);
    }

    /**
     * 执行成功返回true，
     * 保存客户注册
     * <pre>
     *     保存新注册客户，保存到sys_user表和biz_user两个表中
     * </pre>
     *
     * @param pd
     * @throws Exception
     */
    public boolean saveUser(PageData pd) throws Exception {
        Date date = new Date();
        pd.put("USER_ID", UuidUtil.get32UUID());    //ID
        pd.put("RIGHTS", "");                    //权限
        pd.put("LAST_LOGIN", "");                //最后登录时间
        pd.put("IP", "");                        //IP
        pd.put("STATUS", "0");                    //状态
        pd.put("SKIN", "default");                //默认皮肤
        pd.put("NAME", pd.getString("USERNAME"));                //默认皮肤
        pd.put("PASSWORD", new SimpleHash("SHA-1", pd.getString("PASSWORD"), pd.getString("PASSWORD")).toString());

//        设置客户角色
        pd.put("ROLE_ID", "cfae67ae48804fcab874f2b59950cd40");

        saveU(pd);

        pd.put("CDATE", date);
        pd.put("STATUS", 1);
        dao.save("BizUserMapper.insertUser", pd);

        return true;
    }

    /**
     * 检查用户注册，用户名，邮箱，手机号唯一
     * <pre>
     *     返回boolean，
     *     信息可用，返回true，否则返回false
     * </pre>
     *
     * @param pd
     * @return
     * @author thankful
     * @createDate 2016-9-2
     */
    public boolean singleCheck(PageData pd) throws Exception {

        boolean rs = true;

        String value = pd.getString("value");
        String name = pd.getString("name");

        PageData user = new PageData();
        switch (name) {
            case "username":
                pd.put("USERNAME", value);
                user = (PageData) dao.findForObject("UserXMapper.findByUId", pd);
                break;
            case "phone":
                pd.put("PHONE", value);
                user = (PageData) dao.findForObject("UserXMapper.findByPhone", pd);
                break;
            case "email":
                pd.put("EMAIL", value);
                user = (PageData) dao.findForObject("UserXMapper.findByUE", pd);
                break;
        }
        if (null != user && !user.isEmpty()) {
            rs = false;
        }
        return rs;
    }

    /**
     * 检查用户注册信息唯一性
     * <pre>
     *     用户信息唯一，返回true
     *     否则返回false
     * </pre>
     *
     * @param pd
     * @return
     * @throws Exception
     */
    public boolean checkUserByNamePhoneEmail(PageData pd) throws Exception {
        List<PageData> user = (List<PageData>) dao.findForList("UserXMapper.findUserByNamePhoneEmail", pd);
        if (null != user && user.size() > 0) {
            return false;
        }
        return true;
    }

    /*
    *通过id获取数据
    */
    public BizUser getBizUserByUserId(String USER_ID) throws Exception {
        return (BizUser) dao.findForObject("UserMapper.getBizUserByUserId", USER_ID);
    }
}
