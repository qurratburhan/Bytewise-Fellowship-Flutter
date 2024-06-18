void main() {
  int age = 30;
  double height = 6.2;
  String name = 'Alice';
  bool isActive = true;
  List<int> scores = [85, 90, 78];
  Map<String, String> address = {'city': 'New York', 'country': 'USA'};
  Set<String> skills = {'coding', 'design', 'testing'};
  Runes emoji = Runes('\u{1F600}');
  Symbol library = #myLibrary;

  print('Name: $name');
  print('Age: $age');
  print('Height: $height');
  print('Is Active: $isActive');
  print('Scores: $scores');
  print('Address: ${address['city']}, ${address['country']}');
  print('Skills: $skills');
  print('Emoji: ${String.fromCharCodes(emoji)}');
  print('Library Symbol: $library');
}
