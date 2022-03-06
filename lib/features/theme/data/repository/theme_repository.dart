class ThemeRepository {
  bool isDarkMode = false;

  void setDarkMode() {
    isDarkMode = true;
  }

  void setLightMode() {
    isDarkMode = false;
  }
}
