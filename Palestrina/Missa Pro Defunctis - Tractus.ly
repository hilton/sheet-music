\score {
	\new Staff <<
		\new Voice = "tenor" {
			\relative c' {
				\clef "treble_8"
				\cadenzaOn \accidentalStyle "forget" \override Stem #'transparent = ##t
				g8^"solo" s g a b a s g a s a g2 \breathe g8^"tutti" c c d s a s g f g a a g2 \breathe
				g8 c s c s c s4 c8 s c s c s4 c8 s a c s c s c2 \breathe \bar ""
				c8 s c s b d e c c a s c a a g a g c c a c g g f2 \showBarLine \bar "|"
				f8 s4 a8 c s b g a s g f g a s g s g2 \breathe \bar ""
				g8 s g a c b c s c a2 \grace b8 c s c c c b a b a g a2 g \showBarLine \bar "|"
				g8^"solo" s4 g8 c s c s c s4 c8 s c2 \breathe \bar ""
				c8 s c s4 c8 s c s b d e c c a s c a a g a g c c a c g g f2 \showBarLine \bar "|"
				f8 s f s a c s b g a s4 \bar "" g8 f s g a s g s g2 \breathe
				g8 s g a s g s g s4 g8 s g a c b c s4 c8 a2 \grace b8 c s c c c b a b a g a2 g \showBarLine \bar "|"
				g8^"solo" s g8 c   c s4 c8 s b d e c c a s c a a g a g c c a c g g f2 \showBarLine \bar "|"
				g8 s g s g s a2 g8 a \grace b c s g a g f s f2 \breathe \bar ""
				f2^"tutti" a8 \grace b c d s c s c b c a g g g a g g f g2 \breathe
				c8 c c d c b a a g a c b a g g a f2 \breathe a8 \grace b c b a b a a g2 \showBarLine \bar "||"
    }
		\addlyrics {
			Ab -- sól -- _ _ _ _ _ ve, __ _ Dó -- _ _ _ mi -- ne, __ _ _ _ _ _ 
			á -- _ ni -- mas óm -- ni -- um fi -- dé -- _ li -- um 
			de -- func -- tó -- _ _ _ _ _ rum __ _ _ _ _ _ _ _ _ _ _ _ _
			ab óm -- _ ni __ _ _ vín -- _ _ _ cu -- lo 
			de -- lic -- _ _ _ _ tó -- _ _ rum __ _ _ _ _ _ _ _ _ _ 
			et grá -- _ ti -- a tú -- a íl -- lis suc -- cu -- rén -- _ _ _ _ _ te __ _ _ _ _ _ _ _ _ _ _ _ _
			me -- re -- án -- _ tur __ _ _ e -- _ vá -- _ de -- re 
			ju -- dí -- _ ci -- um ul -- ti -- _ _ _ _ ó -- _ _ nis, __ _ _ _ _ _ _ _ _ _ 
			et lú -- _ cis æ -- tér -- _ _ _ _ _ næ __ _ _ _ _ _ _ _ _ _ _ _ _ 
			be -- a -- ti -- tú -- _ _ _ di -- _ _ _ ne pér -- _ _ _ fru -- i. __ _ _ _ _ _ _ _ _ _ _ _
		}
	}
	>>
	\header {
		piece = \markup \larger \sans { Tractus }
	}
	\layout {
		ragged-right = ##t
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
	}
}
