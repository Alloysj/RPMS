
package javaBeansClasses;
import java.io.Serializable;
import java.sql.Date;
/**
 *
 * @author user
 */
public class Projects {
    
    private Date start_date;
    private Date end_date;
    private String name;
    private int amount_funded;
    private int project_id;
    private String field;
    private int funderId;
    private int researcherId;
    
    
    public void Project(String name, Date start_date, Date end_date, String field, int funderId, int researcherId, int amount_funded, int project_id) {
        this.name = name;
        this.start_date = start_date;
        this.end_date = end_date;
        this.field = field;
        this.funderId = funderId;
        this.researcherId = researcherId;
        this.amount_funded = amount_funded;
        this.project_id = project_id;
    }
    /**
     * @return the start_date
     */
    public Date getStart_date() {
        return start_date;
    }

    /**
     * @param start_date the start_date to set
     */
    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    /**
     * @return the end_date
     */
    public Date getEnd_date() {
        return end_date;
    }

    /**
     * @param end_date the end_date to set
     */
    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
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
     * @return the amount_funded
     */
    public int getAmount_funded() {
        return amount_funded;
    }

    /**
     * @param amount_funded the amount_funded to set
     */
    public void setAmount_funded(int amount_funded) {
        this.amount_funded = amount_funded;
    }

    /**
     * @return the project_id
     */
    public int getProject_id() {
        return project_id;
    }

    /**
     * @return the field
     */
    public String getField() {
        return field;
    }

    /**
     * @param field the field to set
     */
    public void setField(String field) {
        this.field = field;
    }

    /**
     * @return the funderId
     */
    public int getFunderId() {
        return funderId;
    }

    /**
     * @return the researcherId
     */
    public int getResearcherId() {
        return researcherId;
    }
    
}
