import 'package:get/get.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/models/account.dart';
import 'package:mobileapp/data/service/local_service.dart';
//
class AccountService extends BaseService {
  
  LocalService localService;
  AccountService({required this.localService});

  var me = Rx<Account?>(null);
}
