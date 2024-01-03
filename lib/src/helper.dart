class Helper {
  static String getName(String text) {
    final name = text.split('-');

    return name[0].trim();
  }
}

