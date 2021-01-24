import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EasyLocalization(
      path: 'asset/lang',
      saveLocale: true,
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('ur', 'UR'),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr().toString()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'text'.tr().toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14.0, fontFamily: 'sans-serif'),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Urdu",
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.cyan,
                      onPressed: () {
                        setState(() {
                          EasyLocalization.of(context).locale =
                              Locale('ur', 'UR');
                        });
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        "English",
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.cyan,
                      onPressed: () {
                        setState(() {
                          EasyLocalization.of(context).locale =
                              Locale('en', 'EN');
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
