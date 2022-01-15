import 'package:flutter/material.dart';
import 'package:weatherapp/services/home_services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

String backImage = "assets/night.gif";
// double temperature = 10.9;
// String city = "Karachi";
// String status = "smoke";
// int humidity = 17;
// int pressure = 170;
// int wind = 170;

String citynameinput = "islamabad";

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            setState(() {
              citynameinput = value;
              // print(citynameinput);
            });
          },
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            height: 2.0,
          ),
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintStyle: TextStyle(fontSize: 25, color: Colors.white),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.0),
              ),
              hintText: 'Enter a city'),
        ),
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getdata(citynameinput),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // print(snapshot.data.temperature);

            String images;
            String day;
            var myicon;
            var a = snapshot.data.currentdate ;
            var b = snapshot.data.sunset;
            var c = snapshot.data.sunrise;

            if(a< b && a > c){
            images = 'assets/day.gif';
            day = "Day";
            myicon = Icons.wb_sunny_outlined;
            }else{
            images = 'assets/night.gif';
            day = "Night";
            myicon = Icons.mode_night_outlined;
            }

            return SingleChildScrollView(
              child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    color: Colors.black.withOpacity(0.55),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.15),
                          child: Icon(myicon,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.08),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.03,
                              top: MediaQuery.of(context).size.height * 0.0),
                          child: Text(snapshot.data.city,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 60)),
                        ),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "${(snapshot.data.temperature - 273).toStringAsFixed(0)}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 60)),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text("°C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 25)),
                            ),
                          ],
                        )),
                        Text(snapshot.data.status,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 24)),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.01),
                          child: Text(day,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                color: Colors.white,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: Column(
                                  children: [
                                    Text("Humidity",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                    Text("${snapshot.data.humidity}%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                color: Colors.white,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: Column(
                                  children: [
                                    Text("Pressure",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                    Text("${snapshot.data.pressure} mb",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                color: Colors.white,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: Column(
                                  children: [
                                    Text("Wind",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                    Text("${snapshot.data.wind} Km/h",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.005,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ))),
              ]),
            );
          }),
    );
  }
}
