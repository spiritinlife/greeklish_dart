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
    "τ": ["t"],
    "υ": ["y", "u", "i"],
    "φ": ["f", "ph"],
    "χ": ["x", "h", "ch"],
    "ψ": ["ps"],
    "ω": ["w", "o", "v"]
  };

  static List<String> generate(String greekWord) {
    List<String> greeklishVersion = List();

    DIGRAPH_CASES.forEach((key, value) {
      greekWord = greekWord.replaceAll(key, value);
    });

    Runes inputToken = greekWord.runes;

    inputToken.forEach((rune) {
      String greekChar = String.fromCharCode(rune);
      greekChar =
          ACCENTS.containsKey(greekChar) ? ACCENTS[greekChar] : greekChar;

      if (CONVERT_STRINGS.containsKey(greekChar)) {
        if (greeklishVersion.isEmpty) {
          CONVERT_STRINGS[greekChar].forEach((conversionStrings) {
            greeklishVersion.add(conversionStrings);
          });
        } else {
          List<String> newTokens = [];
          CONVERT_STRINGS[greekChar].forEach((conversionString) {
            greeklishVersion.forEach((token) {
              newTokens.add("$token$conversionString");
            });
          });

          greeklishVersion = newTokens;
        }
      } else {
        greeklishVersion.add(greekChar);
      }
    });
    return greeklishVersion;
  }
}
