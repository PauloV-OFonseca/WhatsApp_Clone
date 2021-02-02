import 'package:dio/dio.dart';
import 'package:whatsapp_clone/app/intro/modules/login/modules/register/models/new_user_model.dart';
import 'package:whatsapp_clone/app/shared/consts/app_api.dart';

class RegisterAuthService {
  final dio = Dio();
  
  signUp(NewUserModel user) async{
    await dio.post(
      AppApi.REGISTER_URL,
      data: user.toJson()
    );
  }

}
