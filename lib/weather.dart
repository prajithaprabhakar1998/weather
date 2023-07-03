class Weather{
final double temperatureC;
final double temperatureF;
final String condition;
final int humidity;
final double windspeed;

Weather({this.temperatureC=0,
  this.temperatureF=0,
  this.condition="sunny",
  this.humidity=0,
  this.windspeed=0
});

factory Weather.fromJson(Map<String,dynamic>json){
  return Weather(
    temperatureC:json["current"]["temp_c"],
    temperatureF:json["current"]["temp_f"],
    condition:json["current"]["condition"]["text"],
    humidity: json["current"]["humidity"],
    windspeed: json["current"]["wind_kph"]
  );
}

}