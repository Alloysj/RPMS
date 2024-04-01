
package javaBeansClasses;

/**
 *
 * @author user
 */
public class Funders {
    
    //constructor
    
    private String name;
    private int funderId;
    private int totalFunds;
    private String status;
    private String country;
    
    public void Funder(String name, int funderId, int totalFunds, String status, String country) {
        this.setName(name);
        this.setFunderId(funderId);
        this.setTotalFunds(totalFunds);
        this.setStatus(status);
        this.setCountry(country);
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the funderId
     */
    public int getFunderId() {
        return funderId;
    }

    /**
     * @param funderId the funderId to set
     */
    public void setFunderId(int funderId) {
        this.funderId = funderId;
    }

    /**
     * @return the totalFunds
     */
    public int getTotalFunds() {
        return totalFunds;
    }

    /**
     * @param totalFunds the totalFunds to set
     */
    public void setTotalFunds(int totalFunds) {
        this.totalFunds = totalFunds;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }
  
}
