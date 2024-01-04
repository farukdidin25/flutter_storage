import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_storage/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'shared_pref_kullanimi.dart';


final locator = GetIt.instance;
void setup(){
  locator.registerSingleton<SecureStorageService>(SecureStorageService( ));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Storage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Flutter Storage Islemleri'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SharedPreferenceKullanimi()));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Shared Preference / Secure Storage Kullanımı'),
            )
          ],
        ),
      ),
    );
  }
}
