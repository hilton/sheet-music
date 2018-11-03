\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn \override Stem #'transparent = ##t 
				f8^"solo" f g s4 f8 s4 f8 s2 f8^"tutti" g a s4 a8 g g f g s4 g2 f \breathe
				f8 g a s4 a8 g s2 a8 s4 a8 c a g a bes a g s2 f8 s4 f8 g a g f g s4 g2 f \showBarLine \bar "|"
				a8 g s2 a8 g f s2 a8 s4 g8 a s4 g8 f s4 f2 \breathe
				a8 g s4 a s a8 c a g a bes a g s2 f8 g a g f g s4 g2 f \showBarLine \bar "|"
				f8^"solo" g s2 g8 f s4 g8 a s2 a8 a s2 a8 a s2 a8 s2 g4 a2 \breathe
				f8 s2 g8 s4 a8 s2 a8 a a s2 a8 a s2 a8 s2 g8 bes g a2 \showBarLine \bar "|"
				f8^"tutti" s4 g8 a s4 a8 s2 a4 a a a a s2 a8 a2 \breathe
				a4 s a4 s a8 a s2 f8 s4 g8 a s2 g8 s4 f f2 \showBarLine \bar "|"
				f8 f g s4 f8 s4 f8 s2 f8 g a s4 a8 g g f g s4 g2 f \breathe
				f8 g a s4 a8 g s2 a8 s4 a8 c a g a bes a g s2 f8 s4 f8 g a g f g s4 g2 f \showBarLine \bar "|"
		}
		}
		\addlyrics {
			Ré -- _ _ qui -- em æ -- _ _ tér -- _ _ _ _ nam __ _ dó -- _ _ na __ _ é -- is, __ _ _ _ _ _ _ _
			Dó -- mi -- _ _ _ _ _ ne, __ _ 
			et __ _ lux __ _ _ per -- pé -- _ tu -- _ a lú -- _ ce -- at __ _ _ _ _ _ _ _ é -- _ _ _ _ _ is. __ _
			Te __ _ dé -- _ cet __ _ hym -- nus Dé -- us, in Sí -- on, 
			et tí -- bi red -- dé -- tur vó -- tum in Je -- rú -- sa -- lem.
      Ex -- áu -- _ di o -- ra -- ti -- ó -- nem mé -- am; ad te óm -- nis cá -- ro __ _ vé -- ni -- et.
			Ré -- _ _ qui -- em æ -- _ _ tér -- _ _ _ _ nam __ _ dó -- _ _ na __ _ é -- is, __ _ _ _ _ _ _ _
			Dó -- mi -- _ _ _ _ _ ne, __ _ 
		}
	>>
	\header {
		piece = \markup \larger \sans { Introitus }
	}
	\layout {
		ragged-right = ##t
	}
}
