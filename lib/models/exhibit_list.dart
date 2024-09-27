import 'package:app_rl/models/exhibit.dart';

class ExhibitList {

  static Exhibit springbok = Exhibit(
      normalName: "Springbok",
      scientificName: "Antidorcas marsupialis",
      alim: "Erbivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgSpringbok.png");

  static Exhibit capibara = Exhibit(
      normalName: "Capibara",
      scientificName: "Hydrochoerus hydrochaeris",
      alim: "Erbivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgCapibara.png");

  static Exhibit cervoNobile = Exhibit(
      normalName: "Cervo nobile",
      scientificName: "Cervus elaphus",
      alim: "Erbivoro",
      loc: "Eurasia",
      nPiano: 1,
      resPhoto: "imgCervoNobile.png");

  static Exhibit wallabyDalColloRosso = Exhibit(
      normalName: "Wallaby dal collo rosso",
      scientificName: "Macropus rufogriseus",
      alim: "Erbivoro",
      loc: "Oceania",
      nPiano: -1,
      resPhoto: "imgWallabyDalColloRosso.png");

  static Exhibit lemureCatta = Exhibit(
      normalName: "Lemure catta",
      scientificName: "Lemur catta",
      alim: "Onnivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgLemureCatta.png");

  static Exhibit opossumDellaVirginia = Exhibit(
      normalName: "Opossum della Virginia",
      scientificName: "Didelphis virginiana",
      alim: "Onnivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgOpossumDellaVirginia.png");

  static Exhibit tasso = Exhibit(
      normalName: "Tasso",
      scientificName: "Meles meles",
      alim: "Onnivoro",
      loc: "Eurasia",
      nPiano: 3,
      resPhoto: "imgTasso.png");

  static Exhibit leoneAfricano = Exhibit(
      normalName: "Leone (africano)",
      scientificName: "Panthera leo",
      alim: "Carnivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgLeoneAfricano.png");

  static Exhibit linceEurasiatica = Exhibit(
      normalName: "Lince eurasiatica",
      scientificName: "Lynx lynx",
      alim: "Carnivoro",
      loc: "Eurasia",
      nPiano: 3,
      resPhoto: "imgLinceEurasiatica.png");

  static Exhibit dingo = Exhibit(
      normalName: "Dingo",
      scientificName: "Canis lupus dingo",
      alim: "Carnivoro",
      loc: "Oceania",
      nPiano: 0,
      resPhoto: "imgDingo.png");

  static Exhibit otariaOrsinaDelCapo = Exhibit(
      normalName: "Otaria orsina del Capo",
      scientificName: "Arctocephalus pusillus",
      alim: "Piscivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgOtariaOrsinaDelCapo.png");

  static Exhibit leoneMarinoSudamericano = Exhibit(
      normalName: "Leone marino sudamericano",
      scientificName: "Otaria flavescens",
      alim: "Piscivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgLeoneMarinoSudamericano.png");

  static Exhibit tricheco = Exhibit(
      normalName: "Tricheco",
      scientificName: "Odobenus rosmarus",
      alim: "Piscivoro",
      loc: "Eurasia",
      nPiano: -1,
      resPhoto: "imgTricheco.png");

  static Exhibit oritteropo = Exhibit(
      normalName: "Oritteropo",
      scientificName: "Orycteropus afer",
      alim: "Insettivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgOritteropo.png");

  static Exhibit formichiereGigante = Exhibit(
      normalName: "Formichiere gigante",
      scientificName: "Myrmecophaga tridactyla",
      alim: "Insettivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgFormichiereGigante.png");

  static Exhibit riccioComune = Exhibit(
      normalName: "Riccio comune",
      scientificName: "Erinaceus europaeus",
      alim: "Insettivoro",
      loc: "Eurasia",
      nPiano: 3,
      resPhoto: "imgRiccioComune.png");

  static Exhibit ornitorinco = Exhibit(
      normalName: "Ornitorinco",
      scientificName: "Ornithorhynchus anatinus",
      alim: "Insettivoro",
      loc: "Oceania",
      nPiano: -1,
      resPhoto: "imgOrnitorinco.png");

  static Exhibit lupoGrigio = Exhibit(
      normalName: "Lupo (grigio)",
      scientificName: "Canis lupus",
      alim: "4(*)",
      loc: "Eurasia",
      nPiano: 0,
      resPhoto: "imgLupoGrigio.png"
  );

  static Exhibit bradipoDidattilo = Exhibit(
      normalName: "Bradipo didattilo",
      scientificName: "Choloepus didactylus",
      alim: "2(*)",
      loc: "Americhe",
      nPiano: 0,
      resPhoto: "imgBradipoDidattilo.png"
  );

  static void setNeighbors() {
    //Game
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
    lupoGrigio.neighbors = [bradipoDidattilo, leoneAfricano];
  }

  static Exhibit winnerExhibit = leoneMarinoSudamericano;

  static Exhibit startingExhibit = opossumDellaVirginia;

  static Exhibit tutorialExhibit = lupoGrigio;

  static Exhibit getExhibitByName(String name){
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
