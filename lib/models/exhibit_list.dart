import 'package:app_rl/models/exhibit.dart';

class ExhibitList {

  /*  Esempio di creazione di un nuovo animale
  static Animale nome = Animale(
      normalName: "nome animale", //Dev'essere uguale al QR-code
      scientificName: "nome scientifico",
      alimentazione: "...",
      ambiente: "...",
      nPiano: ...,
      resPhoto: "..."     //Dev'essere uguale all'immagine nella cartella images
      );
   */



  static Animale springbok = Animale(
      normalName: "Springbok",
      scientificName: "Antidorcas marsupialis",
      alimentazione: "Erbivoro",
      ambiente: "Africa",
      nPiano: -1,
      resPhoto: "imgSpringbok.png");

  static Animale capibara = Animale(
      normalName: "Capibara",
      scientificName: "Hydrochoerus hydrochaeris",
      alimentazione: "Erbivoro",
      ambiente: "Americhe",
      nPiano: -1,
      resPhoto: "imgCapibara.png");

  static Animale cervoNobile = Animale(
      normalName: "Cervo nobile",
      scientificName: "Cervus elaphus",
      alimentazione: "Erbivoro",
      ambiente: "Eurasia",
      nPiano: 3,
      resPhoto: "imgCervoNobile.png");

  static Animale wallabyDalColloRosso = Animale(
      normalName: "Wallaby dal collo rosso",
      scientificName: "Macropus rufogriseus",
      alimentazione: "Erbivoro",
      ambiente: "Oceania",
      nPiano: -1,
      resPhoto: "imgWallabyDalColloRosso.png");

  static Animale lemureCatta = Animale(
      normalName: "Lemure catta",
      scientificName: "Lemur catta",
      alimentazione: "Onnivoro",
      ambiente: "Africa",
      nPiano: -1,
      resPhoto: "imgLemureCatta.png");

  static Animale opossumDellaVirginia = Animale(
      normalName: "Opossum della Virginia",
      scientificName: "Didelphis virginiana",
      alimentazione: "Onnivoro",
      ambiente: "Americhe",
      nPiano: -1,
      resPhoto: "imgOpossumDellaVirginia.png");

  static Animale tasso = Animale(
      normalName: "Tasso",
      scientificName: "Meles meles",
      alimentazione: "Onnivoro",
      ambiente: "Eurasia",
      nPiano: 3,
      resPhoto: "imgTasso.png");

  static Animale leoneAfricano = Animale(
      normalName: "Leone (africano)",
      scientificName: "Panthera leo",
      alimentazione: "Carnivoro",
      ambiente: "Africa",
      nPiano: -1,
      resPhoto: "imgLeoneAfricano.png");

  static Animale linceEurasiatica = Animale(
      normalName: "Lince eurasiatica",
      scientificName: "Lynx lynx",
      alimentazione: "Carnivoro",
      ambiente: "Eurasia",
      nPiano: 3,
      resPhoto: "imgLinceEurasiatica.png");

  static Animale dingo = Animale(
      normalName: "Dingo",
      scientificName: "Canis lupus dingo",
      alimentazione: "Carnivoro",
      ambiente: "Oceania",
      nPiano: 0,
      resPhoto: "imgDingo.png");

  static Animale otariaOrsinaDelCapo = Animale(
      normalName: "Otaria orsina del Capo",
      scientificName: "Arctocephalus pusillus",
      alimentazione: "Piscivoro",
      ambiente: "Africa",
      nPiano: -1,
      resPhoto: "imgOtariaOrsinaDelCapo.png");

  static Animale leoneMarinoSudamericano = Animale(
      normalName: "Leone marino sudamericano",
      scientificName: "Otaria flavescens",
      alimentazione: "Piscivoro",
      ambiente: "Americhe",
      nPiano: -1,
      resPhoto: "imgLeoneMarinoSudamericano.png");

  static Animale tricheco = Animale(
      normalName: "Tricheco",
      scientificName: "Odobenus rosmarus",
      alimentazione: "Piscivoro",
      ambiente: "Eurasia",
      nPiano: -1,
      resPhoto: "imgTricheco.png");

  static Animale oritteropo = Animale(
      normalName: "Oritteropo",
      scientificName: "Orycteropus afer",
      alimentazione: "Insettivoro",
      ambiente: "Africa",
      nPiano: -1,
      resPhoto: "imgOritteropo.png");

  static Animale formichiereGigante = Animale(
      normalName: "Formichiere gigante",
      scientificName: "Myrmecophaga tridactyla",
      alimentazione: "Insettivoro",
      ambiente: "Americhe",
      nPiano: -1,
      resPhoto: "imgFormichiereGigante.png");

  static Animale riccioComune = Animale(
      normalName: "Riccio comune",
      scientificName: "Erinaceus europaeus",
      alimentazione: "Insettivoro",
      ambiente: "Eurasia",
      nPiano: 3,
      resPhoto: "imgRiccioComune.png");

  static Animale ornitorinco = Animale(
      normalName: "Ornitorinco",
      scientificName: "Ornithorhynchus anatinus",
      alimentazione: "Insettivoro",
      ambiente: "Oceania",
      nPiano: -1,
      resPhoto: "imgOrnitorinco.png");

  static Animale lupoGrigio = Animale(
      normalName: "Lupo (grigio)",
      scientificName: "Canis lupus",
      alimentazione: "4(*)",
      ambiente: "Eurasia",
      nPiano: 0,
      resPhoto: "imgLupoGrigio.png"
  );

  static Animale bradipoDidattilo = Animale(
      normalName: "Bradipo didattilo",
      scientificName: "Choloepus didactylus",
      alimentazione: "2(*)",
      ambiente: "Americhe",
      nPiano: 0,
      resPhoto: "imgBradipoDidattilo.png"
  );

  static void setNeighbors() {
    //Game
    //Nome.neighbors = [neighbor1, neighbor2, ...];
    springbok.neighbors = [lemureCatta, wallabyDalColloRosso];
    capibara.neighbors = [cervoNobile, opossumDellaVirginia];
    cervoNobile.neighbors = [capibara, tasso, wallabyDalColloRosso];
    wallabyDalColloRosso.neighbors = [cervoNobile, springbok];
    lemureCatta.neighbors = [leoneAfricano, springbok];
    opossumDellaVirginia.neighbors = [capibara, tasso];
    tasso.neighbors = [cervoNobile, linceEurasiatica, opossumDellaVirginia];
    leoneAfricano.neighbors = [dingo, lemureCatta, otariaOrsinaDelCapo];
    linceEurasiatica.neighbors = [dingo, tasso, tricheco];
    dingo.neighbors = [leoneAfricano, linceEurasiatica];
    otariaOrsinaDelCapo.neighbors = [leoneAfricano, oritteropo];
    leoneMarinoSudamericano.neighbors = [formichiereGigante, tricheco];
    tricheco.neighbors = [leoneMarinoSudamericano, linceEurasiatica, riccioComune];
    oritteropo.neighbors = [ornitorinco, otariaOrsinaDelCapo];
    formichiereGigante.neighbors = [leoneMarinoSudamericano, riccioComune];
    riccioComune.neighbors = [formichiereGigante, ornitorinco, tricheco];
    ornitorinco.neighbors = [oritteropo, riccioComune];

    //Tutorial
    lupoGrigio.neighbors = [bradipoDidattilo, dingo];
  }

  static Animale startingExhibit = opossumDellaVirginia;

  static Animale winnerExhibit = leoneMarinoSudamericano;

  static Animale tutorialExhibit = lupoGrigio;

  static Animale getExhibitByName(String name){
    switch(name){
    case "Springbok" : return springbok;
    case "Capibara" : return capibara;
    case "Cervo nobile" : return cervoNobile;
    case "Wallaby dal collo rosso" : return wallabyDalColloRosso;
    case "Lemure catta" : return lemureCatta;
    case "Opossum della Virginia" : return opossumDellaVirginia;
    case "Tasso" : return tasso;
    case "Leone (africano)" : return leoneAfricano;
    case "Lince eurasiatica" : return linceEurasiatica;
    case "Dingo" : return dingo;
    case "Otaria orsina del Capo" : return otariaOrsinaDelCapo;
    case "Leone marino sudamericano" : return leoneMarinoSudamericano;
    case "Tricheco" : return tricheco;
    case "Oritteropo" : return oritteropo;
    case "Formichiere gigante" : return formichiereGigante;
    case "Riccio comune" : return riccioComune;
    case "Ornitorinco" : return ornitorinco;
    case "Lupo (grigio)" : return lupoGrigio;
    case "Bradipo didattilo" : return bradipoDidattilo;
    default:  return startingExhibit;
    }
  }

  static bool scannedExhibit(String name){
    if(name == "Springbok") return true;
    if(name == "Capibara") return true;
    if(name == "Cervo nobile") return true;
    if(name == "Wallaby dal collo rosso") return true;
    if(name == "Lemure catta") return true;
    if(name == "Opossum della Virginia") return true;
    if(name == "Tasso") return true;
    if(name == "Leone (africano)") return true;
    if(name == "Lince eurasiatica") return true;
    if(name == "Dingo") return true;
    if(name == "Otaria orsina del Capo") return true;
    if(name == "Leone marino sudamericano") return true;
    if(name == "Tricheco") return true;
    if(name == "Oritteropo") return true;
    if(name == "Formichiere gigante") return true;
    if(name == "Riccio comune") return true;
    if(name == "Ornitorinco") return true;
    if(name == "Lupo (grigio)") return true;
    if(name == "Bradipo didattilo") return true;
    return false;
  }
}
