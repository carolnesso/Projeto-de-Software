package projeto;

import java.util.Scanner;

public class Main{

   public static void main(String[] args) {
    int input = -1;

    Scanner scan = new Scanner(System.in);

    while(input != 0){
        System.out.println("1 - Criar novo projeto");
        System.out.println("2 - Remover projeto");
        System.out.println("3 - Associar usuário à projeto/ou atividade ");
        System.out.println("4 - Alterar status do projeto");
        System.out.println("0 - Sair");
        input = scan.nextInt();

        switch(input){
            case 1:
            System.out.println("você escolheu 1");
            
        }

    }

   }
}