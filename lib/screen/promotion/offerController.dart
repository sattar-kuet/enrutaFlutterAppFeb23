import 'package:enruta/api/service.dart';
import 'package:enruta/controllers/cartController.dart';

import 'package:get/get.dart';

import 'offerModel.dart';

class OfferController extends GetxController {
  // ignore: deprecated_member_use
  RxList<Offer> allOfferItems = <Offer>[].obs;
  var isLoading = true.obs;
  CartController ccont = Get.find();

  @override
  void onInit() {
    getoffer();
    super.onInit();
  }

  void getoffer() async {
    try {
      isLoading(true);
      await Future.delayed(Duration(seconds: 3));
      Service.getAllOffers().then((values) {
        if (values != null && values.offers != null && values.offers!.isNotEmpty) {
          allOfferItems.value = values.offers!.toList();
        }
      });
    } finally {
      isLoading(false);
    }
  }

  void setoffercode(var offerprice, var minimumSpent) {
    try {
      ccont.offer.value = offerprice;
      ccont.minimumSpent.value = minimumSpent;
    } catch (e) {
      print(e);
    }
  }
}
