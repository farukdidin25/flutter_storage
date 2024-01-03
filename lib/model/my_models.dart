// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

enum Cinsiyet {
  KADIN,
  ERKEK
}

enum Renkler {
  SARI, KIRMIZI, MAVI, YESIL, PEMBE
}

class UserInformation {
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'cinsiyet': cinsiyet.toString().split('.').last, // Enum'u stringe çevirme
      'renkler': renkler,
      'ogrenciMi': ogrenciMi
    };
  }

  UserInformation.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        cinsiyet = _getCinsiyetEnum(json['cinsiyet']),
        renkler = List<String>.from(json['renkler']),
        ogrenciMi = json['ogrenciMi'];

  static Cinsiyet _getCinsiyetEnum(String value) {
    return Cinsiyet.values.firstWhere((element) => element.toString() == 'Cinsiyet.$value');
  }
}
