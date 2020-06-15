package com.greathammer.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class BizContract {
    private Integer id;

    private String contentNumber;

    private Integer typeContractId;

    private String orderCode;

    private String lineNumber;

    private String materialCode;

    private String materialDesc;

    private String comment;

    private String provider;

    private String original;

    private String customer;

    private String priceUnit;

    private String count;

    private String unit;

    private String unitPrice;

    private String placeCount;

    private String sellCount;

    private Float paymentMoney;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date placeDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date requireDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date realityDate;

    private String freightOrderCode;

    private Float freightMoney;

    private Float freightMoneyNo;

    private Float storageMoney;

    private String fileName;

    private String filePath;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date cdate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date udate;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContentNumber() {
        return contentNumber;
    }

    public void setContentNumber(String contentNumber) {
        this.contentNumber = contentNumber == null ? null : contentNumber.trim();
    }

    public Integer getTypeContractId() {
        return typeContractId;
    }

    public void setTypeContractId(Integer typeContractId) {
        this.typeContractId = typeContractId;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode == null ? null : orderCode.trim();
    }

    public String getLineNumber() {
        return lineNumber;
    }

    public void setLineNumber(String lineNumber) {
        this.lineNumber = lineNumber == null ? null : lineNumber.trim();
    }

    public String getMaterialCode() {
        return materialCode;
    }

    public void setMaterialCode(String materialCode) {
        this.materialCode = materialCode == null ? null : materialCode.trim();
    }

    public String getMaterialDesc() {
        return materialDesc;
    }

    public void setMaterialDesc(String materialDesc) {
        this.materialDesc = materialDesc == null ? null : materialDesc.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider == null ? null : provider.trim();
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original == null ? null : original.trim();
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer == null ? null : customer.trim();
    }

    public String getPriceUnit() {
        return priceUnit;
    }

    public void setPriceUnit(String priceUnit) {
        this.priceUnit = priceUnit == null ? null : priceUnit.trim();
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count == null ? null : count.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice == null ? null : unitPrice.trim();
    }

    public String getPlaceCount() {
        return placeCount;
    }

    public void setPlaceCount(String placeCount) {
        this.placeCount = placeCount == null ? null : placeCount.trim();
    }

    public String getSellCount() {
        return sellCount;
    }

    public void setSellCount(String sellCount) {
        this.sellCount = sellCount == null ? null : sellCount.trim();
    }

    public Float getPaymentMoney() {
        return paymentMoney;
    }

    public void setPaymentMoney(Float paymentMoney) {
        this.paymentMoney = paymentMoney;
    }

    public Date getPlaceDate() {
        return placeDate;
    }

    public void setPlaceDate(Date placeDate) {
        this.placeDate = placeDate;
    }

    public Date getRequireDate() {
        return requireDate;
    }

    public void setRequireDate(Date requireDate) {
        this.requireDate = requireDate;
    }

    public Date getRealityDate() {
        return realityDate;
    }

    public void setRealityDate(Date realityDate) {
        this.realityDate = realityDate;
    }

    public String getFreightOrderCode() {
        return freightOrderCode;
    }

    public void setFreightOrderCode(String freightOrderCode) {
        this.freightOrderCode = freightOrderCode == null ? null : freightOrderCode.trim();
    }

    public Float getFreightMoney() {
        return freightMoney;
    }

    public void setFreightMoney(Float freightMoney) {
        this.freightMoney = freightMoney;
    }

    public Float getFreightMoneyNo() {
        return freightMoneyNo;
    }

    public void setFreightMoneyNo(Float freightMoneyNo) {
        this.freightMoneyNo = freightMoneyNo;
    }

    public Float getStorageMoney() {
        return storageMoney;
    }

    public void setStorageMoney(Float storageMoney) {
        this.storageMoney = storageMoney;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
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