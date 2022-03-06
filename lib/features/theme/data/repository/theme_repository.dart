class ThemeRepository {
  bool isDarkMode = false;

  bool loadTheme() => isDarkMode;

  void setDarkMode() {
    isDarkMode = true;
  }

  void setLightMode() {
    isDarkMode = false;
  }
}
