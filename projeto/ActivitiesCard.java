package projeto;

import java.util.ArrayList;
import java.util.List;

public class ActivitiesCard {
    int id;
    String description;
    List <String> hours = new ArrayList<>();
    int responsibleId;
    
    public ActivitiesCard(int id, String description) {
        this.id = id;
        this.description = description;
        
    }
}
