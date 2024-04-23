class Breakpoints {
  const Breakpoints._();
  static const double xs = 576;
  static const double sm = 768;
  static const double md = 992;
  static const double lg = 1200;
  static const double xl = 1920;

  static bool isMobile(double value) => value <= xs;
  static bool isTablet(double value) => value > xs && value <= sm;
  static bool isDesktop(double value) => value >= md;
}
