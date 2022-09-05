package projeto.students;

import java.util.List;

public class Students {
    long cpf;
    List<Integer> idProjects;
    List<Integer> idActivities;
    String type;

    public Students(long cpf, String type){
        this.cpf = cpf;
        this.type = type;
    }

    public void setCpf(int cpf){
        this.cpf = cpf;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setIdProjects(Integer idProjects) {
        this.idProjects.add(idProjects);
    }

    public void setIdActivities(Integer idActivities) {
        this.idActivities.add(idActivities);
    }

    public long getCpf() {
        return cpf;
    }

    public String getType() {
        return type;
    }

    public List<Integer> getIdProjects() {
        return idProjects;
    }

    public List<Integer> getIdActivities() {
        return idActivities;
    }
    
}
