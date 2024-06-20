// Person class with basic attributes
class Person {
  String name;
  String address;
  String email;
  String phone;

  Person(this.name, this.address, this.email, this.phone);

  void displayInfo() {
    print('Name: $name');
    print('Address: $address');
    print('Email: $email');
    print('Phone: $phone');
  }
}

// Student class, subclass of Person
class Student extends Person {
  String status;

  Student(String name, String address, String email, String phone, this.status)
      : super(name, address, email, phone);
}

// Employee class, subclass of Person
class Employee extends Person {
  String office;
  double salary;
  String dateHired;

  Employee(String name, String address, String email, String phone, this.office, this.salary, this.dateHired)
      : super(name, address, email, phone);
}

// Faculty class, subclass of Employee
class Faculty extends Employee {
  String officeHours;
  String rank;

  Faculty(String name, String address, String email, String phone, String office, double salary, String dateHired, this.officeHours, this.rank)
      : super(name, address, email, phone, office, salary, dateHired);

  void displayInfo() {
    super.displayInfo();
    print('Office Hours: $officeHours');
    print('Rank: $rank');
  }
}

// Staff class, subclass of Employee
class Staff extends Employee {
  String title;

  Staff(String name, String address, String email, String phone, String office, double salary, String dateHired, this.title)
      : super(name, address, email, phone, office, salary, dateHired);

  void displayInfo() {
    super.displayInfo();
    print('Title: $title');
  }
}

void main() {
  // Example usage
  String studentAddress = 'North Nazimabad,Karachi';
  Student student = Student('Aliza', studentAddress, 'aliza@gmail.com', '039876666', 'Senior');
  student.displayInfo();
  print('Student Status: ${student.status}');


  String facultyAddress = 'Clifton';
  String facultyDateHired = "15 /6 /2012";
  Faculty faculty = Faculty('Hassan', facultyAddress, 'hassan@example.com', '0336543210', 'Building A, Room 101', 80000, facultyDateHired, '9 AM - 5 PM', 'Professor');
  faculty.displayInfo();

 

  String staffAddress = 'Bhadurabad';
  String staffDateHired = '1, 1, 2022';
  Staff staff = Staff('Mike Johnson', staffAddress, 'mike.johnson@example.com', '032256-0123', 'Building B, Room 201', 50000, staffDateHired, ' Assistant');
  staff.displayInfo();
}