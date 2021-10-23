class Timer {  //Her er min timer til at time produktion af græskar 

  //først er der min timers DATA
  int startTid; //Her deklarer jeg en variabel for tiden da timeren startede
  int totalTid; //Her deklarer jeg en variabel for hvor længe timeren skal køre

  //Her er min timers KONSTRUKTØR
  Timer(int tempTotalTid) { //Min konstruktør tager én parameter, nemlig en midlertidig totaltid...
    totalTid = tempTotalTid; //...og derfor sættes min variabel totaltid nu lig med den midlertidige totaltid
  }
  //så er der min timers FUNKTIONER
  void setTid(int t) {  //en funktion til at sætte tiden. Den tager én parameter, nemlig variablen t
    totalTid = t; //her sætter jeg den totale tid timeren skal køre til variablen t
  }
  int nutid() {  //en funktion der gør det lettere at se at nutiden er millis
    return millis();   //den returnerer værdien millis
  }
  void start() { //Denne funktion starter timeren
    startTid=nutid(); //min variabel for starttiden sættes til at være lig med det antal millisekunder der er gåët siden spillet startede
  }
  boolean tidenErSlut() { //En boolean-funktion der returnerer sandt eller falsk ud fra om den tid der initialiseres i hovedfanen er gået
    int passeretTid = nutid()-startTid; //Her defineres og initialiseres variablen passeretTid til beregning af hvor lang tid der er gået. Nutid minus Starttiden.
    if (passeretTid > totalTid) { //Hvis den tid der er gået er længere end den tid timeren er sat til at køre...
      return true; //så returner værdien sand: tidenErSlut er sand
    } else {  //ellers
      return false;  //returner værdien falsk: tidenErSlut er falsk
    }
  }
}
