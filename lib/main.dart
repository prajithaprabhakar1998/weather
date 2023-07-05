import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather/weather_service.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
 //var oneDayFromNow="";
  var now= DateTime.now();
   var day=DateTime.now().add(new Duration(days: 5));

  WeatherService weatherService = WeatherService();
  Weather weather = Weather();

  String currentWeather = "";
  String weather11 = "";
  double tempC = 0;
  double tempF = 0;
  int hum = 0;
  double wind = 0;
  double max=0;

  @override
  void initState() {
    super.initState();
   // getWeather();
  }

  void getWeather(String input) async {
   print("a");
      weather = await weatherService.getWeatherData(input);



      setState(() {
        currentWeather = weather.condition;
        tempC = weather.temperatureC;
        tempF = weather.temperatureF;
        hum = weather.humidity;
        wind = weather.windspeed;
      // max=weather.temperatureC;


      });




    weather11 = currentWeather.replaceAll('', "").toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text(
                                "Temperature in °C :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              tempC.toString() + ' °C',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              new DateFormat.E().format(now),
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            Text(
                              new DateFormat.MMMd().format(day),
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),

                            Image(
                              image: AssetImage("assets/images/$weather11.png"),
                              height: 150,
                              width: 150,
                            ),

                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text("Temperature in °F :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              tempF.toString() + ' °F',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text("Humidity :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              hum.toString() + ' °C',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text("Wind Speed :",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              wind.toString() + 'km/hr',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 40.0),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          currentWeather,
                          style: TextStyle(color: Colors.white, fontSize: 40.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      child: TextField(
                        onSubmitted: (String input) {

                            getWeather(input);
                        },
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        decoration: InputDecoration(
                          hintText: 'Search another location...',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18.0),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
