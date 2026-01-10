abstract final class ApiEndpoints {
  // Auth endpoints
  static const String doesEmailExist = '/auth/doesEmailExist';
  static const String sendOtp = '/auth/sendOtp';
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String googleSignIn = '/auth/googleSignIn';
  static const String refreshAccessToken = '/auth/refreshAccessToken';
  static const String logout = '/auth/logout';

  // User endpoints
  static const String userDetail = '/user/detail';
  static const String activateUserSubscription = '/user/activate-user-subscription';
  static const String updateProfile = '/user/profile';

  // Notes endpoints
  static const String notes = '/notes';
  static String noteById(int id) => '/notes/$id';

  // Folders endpoints
  static const String folders = '/folders';
  static String folderById(int id) => '/folders/$id';

  //notifications & firebase endpoints
  static const String saveFCMToken = 'notification/saveFCMToken';

  //others
  static const String zenQuotes = 'https://zenquotes.io/api/today';
}