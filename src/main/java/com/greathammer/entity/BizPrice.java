package com.greathammer.entity;

import java.util.Date;

public class BizPrice {
    private Integer id;

    private Integer productionId;

    private String bizUserId;

    private Float rmbPrice;

    private Float dollarPrice;

    private String priceUnit;

    private Date effectiveStartDate;

    private Date effectiveEndDate;

    private String operatorId;

    private Date operationDate;

    private Integer status;

    private DicProduction dicProduction;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductionId() {
        return productionId;
    }

    public void setProductionId(Integer productionId) {
        this.productionId = productionId;
    }

    public String getBizUserId() {
        return bizUserId;
    }

    public void setBizUserId(String bizUserId) {
        this.bizUserId = bizUserId == null ? null : bizUserId.trim();
    }

    public Float getRmbPrice() {
        return rmbPrice;
    }

    public void setRmbPrice(Float rmbPrice) {
        this.rmbPrice = rmbPrice;
    }

    public Float getDollarPrice() {
        return dollarPrice;
    }

    public void setDollarPrice(Float dollarPrice) {
        this.dollarPrice = dollarPrice;
    }

    public String getPriceUnit() {
        return priceUnit;
    }

    public void setPriceUnit(String priceUnit) {
        this.priceUnit = priceUnit == null ? null : priceUnit.trim();
    }

    public Date getEffectiveStartDate() {
        return effectiveStartDate;
    }

    public void setEffectiveStartDate(Date effectiveStartDate) {
        this.effectiveStartDate = effectiveStartDate;
    }

    public Date getEffectiveEndDate() {
        return effectiveEndDate;
    }

    public void setEffectiveEndDate(Date effectiveEndDate) {
        this.effectiveEndDate = effectiveEndDate;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId == null ? null : operatorId.trim();
    }

    public Date getOperationDate() {
        return operationDate;
    }

    public void setOperationDate(Date operationDate) {
        this.operationDate = operationDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public DicProduction getDicProduction() {
        return dicProduction;
    }

    public void setDicProduction(DicProduction dicProduction) {
        this.dicProduction = dicProduction;
    }
}