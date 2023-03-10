extension StringExtension on String {
  /// Method to capitalize the first
  /// character of each word in string
  String toStudlyCase() {
    try {
      String result = '';
      final data = split(' ')
          .map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase())
          .toList();
      for (final word in data) {
        final int index = data.indexOf(word);
        if (index < data.length) {
          result += '$word ';
        } else {
          result += word;
        }
      }
      return result;
    } catch (e) {
      return this;
    }
  }
}
