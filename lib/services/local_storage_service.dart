import 'package:flutter_storage/model/my_models.dart';

abstract class LocalStrorageService{
  Future<void> verileriKaydet(UserInformation userInformation);
  Future<UserInformation> verileriOku();
}