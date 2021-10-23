class Catcher { 
  //først definerer jeg mine DATA
  float r;   // radius på min catcher
  float x, y; // lokation til min catcher
  PImage avatar; //Min catcher skal  ha et udseende, så jeg bruger et billede, men da jeg gerne vil kunne bruge forskellige billeder, så opretter jeg en variabel

  //så initialiserer jeg mine data i KONSTRUKTØREN
  Catcher(float tempR) { //min konstruktør, med ét argument, nemlig en midlertidig radius
    r = tempR; //Her sætter jeg min radius til en midlertidig radius
    avatar=loadImage("flagermus.png"); //her loader jeg et default flagermus-billede til at repræsentere min catcher
  }

  //Jeg har her lavet endnu en  konstruktør, hvor jeg kan vælge mellem forskellige avatarer
  Catcher(float tempR, String tempAvatar) { //min konstruktør, med to argumenter, nemlig en midlertidig radius og en midlertidig avatar
    r = tempR; //Her sætter jeg min radius til en midlertidig radiu
    avatar=loadImage(tempAvatar+".png"); //her loader jeg fx. mit eget avatarbillede - jeg kan vælge mellem dem der ligger i mit datasæt
  }
    //så bruger jeg mine data i forskellige metoder eller funktioner
  void setLocation(float tempX, float tempY) { //sæt lokationen af min catcher
    x = tempX; //og lad x være en midlertid x
    y = tempY; //og lad y være et midlertidigt y 
  }
  void vis() { //Vis min catcher
    imageMode(CENTER);  //jeg sætter mode til at være centrum
    image(avatar, x, y, r*2, r*2);  //billedet af min avatar skal vises på position x,y med størrelsen angivet ud fra radius r
  }
  boolean isIntersecting(Pumpkin p) { // en boolean-funktion der returnerer sandt eller falsk ud fra om objektet Catcher kolliderer med instansen p af objektet græskar
    float distance = dist(x, y, p.x, p.y); // beregning af variablen distance som er et kommatal. Den sætter distance lig med afstanden mellem catcherens x og y og græskarrets x og y (p.x. og p.y)
    if (distance < r + p.r) { //sammenligner distance med summen af de to radiusser. //hvis distance er mindre end variablen r plus den anden variabel r
      return true; // så returner værdien sand
    } else { //...ellers
      return false; //så returner værdien falsk
    }
  }
}
