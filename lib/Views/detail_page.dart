import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/wether_model.dart';

import '../providers/convert_provider.dart';
import '../utils/global.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool istapped = false;

  @override
  Widget build(BuildContext context) {
    Weather data = ModalRoute.of(context)!.settings.arguments as Weather;
    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Today's Weather",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              GlassmorphicContainer(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 150,
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/icon/drizzle(1).png"))),
                          ),
                          SizedBox(width: 12),
                          Row(
                            children: [
                              Text(
                                "${data.tempf}",
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "°F",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "${data.conditionText}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              GlassmorphicContainer(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 150,
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
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<ConavertProvider>(context,
                                      listen: false)
                                  .convertcel();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  border:
                                      (Provider.of<ConavertProvider>(context)
                                              .isconvert)
                                          ? Border(
                                              bottom: BorderSide(
                                                  color: Colors.white))
                                          : Border()),
                              child: Text(
                                "°C",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<ConavertProvider>(context,
                                      listen: false)
                                  .convertfel();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                  border:
                                      (Provider.of<ConavertProvider>(context)
                                              .isconvert)
                                          ? Border()
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.white))),
                              child: Text(
                                "°F",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    (Provider.of<ConavertProvider>(context).isconvert)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${data.dewpointC}",
                                    style: TodayWeather.subtitle,
                                  ),
                                  Text(
                                    "Dewpoint",
                                    style: TodayWeather.subtitle,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${data.heatc}",
                                    style: TodayWeather.subtitle,
                                  ),
                                  Text(
                                    "HeatinIndex",
                                    style: TodayWeather.subtitle,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${data.feelslikeC}",
                                    style: TodayWeather.subtitle,
                                  ),
                                  Text(
                                    "Feelslike",
                                    style: TodayWeather.subtitle,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "${data.dewpointC}",
                                    style: TodayWeather.subtitle,
                                  ),
                                  Text(
                                    "Dewpoint",
                                    style: TodayWeather.subtitle,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${data.heatf}",
                                    style: TodayWeather.subtitle,
                                  ),
                                  Text(
                                    "HeatinIndex",
                                    style: TodayWeather.subtitle,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${data.feelslikef}",
                                    style: TodayWeather.subtitle,
                                  ),
                                  Text(
                                    "Feelslike",
                                    style: TodayWeather.subtitle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              GlassmorphicContainer(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 300,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${data.lat}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "Lat",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${data.windDir}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "WindDir",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${data.lon}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "Lon",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${data.visKm}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "visKm",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${data.gustKph}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "Gust_kph",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${data.pressureMb}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "Pressur",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${data.cloud}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "Cloud",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${data.windKph}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "Wind_kph",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${data.precipMm}",
                              style: TodayWeather.subtitle,
                            ),
                            Text(
                              "PrecipMn",
                              style: TodayWeather.subtitle,
                            ),
                          ],
                        ),
                      ],
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
