\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn \override Stem #'transparent = ##t 
				f4^"solo" g a bes s a s a2 g s4 a4 g f e f s g s f s f2 \cadenzaOff
			}
		}
		\addlyrics {
			Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	\header {
		piece = \markup \larger \sans { Kyrie }
	}
	\layout {
		ragged-right = ##t
	}
}

soprano = \new Voice {
	\relative c' {
		r2 f g a bes2. a4 a2 g a2. g8 f 	e f g4. f8 f2 e4 f1 r2 
		c d e f4 a g2 r4 a2 f4 g2 f4 c8 d e f g a g4 f2 e4 f1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Ky -- _ _ _ ri -- e __ _  e -- _ _ _ _ le -- _  _ i -- son
		Ky -- _ _ ri -- _ e e -- _ le -- _ _ _ _ _ _ _ _ _ i -- son
	}
}

alto = \new Voice {
	\relative c' {
		c2 d e f2. e4 d c2 f e4 d c2 bes4 c2 r1 r4 c2 d4 e2 
		f4 f, a bes c1 r4 bes d c8 bes c2. c4 c\breve ~ c1\fermata
	}
	\addlyrics {
		Ky -- _ _ _ ri -- e e -- le -- _ _ _ i -- son Ky -- ri -- e e -- le -- _ i -- son
		e -- _ _ _ le -- i -- son
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8" 
			R1 R R R r2 f
			g a bes2. a4 a2 g a2. g8 f e f g4. f8 f2 e4 f1 c2 f e4. f8 g4 a g c a1\fermata
		}
	}
}
tenorlyrics = \new Lyrics \lyricsto "tenor" {
	Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- _ _ i -- son e -- le -- _ _ _ _ _ i -- son
}

baritone = {
	\new Voice = "baritone" {
		\relative c {
			\clef "treble_8" 
			f2 bes g f4 a g2 f1 c'4. bes8 a2 r2 \bar ""
			r4 c4 d2. bes4 c2 f, c' r f, g a
			bes2. a4 a2 g a2. g8 f e4 f g g f1\fermata
		}
	}
}
baritonelyrics = \new Lyrics \lyricsto "baritone" {
	Ky -- _ ri -- _ _ e e -- le -- i -- son e -- le -- _ _ i -- son
	Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ 
	le -- i -- son.
}

bass = {
	\new Voice = "bass" {
		\relative c {
			\clef "bass"
			R1 R R r2 c2 f d c4 e d2 g f r c 
			f d c4. bes8 a4	f g4 g4 f2 r4 f'2 e4 f f, c'1 ~ c4 c4 f,1\fermata
		}
	}
}
basslyrics = \new Lyrics \lyricsto "bass" {
	Ky -- _ ri -- e e -- le -- i -- son Ky -- _ ri -- e __ _ _ e -- le -- i -- son
	Ky -- ri -- e e -- le -- i -- son.
}

\score {
	<<
		\new ChoirStaff
		<< 
			\new Staff << \global \keyF \soprano >> 
			\new Staff << \global \keyF \alto >> 
			\new Staff << \global \keyF \tenor \tenorlyrics >>
			\new Staff << \global \keyF \baritone \baritonelyrics >>
			\new Staff << \global \keyF \bass \basslyrics >>
		>>
	>>
	\layout {
		ragged-right = ##f
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}


%{	 ██████ ██   ██  ██████   ██  ███████ ████████ ███████
		██      ██   ██  ██   ██  ██  ██         ██    ██
		██      ███████  ██████   ██  ███████    ██    █████
		██      ██   ██  ██   ██  ██       ██    ██    ██
		 ██████ ██   ██  ██   ██  ██  ███████    ██    ███████  %}

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn \override Stem #'transparent = ##t 
				f4^"solo" g a bes a s a2 g s4 a4 g f e f s g s f s f2 \cadenzaOff
			}
		}
		\addlyrics {
			Chri -- _ _ _ _ -- ste __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

soprano = \new Voice {
	\new Voice = "soprano" {
		\relative c' {
			R1 r2 f g a bes a4 a2 g8 f g4 a c1 a2 g4 c4. bes8 a2 g4 f2 r2 r1 
			r2 f1 g2 a bes2. a4 a2 g a2. g8 f e f g2 f e4 f1 ~ f1\fermata \showBarLine \bar "||"
		}
	}
}
sopranolyrics = \new Lyrics \lyricsto "soprano" {
	Chri -- _ _ _ _ _ _ _ ste __ _ e -- _ _ le -- _ _ i -- son,
	Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- _ i -- son.
}

alto = {
	\new Voice = "alto" {
		\relative c' {
			R1 c2 d e f d4 e2 f4. e8 d c d4 e
			c f2 e4 f2 r c1 d2 e f2. e4
			e2 d2. c4 c4. bes8 a g f4 f'2 f2 r4 c d e f4. e16 d
			c4 d c1. a4. bes8 c4 d c1\fermata
		}
	}
}
altolyrics = \new Lyrics \lyricsto "alto" {
	Chri -- _ _ _ _ ste e -- _ _ _ _ _ _ le -- i -- son,
	Chri -- _ ste, Chri -- _ ste e -- _ le -- _ i -- _ son, 
	Chri -- ste e__ _ _ le -- _ _ i -- _ son, e -- _ le -- i -- son.
}

tenor = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8" 
			f2 g a bes4. a8 g c, c'2 d c8 bes c2 d2. c4
			f,8 g a bes c4 c4 f,2 c r4 f8 g a bes c2 bes4 c2 f, g
			a bes2. a4 g g4 f\breve r4 c' c c2 bes8 a g4 e g a g g4 f1 ~ f1\fermata
		}
	}
}
tenorlyrics = \new Lyrics \lyricsto "tenor" {
	Chri -- _ _ _ _ _ _ ste e -- _ _ _ _ _ 
	le -- _ _ _ _ i -- son __ _ e -- _ _ _ le -- i -- son,
	Chri -- _ ste e -- _ le -- i -- son, Chri -- ste e -- _ _ _ _ _ _ le -- i -- son.
}
	
baritone = \new Voice {
	\new Voice = "baritone" {
		\relative c {
			\clef "treble_8" 
			R1 R r2 f g a bes2. a4
			a2 g4 a2 g8 f g4 g4 a2 r2 r4 f g a2 bes4 c2 ~
			c f,1 c2 c' d c2. a4 bes c f,1
			r4 c e f g8 c, c'4. bes8 a g a2 ~ a1\fermata
		}
	}
}
baritonelyrics = \new Lyrics \lyricsto "baritone" {
	Chri -- _ _ _ _ ste __ _ e -- _ _ le -- i -- son e __ _ _ _ le -- i -- son,
	Chri -- _ ste e -- le -- i -- son e -- _ _ le -- _ _ _ i -- _ son.
}

bass = \new Voice {
	\new Voice = "bass" {
		\relative c {
			\clef "bass"
			R1 R R R R
			r2 c d e f2. e4 d2 c d c2 ~ c bes4. c8 d e f2 e4 f2 bes, f1 r2 f a4 bes
			c2. f,4 c'4 c4 f,1 ~ f1\fermata
		}
	}
}
basslyrics = \new Lyrics \lyricsto "bass" {
	Chri -- _ _ _ _ ste e -- _ le -- _ _ _ _ _ _ _ i -- son,
	Chri -- ste e -- le -- _ _ i -- son.
}

\score {
	<<
		\new ChoirStaff
		<< 
			\new Staff << \global \keyF \soprano \sopranolyrics >>
			\new Staff << \global \keyF \alto \altolyrics >>
			\new Staff << \global \keyF \tenor \tenorlyrics >>
			\new Staff << \global \keyF \baritone \baritonelyrics >>
			\new Staff << \global \keyF \bass \basslyrics >>
		>> 
	>>
	\layout {
		ragged-right = ##f
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}



%{	██   ██ ██    ██ ██████   ██  ███████     ██████
		██  ██   ██  ██  ██   ██  ██  ██               ██
		█████     ████   ██████   ██  █████        █████
		██  ██     ██    ██   ██  ██  ██          ██
		██   ██    ██    ██   ██  ██  ███████     ███████  %}

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn \override Stem #'transparent = ##t 
				f4^"solo" g a bes s a s a2 g s4 a4 g f e f s g s f s f2 \cadenzaOff
			}
		}
		\addlyrics {
			Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

soprano = \new Voice {
	\relative c'' {
		R1 R R c2. f,4 f2 c'
		bes c d2. c4 bes a g2 ~ g4 f4 a2. a4 g2 r c f, f f1 g2. g4 a1\fermata 
			\showBarLine \bar "||"
	}
	\addlyrics {
		Ky -- ri -- e e -- 
		_ _ _ _ _ _ _ _ le -- i -- son
		Ky -- ri -- e e -- le -- i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		r2 c2. f,4 f4. g8 a4 bes8 c d e f2 c4 f2 r4 f2 e4
		d2 es d4. c8 bes4 c d f2 e8 d e4 a,4. g8 a bes a4 f g4 g4
		f4 f'2 e4 d bes2 c4 d2 c4 f2 e8 d e4 e4 f1\fermata \bar "||"
	}
	\addlyrics {
		Ky -- ri -- e __ _ _ e -- _ _ _ le  --  i -- son e -- _
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son, 
		Ky -- ri -- _ e __ _ e -- _ le -- _ _ _ _ i -- son.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8" 
		R1 c2. f,4 f2 bes2. a8 g a bes c2 bes4 c2
		d4 g,2 a4 bes2. a4 g f c'2 ~ c r4 c2 c4 c,2
		f g4 a bes4. a8 f g a4 d,8 e f g a bes c d c2. c4 c1\fermata
	}
	\addlyrics {
		Ky -- ri -- e e -- _ _ _ _ _ _ _ _ _ _ _ _ 
		le  --  i -- son Ky -- ri -- e
		e -- _ _ le -- _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son.
	}
}

baritone = \new Voice {
	\relative c' {
		\clef "treble_8" 
		c2. f,4 f2 c'4. bes8 c4 d4. c8 d bes c2 c4 a2 g8 f g1 r2 r4 f g a bes c c,2 r4 c'2 f,4 f2 c'
		bes c d2. c4 bes2 a g2. g4 f1\fermata
	}
	\addlyrics {
		Ky -- ri -- e e -- _ _ _ _ _ _ le  -- i -- son __ _ _ _ 
		e -- _ _ le -- i -- son, Ky -- ri -- e e -- 
		_ _ _ _ _ _ le -- i -- son.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		R1 r2 f2. bes,4 bes2 f'1 d2 c g c bes r2
		r2 r4 c4 ~ c f,4 f2. f'2 e4 d2 c bes2. a4 bes2 f c'2. c4 f,1\fermata
	}
	\addlyrics {
		Ky -- ri -- e e -- _ _
		le  --  i -- son Ky -- ri -- e e -- _
		_ _ _ _ _ _ le -- i -- son.
	}
}

\score {
	<<
		\new ChoirStaff
		<< 
			\new Staff << \global \keyF \soprano >>
			\new Staff << \global \keyF \alto >>
			\new Staff << \global \keyF \tenor >>
			\new Staff << \global \keyF \baritone >>
			\new Staff << \global \keyF \bass >>
		>> 
	>>
	\layout {
		ragged-right = ##f
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}
