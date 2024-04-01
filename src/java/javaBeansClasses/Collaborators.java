
package javaBeansClasses;

/**
 *
 * @author user
 */
public class Collaborators {
    
    
    private int collaboratorId;
    private String fName;
    private String lName;
    private String project;
    private int project_id;
    
    public void Collaborator(int collaboratorId, String fName, String lName, String project, int project_id){
        this.setfName(fName);
        this.setlName(fName);
        this.setCollaboratorId(collaboratorId);
        this.setProject(project);
        this.setProject_id(project_id);
    }

    /**
     * @return the collaboratorId
     */
    public int getCollaboratorId() {
        return collaboratorId;
    }

    /**
     * @param collaboratorId the collaboratorId to set
     */
    public void setCollaboratorId(int collaboratorId) {
        this.collaboratorId = collaboratorId;
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

    /**
     * @return the project_id
     */
    public int getProject_id() {
        return project_id;
    }

    /**
     * @param project_id the project_id to set
     */
    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }
}
