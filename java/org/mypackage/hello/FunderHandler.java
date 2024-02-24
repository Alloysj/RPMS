
package org.mypackage.hello;

/**
 *
 * @author user
 */
public class FunderHandler {
    private String name;
    private String projectName;
    private int funderID;
    private String funderCountry;
    private String status;
    private int totalFund;
    
    public FunderHandler(){
        name=null;
        projectName=null;
        funderID = 200;
        funderCountry = null;
        status = "active";
        totalFund= 30000;
    }

    /**
     * @return the Name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the fName to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the project
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * @param projectName the project to set
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * @return the funderID
     */
    public int getFunderID() {
        return funderID;
    }

    /**
     * @param funderID the funderID to set
     */
    public void setFunderID(int funderID) {
        this.funderID = funderID;
    }

    /**
     * @return the funderCountry
     */
    public String getFunderCountry() {
        return funderCountry;
    }

    /**
     * @param funderCountry the funderCountry to set
     */
    public void setFunderCountry(String funderCountry) {
        this.funderCountry = funderCountry;
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
     * @return the totalFund
     */
    public int getTotalFund() {
        return totalFund;
    }

    /**
     * @param totalFund the totalFund to set
     */
    public void setTotalFund(int totalFund) {
        this.totalFund = totalFund;
    }
}
