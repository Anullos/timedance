import 'dart:convert';

Clima climaFromJson(String str) => Clima.fromJson(json.decode(str));
String climaToJson(Clima data) => json.encode(data.toJson());

class Clima {
    Clima({
        this.id,
        this.weatherStateName,
        this.weatherStateAbbr,
        this.windDirectionCompass,
        this.created,
        this.applicableDate,
        this.minTemp,
        this.maxTemp,
        this.theTemp,
        this.windSpeed,
        this.windDirection,
        this.airPressure,
        this.humidity,
        this.visibility,
        this.predictability,
    });

    int id;
    String weatherStateName;
    String weatherStateAbbr;
    String windDirectionCompass;
    DateTime created;
    DateTime applicableDate;
    double minTemp;
    double maxTemp;
    dynamic theTemp;
    double windSpeed;
    double windDirection;
    dynamic airPressure;
    int humidity;
    double visibility;
    int predictability;

    factory Clima.fromJson(Map<String, dynamic> json) => Clima(
        id: json["id"],
        weatherStateName: json["weather_state_name"],
        weatherStateAbbr: json["weather_state_abbr"],
        windDirectionCompass: json["wind_direction_compass"],
        created: DateTime.parse(json["created"]),
        applicableDate: DateTime.parse(json["applicable_date"]),
        minTemp: json["min_temp"].toDouble(),
        maxTemp: json["max_temp"].toDouble(),
        theTemp: json["the_temp"],
        windSpeed: json["wind_speed"].toDouble(),
        windDirection: json["wind_direction"],
        airPressure: json["air_pressure"],
        humidity: json["humidity"],
        visibility: json["visibility"].toDouble(),
        predictability: json["predictability"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weather_state_name": weatherStateName,
        "weather_state_abbr": weatherStateAbbr,
        "wind_direction_compass": windDirectionCompass,
        "created": created.toIso8601String(),
        "applicable_date": "${applicableDate.year.toString().padLeft(4, '0')}-${applicableDate.month.toString().padLeft(2, '0')}-${applicableDate.day.toString().padLeft(2, '0')}",
        "min_temp": minTemp,
        "max_temp": maxTemp,
        "the_temp": theTemp,
        "wind_speed": windSpeed,
        "wind_direction": windDirection,
        "air_pressure": airPressure,
        "humidity": humidity,
        "visibility": visibility,
        "predictability": predictability,
    };
}