% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "1"

#(set-global-staff-size 14)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 14 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"8. Veni creator spiritus"
	}
	subtitle = \markup \medium \sans {
		"Sacræ cantiones per sei voci - liber secundus (1603)"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Carlo_Gesualdo" "Carlo Gesualdo" (1560 – 1613) }
			\line { Sextus & bassus, \with-url #"https://twitter.com/HenriBroeren" "Henri Broeren" (b. 1932) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
		\column \center-align {
			\line { "Sextus & bassus copyright ©2004-2005 Henri Broeren" }
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
	}
	\context { 
		\StaffGroup
		\remove "Span_bar_engraver"	
	}
	\context {
		\Staff
	}
	\context { 
		\Voice 
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\consists "Ambitus_engraver"
	}
}


global= { 
	\key f \major
	\tempo 2 = 44
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantus = \new Voice {
	\relative c'' {
		d1 b b4 e8 d c b a g a1 b2 r \break d1 b1.
		r2 b4 e8 d c b a g a2. g2 fis4 g2 \break R1 r2 d'4. e8
		f4 d g1 r g2 c, r \break r2 r4 g g a2 g c a4
		
		a2 b2. e4 b a g4. g8 g2 \break R1 c2 g r b4 b e a,2 g2
		fis4 a4. a8 d2 r \break R1 R a4 e'2 f4 d2 c4. d8 e f g2 fis4 \break 
		g2 r r4 d g2 g4 g e1 b2 R1 \break R r2 d 
		
		g,2 g g' g4 g e e a,2 \break a r r4 c2 c8. b16 a b c d e4 e2
		r4 b e e e c4. d8 e \break fis g4. \ficta f!8 e2. d4 r1 r4 f
		c2 c R1 \break d4 d4. c8 c8. d16 e d c b a2 a4
		
		r2 f'4 f8. g16 a g f e d4. c8 b8. cis16 d2 d \showBarLine \bar "|."
	}
	\addlyrics {
	}
}

sextus = \new Voice {
	\relative c'' {
		R1 r2 r4 a1. f2. g4 e'8 d c b a g a4 b2. r4 g1
		e r4 r1 fis4 c'8 b a g fis e e'4. d8 c2 d1 r1
		a4. c8 a4 b c8 b a g a g a b c4 d e c r2 e2 b R1 r4 g g g2
		
		a2 a4 b2 g'2. e4 b c4 ~ c8 e8 b2 r d1 e, r4 a4 a
		d a2 d4 d e fis g g2 e4 b R1 r4 e, b'2 b4 c c2 e4 e c2 ~
		c b2. fis2 g d' d4 c2 b4. a8 g4 a8 b a2 a4 r r1 g2
		
		e e' c a r4 d2 b c a'2. f2 r4 a,4 a8. g16 a b c d
		e4 b8 a g a16 b c d e fis g2 g4 c,8 d e fis g4 a fis d1 e2 a,4  d8 c
		b a d4 e, a a8 g a8. b16 c2 b4 c d a a' e2 f
		
		e8. d16 c b a g f g a8 c d4 e8 fis4 g d1
	}
	\addlyrics {
	}
}

altus = \new Voice {
	\relative c' {
		\clef "treble_8"
	}
	\addlyrics {
	}
}

quintus = \new Voice {
	\relative c' {
		\clef "treble_8"
	}
	\addlyrics {
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
	}
	\addlyrics {
	}
}

bassus = \new Voice {
	\relative c {
		\clef "bass"	
	}
	\addlyrics {
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
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
