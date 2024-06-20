
abstract class Movie {
  int id;
  String title;
  int rentedDays;

  
  Movie(this.id, this.title, this.rentedDays);

  int getId() => id;
  String getTitle() => title;
  int getRentedDays() => rentedDays;

  void setId(int id) {
    this.id = id;
  }

  void setTitle(String title) {
    this.title = title;
  }

  void setRentedDays(int rentedDays) {
    this.rentedDays = rentedDays;
  }

  bool equals(Movie other) {
    return this.id == other.id &&
           this.title == other.title &&
           this.rentedDays == other.rentedDays;
  }

  double calcLateFees(int lateDays);
}

class Action extends Movie {
  Action(int id, String title, int rentedDays) : super(id, title, rentedDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 3.0; // $3/day late fee for Action movies
  }
}


class Comedy extends Movie {
  Comedy(int id, String title, int rentedDays) : super(id, title, rentedDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 2.50; // $2.50/day late fee for Comedy movies
  }
}


class Drama extends Movie {
  Drama(int id, String title, int rentedDays) : super(id, title, rentedDays);

  @override
  double calcLateFees(int lateDays) {
    return lateDays * 2.0; 
  }
}
void main() {
  
  Movie actionMovie = Action(1, "Mission Impossible", 5);
  Movie comedyMovie = Comedy(2, "Jhonny English", 3);
  Movie dramaMovie = Drama(3, "The Shawshank Redemption", 7);


  print("Late fee for ${actionMovie.getTitle()}: \$${actionMovie.calcLateFees(2).toStringAsFixed(2)}");
  print("Late fee for ${comedyMovie.getTitle()}: \$${comedyMovie.calcLateFees(1).toStringAsFixed(2)}");
  print("Late fee for ${dramaMovie.getTitle()}: \$${dramaMovie.calcLateFees(4).toStringAsFixed(2)}");


  if (actionMovie is Action) {
    Action action = actionMovie;
    action.setId(10);
    print("Action movie ID reset: ${action.getId()}");
  }
}