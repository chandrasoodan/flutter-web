import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:googleapis/drive/v2.dart';
import 'package:googleapis/servicecontrol/v1.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

/// Provides the `GoogleSignIn` class
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/io_client.dart';
import "package:googleapis_auth/auth_io.dart" as auth;

import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: MyApp(),
      path: 'assets/langs',
      supportedLocales: MyApp.list,
      saveLocale: true,
      useOnlyLangCode: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  static const list = [
    Locale('en'),
    Locale('ar'),
  ];

  Future<SheetsApi> getSheetsClient(GoogleSignIn signIn) async {

    var cred = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(_key), signIn.scopes, http.Client());

    auth.AuthClient client = auth.authenticatedClient(http.Client(), cred);
    SheetsApi api = new SheetsApi(client);
    DriveApi dApi = new DriveApi(client);
  var  d = await dApi.files.list();
   print(d.items);
    return api;
  }

  @override
  Widget build(BuildContext context) {
    final _googleSignIn = GoogleSignIn(
      scopes: <String>[SheetsApi.spreadsheetsReadonlyScope,DriveApi.drivePhotosReadonlyScope,DriveApi.driveReadonlyScope,DriveApi.driveScope],
      clientId: "803948195257-l7o2sjc90j2ddttf7tvas7rrqtintqda.apps.googleusercontent.com",
    );
    getSheetsClient(_googleSignIn).then((value) => value.spreadsheets.values
        .get("18Fics3wkaF5Sy4-UqR2rAYkr52JIPlwHUlXS79IDl9w", "Sheet1!A1:A10")
        .then((value) => print(value.values)));

    return MaterialApp(
      title: 'Flutter Zoom Drawer Demo',
      onGenerateTitle: (context) => tr("app_name"),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MenuProvider(),
        child: HomeScreen(),
      ),
    );
  }
}
