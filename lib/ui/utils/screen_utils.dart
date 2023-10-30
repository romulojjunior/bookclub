class ScreenUtils {
  static double calculateGridSize(double screenWidth) {
    if (screenWidth > 1200) {
      return 5;
    } else if (screenWidth > 900) {
      return 4;
    } else if (screenWidth > 600) {
      return 3;
    } else {
      return 2;
    }
  }
}
