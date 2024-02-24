
package org.mypackage.hello;

/**
 *
 * @author user
 */
public class CollaboratorHandler {
    private String fName;
    private String lName;
    private int collaborator_id;
    private String project;
    
    public CollaboratorHandler(){
        fName = null;
        lName= null;
        project = null;
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
     * @return the collaborator_id
     */
    public int getCollaborator_id() {
        return collaborator_id;
    }

    /**
     * @param collaborator_id the collaborator_id to set
     */
    public void setCollaborator_id(int collaborator_id) {
        this.collaborator_id = collaborator_id;
    }

    /**
     * @return the project
     */
    public String getProject() {
        return project;
    }

    /**
     * @param project the project to set
     */
    public void setProject(String project) {
        this.project = project;
    }
}
