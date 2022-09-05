package projeto;

import java.util.Scanner;

import projeto.students.Doctors;
import projeto.students.Masters;
import projeto.students.Professors;
import projeto.students.Students;

public class Main{

   public static void main(String[] args) {
    int input = -1;
    int input2 = -1; //para selecionar ação
    int input3 = -1; //para selecionar o tipo de user
    long cpf = -1;
    int id = 0;
    String description;

    DataBase db = new DataBase();

    Scanner scan = new Scanner(System.in);

    while(input != 0){
        System.out.println("1 - Criar novo projeto");
        System.out.println("2 - Remover projeto");
        System.out.println("3 - Associar usuário à projeto/ou atividade ");
        System.out.println("4 - Alterar status do projeto");
        System.out.println("0 - Sair\n");
        input = scan.nextInt();

        switch(input){
            case 1:

            System.out.println("1 - Criar usuário");
            System.out.println("2 - Criar atividade");
            System.out.println("3 - Criar projeto\n");
            input2 = scan.nextInt();

            switch(input2){
                case 1:
                System.out.println("Marque o tipo:");
                System.out.println("1 - Estudante de graduação");
                System.out.println("2 - Estudandte mestrado");
                System.out.println("3 - Estudante de doutorado");
                System.out.println("4 - Professor\n");
                
                input3 = scan.nextInt();
                switch(input3){
                    case 1:
                    System.out.println("Digite o CPF:");
                    cpf = scan.nextLong();
                    Students newUser = new Students(cpf, "estudante");
                    db.setStudents(newUser);

                    case 2:
                    System.out.println("Digite o CPF:");
                    cpf = scan.nextLong();
                    Masters newUser2 = new Masters(cpf, "mestrado");
                    db.setStudents(newUser2);

                    case 3:
                    System.out.println("Digite o CPF:");
                    cpf = scan.nextLong();
                    Doctors newUser3 = new Doctors(cpf, "doutorado");
                    db.setStudents(newUser3);

                    case 4:
                    System.out.println("Digite o CPF:");
                    cpf = scan.nextLong();
                    Professors newUser4 = new Professors(cpf, "professor");
                    db.setStudents(newUser4);          
                }

                case 2:
                System.out.println("Crie um ID:");
                id = scan.nextInt();
                
                System.out.println("Insira a descrição da atividade:");
                description = scan.nextLine();

                ActivitiesCard newActivitie = new ActivitiesCard(id, description);
                db.setActivities(newActivitie);

                case 3:
                System.out.println("Crie um ID:");
                id = scan.nextInt();
                
                System.out.println("Insira a descrição da atividade:");
                description = scan.nextLine();

                ProjectCard newProjectCard = new ProjectCard();
                db.setProjects(newProjectCard);



                
            }
            
        }

    }

   }
}