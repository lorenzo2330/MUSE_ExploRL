
class Exhibit {
  String normalName;
  String scientificName;
  String shortName;
  String alim;
  String loc;
  int nPiano;
  String resPhoto;
  List<Exhibit> neighbors = [];

  Exhibit({
    required this.normalName,
    required this.scientificName,
    required this.shortName,
    required this.alim,
    required this.loc,
    required this.nPiano,
    required this.resPhoto,
  });
}