class Student {
  String name = ''; // Initialize name with an empty string
  List<int> resultArray = List<int>.filled(5, 0);

  // Default constructor
  Student();

  // One-argument constructor for Name
  Student.withName(String name) {
    this.name = name;
  }

  // Two-argument constructor for Name and Result Array
  Student.withDetails(String name, List<int> results) {
    this.name = name;
    if (results.length >= 5) {
      this.resultArray = results.sublist(0, 5);
    } else {
      this.resultArray = List<int>.filled(5, 0);
    }
  }

  // Method to calculate average of marks in resultArray
  double average() {
    if (resultArray.isEmpty) return 0.0;

    int sum = resultArray.reduce((value, element) => value + element);
    return sum / resultArray.length;
  }

  // Method to compare average with another student
  String compareAverage(Student otherStudent) {
    double avg1 = this.average();
    double avg2 = otherStudent.average();

    if (avg1 > avg2) {
      return '${this.name} has a higher average (${avg1.toStringAsFixed(2)}) than ${otherStudent.name} (${avg2.toStringAsFixed(2)})';
    } else if (avg1 < avg2) {
      return '${otherStudent.name} has a higher average (${avg2.toStringAsFixed(2)}) than ${this.name} (${avg1.toStringAsFixed(2)})';
    } else {
      return '${this.name} and ${otherStudent.name} have the same average (${avg1.toStringAsFixed(2)})';
    }
  }
}

void main() {
  
  Student student1 = Student.withName('Qurrat');
  student1.resultArray = [85, 90, 78, 92, 88];

  Student student2 = Student.withDetails('Zubair', [75, 82, 0, 88, 90]);

  
  print('Student 1: ${student1.name}');
  print('Student 1 Marks: ${student1.resultArray}');
  print('Student 1 Average: ${student1.average().toStringAsFixed(2)}');
  print('');

  print('Student 2: ${student2.name}');
  print('Student 2 Marks: ${student2.resultArray}');
  print('Student 2 Average: ${student2.average().toStringAsFixed(2)}');
  print('');

  // Compare averages
  print(student1.compareAverage(student2));
}
