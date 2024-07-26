class Weather {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String localtime;
  final double tempC;
  final String conditionText;
  final String conditionIcon;
  final double windKph;
  final String windDir;
  final double pressureMb;
  final double precipMm;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double dewpointC;
  final double visKm;
  final int uv;
  final double gustKph;

  Weather({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
    required this.tempC,
    required this.conditionText,
    required this.conditionIcon,
    required this.windKph,
    required this.windDir,
    required this.pressureMb,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.dewpointC,
    required this.visKm,
    required this.uv,
    required this.gustKph,
  });

  factory Weather.fromJson({required Map json}) {
    return Weather(
      name: json['location']['name'],
      region: json['location']['region'],
      country: json['location']['country'],
      lat: (json['location']['lat'] as num).toDouble(),
      lon: (json['location']['lon'] as num).toDouble(),
      localtime: json['location']['localtime'],
      tempC: (json['current']['temp_c'] as num).toDouble(),
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      windKph: (json['current']['wind_kph'] as num).toDouble(),
      windDir: json['current']['wind_dir'],
      pressureMb: (json['current']['pressure_mb'] as num).toDouble(),
      precipMm: (json['current']['precip_mm'] as num).toDouble(),
      humidity: (json['current']['humidity'] as num).toInt(),
      cloud: (json['current']['cloud'] as num).toInt(),
      feelslikeC: (json['current']['feelslike_c'] as num).toDouble(),
      dewpointC: (json['current']['dewpoint_c'] as num).toDouble(),
      visKm: (json['current']['vis_km'] as num).toDouble(),
      uv: (json['current']['uv'] as num).toInt(),
      gustKph: (json['current']['gust_kph'] as num).toDouble(),
    );
  }
}
