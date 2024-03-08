class AppLink {
  //static const String server = 'https://queenpharmaeg.com/ecommercepckod';

  static const String server = 'https://pckodstore.com/ecommerce/delivery';

  ///============================= Image =============================

  static const String imagetest = 'https://pckodstore.com/ecommerce/upload';

  // static const String imagetest =
  //     'https://queenpharmaeg.com/ecommercepckod/upload';
  static const String imageCategories = '$imagetest/categories';
  static const String imageItems = '$imagetest/items';

  ///=====================================================================

  static const String test = '$server/test.php';

  ///=========================== Notification =========================== 
  static const String notification = '$server/notification.php';

  ///========================= Auth ======================================
  static const String signUp = '$server/auth/signup.php';

  static const String login = '$server/auth/login.php';

  static const String verifycodesignup = '$server/auth/verfiycode.php';

  static const String resend = '$server/auth/resend.php';

  ///========================= ForgetPassword ===========================
  static const String checkEmail = '$server/forgetpassword/checkemail.php';

  static const String resetPassword =
      '$server/forgetpassword/resetpassword.php';

  static const String verifycodeforgetpassword =
      '$server/forgetpassword/verifycode.php';

  ///========================= Home ===========================

  static const String homepage = '$server/home.php';


  ///=========================== checkout ===========================

  static const String viewpendingOrders = '$server/orders/pending.php';
  static const String viewacceptedOrders = '$server/orders/accepted.php';
  static const String approveOrders= '$server/orders/approve.php';
  static const String viewarchiveOrders = '$server/orders/archive.php';
  static const String detailsOrders= 'https://pckodstore.com/ecommerce/orders/details.php';
  //static const String detailsOrders= '$server/orders/details.php';
  static const String doneOrders= '$server/orders/done.php';



}
