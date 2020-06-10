import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('Can Create Preferences', () async{

    SharedPreferences.setMockInitialValues({}); 
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool working = false;
    String name = 'florence';
    int number = 5;
    List<String> list = ['sandy', 'joe', 'kate'];
    pref.setBool('working', working);
    pref.setString('name', name);
    pref.setInt('number', number);
    pref.setStringList('list', list);


    expect(pref.getBool('working'), false);
    expect(pref.getString('name'), 'florence');
    expect(pref.getInt('number'), 5);
    expect(pref.getStringList('list'), ['sandy', 'joe', 'kate']);
  });
}