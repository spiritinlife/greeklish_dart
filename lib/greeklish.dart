library greeklish;

class Greeklish {
  // Constant variables that represent the character that substitutes
  // a digraph.
  static const String AI = "Α";
  static const String OI = "Ο";
  static const String EI = "Ε";
  static const String OY = "Υ";
  static const String EY = "Φ";
  static const String AY = "Β";
  static const String MP = "Μ";
  static const String GG = "Γ";
  static const String GK = "Κ";
  static const String NT = "Ν";

  // The possible digraph cases.
  static const DIGRAPH_CASES = {
    "αι": AI,
    "ει": EI,
    "οι": OI,
    "ου": OY,
    "ευ": EY,
    "αυ": AY,
    "μπ": MP,
    "γγ": GG,
    "γκ": GK,
    "ντ": NT
  };

  static const ACCENTS = {
    'ά': 'α',
    'έ': 'ε',
    'ή': 'η',
    'ί': 'ι',
    'ό': 'ο',
    'ύ': 'υ',
  };

  // The possible string conversions for each case.
  static const CONVERT_STRINGS = {
    AI: ["ai", "e"],
    EI: ["ei", "i"],
    OI: ["oi", "i"],
    OY: ["ou", "oy", "u"],
    EY: ["eu", "ef", "ev", "ey"],
    AY: ["au", "af", "av", "ay"],
    MP: ["mp", "b"],
    GG: ["gg", "g"],
    GK: ["gk", "g"],
    NT: ["nt", "d"],
    "α": ["a"],
    "β": ["b", "v"],
    "γ": ["g"],
    "δ": ["d"],
    "ε": ["e"],
    "ζ": ["z"],
    "η": ["h", "i"],
    "θ": ["th"],
    "ι": ["i"],
    "κ": ["k"],
    "λ": ["l"],
    "μ": ["m"],
    "ν": ["n"],
    "ξ": ["ks", "x"],
    "ο": ["o"],
    "π": ["p"],
    "ρ": ["r"],
    "σ": ["s"],
    "ς": ["s"],
    "τ": ["t"],
    "υ": ["y", "u", "i"],
    "φ": ["f", "ph"],
    "χ": ["x", "h", "ch"],
    "ψ": ["ps"],
    "ω": ["w", "o", "v"]
  };

  static bool _isGreekChar(String char) =>
      CONVERT_STRINGS[ACCENTS[char] ?? char] != null;

  static bool _containsGreekChars(String word) => word.runes.any((r) {
        String char = String.fromCharCode(r);
        return _isGreekChar(char);
      });

  static List<String> _buildGreeklishVersions(String char) =>
      !_isGreekChar(char) ? [char] : CONVERT_STRINGS[char];

  static List<String> generate(String word) {
    // we work with the lowercase version
    word = word.toLowerCase();

    // if word does not contain any greek chars then stop
    if (!_containsGreekChars(word)) return [word];

    // replace accents
    ACCENTS.forEach((key, value) => word = word.replaceAll(key, value));

    // replace digraphs
    DIGRAPH_CASES.forEach((key, value) => word = word.replaceAll(key, value));

    List<String> wordVersions = List();

    // generate words from all possible rune conversions
    Runes wordRunes = word.runes;
    for (var rune in wordRunes) {
      String char = String.fromCharCode(rune);

      if (wordVersions.isEmpty) {
        _buildGreeklishVersions(char).forEach(
          (version) => wordVersions.add(version),
        );
      } else {
        List<String> newTokens = [];

        _buildGreeklishVersions(char).forEach(
          (version) => wordVersions.forEach(
            (token) => newTokens.add("$token$version"),
          ),
        );

        wordVersions = newTokens;
      }
    }

    return wordVersions;
  }
}
