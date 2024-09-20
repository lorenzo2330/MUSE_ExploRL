import 'package:app_rl/models/Exhibit.dart';

class ExhibitList {

  static Exhibit springbok = Exhibit(
      normalName: "Springbok",
      scientificName: "Antidorcas marsupialis",
      shortName: "Springbok",
      alim: "Erbivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgSpringbok.png");

  static Exhibit capibara = Exhibit(
      normalName: "Capibara",
      scientificName: "Hydrochoerus hydrochaeris",
      shortName: "Capibara",
      alim: "Erbivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgCapibara.png");

  static Exhibit cervoNobile = Exhibit(
      normalName: "Cervo nobile",
      scientificName: "Cervus elaphus",
      shortName: "Cervo",
      alim: "Erbivoro",
      loc: "Eurasia",
      nPiano: 1,
      resPhoto: "imgCervoNobile.png");

  static Exhibit wallabyDalColloRosso = Exhibit(
      normalName: "Wallaby dal collo rosso",
      scientificName: "Macropus rufogriseus",
      shortName: "Wallaby",
      alim: "Erbivoro",
      loc: "Oceania",
      nPiano: -1,
      resPhoto: "imgWallabyDalColloRosso.png");

  static Exhibit lemureCatta = Exhibit(
      normalName: "Lemure catta",
      scientificName: "Lemur catta",
      shortName: "Lemure",
      alim: "Onnivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgLemureCatta.png");

  static Exhibit opossumDellaVirginia = Exhibit(
      normalName: "Opossum della Virginia",
      scientificName: "Didelphis virginiana",
      shortName: "Opossum",
      alim: "Onnivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgOpossumDellaVirginia.png");

  static Exhibit tasso = Exhibit(
      normalName: "Tasso",
      scientificName: "Meles meles",
      shortName: "Tasso",
      alim: "Onnivoro",
      loc: "Eurasia",
      nPiano: 3,
      resPhoto: "imgTasso.png");

  static Exhibit leoneAfricano = Exhibit(
      normalName: "Leone (africano)",
      scientificName: "Panthera leo",
      shortName: "Leone",
      alim: "Carnivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgLeoneAfricano.png");

  static Exhibit linceEurasiatica = Exhibit(
      normalName: "Lince eurasiatica",
      scientificName: "Lynx lynx",
      shortName: "Lince",
      alim: "Carnivoro",
      loc: "Eurasia",
      nPiano: 3,
      resPhoto: "imgLinceEurasiatica.png");

  static Exhibit dingo = Exhibit(
      normalName: "Dingo",
      scientificName: "Canis lupus dingo",
      shortName: "Dingo",
      alim: "Carnivoro",
      loc: "Oceania",
      nPiano: 0,
      resPhoto: "imgDingo.png");

  static Exhibit otariaOrsinaDelCapo = Exhibit(
      normalName: "Otaria orsina del Capo",
      scientificName: "Arctocephalus pusillus",
      shortName: "Otaria",
      alim: "Piscivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgOtariaOrsinaDelCapo.png");

  static Exhibit leoneMarinoSudamericano = Exhibit(
      normalName: "Leone marino sudamericano",
      scientificName: "Otaria flavescens",
      shortName: "Leone marino",
      alim: "Piscivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgLeoneMarinoSudamericano.png");

  static Exhibit tricheco = Exhibit(
      normalName: "Tricheco",
      scientificName: "Odobenus rosmarus",
      shortName: "Tricheco",
      alim: "Piscivoro",
      loc: "Eurasia",
      nPiano: -1,
      resPhoto: "imgTricheco.png");

  static Exhibit oritteropo = Exhibit(
      normalName: "Oritteropo",
      scientificName: "Orycteropus afer",
      shortName: "Oritteropo",
      alim: "Insettivoro",
      loc: "Africa",
      nPiano: -1,
      resPhoto: "imgOritteropo.png");

  static Exhibit formichiereGigante = Exhibit(
      normalName: "Formichiere gigante",
      scientificName: "Myrmecophaga tridactyla",
      shortName: "Formichiere",
      alim: "Insettivoro",
      loc: "Americhe",
      nPiano: -1,
      resPhoto: "imgFormichiereGigante.png");

  static Exhibit riccioComune = Exhibit(
      normalName: "Riccio comune",
      scientificName: "Erinaceus europaeus",
      shortName: "Riccio",
      alim: "Insettivoro",
      loc: "Eurasia",
      nPiano: 3,
      resPhoto: "imgRiccioComune.png");

  static Exhibit ornitorinco = Exhibit(
      normalName: "Ornitorinco",
      scientificName: "Ornithorhynchus anatinus",
      shortName: "Ornitorinco",
      alim: "Insettivoro",
      loc: "Oceania",
      nPiano: -1,
      resPhoto: "imgOrnitorinco.png");

  static void setNeighbors() {
    springbok.neighbors = [wallabyDalColloRosso, lemureCatta];
    capibara.neighbors = [opossumDellaVirginia, cervoNobile];
    cervoNobile.neighbors = [capibara, tasso, wallabyDalColloRosso];
    wallabyDalColloRosso.neighbors = [cervoNobile, springbok];
    lemureCatta.neighbors = [leoneAfricano, springbok];
    opossumDellaVirginia.neighbors = [tasso, capibara];
    tasso.neighbors = [opossumDellaVirginia, linceEurasiatica, cervoNobile];
    leoneAfricano.neighbors = [dingo, otariaOrsinaDelCapo, lemureCatta];
    linceEurasiatica.neighbors = [tricheco, dingo, tasso];
    dingo.neighbors = [linceEurasiatica, leoneAfricano];
    otariaOrsinaDelCapo.neighbors = [oritteropo, leoneAfricano];
    leoneMarinoSudamericano.neighbors = [formichiereGigante, tricheco];
    tricheco.neighbors = [leoneMarinoSudamericano,  riccioComune, linceEurasiatica];
    oritteropo.neighbors = [ornitorinco, otariaOrsinaDelCapo];
    formichiereGigante.neighbors = [riccioComune, leoneMarinoSudamericano];
    riccioComune.neighbors = [formichiereGigante, ornitorinco, tricheco];
    ornitorinco.neighbors = [riccioComune, oritteropo];
  }

  static Exhibit winnerExhibit = leoneMarinoSudamericano;

  static Exhibit startingExhibit = opossumDellaVirginia;
}
