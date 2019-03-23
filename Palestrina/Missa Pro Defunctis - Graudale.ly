\score {
	\new Staff <<
		\new Voice = "tenor" {
			\relative c' {
				\clef "treble_8"
				\cadenzaOn
				\accidentalStyle "forget" \override Stem #'transparent = ##t 
				g8^\markup { solo \concat {( 1 \super {o} ) } } b a s8 a s8 a2 a8^"tutti" s8 c8 a b c a g b g a b s8 a2 \breathe
				c8 a c d e s8 c8 b a s4 a8 s8 a8 g bes a g2 \breathe
				g8 f a g a s8 \bar "" a8 g a s8 a8 f g a c c a g a \grace b c d c c a b4 a2 \showBarLine \bar "|"
				c8 c s4 c8 s4 c8 s8 c8 b c d e c b c c b \breathe \bar ""
				d2 c8 d c a s8 a8 s8 a8 c a g a c c a c c b a c g g f2 \showBarLine \bar "|"
				f8 g a c b a b s8 g8 s8 a8 s4 \bar "" c8 a c2 d4 s8 d8 c d e d c \breathe
				e8 c e f d b c a g \grace a b c d2 c8 d e \breathe
				d8 e d e c a \grace b c a2^"Fine" \showBarLine \bar "|" 
%				\mark "Fine"
				
				a8^"solo" s4 c8 s8 c8 d s8 d8 s d8 s4 d8 e s8 e8 d c b c a g \breathe
				b g a c c d e d e2 \breathe
				c8 e f d b c a g a g a f g2 \breathe
				d'8 \grace e f e f e d e s8 e2 d \showBarLine \bar "|"
				d8 \grace e f e d \grace e f e d s8 d8 e s4 e2 c8 e d c c a c c a c2 c8 c c2 a8 \breathe
				c8 d e d c e d c d a a2 \showBarLine \bar "|"
				c8 c s8 c8 s8 c8 s8 c8 s c8 s8 c8 d s4 d8 c b g a c b g4 a2 c \breathe
				b8 d e c a s8 a8 c a g a c c a c c b a c g g f2 \showBarLine \bar "|"
				f8^"tutti" g a c b a b s4 g8 a s8 c8 a c2 d8 s8 d2 e8 c b4 c2 d \breathe
				g,8 a c c e d c b a \grace b c4 a2^"D.C. al Fine" \showBarLine \bar "||" 
    }
		\addlyrics {
		  Ré -- _ _ qui -- em æ -- tér -- _ _ _ _ _ _ _ _ _ nam dó -- _ _ _ _ na __ _ _ é -- is, __ _ _ _ _
		  Dó -- _ _ _ _ mi -- _ _ ne: __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
      et __ _ lux per -- pé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ tu -- a __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
      lú -- _ _ _ _ _ _ ce -- at é -- _ _ _ is. __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
		  In me -- mó -- _ ri -- a æ -- _ tér -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ na __ _ 
		  é -- _ _ _ _ _ _ rit __ _ jú -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ stus, 
		  ab __ _ au -- di -- ti -- ó -- ne __ _ má -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ la __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		  non __ _ _ _ _ _ _ ti -- _ mé -- _ _ _ bit. __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
		}
	}
	>>
	\header {
		piece = \markup \larger \sans { Graduale }
	}
	\layout {
		ragged-right = ##t
    \context {
      \Score
      \remove "Bar_number_engraver"
    }
	}
}
