import 'package:flutter/material.dart';

class DeviceSize {
  DeviceSize._internal();

  static final DeviceSize _singleton = DeviceSize._internal();

  factory DeviceSize() => _singleton;
  static double masterHeight = 965.90906;
  static double masterWidth = 490.90908;
  Size size;
  double get heightMultiplier => this.size.height / masterHeight;

  double get widthMultiplier => this.size.width / masterWidth;
}

double masterHeight = 965.90906;
double masterWidth = 490.90908;
