import 'package:dio/dio.dart';
import 'package:whatsapp_clone/app/intro/pages/login/register/models/new_user_model.dart';

class RegisterAuthService {
  final String url = "https://us-central1-estagio-clima.cloudfunctions.net/api/v1/usuarios_chat";
  final dio = Dio();
  
  signUp(NewUserModel user) async{
    await dio.post(
      url,
      data: user.toJson()
    );
  }

}
