\version "2.18.2"
#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 8\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##t
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	tagline = ##f
}

\paper {
	annotate-spacing = ##f
	top-margin = #7
	bottom-margin = #10
	top-markup-spacing =  #'(
		(padding . 3)
	)
	top-system-spacing =  #'(
		(basic-distance . 8)
	)
	markup-markup-spacing =  #'(
		(padding . 4)
	)
	markup-system-spacing =  #'(
		(padding . 2)
	)
	system-system-spacing #'padding = #3
	last-bottom-spacing =  #'(
		(minimum-distance . 12)
	)

	ragged-last-bottom=##t
} 

\layout {
	indent = #0
	ragged-right = ##f
	\context {
		\Score
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context {
		\StaffGroup
		\remove "Span_bar_engraver"
	}
	\context {
		\Voice
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\consists "Ambitus_engraver"
		\remove "Forbid_line_break_engraver"
	}
}

\include "Missa Pro Defunctis - symbols.ly"




soprano = \new Voice {
	\relative c' {
		R1 R R R R R f g2 a a a 
		a a a1 r r r g2 bes2. a4 a2 g2. g4 \break
		f1 
		g2. g4 a c c c a2 f4 bes4. g8 a4 g \afterGrace c2 \parenthesize c4 c4 a2 g e4. f8 g2 c ~ c2 r4 a 
		a f e f g2. d4 e4. f8 g2 r4 c c c \afterGrace a2 \parenthesize a4 f4. g8 a2 e fis1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Be -- ne -- _ di -- ctus qui ve -- nit in no -- mi -- ne Do -- mi -- ni, Do -- mi -- ni.
		Ho -- san -- na in ex -- cel -- _ _ sis,
		\lyricLeft "Ho - san" -- na in ex -- cel -- _ _ sis,
		Ho -- san -- na in ex -- cel -- _ _ _ sis,
		Ho -- san -- na \lyricLeft "in   ex" -- cel -- _ _ _ sis.
	}
}

alto = \new Voice {
	\relative c' {
		R1 R R R R r2 c1 d2 e e e e 
		f1 e1. d1 f2. e4 e1 d2. d4 c f4. e8 e4 d2 ~
		d4 d4 c f4. 
		e8 d4 e e f2 r4 f f f d2 e4 f2 e4 r f f f d2 g e e4 c c c a f 
		f'4. e16 d c2 d4 e d g g g e1 f4. e16 d c4 f4. e8 d2 cis8 b cis2 d1\fermata
	}
	\addlyrics {
		Be -- ne -- _ di -- ctus qui ve -- nit in no -- mi -- ne Do -- mi -- ni,
		no -- mi -- ne Do -- mi -- ni, no -- mi -- ne Do -- mi -- ni.
		Ho -- san -- na in ex -- cel -- sis,
		Ho -- san -- na in ex -- cel -- sis,
		Ho -- san -- na in ex -- cel -- _ _ _ _ sis, __ _
		Ho -- san -- na in ex -- _ _ _ cel -- _ _ _ _ _ sis.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
			R1 R R R f g2 a a a c1 c2. a4 
			a4. g8 f4. g8  a2 r g1 bes2. a4 a1 g2. g4 f2 r4 a c c d d,4 ~
			d8 e8 f g a bes c2 
			c4 c r8 c c4 c a2 f bes4. a8 g4 f c'2 a4. bes8 c d c2 b!4 c2 r4 c c c  a4 f2 d4. 
			e8 f g a b c a b4 c2 b4 c2 r4 c c c a f2 d4. \autoBeamOff e8 \autoBeamOn f e16 d e1 d1\fermata
	}
	\addlyrics {
		Be -- ne -- _ di -- ctus qui ve -- _ _ nit __ _ _ _ in no -- mi -- ne Do -- mi -- ni,
		in no -- mi -- ne Do -- _ _ _ _ _ _ mi -- ni.
		Ho -- san -- na in ex -- cel -- _ sis, __ _ in ex -- _ _ _ cel -- _ sis,
		Ho -- san -- na in ex -- cel -- _ _ _ _ _ _ _ _ _ _ sis,
		Ho -- san -- na in ex -- cel -- _ _ _ _ _ sis.
	}
}

baritone = \new Voice {
		\relative c {
			\clef "treble_8" R1 R f1 g2 a a d,4 f4. e16 d e4 f4. g8 a bes c4 f,2 r4 e2 e4 a4. b!8 c2 
			c4 c d2  c4 a c2. c4 bes4. a8 g2 f8 g a b! c4 c c1 r2 r1 r4 g bes2 ~
			bes4 a4 a2 
			g2. g4 f1 r r f g1. a2  a2 a 
			a1 g g a ~ a\breve a1\fermata
	}
	\addlyrics {
		Be -- ne -- _ di -- ctus qui __ _ _ _ ve -- _ _ _ _ nit,
		Be -- ne -- di -- _ _ ctus qui ve -- nit in no -- mi -- ne __ _ _ Do -- _ _ _ _ mi -- ni,
		in no -- mi -- ne Do -- mi -- ni.
		Ho -- san -- na in ex -- cel -- _ sis. __ _
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		f1 g2 a a d,4 f4. e16 d e4 f4. e8 d4. c8 bes4. a8 g2 f f'4. e8 d4 d c2 a1 a'2 
		f4. e8 d2  a2 a c g g d' a a4. b8 c2 g d' f4 f c2 g d'4. e8 f2 
		c c f,1 r r r r2 c' c4 c a2  f2 f'4. e8 
		d2 a r1 c2 c4 c a2 f f'4. e8 d4. c16 bes a1 d1\fermata
	}
	\addlyrics {
		Be -- ne -- _ di -- ctus qui __ _ _ _ ve -- _ _ _ _ _ _ nit,
		Be -- _ _ ne -- di -- ctus qui ve -- _ _ nit in no -- mi -- ne Do -- mi -- ni, __ _ _ _
		in no -- mi -- ne __ _ Do -- _ _ mi -- ni. __ _
		Ho -- san -- na in ex -- cel -- _ _ sis,
		Ho -- san -- na in ex -- cel -- _ _ _ _ _ sis.
	}
}

\score {
	<<
		\new ChoirStaff
		<< 
			\new Staff << \global \keyA \soprano >> 
			\new Staff << \global \keyA \alto >> 
			\new Staff << \global \keyA \tenor >>
			\new Staff << \global \keyA \baritone >>
			\new Staff << \global \keyA \bass >>
		>>
	>>
	\header {
		piece = \markup { \larger \bold "Benedictus" }
	}
	\layout {
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
%	\midi {}
}
