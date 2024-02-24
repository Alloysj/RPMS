package org.mypackage.hello;
import java.time.LocalDate;
/**
 *
 * @author user
 */
public class ReseacherHandler {

    private String fName;
    private String lName;
    private Integer researcher_id;
    private String projectName;
    private Integer fundedAmount;
    private String projectFunder;
    private LocalDate projectStartDate;
    private LocalDate projectEndDate;
    private String projectArea;

    public ReseacherHandler() {
        fName = null;
        lName = null;
        researcher_id = null;
        projectName = null;
        fundedAmount = null;
        projectFunder = null;
        projectStartDate = null;
        projectEndDate = null;
        projectArea = null;
    }

    /**
     * @return the fName
     */
    public String getfName() {
        return fName;
    }

    /**
     * @param fName the fName to set
     */
    public void setfName(String fName) {
        this.fName = fName;
    }

    /**
     * @return the lName
     */
    public String getlName() {
        return lName;
    }

    /**
     * @param lName the lName to set
     */
    public void setlName(String lName) {
        this.lName = lName;
    }

    /**
     * @return the researcher_id
     */
    public int getResearcher_id() {
        return researcher_id;
    }

    /**
     * @param researcher_id the researcher_id to set
     */
    public void setResearcher_id(int researcher_id) {
        this.researcher_id = researcher_id;
    }

    /**
     * @return the projectName
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * @param projectName the projectName to set
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * @return the fundedAmount
     */
    public Integer getFundedAmount() {
        return fundedAmount;
    }

    /**
     * @param fundedAmount the fundedAmount to set
     */
    public void setFundedAmount(Integer fundedAmount) {
        this.fundedAmount = fundedAmount;
    }

    /**
     * @return the funderName
     */
    public String getFunderName() {
        return projectFunder;
    }

    /**
     * @param projectFunder the funderName to set
     */
    public void setFunderName(String projectFunder) {
        this.projectFunder = projectFunder;
    }

    /**
     * @return the startDate
     */
    public LocalDate getStartDate() {
        return projectStartDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(LocalDate startDate) {
        this.projectStartDate = startDate;
    }

    /**
     * @return the endDate
     */
    public LocalDate getEndDate() {
        return projectEndDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(LocalDate endDate) {
        this.projectEndDate = endDate;
    }

    /**
     * @return the area
     */
    public String getArea() {
        return projectArea;
    }

    /**
     * @param area the area to set
     */
    public void setArea(String area) {
        this.projectArea = area;
    }

}
