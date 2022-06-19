import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home_screen.dart';
import 'package:flutterapp/service/notification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  NotificationHandler? notificationHandler = NotificationHandler();

  try {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } catch (e) {
    print(e);
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("${message.data}");
    log("hey");
    notificationHandler.firebaseMessagingForegroundHandler(message);
  });
  runApp(MaterialApp(home: HomeScreen(),));
}

