package org.mypackage.hello;

/**
 *
 * @author user
 */
public class FunderHandler {
    private String funderId;
    private String name;
    private String status;
    private String country;
    private String totalFunds;
    
    public FunderHandler(){
        funderId = "";
        name = "";
        status = "";
        country = "";
        totalFunds = "";
    }
    
    public FunderHandler(String funderId, String name, String status, String country, String totalFunds){
        this.funderId = funderId;
        this.name = name;
        this.status = status;
        this.country = country;
        this.totalFunds = totalFunds;
    }
    
    public void setFunderID(String funderId){
        this.funderId = funderId;
    }
    
    public String getFunderID(){
        return funderId;
    }
    
    public void setName(String name){
        this.name = name;
    }
    
    public String getName(){
        return name;
    }
    
    public void setStatus(String status){
        this.status = status;
    }
    
    public String getStatus(){
        return status;
    }
    public void setCountry(String country){
        this.country = country;
    }
    
    public String getCountry(){
        return country;
    }
    public void setTotalFunds(String totalFunds){
        this.totalFunds = totalFunds;
    }
    
    public String getTotalFunds(){
        return totalFunds;
    }
    
}
