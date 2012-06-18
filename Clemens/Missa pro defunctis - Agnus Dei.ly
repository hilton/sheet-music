\version "2.14.2"

\header {
	title = "Missa pro defunctis"
	piece = "Agnus Dei"
	composer = "Clemens non Papa"
	copyright = \markup \tiny {
		\column \center-align {
			\line { Copyright ©2012 Peter Hilton - Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - Licensed under the }
			\line { Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/ }
		}
	}
	tagline = ##f 
}

global= { 
	\key c \major
	\tempo 4 = 110
	\set Score.timing = ##f 
	\override Score.LyricText #'font-size = #-1
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 17) 
	#(set-accidental-style 'forget)
}

\paper {
	annotate-spacing = ##f
	ragged-last-bottom = ##f
	top-margin = 15\mm
	bottom-margin = 15\mm
	last-bottom-spacing = #'(
		(padding . 8)
	)
} 

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 1 \bar "|" \time 2/2
		g2 g4 g a1 g4 f g2 g1\fermata g a2 a2. a4 g2. g4 g2 \bar "||" \break
		\skip 1 \bar "|" \time 2/2
		a2 a4 a g1 g4 e f2 g1\fermata g a2 a2. a4 a1 g a2 \bar "||" \break
		\skip 1 \bar "|" \time 2/2
		a2 a4 a a1 g4 f a2 a1\fermata g a b g2 g2. g4 a2 a2. a4 g1 g \bar "||"
	}
	\addlyrics {
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 1 \bar "|"
		e2 e4 e f1 d4 d e2 e1\fermata d f2 f2. f4 d2. e4 e2 \bar "||"
		\skip 1 \bar "|"
		f2 f4 f e1 e4 c d2 e1\fermata e e2 f2. e8 d \[ e2 f \] d2. d4 f2 \bar "||"
		\skip 1 \bar "|"
		e2 e4 e f1 d4 d f2 e1\fermata e e g e2 e2. e4 f2 f2. f4 d1 e
	}
	\addlyrics {
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e __ _ _ is __ _ re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\override Stem #'transparent = ##t a4 a a a\fermata \override Stem #'transparent = ##f \bar "|"
		c2 c4 c c1 b4 a c2 c1\fermata b c2 d2. c4 c b8 a b4 c4 c2 \bar "||"
		\override Stem #'transparent = ##t a4 a a a\fermata \override Stem #'transparent = ##f \bar "|"
		c2 c4 c c1 b4 a a2 c1\fermata b c2 d2. c4 c2. b8 a b4 c2 b4 c2 \bar "||"
		\override Stem #'transparent = ##t a4 a a a\fermata \override Stem #'transparent = ##f \bar "|"
		c2 c4 c c1 b4 a d2 c1\fermata b c d c2 c2. c4 c2 c2. c4 c b8 a b2 b1 
	}
	\addlyrics {
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is  re __ _ _ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter __ _ _ _ nam.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 1 \bar "|"
		c2 c4 c f1 g4 d c2 c1\fermata g' f2 d2. f4 g2. c,4 c2 \bar "||"
		\skip 1 \bar "|"
		f2 f4 f c1 e4 a, d2 c1\fermata e a,2 d2. a4 \[ a'2 f g2. \] g4 f2 \bar "||"
		\skip 1 \bar "|"
		a2 a4 a f1 g4 d d2 a1\fermata e' a g c,2 c2. c4 f2 f2. f4 g1 e
	}
	\addlyrics {
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 2)
		\override Score.MetronomeMark #'transparent = ##t
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\layout {
		indent = #0
	    \context {
			\Staff
			\override VerticalAxisGroup #'staff-staff-spacing =
				#'((basic-distance . 0)(minimum-distance . 0)(padding . 4))
	    }
	}
%	\midi { }
}
