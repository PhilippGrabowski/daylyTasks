Map<String, String> names = {
  'Johnny': 'Depp',
  'Tom': 'Cruise',
  'Ted': 'Mosby'
};

void main(List<String> args) {
  names.forEach((key, value) => reverseInitials(key, value));
}

void reverseInitials(String firstName, String lastName) {
  if(firstName.trim().isEmpty || lastName.trim().isEmpty) return;
  String initialFirstName = firstName.trim()[firstName.length - 1].toUpperCase() + '.';
  String initialLastName = lastName.trim()[lastName.length -1].toUpperCase() + '.';
  print((initialLastName + ' ' + initialFirstName)); 
}