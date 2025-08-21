void main(List<String> args) {
  int age = 35;
  bool hasParentalControl = true;
  int movieAgeRating = 18;

  isAllowedToWatchMovie(age, hasParentalControl, movieAgeRating); // Du kannst dir den Film anschauen
  // Tests
  isAllowedToWatchMovie(15, true, 16); // Du kannst dir den Film anschauen
  isAllowedToWatchMovie(13, false, 16); // Du kannst dir den Film nicht anschauen!
}

void isAllowedToWatchMovie(int age, bool hasParentalControl, int movieAgeRating) {
  if (age >= movieAgeRating || (hasParentalControl && age >= movieAgeRating - 2)) {
    print("Du kannst dir den Film anschauen.");
  } else {
    print("Du kannst dir den Film nicht anschauen!");
  }
}