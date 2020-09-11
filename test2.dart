void main() async {
  dynamic list = {'name': 'sam', 'age': 11};
  var map = list.cast<String, dynamic>();

  print(list);
  print(map);
}
