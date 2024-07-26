import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
  @override
  initState() {
    super.initState();
    futureWeather = WeatherApi.weatherApi.featchweather(location: "ra");
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
        child: FutureBuilder(
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
                                        Text(
                                          "${allData.name}",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          "Monday, 1 January 10:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        SizedBox(height: 20),
                                        GlassmorphicContainer(
                                          width: double.infinity,
                                          height: 200,
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
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.wb_sunny,
                                                        color: Colors.yellow,
                                                        size: 50),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "22°",
                                                      style: TextStyle(
                                                          fontSize: 50,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Mostly Clear",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(height: 16),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("30%",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text("Precipitation",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("20%",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text("Humidity",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("12 km/h",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                        Text("Wind Speed",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Expanded(
                                          child: GlassmorphicContainer(
                                            height: double.infinity,
                                            width: double.infinity,
                                            borderRadius: 20,
                                            blur: 20,
                                            alignment: Alignment.bottomCenter,
                                            border: 2,
                                            linearGradient: LinearGradient(
                                              colors: [
                                                Colors.white.withOpacity(0.2),
                                                Colors.white.withOpacity(0.1),
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
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Today",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
                                                    SizedBox(height: 8),
                                                    SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          _buildWeatherCard(
                                                              "09:00",
                                                              "22°",
                                                              Icons.wb_sunny),
                                                          _buildWeatherCard(
                                                              "10:00",
                                                              "22°",
                                                              Icons.wb_sunny),
                                                          _buildWeatherCard(
                                                              "11:00",
                                                              "22°",
                                                              Icons.wb_sunny),
                                                          _buildWeatherCard(
                                                              "12:00",
                                                              "22°",
                                                              Icons.wb_sunny),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 16),
                                                    Text("7-Day Forecast",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
                                                    // SizedBox(height: 8),
                                                    // Row(
                                                    //   mainAxisAlignment:
                                                    //       MainAxisAlignment
                                                    //           .spaceAround,
                                                    //   children: [
                                                    //     _buildWeatherCard(
                                                    //         "Mon",
                                                    //         "22°",
                                                    //         Icons.wb_sunny),
                                                    //     _buildWeatherCard(
                                                    //         "Tue",
                                                    //         "21°",
                                                    //         Icons.wb_cloudy),
                                                    //     _buildWeatherCard(
                                                    //         "Wed",
                                                    //         "20°",
                                                    //         Icons.wb_cloudy),
                                                    //     _buildWeatherCard(
                                                    //         "Thu",
                                                    //         "19°",
                                                    //         Icons.wb_cloudy),
                                                    //   ],
                                                    // ),
                                                    SizedBox(height: 16),
                                                    Text("Other Cities",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white)),
                                                    SizedBox(height: 8),
                                                    // _buildWeatherCard("Location",
                                                    //     "21°", Icons.wb_cloudy),
                                                  ],
                                                ),
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

Widget _buildWeatherCard(String time, String temp, IconData icon) {
  return GlassmorphicContainer(
    width: 80,
    height: 100,
    borderRadius: 16,
    blur: 20,
    alignment: Alignment.center,
    border: 2,
    linearGradient: LinearGradient(
      colors: [
        Colors.white.withOpacity(0.2),
        Colors.white.withOpacity(0.1),
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 8),
        Text(time, style: TextStyle(color: Colors.white)),
        Text(temp, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
