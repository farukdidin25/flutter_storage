// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage/model/my_models.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageService {

  _getFilePath()async{
    var filePath = await getApplicationDocumentsDirectory();
    debugPrint(filePath.path);
    return filePath.path;
  }
  FileStorageService(){
    _createFile();
  }

  _createFile()async{
    var file = File(await _getFilePath() + "/info.json");
    await file.writeAsString("deneme içerik");
  }

  Future<void> verileriKaydet(UserInformation userInformation) async {
    
  }

  Future<UserInformation> verileriOku() async {
    
    return UserInformation("a", Cinsiyet.ERKEK, ["SARI"], false);
    
  }
}
