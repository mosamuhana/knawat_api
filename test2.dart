import 'lib/src/helpers.dart';

void main() async {
  var json = '2019-08-24';
  var date = DateHelper.fromJson(json);

  print(json);
  print(date);
}
