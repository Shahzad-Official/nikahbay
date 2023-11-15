class ApiConstant {
  // static const mainUrl = "http://192.168.102.70:3000";
  static const mainUrl = "http://192.168.100.24:3000";
  static const baseUrl = "$mainUrl/api";

  //Auth routes
  // static const getUsers = "/auth/all";
  static const login = "/user/login";
  static const signUp = "/user/sign-up";
  static const verifyOtp = "/user/verify";
  static const updateProfile = "/user/update-profile";
  static const updatePassword = "/user/update-password";
  static const sendOtp = "/user/send-otp";
  static const getUserData = "/user/";
  static const updateFcm = "/user/update-fcm";
}
