import 'package:flutter/material.dart';
import 'dart:js' as js;

class Services {
  Future<void> launchURL({@required String url}) async {
     js.context.callMethod('open', [url]);
  }
}
