import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage/model/my_models.dart';

class SecureStorageService {
  late final FlutterSecureStorage preferences;

  // Constructor içerisinde preferences değişkenini başlatın.
  SecureStorageService() {
    preferences = FlutterSecureStorage();
  }

  Future<void> verileriKaydet(UserInformation userInformation) async {
    final _name = userInformation.isim;
    await preferences.write(key: "isim", value: _name);
    await preferences.write(
        key: "ogrenci", value: userInformation.ogrenciMi.toString());
    await preferences.write(
        key: "cinsiyet", value: userInformation.cinsiyet.index.toString());
    await preferences.write(
        key: "renkler", value: jsonEncode(userInformation.renkler));
  }

  Future<UserInformation> verileriOku() async {
    var _isim = await preferences.read(key: 'isim') ?? '';

    var _ogrenciString =
        await preferences.read(key: 'ogrenci') ?? 'false';

    var _ogrenci = _ogrenciString.toLowerCase() == 'true' ? true : false;
    var _cinsiyetString =
        await preferences.read(key: 'cinsiyet') ?? '0';

    var _cinsiyet = Cinsiyet.values[int.parse(_cinsiyetString)];

    var _renklerString = await preferences.read(key: 'renkler');
    var _renkler = _renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(_renklerString));

    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenci);
  }
}
