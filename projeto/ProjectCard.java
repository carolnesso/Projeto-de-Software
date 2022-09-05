package projeto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;

import java.sql.Date;
import java.time.LocalDateTime;

public class ProjectCard {
    int id;
    String description;
    LocalDateTime begin;
    LocalDateTime end;
    int idCoordinator;
    List <Integer> idProfessors;
    List <Integer> actvs;
    int validityResearchBag;
    Map <Integer, Integer> researchBag = new HashMap<>();

    


    public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setBegin(LocalDateTime begin) {
        this.begin = begin;
    }

    public void setEnd(LocalDateTime end) {
        this.end = end;
    }

    public void setIdCoordinator(int idCoordinator) {
        this.idCoordinator = idCoordinator;
    }

    public void setIdProfessors(Integer idProfessors) {
        this.idProfessors.add(idProfessors);
        //TODO nomes conflitantes, colocar this.
    }

    public void setActvs(Integer actvs) {
        this.actvs.add(actvs);
    }

    public void setValidityResearchBag(int validityResearchBag) {
        this.validityResearchBag = validityResearchBag;
    }

    public void setResearchBag(int id, int researchBag) {
        this.researchBag.put(id, researchBag);
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getBegin() {
        return begin;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public int getIdCoordinator() {
        return idCoordinator;
    }

    public List<Integer> getIdProfessors() {
        return idProfessors;
    }

    public List<Integer> getActvs() {
        return actvs;
    }

    public int getValidityResearchBag() {
        return validityResearchBag;
    }

    public Map<Integer, Integer> getResearchBag() {
        return researchBag;
    }

}