String substringFromFirstSpace(String input) {
  int spaceIndex = input.indexOf(' ');
  if (spaceIndex == -1) {
    return '';
  } else {
    return input.substring(spaceIndex + 1);
  }
}
