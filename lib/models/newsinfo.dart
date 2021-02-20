// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

ApiModel apiModelFromJson(String str) => ApiModel.fromJson(json.decode(str));

String apiModelToJson(ApiModel data) => json.encode(data.toJson());

class ApiModel {
  ApiModel({
    this.steps,
    this.bodyTemperature,
    this.bloodPressure,
    this.respiration,
    this.glucose,
    this.heartRate,
    this.cholesterol,
    this.oxygenSaturation,
  });

  int steps;
  double bodyTemperature;
  int bloodPressure;
  int respiration;
  int glucose;
  int heartRate;
  int cholesterol;
  int oxygenSaturation;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        steps: json["steps"],
        bodyTemperature: json["bodyTemperature"].toDouble(),
        bloodPressure: json["bloodPressure"],
        respiration: json["respiration"],
        glucose: json["glucose"],
        heartRate: json["heartRate"],
        cholesterol: json["cholesterol"],
        oxygenSaturation: json["oxygenSaturation"],
      );

  Map<String, dynamic> toJson() => {
        "steps": steps,
        "bodyTemperature": bodyTemperature,
        "bloodPressure": bloodPressure,
        "respiration": respiration,
        "glucose": glucose,
        "heartRate": heartRate,
        "cholesterol": cholesterol,
        "oxygenSaturation": oxygenSaturation,
      };
}
