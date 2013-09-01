% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "1"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 0) )
	system-system-spacing = #'( (basic-distance . 12) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"15. Domine Deus"
	}
	subtitle = \markup \medium \sans {
		"Sacræ cantiones per sei voci - liber secundus (1603)"
	}
	composer = \markup \sans {
%		\vspace #1
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Carlo_Gesualdo" "Carlo Gesualdo" (1560 – 1613) }
			\line { Sextus & bassus, \with-url #"http://en.wikipedia.org/wiki/Joop_Voorn" "Joop Voorn" (b. 1932) }
		}
	}
	copyright = \markup \sans {
		\vspace #1
		\column \center-align {
			\line { "Sextus & bassus copyright ©2005 Joop Voorn" }
			\line {
				This edition copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
		}
	}
	tagline = ##f
}

\layout {
  	ragged-right = ##f
  	ragged-last = ##f
	\context {
		\Score
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
		\override TupletNumber #'stencil = ##f 
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
	}
}


global= { 
	\key c \major
	\tempo 2 = 48
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantus = \new Voice {
	\relative c'' {
		R1 R r2 c4 b8 a g4 c, f e2 d4 e2 ~ \break
		e r4 g2 e fis4 g e e2 R1 r4 c'2 a8 g \break
		f4 g2 d'4. c8 d e a,1 d, r2 c'2 b2 ~ \break
	}
	\addlyrics {
		Do -- mi -- ne De -- us me -- _ _ us,
		ne de -- re -- lin -- quas me, Do -- mi -- ne 
		De -- us me -- _ _ _ _ us, ne de -- 
		
		re -- lin -- quas me,

	}
}

sextus = \new Voice {
	\relative c'' {
		R1 R R R r4 g2 e4 ~
		e fis g e e2 r R1 r4 d' a b c4. c8 c2 ~
		c4 b g2 r4 g4 f8 e d4 f2 fis fis d'4 b2 a4 d2 ~
	}
	\addlyrics {
		Ne de -- 
		re -- lin -- quas me, et ne di -- sces -- se -- ris 
		a me, Do -- mi -- ne De -- us me -- us, ne de -- re -- lin -- 
		
		quas me,
	}
}

altus = {
	\new Voice = "altus" {
		\relative c' {
			\clef "treble_8"
			f2 e2. fis4 g e e1. r1 c4 b8 a
			g4 a e'4. d8 e f g4 g2 r4 g c, cis d4. d8 e2. g4 f2
			R1 r2 d4 c8 b a2 fis1 b2 e4 e d fis
		}
	}
	\addlyrics {
		Ne de -- re -- lin -- quas me, Do -- mi -- ne 
		De -- us me -- _ _ _ _ us, et ne di -- sces -- se -- ris a me,
		Do -- mi -- ne De -- us me -- us, ne de -- re -- 
		
		lin -- quas me,
	}
}

quintus = {
	\new Voice = "quintus" {
		\relative c' {
			\clef "treble_8"
			R1 r2 r4 c2 a b4 c a a1 r2
			r r4 b g2. a4 b2 a a c4 b8 a g4 c, c'4. b8
			c d e2 d4 d g, a2. d4 r2 r4 d g, gis a4. a8 b2
		}
	}
	\addlyrics {
		Ne de -- re -- lin -- quas me,
		ne de -- re -- lin -- quas me, Do -- mi -- ne De -- us me -- _
		_ _ _ us, De -- us me -- us, et ne di -- sces -- se -- ris
		
		a me,
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c' {
			\clef "treble_8"
			R1 R R r2 r4 c2 b8 a g4 c,
			c'2 b1. R1 R c2 a ~
			a4 b c b b2 r d4 c8 b a4 b b8 a b cis d4 d, R1
		}
	}
	\addlyrics {
		Do -- mi -- ne De -- us 
		me -- us, ne de -- 
		re -- lin -- quas me, Do -- mi -- ne De -- us me -- _ _ _ _ us,
	}
}

bassus = {
	\new Voice = "bassus" {
		\relative c' {
			\clef "bass"
			R1 c4 b8 a g4 c, c'4. b8 a4 g8 f e d c4 c2 a4 b c2
			c e1. e2 a,4. a8 d4. d8 c1 f8 g a4 ~
			a g2 g f8 e d4 d d2 d d4 b b2 a r
		}
	}
	\addlyrics {
		Do -- mi -- ne De -- us me -- _ _ _ _ _ _ us, ne de -- re -- lin -- 
		quas me, et ne di -- sces -- se -- ris a __ _ _
		me, Do -- mi -- ne De -- us me -- us, De -- us me -- us,
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff \with { instrumentName = #"CANTUS"  shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"SEXTUS"  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"ALTUS"   shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"QUINTUS" shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"TENOR"   shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"BASSUS"  shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
	\layout { }
%	\midi { }
}
