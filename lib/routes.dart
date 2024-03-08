import 'package:delivery/core/constant/routes.dart';
import 'package:delivery/core/middleware/mymiddleware.dart';
import 'package:delivery/view/screen/auth/forget_password/forget_passwordd.dart';
import 'package:delivery/view/screen/auth/forget_password/reset_password.dart';
import 'package:delivery/view/screen/auth/forget_password/success_resetpassword.dart';
import 'package:delivery/view/screen/auth/forget_password/verify_code.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/auth/success_signup.dart';
import 'package:delivery/view/screen/auth/verifycodesignup.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/language.dart';
import 'package:delivery/view/screen/onboarding.dart';
import 'package:delivery/view/screen/orders/archive.dart';
import 'package:delivery/view/screen/orders/details.dart';
import 'package:delivery/view/screen/orders/pending.dart';
import 'package:delivery/view/screen/orders/tracking.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Language(), middlewares: [
    MyMiddleWare()
  ]),

//GetPage(name: '/', page: () => const Cart() ) ,

// Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  
  GetPage(name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
   GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUp()),

// Home Screen
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),


  //  Orders
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
 // GetPage(name: AppRoute.orderstracking, page: () => const OrdersTracking()),

];



