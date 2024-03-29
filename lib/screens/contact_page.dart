import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  final String address =
      "https://www.google.com/maps/place/Plaza+Mall+Asian+Town/@25.1861048,51.460918,17z/data=!4m5!3m4!1s0x3e45d10d8c42bf09:0xdf4d23be084c3a10!8m2!3d25.1861002!4d51.4631119";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(153, 5, 5, 1),
          title: Text("Contact Us"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(3),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage("assets/contact.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Container(
                  height: 225,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(215, 219, 224, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        title: Text("(+974) 44999039"),
                        onTap: () => launch("tel://+97444999039"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        title: Text("helpdesk.asiantown@ibnajayan.com"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.timer,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        title: Text("10 AM - 10 PM 7/7"),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        title: Text(
                          "Street 37, Industrial Area, Mesaimeer, area 56",
                        ),
                        onTap: () => launch(address),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(215, 219, 224, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            size: 40,
                            color: Color.fromRGBO(153, 5, 5, 1),
                          ),
                          onPressed: () => launch(
                            "https://www.facebook.com/asiantownqatar/",
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          size: 40,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        onPressed: () => launch(
                          "https://instagram.com/asian_town_qatar?igshid=kah3b3v7obow",
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          size: 40,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        onPressed: () => launch(
                          "https://twitter.com/Ibn_Ajayan_pro?s=09",
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.youtube,
                          size: 40,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        onPressed: () => launch(
                          "https://www.youtube.com/channel/UCAWzKgUY8A4nEvPk24Fthrg",
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.globe,
                          size: 40,
                          color: Color.fromRGBO(153, 5, 5, 1),
                        ),
                        onPressed: () => launch(
                          "http://ibnajayan.com/en/",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
