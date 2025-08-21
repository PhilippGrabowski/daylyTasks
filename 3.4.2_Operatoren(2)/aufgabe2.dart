void main(List<String> args) {
  // Test1
  checkUserAccess(true, false, true, 18); // Willkommen
  // Test2
  checkUserAccess(false, false, true, 18); // Bitte logge dich ein
  // Test3
  checkUserAccess(true, true, true, 18); // Dein Account wurde gesperrt!
  // Test4
  checkUserAccess(true, false, false, 18); // Bitte abonniere
  // Test5
  checkUserAccess(true, false, true, 17); // Du bist zu jung
}

void checkUserAccess(bool isLoggedIn, bool isBanned, bool isSubscribed, int age) {
  if (!isLoggedIn) {
    print("Bitte logge dich ein.");
  } else if (isBanned) {
    print("Dein Account wurde gesperrt!");
  } else if (!isSubscribed) {
    print("Bitte abonniere.");
  } else if (age < 18) {
    print("Du bist zu jung.");
  } else {
    print("Willkommen.");
  }
}