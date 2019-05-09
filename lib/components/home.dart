import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;



import "./recentArticles.dart";
import "./recentNews.dart";

import "package:awesome_loader/awesome_loader.dart";


var _recentNews = RecentNews();
//recent news component
var _recentArticles = RecentBlogs();
//recent blog aricles




const betterDeliveryAPI = "https://socialstation.info/newsv2/betterdelivery";


class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _Homestate();
}

class _Homestate extends State<HomePage> {


  var isShow = true;

  String _textNewsTabbr="Recent News- (Loading News)";

  var _jsonGlobalNews = [{
    "id": 294111,
    "Title": "How a Political Tug-of-War Between America and Russia Could Ruin Venezuela",
    "Description": "Venezuelan leader Juan Guaidó is gambling that massive civilian protests and nationwide strikes will shake the military’s loyalty to embattled dictator Nicolas Maduro and end the extended political standoff in Caracas. Several have already died, and more violence appears inevitable. But avoiding it is key, because nonviolence tears down dictators better than anything else.The oft-seen trajectories of domestic protest movements is confrontation, violence and foreign intervention. Indeed, in Venezuela, Vladimir Putin has already personally inserted himself, reportedly urging Maduro not to flee while sending Russian operatives and weapons. The Venezuelan National Assembly has considered invoking the Constitution to openly call for foreign military assistance under the precept of responsibility to protect. And some are urging President Donald Trump to end a festering threat. But invading Venezuela is not the answer, at least not yet.Studying successful efforts that mirror those of Guaidó and his fellow Venezuelans reveals a workable model: For the movement to be successful, it must have numbers, discipline, and, most importantly, inspire loyalty shifts within the state’s security forces.The Numbers",
    "CrawlDate": "2019-05-09T09:03:26.000Z",
    "Source": "Yahoo",
    "Author": "Bill Cosbey",
    "Url": "https://www.yahoo.com/news/political-tug-war-between-america-105500384.html",
    "UrlToImage": "https://s.yimg.com/uu/api/res/1.2/Q04rdhAblorrOp_mheE.pw--~B/Zmk9c3RyaW07aD0xOTM7cHlvZmY9MDtxPTgwO3c9MjIwO3NtPTE7YXBwaWQ9eXRhY2h5b24-/https://media.zenfs.com/en/the_national_interest_705/b0df7f94f8196fe23859cc63a7b6d656",
    "tag": "headlines",
    "souceImageUrl": "https://vignette.wikia.nocookie.net/logopedia/images/8/84/Yahoo%21_18_Favicon.png/revision/latest?cb=20130825034903",
    "postType": "standard",
    "newsType": "crawled",
    "latLng": null
  }];

  var _totalAmountOfNews = 1;

  var __isNews=false;


  Future<void> getData() async {
    var response = await http.get(Uri.encodeFull(betterDeliveryAPI));

    print("---------------------------------------------------------------");

    var jsonBody = jsonDecode(response.body);

    print(response.body);

    var data = jsonBody["data"];

    print(data);
    setState(() {
      __isNews=true;
      _textNewsTabbr="Recent News";

      for(var i=0;i<data.length;i++){
        print(data[i]);
        _jsonGlobalNews.add(data[i]);
      }
        _totalAmountOfNews=data.length+1;


      
    });
  }



  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    print("doing ");    
    });
  
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children
            :
        <Widget>[
        isShow? Container(
        width:
        double
        .
        infinity,
        padding: EdgeInsets.all(20.0),
        color: Colors.black87,
        alignment: Alignment.center,

        child: Column(
          children: <Widget>[
          Text("Newisify is on open knowledge platform. View news articles from various sources around the globe. In addition we give our users the ability to publish articles censorless via the Ethereum Blockchain. This means once you create an article it can never be deleted,modified or censored"
          ,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "ROBOTO",
              color: Colors.white,
              fontSize: 15.0

          ),),
        Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FlatButton(
                color: Colors.black87,
                child: Text("Hide message", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
                onPressed:(){
                  setState(() {
                   isShow=false; 
                  });
                }

    ),)
    ],
    )
    ): new Container(width
        : 0, height: 0, ),

    Container
    (
    width: double.infinity,
    color: Colors
        .cyan,
    child: Padding(
    padding: const
    EdgeInsets.only(left: 10.0, top:
    10.0),
    child: Padding(
    padding: const
    EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        AwesomeLoader(
          loaderType: AwesomeLoader.AwesomeLoader3,
          color: Colors.white,
        ),
        Text
    (_textNewsTabbr, style: TextStyle(color
        : Colors.white), ),

      ],
    )
    ),
    ),
    ),

    Expanded(
    child: __isNews==false
    ?
    Container
    (
    height
        :
    0
    ,
    width
        :
    0
    ,
    )
        :
    ListView
        .
    builder
    (
    itemCount
        :
    _totalAmountOfNews
    ,
    itemBuilder
        :
    (
    context
    ,
    index
    )
    {
    return Card(
    elevation: 2.0,

    child: Container(

    width: double.infinity,
    color: Colors.cyan,
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Container(
    alignment: Alignment.topCenter,
    child: Column(

    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(top:40.0, left: 20),
    child: CircleAvatar(
    radius: 40.0,
    backgroundColor: Colors.brown.shade800,
    child: Text(_jsonGlobalNews
    [index]["Source"], textAlign: TextAlign.center, ),
    ),
    ),
    Container( width:80,child:Padding(

    padding: const EdgeInsets.only(top:40.0, left: 20),
    child: Column(
    children: <Widget>[
    RaisedButton(onPressed:()=>{},color:Colors.black,child: Text("Report",style: TextStyle(fontSize: 9.0,color: Colors.white),),),
    RaisedButton(onPressed:()=>{},color:Colors.black,child: Text("Info",style: TextStyle(fontSize: 9.0,color:Colors.white),),),
    RaisedButton(onPressed:()=>{
    
    },color:Colors.black,child: Text("Read More",textAlign:TextAlign.center,style: TextStyle(fontSize: 9.0,color:Colors.white),),)
    ],
    )
    ),
    )
    ],
    )

    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    Container(
    width: MediaQuery.of(context).size.width*0.7,
    alignment: Alignment.center,
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(_jsonGlobalNews[index]["Title"], textAlign:TextAlign.center, style: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold
    ), ),
    )
    ),
    Container(
    width: MediaQuery.of(context).size.width*0.4,
    height: 150.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    color: Colors.cyan,
    ),
    child:Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Image.network(_jsonGlobalNews[index]["UrlToImage"],scale: 0.4,width:  MediaQuery.of(context).size.width*0.99,),
    )
    ),

    Container(
    width: MediaQuery.of(context).size.width*0.7,
    child: Padding(
    padding:
    const EdgeInsets.only(left:20.0,top: 0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(_jsonGlobalNews[index]["Description"]=="n/a" || _jsonGlobalNews[index]["Description"]=="n-a"  ? "No description available. Don't worry you can still view the underlying article to find out more about this particular event.":_jsonGlobalNews[index]["Description"]),
    ),
    ),
    ),


    ],
    )
    ],
    ),
    ),
    );
    }
    )
    ,
    )

    ]
    ,
    );
  }
}