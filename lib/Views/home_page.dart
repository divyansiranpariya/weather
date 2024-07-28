import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/connectivity_provider.dart';
import 'package:weather_app/providers/themeprovider.dart';

import '../models/wether_model.dart';
import '../utils/helper/weather_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Weather?> futureWeather;
  bool start = true;
  TextEditingController SearchController = TextEditingController();
  DateTime date = DateTime.now();
  @override
  initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).checkInternet();

    futureWeather = WeatherApi.weatherApi.featchweather(location: "rajkot");
  }

  void searchWeather() {
    setState(() {
      futureWeather =
          WeatherApi.weatherApi.featchweather(location: SearchController.text);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (Provider.of<ConnectivityProvider>(context).isInternet == false)
            ? Center(
                child: Text("NOT AVAILABLE NETWORK"),
              )
            : FutureBuilder(
                future: futureWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    Weather? allData = snapshot.data;

                    return (allData == null)
                        ? Center(
                            child: Text("No Data Available"),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [
                                Color(0xff0168F2).withOpacity(0.9),
                                Color(0xff0168F2).withOpacity(0.7),
                                Color(0xff034EE8).withOpacity(0.8)
                              ],
                            )),
                            child: SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: GlassmorphicContainer(
                                        width: double.infinity,
                                        height: 50,
                                        borderRadius: 20,
                                        blur: 20,
                                        alignment: Alignment.bottomCenter,
                                        border: 2,
                                        linearGradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.3),
                                            Colors.white.withOpacity(0.3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderGradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.2),
                                            Colors.white.withOpacity(0.1),
                                            Colors.white.withOpacity(0.05),
                                            Colors.white.withOpacity(0.01),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                controller: SearchController,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    border: InputBorder.none,
                                                    hintText: " Search here"),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: searchWeather,
                                                icon: Icon(Icons.search)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 17,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${allData.name}",
                                                    style: TextStyle(
                                                        fontSize: 34,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Provider.of<Themeprovider>(
                                                                context,
                                                                listen: false)
                                                            .chandge();
                                                      },
                                                      icon: Icon(
                                                        Icons.sunny,
                                                        color: Colors.yellow,
                                                      ))
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 80,
                                                    top: 40,
                                                    bottom: 65),
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/icon/drizzle(1).png"))),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushNamed('DetailPage',
                                                          arguments: allData);
                                                },
                                                child: GlassmorphicContainer(
                                                  margin: EdgeInsets.only(
                                                      top: 10,
                                                      right: 10,
                                                      left: 10),
                                                  width: double.infinity,
                                                  height: 300,
                                                  borderRadius: 20,
                                                  blur: 20,
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  border: 2,
                                                  linearGradient:
                                                      LinearGradient(
                                                    colors: [
                                                      Colors.white
                                                          .withOpacity(0.3),
                                                      Colors.white
                                                          .withOpacity(0.3),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  borderGradient:
                                                      LinearGradient(
                                                    colors: [
                                                      Colors.white
                                                          .withOpacity(0.2),
                                                      Colors.white
                                                          .withOpacity(0.1),
                                                      Colors.white
                                                          .withOpacity(0.05),
                                                      Colors.white
                                                          .withOpacity(0.01),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${allData.localtime}",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          "${allData.tempC}°",
                                                          style: TextStyle(
                                                              fontSize: 55,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          "${allData.conditionText}",
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(height: 25),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Icon(
                                                              Icons.line_axis,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Text("Wind",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .white)),
                                                            Text("|",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white)),
                                                            Text(
                                                                "${allData.windKph} km/h",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Icon(
                                                              Icons.water_drop,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            Text("Hum",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    color: Colors
                                                                        .white)),
                                                            Text("|",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white)),
                                                            Text(
                                                                "${allData.humidity} ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                            SizedBox(
                                                              width: 10,
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
      ),
    );
  }
}
