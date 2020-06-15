package com.framework.entity.base;

import java.util.Date;

/**
 * Created by thankful on 2016/8/30.
 */
public class Order {

    private int id;
//    ������
    private String number;
//    ���������ˣ�����Ա
    private int operatorId;
//    �ͻ�id
    private int consignorId;
//    ��ַid
    private int addressId;
//    Ҫ���������
    private Date shipmentDate;
//    ʵ�ʳ�������
    private Date realDate;
//    ��ע
    private String comment;
//    ��������
    private Date cdate;
//    ��������
    private Date udate;
//    ״̬��0����Ч��1����Ч
    private int status;

    /**
     * Getter for property 'id'.
     *
     * @return Value for property 'id'.
     */
    public int getId() {
        return id;
    }

    /**
     * Setter for property 'id'.
     *
     * @param id Value to set for property 'id'.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Getter for property 'number'.
     *
     * @return Value for property 'number'.
     */
    public String getNumber() {
        return number;
    }

    /**
     * Setter for property 'number'.
     *
     * @param number Value to set for property 'number'.
     */
    public void setNumber(String number) {
        this.number = number;
    }

    /**
     * Getter for property 'operatorId'.
     *
     * @return Value for property 'operatorId'.
     */
    public int getOperatorId() {
        return operatorId;
    }

    /**
     * Setter for property 'operatorId'.
     *
     * @param operatorId Value to set for property 'operatorId'.
     */
    public void setOperatorId(int operatorId) {
        this.operatorId = operatorId;
    }

    /**
     * Getter for property 'consignorId'.
     *
     * @return Value for property 'consignorId'.
     */
    public int getConsignorId() {
        return consignorId;
    }

    /**
     * Setter for property 'consignorId'.
     *
     * @param consignorId Value to set for property 'consignorId'.
     */
    public void setConsignorId(int consignorId) {
        this.consignorId = consignorId;
    }

    /**
     * Getter for property 'addressId'.
     *
     * @return Value for property 'addressId'.
     */
    public int getAddressId() {
        return addressId;
    }

    /**
     * Setter for property 'addressId'.
     *
     * @param addressId Value to set for property 'addressId'.
     */
    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    /**
     * Getter for property 'shipmentDate'.
     *
     * @return Value for property 'shipmentDate'.
     */
    public Date getShipmentDate() {
        return shipmentDate;
    }

    /**
     * Setter for property 'shipmentDate'.
     *
     * @param shipmentDate Value to set for property 'shipmentDate'.
     */
    public void setShipmentDate(Date shipmentDate) {
        this.shipmentDate = shipmentDate;
    }

    /**
     * Getter for property 'realDate'.
     *
     * @return Value for property 'realDate'.
     */
    public Date getRealDate() {
        return realDate;
    }

    /**
     * Setter for property 'realDate'.
     *
     * @param realDate Value to set for property 'realDate'.
     */
    public void setRealDate(Date realDate) {
        this.realDate = realDate;
    }

    /**
     * Getter for property 'comment'.
     *
     * @return Value for property 'comment'.
     */
    public String getComment() {
        return comment;
    }

    /**
     * Setter for property 'comment'.
     *
     * @param comment Value to set for property 'comment'.
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * Getter for property 'cdate'.
     *
     * @return Value for property 'cdate'.
     */
    public Date getCdate() {
        return cdate;
    }

    /**
     * Setter for property 'cdate'.
     *
     * @param cdate Value to set for property 'cdate'.
     */
    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    /**
     * Getter for property 'udate'.
     *
     * @return Value for property 'udate'.
     */
    public Date getUdate() {
        return udate;
    }

    /**
     * Setter for property 'udate'.
     *
     * @param udate Value to set for property 'udate'.
     */
    public void setUdate(Date udate) {
        this.udate = udate;
    }

    /**
     * Getter for property 'status'.
     *
     * @return Value for property 'status'.
     */
    public int getStatus() {
        return status;
    }

    /**
     * Setter for property 'status'.
     *
     * @param status Value to set for property 'status'.
     */
    public void setStatus(int status) {
        this.status = status;
    }
}
