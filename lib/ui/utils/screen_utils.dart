class ScreenUtils {
  static double calculateGridSize(double screenWidth) {
    if (screenWidth > 1150) {
      return 5;
    } else if (screenWidth > 680) {
      return 3;
    } else {
      return 2;
    }
  }
}
