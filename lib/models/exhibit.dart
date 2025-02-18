
class Animale {

  String normalName, scientificName, alimentazione, ambiente, resPhoto;
  int nPiano;
  List<Animale> neighbors = [];
  //TipoAttributo nomeAttributo = valoreAttributo;    //Aggiungere un parametro

  Animale({
    required this.normalName, required this.scientificName,
    required this.alimentazione, required this.ambiente,
    required this.nPiano, required this.resPhoto,
    //required this.nomeAttributo                     //Aggiungere un parametro
  });
}


