import 'dart:math';

class Box<T> {
  List<T> items = [];

  // Method to add an item to the box
  void add(T item) {
    items.add(item);
  }

  // Method to check if the box is empty
  bool isEmpty() {
    return items.isEmpty;
  }

  // Method to draw an item randomly from the box
  T drawItem() {
    if (isEmpty()) {
      print("Box is empty. Cannot draw an item.");
      return Null;
    }
    Random random = Random();
    int randomIndex = random.nextInt(items.length);
    return items[randomIndex];
  }
}

void main() {
  // Create a Box of Strings (example: names)
  Box<String> nameBox = Box<String>();

  // Add some names to the box
  nameBox.add("Rectangle");
  nameBox.add("Ellipse");
  nameBox.add("Circle");
  nameBox.add("Triangle");

  // Test drawing items from the nameBox
  print("Drawing names from the box:");
  for (int i = 0; i < 5; i++) {
    var drawnName = nameBox.drawItem();
    if (drawnName != null) {
      print("Drawn item: $drawnName");
    } else {
      print("No more items to draw.");
    }
  
  Box<int> lotteryBox = Box<int>();


  lotteryBox.add(5);
  lotteryBox.add(10);
  lotteryBox.add(15);
  lotteryBox.add(20);
  print("\nDrawing lottery numbers from the box:");
  for (int i = 0; i < 3; i++) {
    var drawnNumber = lotteryBox.drawItem();
    if (drawnNumber != null) {
      print("Drawn number: $drawnNumber");
    } else {
      print("No more items to draw.");
    }
  }
  Box<double> emptyBox = Box<double>();
  var drawnItem = emptyBox.drawItem();
  if (drawnItem == null) {
    print("\nTrying to draw from an empty box returned null.");
  }
  }
