class GreeklishGenerator {
  /// Constant variables that represent the character that substitutes
  /// a digraph.
  static const String _AI = 'Α';
  static const String _OI = 'Ο';
  static const String _EI = 'Ε';
  static const String _OY = 'Υ';
  static const String _EY = 'Φ';
  static const String _AY = 'Β';
  static const String _MP = 'Μ';
  static const String _GG = 'Γ';
  static const String _GK = 'Κ';
  static const String _NT = 'Ν';

  /// The possible digraph cases.
  static const Map<String, String> _DIGRAPH_CASES = <String, String>{
    'αι': _AI,
    'ει': _EI,
    'οι': _OI,
    'ου': _OY,
    'ευ': _EY,
    'αυ': _AY,
    'μπ': _MP,
    'γγ': _GG,
    'γκ': _GK,
    'ντ': _NT
  };

  static const Map<String, String> _ACCENTS = <String, String>{
    'ά': 'α',
    'έ': 'ε',
    'ή': 'η',
    'ί': 'ι',
    'ό': 'ο',
    'ύ': 'υ',
    'ώ': 'ω',
  };

  // The possible string conversions for each case.
  static const Map<String, List<String>> _CONVERT_STRINGS =
      <String, List<String>>{
    _AI: ['ai', 'e'],
    _EI: ['ei', 'i'],
    _OI: ['oi', 'i'],
    _OY: ['ou', 'oy', 'u'],
    _EY: ['eu', 'ef', 'ev', 'ey'],
    _AY: ['au', 'af', 'av', 'ay'],
    _MP: ['mp', 'b'],
    _GG: ['gg', 'g'],
    _GK: ['gk', 'g'],
    _NT: ['nt', 'd'],
    'α': ['a'],
    'β': ['b', 'v'],
    'γ': ['g'],
    'δ': ['d'],
    'ε': ['e'],
    'ζ': ['z'],
    'η': ['h', 'i'],
    'θ': ['th'],
    'ι': ['i'],
    'κ': ['k'],
    'λ': ['l'],
    'μ': ['m'],
    'ν': ['n'],
    'ξ': ['ks', 'x'],
    'ο': ['o'],
    'π': ['p'],
    'ρ': ['r'],
    'σ': ['s'],
    'ς': ['s'],
    'τ': ['t'],
    'υ': ['y', 'u', 'i'],
    'φ': ['f', 'ph'],
    'χ': ['x', 'h', 'ch'],
    'ψ': ['ps'],
    'ω': ['w', 'o', 'v']
  };

  /// Given a word will produce a List of greeklish variations.
  ///
  /// ```dart
  /// GreeklishGenerator.generate('αυτοκίνητο') == ['autokinhto','aftokinhto','avtokinhto','aytokinhto','autokinito','aftokinito','avtokinito','aytokinito']
  /// ```
  ///
  static List<String> generate(String word) {
    // we work with the lowercase version
    word = word.toLowerCase();

    // if word does not contain any greek chars then stop
    if (!_containsGreekChars(word)) {
      return List<String>.from([word]);
    }

    // replace accents
    _ACCENTS.forEach((key, value) => word = word.replaceAll(key, value));

    // replace digraphs
    _DIGRAPH_CASES.forEach((key, value) => word = word.replaceAll(key, value));

    List<String> wordVariations = [];

    // generate words from all possible rune conversions
    for (final int rune in word.runes) {
      if (wordVariations.isEmpty) {
        _produceGreeklishVeriations(rune).forEach(
          (greeklishVariation) => wordVariations.add(greeklishVariation),
        );
      } else {
        final List<String> newTokens = [];

        for (final String greeklishVariation
            in _produceGreeklishVeriations(rune)) {
          for (final String token in wordVariations) {
            newTokens.add('$token$greeklishVariation');
          }
        }
        wordVariations = newTokens;
      }
    }

    return wordVariations;
  }

  /// Checks if a character is greek character
  static bool _isGreekChar(int charCode) {
    final String char = String.fromCharCode(charCode);
    return _CONVERT_STRINGS[_ACCENTS[char] ?? char] != null;
  }

  /// Checks if given word contains greek characters
  static bool _containsGreekChars(String word) => word.runes.any(_isGreekChar);

  /// Given a charCode will produce greeklish variations of it
  static List<String> _produceGreeklishVeriations(int charCode) =>
      !_isGreekChar(charCode)
          ? [String.fromCharCode(charCode)]
          : _CONVERT_STRINGS[String.fromCharCode(charCode)];
}
