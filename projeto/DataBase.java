package projeto;

import java.util.ArrayList;
import java.util.List;

import projeto.students.Students;

public class DataBase {
    List <ProjectCard> projects = new ArrayList<>();
    List <ActivitiesCard> activities;

    List <Students> students = new ArrayList<>();

    public void setProjects(ProjectCard projects) {
        this.projects.add(projects);
    }

    public void setActivities(ActivitiesCard activities) {
        this.activities.add(activities);
    }

    public void setStudents(Students students) {
        this.students.add(students);
    }

    public List<ProjectCard> getProjects() {
        return projects;
    }

    public List<ActivitiesCard> getActivities() {
        return activities;
    }

    public List<Students> getStudents() {
        return students;
    }


}
