class MyString {
  static const String placeholder = "TODO";

  static const String alimentazione = "Alimentazione";
  static const String ambiente = "Ambiente";
  static const String animale = "Animale";
  static const String animaleTrovato = "Animale trovato";
  static const String appName = "MUSE ExploRL";
  static const String avvio = "Avvio";
  static const String cancellaDati = "Cancella dati";
  static const String chiudi = "Chiudi";
  static const String cosaPuoiVisitare = "Cosa puoi visitare ora";
  static const String cosaHaiVisitato = "Cosa hai già visitato";
  static const String credits = "Credits";
  static const String creditDipartimento = "Credit dipartimento";
  static const String creditFont = "Credit font";
  static const String creditFoto = "Fotografie:";
  static const String creditFotografo = "- Nome Cognome";
  static const String creditPopmat = "- Laboratorio di comunicazione,\n   storia e filosofia della\n   matematica del Dipartimento di\n   Matematica dell'Università di\n   Trento";
  static const String creditProgetto = "Attività progettata da:";
  static const String creditMuse = "- MUSE - Museo delle Scienze di\n   Trento";
  static const String creditNomeSviluppatore = "- Lorenzo D'Ambrosio (DISI\n   UniTrento)";
  static const String creditSviluppatore = "App sviluppata da:";
  static const String creditTitle = "Credits:";
  static const String descrizioneObiettivo =
      "Trova un animale specifico raccogliendo indizi dalle caratteristiche degli altri animali.\n"
      "Ogni scelta ti consuma risorse, quindi pianifica con attenzione per conservare energia.\n"
      "Raggiungi il tuo obiettivo con il minor numero di mosse possibile!\n\n"
      "Buona fortuna, esploratore!";
  static const String errorPage = "Error page";
  static const String iniziamo = "Iniziamo";
  static const String obiettivo = "Obiettivo";
  static const String N = "N°";
  static const String nDita = "Numero dita";
  static const String nMatch = "nMatch";
  static const String nome = "Nome";
  static const String nuovoTentativo = "Nuovo tentativo";
  static const String ricaricaEnergia = "Ricarica energia";
  static const String riprova = "Riprova";
  static const String riprovaScansione = "Riprova scansione";
  static const String routeAlreadyVisited = "/alreadyVisited";
  static const String routeExhibit = "/exhibit";
  static const String routeHome = "/home";
  static const String routeObjective = "/objective";
  static const String routeNotVisited = "/notVisited";
  static const String routeTutorial = "/tutorial";

  static const String scanQr = "Scansiona il codice QR";
  static const String scegliAnimale = "Scegli il prossimo animale";
  static const String selezionaPartita = "Seleziona una partita";
  static const String simulaScansione = "Simula una scansione";
  static const String sottotitoloAttivita = "Come impara l'intelligenza artificiale?";
  static const String titoloAttivita = "Impara dagli errori, sperimenta il Reinforcement Learning";
  static const String tornaAllaHome = "Torna alla Home Page";
  static const String tutorial = "Tutorial";
  static const String tutorialEnergia = "Tutorial energia";
  static const String tutorialInfo1 = "Questa app ti supporterà nella tua avventura";
  static const String tutorialInfo2 = "Prima di partire, in questo tutorial scoprirai le funzionalità che ti aiuteranno nell'esplorazione";
  static const String tutorialInfo3 = "Scorri la schermata per iniziare";

  static String energy(bool isMini, int charge){
    return isMini ? "$charge   " : "Energia rimanente: $charge   ";
  }

  static String finalEnergy(bool hasWin, int energy){
    return hasWin ? "Punti energia finali: $energy" : "";
  }

  static String gameEnergy(int i){
    return "Game-$i-energy";
  }

  static String gameLabel(int index, int length){
    return index == length ? "Partita attuale" : "Partita ${index + 1}";
  }

  static String gameMatch(int i){
    return "Game-$i-match";
  }

  static String getAlimentazione(String alim) {
    return "Alimentazione: $alim";
  }

  static String getLocalitaGeografica(String locGeo) {
    return "Località geografica: $locGeo";
  }

  static String nPiano(int nPiano) {
    return "Vai al piano $nPiano";
  }

  static String qrResult(bool scansioneCorretta, String? result) {
    return (result != null)
        ? scansioneCorretta
        ? "Trovato QR corretto: $result"
        : "Trovato QR errato"
        : "Scansiona il QR code";
  }

  static String result(bool noEnergy, bool hasWin) {
    return noEnergy
        ? "Hai esaurito tutti i punti energia"
        : hasWin
            ? "Hai trovato l'animale vincente!"
            : "";
  }

  static String tutEnergyInfo(int e){
    return e > 0 ? "Sei ancora in gioco" : "Hai esaurito l'energia";
  }
}
