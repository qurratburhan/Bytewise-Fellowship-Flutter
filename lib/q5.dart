// Job class
class Job {
  String designation;
  double salary;
  int id;

  // Constructor
  Job(this.designation, this.salary, this.id);

  // Getters and setters
  String getDesignation() => designation;
  double getSalary() => salary;
  int getId() => id;

  void setDesignation(String designation) {
    this.designation = designation;
  }

  void setSalary(double salary) {
    this.salary = salary;
  }

  void setId(int id) {
    this.id = id;
  }
}

// Employee class
class Employee {
  String name;
  int age;
  Job job;

  // Constructor without job initially
  Employee(this.name, this.age);

  // Constructor with job
  Employee.withJob(this.name, this.age, this.job);

  // Getter and setter for name and age
  String getName() => name;
  int getAge() => age;

  void setName(String name) {
    this.name = name;
  }

  void setAge(int age) {
    this.age = age;
  }

  // Getter and setter for job
  Job getJob() => job;

  void setJob(Job job) {
    this.job = job;
  }

  // Method to check if salary is greater than 50,000
  bool isHighSalary() {
    if (job != null && job.getSalary() > 50000) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    print('Name: $name');
    print('Age: $age');
    if (job != null) {
      print('Job Designation: ${job.getDesignation()}');
      print('Job Salary: ${job.getSalary()}');
      print('Job ID: ${job.getId()}');
    } else {
      print('Employee has no job assigned.');
    }
  }
}

void main() {
  Job job1 = Job('Software Engineer', 60000000, 1);
  Employee emp1 = Employee.withJob('ALI', 29, job1);

  print('Employee  Details:');
  emp1.display();
  print('');

  if (emp1.isHighSalary()) {
    print('${emp1.getName()} has a high salary.');
  } else {
    print('${emp1.getName()} does not have a high salary.');
  }
}
