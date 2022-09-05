package projeto;

import java.util.ArrayList;
import java.util.List;

public class ActivitiesCard {
    int id;
    String description;
    List <String> hours = new ArrayList<>();
    int responsibleId;
    List <Integer> idProjects;
    List <Integer> idUsers;
    
    public ActivitiesCard(int id, String description) {
        this.id = id;
        this.description = description; 
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setHours(String hours) {
        this.hours.add(hours);
    }

    public void setResponsibleId(int responsibleId) {
        this.responsibleId = responsibleId;
    }

    public void setIdProjects(Integer idProjects) {
        this.idProjects.add(idProjects);
    }

    public void setIdUsers(Integer idUsers) {
        this.idUsers.add(idUsers);
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public List<String> getHours() {
        return hours;
    }

    public int getResponsibleId() {
        return responsibleId;
    }

    public List<Integer> getIdProjects() {
        return idProjects;
    }

    public List<Integer> getIdUsers() {
        return idUsers;
    }
}
