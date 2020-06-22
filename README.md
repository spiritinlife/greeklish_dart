# Greeklish Generator

Transforms a word into greeklish versions.


## Getting Started

```
        Greeklish.generate("αυτοκινητο")
```

will produce

```
[
      "autokinhto",
      "aftokinhto",
      "avtokinhto",
      "aytokinhto",
      "autokinito",
      "aftokinito",
      "avtokinito",
      "aytokinito",
]
```

You can pass a mix of greek and latin characters.
Latin characters will be ignored.


Does not preserve the case of the input word. All generated words will be in lower case.


# TODO
 - [] Preserve case
 - [] Add stemming ( plurals and such https://github.com/skroutz/greeklish/blob/master/lib/greeklish/greek_reverse_stemmer.rb )

## Inspiration

The project was based on https://github.com/skroutz/greeklish
