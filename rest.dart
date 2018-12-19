import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/////////-------Usage------------------

//class LoadJson extends BaseObject {
//  String name;
//  String id;
//
//  Map<String, String> toMap() {
//    return {
//      "name": name,
//      "id": id
//    };
//  }
//}
//

//  var p = new LoadJson();
//  p.name = "asd";
//  p.id="11";
//
//  var restHelper = new RestHelper();
//  String lResp = await restHelper.post(URL_FULL, p, context);
//
//  var ret = json.decode(lResp);

////-------------------------



abstract class BaseObject {
  Map<String, String> toMap();
}

class RestHelper {
  //final Map<String, String> _headers = {"Content-type": "application/json", "Accept": "application/json"};

  post(String url, BaseObject obj, BuildContext context) async {
    String ret = "";

    var client = new http.Client();
    var req= http.Request('POST', Uri.parse(url));

    //req.headers["authorization"]="Beer "+token;

    req.bodyFields = obj.toMap();
    await client.send(req).then((response)
    => response.stream.bytesToString().then((value)
    => ret=value.toString())).catchError((error) => print(error.toString()));

    //Output full answer to console
    for (int i = 0; i < (ret.length/100).round()+1; i++) {
      try {
        print(ret.substring(i*100,(i+1)*100));
      } catch (e) {}
    }

    //If you need to show answer in application

//     new Future.delayed(Duration.zero,() {
//       showDialog(context: context, builder: (context) => new AlertDialog(
//         title: new Text("rest response"),
//         content: new Text(ret),
//         actions: <Widget>[
//           new FlatButton(onPressed: (){
//             Navigator.pop(context);
//           }, child: new Text('OK')),
//         ],
//       ));
//     });
    return ret;
  }
}
