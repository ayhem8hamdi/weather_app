class Weather {
  String location;
  String date;
  num temp;
  num maxTemp;
  num minTemp;
  String etat;
  Weather(
      {required this.temp,
      required this.maxTemp,
      required this.date,
      required this.location,
      required this.minTemp,
      required this.etat});
  factory Weather.jsonData(json) {
    return Weather(
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        location: json['location']['name'],
        date: json['current']['last_updated'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        etat: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
