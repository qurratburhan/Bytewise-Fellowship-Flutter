void main() {
  // Arithmetic Operators
  int a = 10;
  int b = 5;
  print('Arithmetic Operators:');
  print('a + b = ${a + b}'); // 15
  print('a - b = ${a - b}'); // 5
  print('a * b = ${a * b}'); // 50
  print('a / b = ${a / b}'); // 2.0
  print('a ~/ b = ${a ~/ b}'); // 2
  print('a % b = ${a % b}'); // 0

  // Relational Operators
  print('\nRelational Operators:');
  print('a == b: ${a == b}'); // false
  print('a != b: ${a != b}'); // true
  print('a > b: ${a > b}'); // true
  print('a < b: ${a < b}'); // false
  print('a >= b: ${a >= b}'); // true
  print('a <= b: ${a <= b}'); // false

  // Bitwise and Shift Operators
  int c = 2; // 10 in binary
  int d = 3; // 11 in binary
  print('\nBitwise and Shift Operators:');
  print('c & d = ${c & d}'); // 2 (10 & 11 = 10)
  print('c | d = ${c | d}'); // 3 (10 | 11 = 11)
  print('c ^ d = ${c ^ d}'); // 1 (10 ^ 11 = 01)
  print('~c = ${~c}'); // -3
  print('c << 1 = ${c << 1}'); // 4 (10 << 1 = 100)
  print('c >> 1 = ${c >> 1}'); // 1 (10 >> 1 = 01)

  // Cascade Notation
  print('\nCascade Notation:');
  var numbers = [1, 2, 3]
    ..add(4)
    ..remove(2);
  print('Numbers after cascade: $numbers'); // [1, 3, 4]

  // Null Safety
  print('\nNull Safety:');
  int? g;
  int h = g ?? 5;
  print('h (default to 5 if g is null) = $h'); // 5

  g ??= 10;
  print('g (assign 10 if g is null) = $g'); // 10

  String? text;
  print('text?.length = ${text?.length}'); // null

  // Type Test Operators
  print('\nType Test Operators:');
  var i = 'Hello';
  if (i is String) {
    print('i is a String'); // i is a String
  }
}
