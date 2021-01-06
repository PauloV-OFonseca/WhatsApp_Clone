import 'package:whatsapp_clone/model/call.dart';
import 'package:whatsapp_clone/model/status.dart';
import 'package:whatsapp_clone/model/user.dart';

class Mocks {
  List<User> getUsers() {
    return [
      User("Pessoa 1", "Olá", "+55 71 999999999",
          "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg"),
      User("Pessoa 2", "hello", "+55 71 999999998",
          "https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-4.jpeg"),
      User("Pessoa 3", "Ocupado", "+55 71 999999997",
          "https://static01.nyt.com/newsgraphics/2020/11/12/fake-people/4b806cf591a8a76adfc88d19e90c8c634345bf3d/fallbacks/mobile-01.jpg")
    ];
  }

  List<Call> getCalls() {
    return [
      Call(getUsers()[0], DateTime.parse("2020-09-20 20:18:04Z"), "video", true, true),
      Call(getUsers()[1], DateTime.parse("2020-09-19 09:52:12Z"), "voz", false, false),
      Call(getUsers()[2], DateTime.parse("2020-09-16 01:23:00Z"), "video", true, false),
      Call(getUsers()[1], DateTime.parse("2020-08-01 15:35:59Z"), "voz", false, true)
    ];
  }

  List<Status> getStatus(){
    return [
      Status(getUsers()[0], ["assets/image1.png", "assets/image2.png"])
    ];
  }
}
