\version "2.13.16"

\header {
	title = "Missa pro defunctis"
	composer = \markup \column \right-align { "Giovanni Pierluigi da Palestrina (1525-1594)" }
	tagline = \markup \small { 
		\left-align \center-column {
			\line { Version 2. Copyright ©2010 Cappella Gabrieli - \with-url #"http://cappellagabrieli.nl" http://cappellagabrieli.nl - Licensed under the Creative Commons }
			\line { Attribution-Noncommercial-No Derivative Works 3.0 License - \with-url #"http://creativecommons.org/licenses/by-nc-nd/3.0" http://creativecommons.org/licenses/by-nc-nd/3.0 }
		}
	}
}

global = { 
	\key f \major
	\time 2/2
	\tempo 2 = 60
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 15) 
	#(set-accidental-style 'forget)
}

\paper {
	annotate-spacing = ##f
	between-system-spacing = #'((space . 15) (padding . 0))
	top-margin = 10\mm
	bottom-margin = 10\mm
	left-margin = 15\mm
	right-margin = 15\mm
	foot-separation = 10\mm
	ragged-bottom = ##t
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }

halfLength = #(define-music-function (parser location music) (ly:music?)
  (let ((new-music (ly:music-deep-copy music)))
   (shift-duration-log new-music 1 0)
   new-music))

cantus = \new Voice	{
	\halfLength
	\relative c' { 
		r1 f g a bes1. a2 a1 g a1. g4 f e f g2. f4 f1 e2 f\breve 
		r1 c d e f2 a g1 r2 a1 f2 g1 f2 c4 d e f g a g2 f1 e2 f\breve \showBarLine \bar "|." \break

		r\breve r1 f g a bes a2 a1 g4 f g2 a c\breve
		a1 g2 c2. bes4 a1 g2 f1 r r\breve r1 f\breve g1
		a bes1. a2 a1 g a1. g4 f e f g1 f e2 f\breve ~ f \showBarLine \bar "|." \break

		r\breve r r c'1. f,2 f1 c' bes c d1. c2
		bes2 a g1. f2 a\breve g1 r c f, f f\breve g  a \showBarLine \bar "|."
	}
	\addlyrics {
		Ky -- _ ri -- _ e e -- _ lei -- _ _ _ _ _ _ _ _ son, 
		Ky -- ri -- e e -- lei -- son, Ky -- ri -- e e -- lei -- \skip 8 _ _ _ _ _ _ _ son.

		Chri -- _ ste __ _ e -- lei -- _ _ _ son, Chri --
		ste e -- lei -- _ _ _ son, Chri -- ste --
		_ e -- _ lei -- _ _ _ _ _ _ _ _ _ son.

		Ky -- ri -- e e -- lei -- _ _ _
		_ _ _ _ _ son, Ky -- rie e -- lei -- _ son.
	}
}

altus = \new Voice {
	\halfLength
	\relative c' { 
		\clef "treble_8"
		c1 d e f1. e2 d c1 f e2 d c1 bes2 c1 r r r2 c1 d2 e1 f2 f, a bes c\breve r2 bes d c4 bes c1. c2 c\breve ~ c c

		r\breve c1 d e f d2 e1 f2. e4 d c d2 e c f1 e2
		f1 r c\breve d1 e f1. e2 e1 d1. c2 c2. bes4
		a g f2 f'\breve r2 c d e f2. e8 d c2 d c1 ~ c\breve a2. bes4 c2 d c\breve

		r1 c1. f,2 f2. g4 a2 bes4 c d e f1 c2 f1 r2 f1 e2 d1 es d2. c4 bes2 c
		d2 f1 e4 d e2 a,2. g4 a bes a2 f g1 f2 f'1 e2 d bes1 c2 d1 f2 f1 e4 d e1 f\breve
	}
	\addlyrics {
		Ky -- _ ri -- _ _ _ e e -- lei -- _ _ _ son, Ky -- ri -- e __ _ e -- lei -- _ son, Ky -- rie __ _ _ _ e -- lei -- son.

		Chri -- _ ste __ _ e -- lei -- _ _ _ _ _ _ _ _ _
		son, Chri -- ste __ _ _ _ e -- _ _ lei -- _
		_ _ _ son, Chri -- ste __ _ _ _ _ _ e -- lei -- _ _ _ _ son.

		Ky -- ri -- e __ _ _ e -- _ _ _ _ lei -- son, Ky -- ri -- e e -- lei -- _ _ _
		_ _ _ _ _ _ _ _ _ _ _ _ son, Ky -- ri -- e e -- _ lei -- _ _ _ _ _ son.
	}
}

tenor = \new Voice {
	\halfLength
	\relative c { 
		\clef "treble_8"
		r\breve r r r r1 f g a bes1. a2 a1 g a1. g4 f e f g2. f4 f1 e2 f\breve c1 f e2. f4 g2 a g c a\breve

		f1 g a bes2. a4 g c, c'1 d c4 bes c1 d1. c2 f,4 g a bes c1
		f,1 c r2 f4 g a bes c1 bes2 c1 f, g a bes1. a2 g1
		f\breve ~ f r2 c' c c1 bes4 a g2 e g a g1 f\breve ~ f

		r\breve c'1. f,2 f1 bes1. a4 g a bes c1 bes2 c1 d2 g,1 a2 bes1. a2
		g f c'\breve r2 c1 c2 c,1 f g2 a bes2. a4 f g a2 d,4 e f g a bes c d c\breve c
	}
	\addlyrics {
		Ky -- _ ri -- _ e e -- _ lei -- _ _ _ _ _ _ _ _ son, Ky -- ri -- e __ _ _ e -- lei -- _ son.

		Chri -- _ ste __ _ _ _ _ _ e -- _ _ _ lei -- _ _ _ _ _ _
		son, __ _ Chri -- \skip 8 _ _ _ _ ste e -- _ lei -- _ _ _
		son, Chri -- ste e -- _ _ _ _ _ _ lei -- son.

		Ky -- ri -- e e -- _ _ _ _ _ _ lei -- son, Ky -- ri -- e e -- 
		lei -- _ son, Ky -- ri -- e e -- lei -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ son.
	}
}

tenorB = \new Voice {
	\halfLength
	\relative c { 
		\clef "treble_8"
		f1 bes g f2 a g1 f\breve c'2. bes4 a1 r1 r2 c d1. bes2 c1 
		f, c' r f, g a bes1. a2 a1 g a1. g4 f e2 f g1 f\breve

		r\breve r r1 f1 g a bes1. a2 a1 g2 a1
		g4 f g1 a r1 r2 f g a1 bes2 c\breve f, c1
		c'1 d c1. a2 bes c f,\breve r2 c e f g4 c, c'2. bes4 a g a1 ~ a\breve

		c1. f,2 f1 c'2. bes4 c2 d2. c4 d bes c1 c2 a1 g4 f g\breve r1 r2 f g a
		bes2 c c,1 r2 c'1 f,2 f1 c'1 bes c d1. c2 bes1 a g\breve f
	}
	\addlyrics {
		Ky -- _ ri -- e _ _ e lei __ _ son, Ky -- rie e -- lei -- _ son, Ky -- _ ri -- _ e e -- _ lei -- _ _ _ _ _ son.

		Chri -- _ ste __ _ e -- lei -- _ _
		_ _ _ son, Chri -- ste e -- _ lei -- _ son,
		Chri -- ste e -- _ lei -- _ son, Chri -- ste e -- lei -- _ _ _ _ _ son.

		Ky -- ri -- e e -- _ _ lei -- _ _ _ _ son, __ _ _ _ _  Ky -- rie  e -- 
		lei -- _ son, Ky -- ri -- e e -- _ _ lei -- _ _ _ _ son.
	}
}

bassus = \new Voice {
	\halfLength
	\relative c { 
		\clef bass
		r\breve r r r1 c f d c2 e d1 g f
		r c f d c2. bes4 a2 f g1 f r2 f'1 e2 f f, c'1 ~ c\breve f,

		r\breve r r r r r1 c'1
		d e f1. e2 d1 c d c\breve bes2. c4 d e f1 e2
		f1 bes, f\breve r1 f a2 bes c1. f,2 c'1 f,\breve ~ f
	
		r\breve r1 f'1. bes,2 bes1 f'\breve d1 c g c bes r
		r1 r2 c1 f,2 f1. f'1 e2 d1 c bes1. a2 bes1 f c'\breve f,
	}
	\addlyrics {
		Ky -- ri -- e e -- lei -- _ _ son,
		Ky -- ri -- e e -- _ _ _ lei -- son, Ky -- ri -- e e -- lei -- son.

		Chri -- _ ste __ _ _ _ _ e -- lei -- _ _ _ _ _  _
		_ _ son, Chri -- ste __ _ _ e -- lei -- son.

		Ky -- ri -- e e -- lei -- _ _ _ son,
		Ky -- ri -- e e -- _ lei -- _ _ _ _ _ _ son.
	}
}

\score {
	<<
		\new ChoirStaff
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff << \global \cantus >> 
			\new Staff << \global \altus >> 
			\new Staff << \global \tenor >> 
			\new Staff << \global \tenorB >> 
			\new Staff << \global \bassus >> 
		>> 
	>>
	\layout {
		indent = #0
		\context { 
			\Score
			\override BarLine #'transparent = ##t
			\override BarNumber #'transparent = ##t
		} 
		\context { 
			\Voice 
			\consists "Ambitus_engraver" 
			\override NoteHead #'style = #'baroque
		} 
		\context {
			\Score
			between-system-spacing = #'((space . 10) (padding . 0))
        }
	}
	\midi {
	}
}


\markup { \pad-to-box #'(0 . 0) #'(0 . 10)
    \column {
		\wordwrap {
			Source: \italic { Erstes Buch de Messen von Pierluigi da Palestrina, } edited by Franz Xaver Haberl (1840–1910), published by Breitkopf & Härtel,
			Leipzig (1880), from \italic { Missarum – Liber Primus, } published 1554, reissued 1591 with 2 additional masses.
			\with-url #"http://imslp.org/wiki/Missarum_-_Liber_Primus_(Palestrina,_Giovanni_Pierluigi_da)" http://imslp.org/wiki/Missarum_-_Liber_Primus_(Palestrina,_Giovanni_Pierluigi_da)
		}
	}
}