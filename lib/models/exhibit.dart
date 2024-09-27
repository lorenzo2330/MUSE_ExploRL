
class Exhibit {

  Exhibit({
    required this.normalName,
    required this.scientificName,
    required this.alim,
    required this.loc,
    required this.nPiano,
    required this.resPhoto,
  });

  String normalName;
  String scientificName;
  String alim;
  String loc;
  int nPiano;
  String resPhoto;
  List<Exhibit> neighbors = [];
}


