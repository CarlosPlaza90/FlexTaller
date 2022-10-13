%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    FILE *yyin;
    int jugadoresActivos;
    char P1[11];
    char P2[11];
    char P3[11];
    char P4[11];
    int HP1 = 100;
    int HP2 = 100;
    int HP3 = 100;
    int HP4 = 100;
    int hit = 0;
    int escenario = 0;
    int personaje = 0;

    
%}

%option noyywrap
%option yylineno

Arriba [A][r][r][i][b][a]
Derecha [D][e][r][e][c][h][a]~
Abajo [A][b][a][j][o]
Izquierda [I][z][q][u][i][e][r][d][a]
Triangulo [T][r][i][a][n][g][u][l][o]
Circulo [C][i][r][c][u][l][o]
Cuadrado [C][u][a][d][r][a][d][o]

L1[L][1]
L2[L][2]
R1[R][1]
R2[R][2]

Distancia [0-9]|([0-9]+)

Axel [A][x][e][l]
Grasshopper [G][r][a][s][s][h][o][p][p][e][r]
MrGrimm [M][r][G][r][i][m][m]
Hammerhead [H][a][m][m][e][r][h][e][a][d]
Minion [M][i][n][i][o][n]
Outlaw2 [O][u][t][l][a][w][2]
Roadkill [R][o][a][d][k][i][l][l]
Shadow [S][h][a][d][o][w]
MrSlam [M][r][S][l][a][m]
Spectre [S][p][e][c][t][r][e]
Sweettooth [S][w][e][e][t][t][o][o][t][h]
Thumper [T][h][u][m][p][e][r]
Twister [T][w][i][s][t][e][r]
Warthog [W][a][r][t][h][o][g]
Darktooth [D][a][r][k][t][o][o][t][h]

Select [S][e][l][e][c][t]
Escenario [E][s][c][e][n][a][r][i][o]
Personaje [P][e][r][s][o][n][a][j][e]

Moscow [M][o][s][c][o][w]
Paris [P][a][r][i][s]
Amazonia [A][m][a][z][o][n][i][a]
NewYork [N][e][w][Y][o][r][k]
Antartica [A][n][t][a][r][t][i][c][a]
Holland [H][o][l][l][a][n][d]
HongKong [H][o][n][g][K][o][n][g]
DarkTooth [D][a][r][k][T][o][o][t][h]


AtaquesEspeciales ({Arriba}|{Abajo}|{Izquierda}|{Derecha})
SeleccionarMapa {Select}{Escenario}


%%

{Axel} {personaje = 1;}
{Grasshopper} {personaje = 2;}
{MrGrimm} {personaje = 3;}
{Hammerhead} {personaje = 4;}
{Minion} {personaje = 5;}
{Outlaw2} {personaje = 6;}
{Roadkill} {personaje = 7;}
{Shadow} {personaje = 8;}
{MrSlam} {personaje = 9;}
{Spectre} {personaje = 10;}
{Sweettooth} {personaje = 11;}
{Thumper} {personaje = 12;}
{Twister} {personaje = 13;}
{Warthog} {personaje = 14;}
{Darktooth} {personaje = 15;}


{Moscow} {escenario = 1;}
{Paris} {escenario = 2;}
{Amazonia} {escenario = 3;}
{NewYork} {escenario = 4;}
{Antartica} {escenario = 5;}
{Holland} {escenario = 6;}
{HongKong} {escenario = 7;}
{DarkTooth} {escenario = 8;}

{SeleccionarMapa} {
            if(escenario == 1){
                printf("Ha seleccionado Moscow");
            }else if(escenario == 2){
                printf("Ha seleccionado Paris");
            }else if(escenario == 3){
                printf("Ha seleccionado Amazonia");
            }else if(escenario == 4){
                printf("Ha seleccionado New York");
            }else if(escenario == 5){
                printf("Ha seleccionado Antartica");
            }else if(escenario == 6){
                printf("Ha seleccionado Holland");
            }else if(escenario == 7){
                printf("Ha seleccionado Hong Kong");
            }else if(escenario == 8){
                printf("Ha seleccionado Dark Tooth");
            }
}
%%

int main(int argc, char *argv[]){

    /*Abro el archivo en modo lectura y dejo apuntado el puntero yyvin que nos pide FLEX alli.*/
    
    yylex(); 
    printf("\nFLEX finalizo la lectura del archivo %s \n", argv[1]);
    
    return 0;
}
