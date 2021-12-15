
import 'package:shared_preferences/shared_preferences.dart';

class Preference{
  static final _instance = Preference._internal();
  Preference._internal();

  factory Preference(){
    return _instance;
  }

  late SharedPreferences _sharedPreferences;

  initPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  List<String> get searchStorage => _sharedPreferences.getStringList('keySearch')??[];
  set searchStorage(List<String> keySearch){_sharedPreferences.setStringList('keySearch', keySearch);}
}