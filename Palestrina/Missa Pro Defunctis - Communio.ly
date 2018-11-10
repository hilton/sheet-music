\score {
	\new Staff <<
		\new Voice = "tenor" {
			\relative c' {
				\clef "treble_8"
				\cadenzaOn \accidentalStyle "forget" \override Stem #'transparent = ##t
				a8^"solo" s4 g8 f s g a s g2 \breathe 
				a4^"tutti" c b s4 c4 a s4 g4 f8 g s g2 \showBarLine \bar "|"
				a8 s4 c b s8 c4 a s8 b4 s8 c4 a g8 a g2 \breathe \bar "" e4 f s8 g8 a4 a s8 g2 \showBarLine \bar "|"
				g4^"solo" a c s8 c4 c c s8 c4 c s8 c4 d s8 d4 c c2 \breathe
				a4 s8 c4 s8 c4 c c c s8 c4 b c s8 a4 g2 \showBarLine \bar "|"
				a8^"tutti" s4 c b s8 c4 a s8 b4 s8 c4 a g8 a g2 \breathe e4 f s8 g8 a4 a s8 g2 \showBarLine \bar "|"
				g4 a a g s8 a4 s8 a g g2 \showBarLine \bar "|" g4 g2 a \showBarLine \bar "|"
    }
		\addlyrics {
			Lux æ -- _ tér -- _ na lú -- ce -- at é -- is, Dó -- mi -- _ ne,
			cum sánc -- tis tú -- is in æ -- tér -- num, __ _ _
			qui -- a pí -- _ us es.
			Ré -- qui -- em æ -- tér -- nam dó -- na é -- is, Dó -- mi -- ne;
			et lux per -- pé -- tu -- a lú -- ce -- at é -- is;
			cum sánc -- tis tú -- is in æ -- tér -- num, __ _ _
			qui -- a pí -- _ us es.
			Re -- qui -- és -- cant in pá -- _ ce. Am -- en. __ _
		}
	}
	>>
	\header {
		piece = \markup \larger \sans { Communio }
	}
	\layout {
		ragged-right = ##f
		ragged-last = ##f
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
	}
}
