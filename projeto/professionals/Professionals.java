package projeto.professionals;

import java.util.HashMap;
import java.util.Map;

public class Professionals {
    int id;
    String type;
    Map<Integer, Boolean> actvsParticipating = new HashMap<>();
    Map<Integer, Boolean> projcsParticipating = new HashMap<>();

    public Professionals(int id, String type) {
        this.id = id;
        this.type = type;
    }
}
