//Mit Halloween-spil


//Spilleren starter med 10 point. For hver græskar der når bunden nedsættes scoren med én. Hvis alle 10 græskar når ned uden at scoren er nået ned på nul, så skal der begynde et nyt niveau.
//For hvert niveau falder græskarrene hurtigere.
//Hvis 10 græskar når bunden på et hvilket som helst niveau er spillet tabt.
//Antal liv vises både som tal og som en bar der aftager i størrelse.

Catcher catcher; //Her deklarerer jeg variablen catcher ud fra Catcher-objektet
Timer timer; //Her deklarerer jeg variablen timer ud fra mit timer-objekt
Pumpkin[] pumpkins; //her deklarerer jeg variablen pumpkins af typen Pumpkin, altså ud fra skabelonen(class)
Spilinfo spilinfo; //Her deklarer jeg variablen hud ud fra Spilinfo-klassen
int ingenPumpkins=0;    //Her deklarerer og initialiserer jeg hvor mange græskar spillet starter med
int totalPumpkins = ingenPumpkins; //Tæller det totale antal græskar der er i spillet. Starter med værdien af vairablen ingenPumpkins
boolean spilletErSlut = false; //En boolean variabel, til at holde styr på hvornår spillet er slut. Jeg har sat den til at starte med værdien falsk
int   pumpkinsUde = 0;   //tæller til at tælle når et græskar er ude af spillet
int skabelsesTid = 3000;  //variabel til at sætte tiden for hvor lang tid der skal gå mellem skabelse af hver ny instans af et græskar
PImage slim; //Dette er en variabel for det billede jeg bruger til min baggrund

void setup() {
  // size(640, 360);  //Det vindue jeg vil vise mit spil i
  size(1280, 720);  //Det vindue jeg vil vise mit spil i


  catcher = new Catcher(60); //Her initialiserer jeg min catcher til at ha en radius på 60 pixels
  pumpkins = new Pumpkin[10]; //Her initialiserer jeg en ny instans af arrayet Pumkins, med 10 pladser, ud fra variablen pumpkins.
  timer = new Timer(skabelsesTid); //Her initialiserer jeg timeren til at gå i gang ud fra værdien af variablen skabelsesTid
  timer.start(); // Her sætter jeg timeren i gang
  spilinfo = new Spilinfo(); //Her initialiserer jeg en ny instans af objektet Spilinfo - som er alt det jeg beregner og skriver på skærmen i løbet af spillet
  noCursor();  //her fjerner jeg min cursor så det mere ligner et rigtigt spil
  slim=loadImage("slim.png");  //Her henter jeg det billede jeg bruger til min baggrund i spillet
}

void draw() {
  background(slim); //Grønt slim fordi det er temaet for Halloween
  if (spilletErSlut) { //Hvis spillet er slut...
    spilinfo.visSlut(); //...så gør det der står i funktionen visSlut i klassen Spilinfo
  } else {    // hvis spillet IKKE er slut...
    catcher.setLocation(mouseX, mouseY); //..så indstil lokationen af min catcher ud fra musen
    catcher.vis(); //..og vis min catcher

    if (timer.tidenErSlut()) { //Hvis timeren har brugt al den tid jeg har initialiseret den til...

      //Her fylder jeg mit græskar-array med græskar
      if (totalPumpkins < pumpkins.length) {  //Hvis det totale antal græskar er mindre end det antal græskar der er afsat plads til i mit græskar-array...
        pumpkins[totalPumpkins] = new Pumpkin();  //..så skal mit græskar array med indexpladserne totalPumpkins initialisere et nyt græskar ud fra mit græskar-objekt...
        totalPumpkins++;  //...og så skal det totale antal græskar øges med én
      }
      timer.start();  // ... og så skal timeren for hvornår der skal skabes flere græskar startes igen.
    }

    // Her får jeg alle græskar til at falde og vises
    for (int i = 0; i < totalPumpkins; i++ ) {   //her looper jeg gennem hele længden af mit array med det totale antal græskar.
      if (pumpkins[i].erGrebet) continue;  // hvis græskar i er grebet så gå videre til næste græskar ("i" i  linjen ovenfor), ellers gå videre til næste linje
      pumpkins[i].fald();  //...så lad græskar i falde
      pumpkins[i].vis();  //...og vis græskar i

      if (pumpkins[i].underBunden()) {   //hvis græskar i når under bunden...
        pumpkinsUde++;   //...så sæt antallet af pumpkinsUde op med én...
        pumpkins[i].ude();  //...og så er græskar i ude. Jeg kalderfunktionen ude, som ændrer værdien af boolean-variablen erGrebet
        spilinfo.lives--;   //...og så skal der fjernes et liv

        if (spilinfo.lives <= 0) {  //for hvert græskar der er ude tjekkes om antallet af liv der er ude når under 0
          spilletErSlut = true;  //...og hvis det er sandt, så er spillet slut
          break; //..og så slutter spillet.
        }
      }
      if (catcher.isIntersecting(pumpkins[i])) { //hvis min catcher kolliderer med et græskar på hvilken som helst index-plads i mit array...så har jeg grebet det græskar...
        pumpkins[i].ude();  //...så er græskarret på den indexplads ude...
        pumpkinsUde++;  //..og så skal min pumpkinUde-tæller øges med én...
        spilinfo.score++;  //...og min score skal øges med én.
      }
    }
    if (pumpkinsUde >= pumpkins.length) {  //Hvis min pumpkinsUde tæller er større end længden af mit pumpkins-array, så betyder det at alle græskarrene er brugt, og så er det level slut...
      spilinfo.level++;  //...og så skal jeg op på næste level

      //Her re-setter jeg alle min spil-elementer
      pumpkinsUde = 0;  //...og så skal pumpkinUde-tælleren re-settes til nul i næste spil
      spilinfo.lives =spilinfo.maxLiv;  //...og jeg skal have mine liv igen...
      totalPumpkins = ingenPumpkins;  //...og det totale antal græskar skal re-sættes til nul
      timer.setTid(skabelsesTid/(spilinfo.level));  //...og timeren skal gøre det lidt vanskeligere ved at gøre skabelses-tiden for græskar kortere for hvert niveau ved at dividere med niveauet
    }
    spilinfo.visLiv();  //viser hele tiden hvor mange liv jeg har tilbage, både i tal og visuelt i en bar
    spilinfo.visLevel();  //viser hele tiden den level jeg er på
    spilinfo.visScore(); //viser hele tiden den score jeg har
  }
}
