import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _num = prefs.getDouble('ff_num') ?? _num;
    });
    _safeInit(() {
      _quote = prefs.getString('ff_quote') ?? _quote;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _num = 0.0;
  double get num => _num;
  set num(double value) {
    _num = value;
    prefs.setDouble('ff_num', value);
  }

  String _quote = '';
  String get quote => _quote;
  set quote(String value) {
    _quote = value;
    prefs.setString('ff_quote', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
