
import 'package:get/get.dart';

import '../data/repo/authentication/auth_repo.dart';
import '../utils/https/network_manager.dart';


class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager(), permanent: true);
  }
}