abstract class DatabaseRepository {
  create(var object);
  List<dynamic> read();
  update(var object);
  delete(String id);
}