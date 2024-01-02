// ignore_for_file: constant_identifier_names

enum Cinsiyet{
  KADIN,
  ERKEK
}

enum Renkler{
  SARI,KIRMIZI,MAVI,YESIL,PEMBE
}

class UserInformation{
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);
}