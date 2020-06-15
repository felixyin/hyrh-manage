package com.framework.entity.system;

import java.util.Date;

/**
 * Created by lichangde on 2016/9/12.
 */
public class BizUser {
    // id
    private int id;
    private String sysUserId;
    //用户名
    private String userName;
    //密码
    private String passWord;
    //姓名
    private String name;
    //手机号
    private String phone;
    //邮箱
    private String email;
    //公司名称
    private String companyName;
    //公司座机
    private String companyPhone;
    //公司地址
    private String companyPlane;
    //公司传真
    private String companyFex;
    //公司描述
    private String companyDesc;
    //公司地址
    private String companyAddr;
    //公司网站
    private String companyWebsite;
    //公司开户行
    private String companyOpenBank;
    //公司开户行账号
    private String companyBankAcount;
    //营业范围
    private String businessScope;
    //成立时间
    private Date establishedDate;
    //税号
    private String tfn;
    //法人
    private String legalPerson;
    //邮编
    private String zipCode;
    //支付方式
    private Integer clearingForm;

    private Date cdate;

    private Date udate;
    //状态，0：无效，1：未定价，2：价格未审批，3：价格已审批
    private Integer status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(String sysUserId) {
        this.sysUserId = sysUserId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getCompanyPlane() {
        return companyPlane;
    }

    public void setCompanyPlane(String companyPlane) {
        this.companyPlane = companyPlane;
    }

    public String getCompanyFex() {
        return companyFex;
    }

    public void setCompanyFex(String companyFex) {
        this.companyFex = companyFex;
    }

    public String getCompanyDesc() {
        return companyDesc;
    }

    public void setCompanyDesc(String companyDesc) {
        this.companyDesc = companyDesc;
    }

    public String getCompanyAddr() {
        return companyAddr;
    }

    public void setCompanyAddr(String companyAddr) {
        this.companyAddr = companyAddr;
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    public String getCompanyOpenBank() {
        return companyOpenBank;
    }

    public void setCompanyOpenBank(String companyOpenBank) {
        this.companyOpenBank = companyOpenBank;
    }

    public String getCompanyBankAcount() {
        return companyBankAcount;
    }

    public void setCompanyBankAcount(String companyBankAcount) {
        this.companyBankAcount = companyBankAcount;
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    public Date getEstablishedDate() {
        return establishedDate;
    }

    public void setEstablishedDate(Date establishedDate) {
        this.establishedDate = establishedDate;
    }

    public String getTfn() {
        return tfn;
    }

    public void setTfn(String tfn) {
        this.tfn = tfn;
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public Integer getClearingForm() {
        return clearingForm;
    }

    public void setClearingForm(Integer clearingForm) {
        this.clearingForm = clearingForm;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Date getUdate() {
        return udate;
    }

    public void setUdate(Date udate) {
        this.udate = udate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
