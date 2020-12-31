import 'package:whatsapp_clone/model/user.dart';

class Mocks{

  List<User> getUsers(){
    return [
      User(
        "Pessoa 1", "Olá", "1", "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg"
      ),
      User(
        "Pessoa 2", "hello", "2", "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-4.jpeg"
      ),
      User(
        "Pessoa 3", "Ocupado", "3", "https://static01.nyt.com/newsgraphics/2020/11/12/fake-people/4b806cf591a8a76adfc88d19e90c8c634345bf3d/fallbacks/mobile-01.jpg"
      ),
    ];
  }

}