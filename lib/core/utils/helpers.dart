class Helpers {
  static bool isPalindrome(String text) {
    String processed = text.replaceAll(' ', '').toLowerCase();
    return processed == processed.split('').reversed.join('');
  }
}
