/// Internet Check class
///
/// This class contains methods for checking interent connection.
///
/// Imports:
///   DataConnectionChecker for checking interent connection
///
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

import 'dart:io';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';

class MyInternetCheck extends StatelessWidget {
  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 1);
  static const int DEFAULT_PORT = 53;

  final List<AddressCheckOptions> defaultAddresses = List.unmodifiable([
    AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
  ]);
  DataConnectionChecker connection = DataConnectionChecker();

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
