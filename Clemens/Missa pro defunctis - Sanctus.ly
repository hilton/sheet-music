\version "2.14.2"

\header {
	title = "Missa pro defunctis"
	composer = "Clemens non Papa (1510 - 1556)"
	copyright = \markup \smaller {
		\column \center-align {
			\line { Copyright ©2013 Peter Hilton - Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - Licensed under the }
			\line { Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/ }
		}
	}
	tagline = ##f 
}

global= { 
	\key c \major
	\time 2/4
	\tempo 4 = 90
	\set Score.timing = ##f 
	\override Score.LyricText #'font-size = #-1
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 17) 
	#(set-accidental-style 'forget)
}

\paper {
	annotate-spacing = ##f
	ragged-last = ##t
	top-margin = 15\mm
	bottom-margin = 15\mm
	last-bottom-spacing = #'(
		(padding . 8)
	)
}

ficta = { \once \set suggestAccidentals = ##t }

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 2 \bar "|" \time 2/2
		\[ a2 c2. \] b8 a b4 a2 g4 a1 r4 a2 a4 f f \bar "" \break
		bes2 a2. a4 a2 a a r4 a a d2 c8 b c2 \bar "||" \break
		f,1 \[ g2 a \] a2. a4 a a g2 e f2. f4 a2 g a1 \fermata \bar "||" \break
		a1 bes2 g f2. f4 e1 e2 \bar "||"
	}
	\addlyrics {
		San -- _ _ _ _ _ _ ctus San -- ctus Do -- mi -- 
		nus De -- us Sa -- ba -- oth Sa -- ba -- oth __ _ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 2 \bar "|"
		r2 e1 \[ f2 e \] c4 e2 e4 e e f2 r4 f4 ~ 
		f e f2 e d4 f2 f4 e e f f2 e8 d e4 f e2 \bar "||" \break
		d1 \[ d2 f \] f2. f4 f f e2 c d2. d4 e2 e f1 \fermata \bar "||" \break
		f1 f2 e d2. d4 b1 c2 \bar "||"
	}
	\addlyrics {
		San -- ctus __ _ _  Do -- mi -- nus De -- us Do -- 
		mi -- nus De -- _ us Sa -- _ ba -- oth Sa -- _ _ _ ba -- oth __
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\time 2/4
		\override Stem #'transparent = ##t a4 a \override Stem #'transparent = ##f \bar "|"
		a1 \[ c2 d \] b a c2. c4 c c d2 ~
		d4 \ficta bes c d2 c4 d2 r4 d2 c4 d4. c8 a1. \bar "||" \break
		a1 \[ b2 c \] c2. c4 d d b2 a a2. a4 c2 b d1 \fermata \bar "||" \break
		c1 d2 c a2. f4 g a2 g4 a2 \bar "||"
	}
	\addlyrics {
		San -- ctus
		San -- _ _ ctus __ _ Do -- mi -- nus De -- us 
		Sa -- _ _ ba -- oth Sa -- ba -- oth __ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- _ _ sis
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 2 \bar "|"
		r2 a1 \[ d,2 e \] a, a'2. a4 f f \ficta bes2
		g2 f4. g8 a4 a d,4. e8 f4 d a'2 d,1 a \bar "||" \break
		d \[ g2 f \] f2. f4 d d e2 a, d2. d4 a2 e' d1 \fermata \bar "||" \break
		f1 bes,2 c d2. d4 e1 a,2 \bar "||"
	}
	\addlyrics {
		San -- ctus __ _ _ Do -- mi -- nus De -- us 
		Do -- mi -- _ _ nus De -- _ _ us  Sa -- ba -- oth
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\override Score.MetronomeMark #'transparent = ##t
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\header {
		piece = "Sanctus"
	}
	\layout {
		indent = #0
		\context {
			\Score
			\override StaffGrouper #'staff-staff-spacing #'basic-distance = #11.5
		}
	}
%	\midi { }
}


soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 \bar "|" \time 2/2
		a2 a4 a a1 a2. g4 f1 \fermata g g2. g4 \bar "" \break
		f2 f e1 e\breve \bar "||"
	}
	\addlyrics {
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 \bar "|"
		d2 f4 f e1 f2. d4 d1\fermata e2. d8 c d2 e
		c d b1 c\breve \bar "||"
	}
	\addlyrics {
		In no -- mi -- ne Do -- mi -- ni, O -- _ _ san -- na
		in ex -- cel -- sis. __
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\time 7/4
		\override Stem #'transparent = ##t f4 g a a a a a  \override Stem #'transparent = ##f \bar "|"
		a2 d4 d d c8 b c2 c2. b4 a1 \fermata c2. b8 a b2 c2 ~
		c4 a bes a a g8 f g2 a\breve \bar "||"
	}
	\addlyrics {
		Be -- ne -- di -- ctus qui ve -- nit
		In no -- mi -- ne __ _ _ _ Do -- mi -- ni, O -- _ _ san -- na
		in __ _ ex -- cel -- _ _ _ sis. __
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 \bar "|"
		d2 d4 d a'1 f2. g4 d1 \fermata c2 g'1 c,2
		f d e1 a,\breve \bar "||"
	}
	\addlyrics {
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\override Score.MetronomeMark #'transparent = ##t
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\header {
		piece = "Benedictus"
	}
	\layout {
		indent = #0
		\context {
			\Score
			\override StaffGrouper #'staff-staff-spacing #'basic-distance = #11.5
		}
	}
	\midi { }
}