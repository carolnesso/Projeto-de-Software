package projeto.students;

import java.util.List;

public class Students {
    int cpf;
    List<Integer> idProjects;
    List<Integer> idActivities;
    String type;

    public Students(int cpf, String type){
        this.cpf = cpf;
        this.type = type;
    }

    public void setCpf(int cpf){
        this.cpf = cpf;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void addProjects(){}
    
}
