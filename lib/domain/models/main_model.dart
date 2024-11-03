import 'dart:convert';

class Main {
  num temp;
  num feels_like;
  num temp_min;
  num temp_max;
  num humidity;
  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as num,
      feels_like: map['feels_like'] as num,
      temp_min: map['temp_min'] as num,
      temp_max: map['temp_max'] as num,
      humidity: map['humidity'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}
