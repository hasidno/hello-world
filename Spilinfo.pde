class Spilinfo {

  // De nedenstående variabler er tilsammen med til at holde styr på score, level og antal liv man har tilbage
  int score;      //Deklarering af variabel til at holde styr på spillerens score
  int level;      // Deklarering af variabel til at se hvilket niveau spilleren er på
  int maxLiv;     //Deklarering af variabel til max antal liv
  int lives;     // Deklarering af variabel til at tælle antal resterende liv
  PFont f;  //Her deklarerer jeg en variabel af typen PFont, til at være f .  Den skal jeg bruge i min skrifttype jeg har importeret

  Spilinfo() {    //konstruktøren til objektet Spilinfo, som er alt der skal beregnes og skrives på skærmen under spillet
    score=0;  //initialisering af hvad scoren skal starte med
    level=1; //initialisering af variabel til at tælle niveauer
    maxLiv=5;  //initialisering af variabel til max antal liv
    lives=maxLiv;  //Initialiserer antal resterende liv med max liv (græskar der kan ramme bunden)
    f = createFont("Arial", 12, true); // Her initialiserer jeg min variabel f til skrifttypen Arial, til at skrive tekst på skærmen.
  }

  void visSlut() {
    textFont(f, 60);  //...så skal der med tesksten f i størrelsen 60...
    textAlign(CENTER);  //...hvor text er centreret
    fill(0);   //...og hvor fyldet er sort...
    text("Spillet er slut", width/2, height/2);  //...skrives teksten "  ", på lokationen centrum
  }

  void visLiv() {
    // Her vises antalliv der er tilbage
    textFont(f, 42);  //teksten fra variabel f, i størrelsen 42
    fill(255, 100, 0);  //fyldt med farven orange
    textAlign(LEFT);  //...hvor text er centreret
    text("Antal liv tilbage: " + lives, 30, 50); //med teksten " " efterfulgt af variablen "lives" på positionen 30,50
    rect(30, 60, lives*70, 10);  //en rektangel der starter i position 30,60, og ændrer sig i bredden med variablen "lives"*70, med en højde på 10.
  }

  void visLevel() {  //Her vises hvilken level spilleren er på
    textAlign(RIGHT);  //...hvor text er centreret
    text("Level: " + level, width-60, 50);  //Her skrives teksten "Level" efterfulgt af variablen "level", på positionen width-60,50
  }

  void visScore() {
    textFont(f, 42);  //teksten fra variabel f, i størrelsen 42
    textAlign(CENTER);  //...hvor text er centreret
    text("Score: " + score, width/2, height-40);  //Her skrives teksten "Score" efterfulgt af variablen "score", på positionen width/2,height-40
  }
}
