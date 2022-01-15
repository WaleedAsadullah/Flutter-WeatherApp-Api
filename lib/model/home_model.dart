class HomeModel {
  double temperature;
  String city;
  String status;
  int humidity;
  int pressure;
  var wind;
  int currentdate ;
  int sunrise;
  int sunset;

  HomeModel(
      {required this.city,
      required this.humidity,
      required this.pressure,
      required this.status,
      required this.temperature,
      required this.wind,
      required this.currentdate,
      required this.sunrise,
      required this.sunset});
}
