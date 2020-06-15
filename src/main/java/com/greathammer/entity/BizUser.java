package com.greathammer.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class BizUser {
    private Integer id;

    private String sysUserId;

    private String username;

    private String password;

    private String name;

    private String phone;

    private String email;

    private String companyName;

    private String companyPhone;

    private String companyPlane;

    private String companyFex;

    private String companyDesc;

    private String companyAddr;

    private String companyWebsite;

    private String companyOpenBank;

    private String companyBankAcount;

    private String businessScope;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date establishedDate;

    private String tfn;

    private String legalPerson;

    private String zipCode;

    private Integer clearingForm;

    private Date cdate;

    private Date udate;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSysUserId() {
        return sysUserId;
    }

    public void setSysUserId(String sysUserId) {
        this.sysUserId = sysUserId == null ? null : sysUserId.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone == null ? null : companyPhone.trim();
    }

    public String getCompanyPlane() {
        return companyPlane;
    }

    public void setCompanyPlane(String companyPlane) {
        this.companyPlane = companyPlane == null ? null : companyPlane.trim();
    }

    public String getCompanyFex() {
        return companyFex;
    }

    public void setCompanyFex(String companyFex) {
        this.companyFex = companyFex == null ? null : companyFex.trim();
    }

    public String getCompanyDesc() {
        return companyDesc;
    }

    public void setCompanyDesc(String companyDesc) {
        this.companyDesc = companyDesc == null ? null : companyDesc.trim();
    }

    public String getCompanyAddr() {
        return companyAddr;
    }

    public void setCompanyAddr(String companyAddr) {
        this.companyAddr = companyAddr == null ? null : companyAddr.trim();
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite == null ? null : companyWebsite.trim();
    }

    public String getCompanyOpenBank() {
        return companyOpenBank;
    }

    public void setCompanyOpenBank(String companyOpenBank) {
        this.companyOpenBank = companyOpenBank == null ? null : companyOpenBank.trim();
    }

    public String getCompanyBankAcount() {
        return companyBankAcount;
    }

    public void setCompanyBankAcount(String companyBankAcount) {
        this.companyBankAcount = companyBankAcount == null ? null : companyBankAcount.trim();
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope == null ? null : businessScope.trim();
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
        this.tfn = tfn == null ? null : tfn.trim();
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson == null ? null : legalPerson.trim();
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode == null ? null : zipCode.trim();
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