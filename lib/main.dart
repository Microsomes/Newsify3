import 'package:flutter/material.dart';

import 'components/ab.dart';

import 'pages/crypto.dart';


import 'components/home.dart';
//this is the home page
import 'components/articles.dart';
import 'components/stock.dart';

var __crypto= Coins();
//coin page




var __home= HomePage();
var __articles= Articles();
var __stock = Stock();





void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAI.MOBILE',
      
      color: Colors.white,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white
          )
        )
      ),
      home: MyHomePage(title: 'Newsify: 3.0.0'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


    int _currentIndex=0;

    var allPages=[
      __home,
      __articles,
      __stock
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
              child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Utility'),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Create Ethereum Wallet'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            ListTile(
              title: Text('All Ethereum Accounts'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
             ListTile(
              title: Text('Register ETHADDR'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
             ListTile(
              title: Text("Videos"),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:allPages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        tooltip: 'Increment',
        child: Icon(Icons.add,color: Colors.white,),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title:Text("Home")
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title:Text("Articles")
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            title:Text("Stock/Crypto"),

          )

        ],
        onTap: (int index)=>{
            setState((){
             _currentIndex=index;
            })
        },
      ),
    
    );
  }
}
