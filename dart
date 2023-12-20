import 'dart:io';
import 'package:clipboard/clipboard.dart';

void main() async {
 String _wordlistContent = await File('english.txt').readAsString();
 List<String> wordlist = _wordlistContent.split('\n');
 List<String> randomWords = _generateRandomWords(wordlist);
 String wordsString = randomWords.join(' ');
 await FlutterClipboard.copy(wordsString);
}

List<String> _generateRandomWords(List<String> wordlist) {
 final _random = Random();
 final List<String> randomWords = [];
 while (randomWords.length < 12) {
    String randomWord = wordlist[_random.nextInt(wordlist.length)];
    if (!randomWords.contains(randomWord)) {
      randomWords.add(randomWord);
    }
 }
 return randomWords;
}
