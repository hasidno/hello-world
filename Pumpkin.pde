class Pumpkin {
  //mit græskar har nogle data
  float x;  //Deklarering af lokationen x.
  float y;  //Deklarering af lokationen y.
  float r;  // Deklarering af r (radius på et græskar).
  float ySpeed;  // Deklarering af hastighed eller bevægelsesretning på et græskar.
  PImage pumpkin;  //Mine græskar skal se ægte ud, så jeg bruger dette billede
  boolean erGrebet = false;  //En boolean variabel til at holde styr på om græskarret stadig er i brug. Det starter med ikke at være grebet.

  Pumpkin() { //Konstruktøren til Objektet græskar. Initialiseringer.
    x= random(width); //Initialisering af x: De sendes afsted tilfældige steder spredt på tværs af vinduet.
    y= -r*4; //Initialisering af y: de sendes afsted fra lidt over vinduet, så det ser ud som om de kommer fra himlen. .
    r=random(10, 50); // Initialisering af r: Her gør jeg størrelsen af græskar tilfældige mellem 5 og 10
    ySpeed= random(5, 10); // Initialisering af ySpeed: Græskarrene falder med tilfældig hastighed
    pumpkin = loadImage("pumpkin.png");  //her loader jeg mit græskar-billede
  }
  void fald() { //en funktion eller metode til at lade græskarret falde
    y=y+ySpeed; //øg hastigheden af y med variablen ySpeed
  }
  boolean underBunden() { //En boolean funktion der tjekker om græskarret kommer ned til bunden
    if (y>height+r*4) { //hvis græskarrene når lidt under bunden af vinduet
      return true;  //...så returner værdien sand
    } else {
      return false;  //...ellers returner værdien falsk
    }
  }
  void vis() { //en funktion el. metode til at vise græskarret
    noStroke(); //ingen kontur
    for (int i = 2; i < r; i++) {  //her kører jeg igennem hele mit array af græskar
      imageMode(CENTER); //jeg sætter mine græskar i Center-mode
      image(pumpkin, x, y, i*2, i*2);  //...og viser hvert græskar i mit array som et billede af et græskar, vist i en cirkel defineret vha en radius
    }
  }
  void ude() {  //...Hvis græskarret er ude...
    erGrebet = true;  //...så lad det være sandt at det er grebet
  }
}
