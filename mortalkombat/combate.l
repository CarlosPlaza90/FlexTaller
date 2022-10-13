%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    FILE *yyin;
    int VidaJugador1 = 100;
    int VidaJugador2 = 100;
    int pegarse = 0;
    int quien = 0;
    

%}

%option noyywrap
%option yylineno


MovimientosBasicos [ABYX]
Arriba [A][r][r][i][b][a]
Abajo [A][b][a][j][o]
Izquierda [I][z][q][u][i][e][r][d][a]
Derecha [D][e][r][e][c][h][a]
Movimientos ({Arriba}|{Abajo}|{Izquierda}|{Derecha})
Combo {Movimientos}{MovimientosBasicos}
Bloqueo [B][l][o][q][u][e][o]
Distancia [0-9]|([0-9]+)
JohnnyCage [J][o][h][n][n][y][C][a][g][e]
Kano [K][a][n][o]
F [F]
Fatality {F}{Movimientos}+{MovimientosBasicos}+
FatalityJohnnyCage {JohnnyCage}:{Fatality}
FatalityKano {Kano}:{Fatality}
Final [F][i][n]

%%


{Distancia} {
                if(VidaJugador1 > 0 && VidaJugador2 > 0){
                    if(atoi(yytext)<41){
                        pegarse = 1;
                        printf("Estan cerca para poderse golpear");
                    }else{
                        pegarse = 0;
                        printf("Los personajes estan muy lejos para golpearse aburridos");
                    }
                }
            }
{JohnnyCage} {  quien = 2;}
{Kano} {quien = 1;}
{Combo} {
            if(VidaJugador1 > 0 && VidaJugador2 > 0){
                if(pegarse==1){
                    if(quien == 2){
                        VidaJugador2 = VidaJugador2-20;
                        printf("-20 de daño a kano por COMBOOOO ");
                    }else{
                        VidaJugador1 = VidaJugador1-20;
                        printf("-20 de daño a JohnnyCage por COMBOOOO");
                    }
                }
            }
        }
{MovimientosBasicos} {
                        if(VidaJugador1 > 0 && VidaJugador2 > 0){
                            if(pegarse==1){
                                if(quien == 2){
                                    VidaJugador2 = VidaJugador2-10;
                                    printf("-10 de daño a kano por un golpe basico");
                                }else{
                                    VidaJugador1 = VidaJugador1-10;
                                    printf("-10 de daño a JohnnyCage por un golpe basico");
                                }
                            }
                        }
                        
                     }
{Final} {
            if(VidaJugador1 > 0 && VidaJugador2 > 0){
                printf("\n Los jugadores siguen con vida ");
                
            }else {
                if(VidaJugador1 < 1 ){
                    printf("\n Kano GANAAAA");
                    printf("\n Johnny Cage tambaleandose... ");
                }
                if(VidaJugador2 < 1){
                    printf("\n Johnny Cage GANAAAA");
                    printf("\n Kano tambaleandose... \n\n");
                }
                    
            }
}
{FatalityJohnnyCage} {

            if(VidaJugador1 > 0 && VidaJugador2 > 0){
                printf("\n Los jugadores siguen con vida ");
                
            }else {
                
                if(VidaJugador2 < 1){
                    printf("\n Fatality %s ",yytext);
                    printf("\n FATALITYYYYY ");
                }
                    
            }
}
{FatalityKano} {

            if(VidaJugador1 > 0 && VidaJugador2 > 0){
                printf("\n Los jugadores siguen con vida ");
                
            }else {
                
                if(VidaJugador1 < 1){
                    printf("\n Fatality de Kano %s ",yytext);
                    printf("\n FATALITYYYYY ");
                }
                    
            }
}
%%

int main(int argc, char *argv[]){

    /*Abro el archivo en modo lectura y dejo apuntado el puntero yyvin que nos pide FLEX alli.*/
    
    yylex(); 
    printf("\nFLEX finalizo la lectura del archivo %s \n", argv[1]);
    
    return 0;
}