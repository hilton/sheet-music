% Copyright ©2013 Peter Hilton

\version "2.16.2"
revision = "1"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	indent = 0
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 5) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"4. Ave sanctissima"
	}
	subtitle = \markup \medium \sans {
		"Sacræ cantiones per sei voci - liber secundus (1603)"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Carlo_Gesualdo" "Carlo Gesualdo" (1560 – 1613) }
			\line { Sextus & bassus, \with-url #"http://en.wikipedia.org/wiki/Joop_Voorn" "Joop Voorn" (b. 1932) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
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
	}
	\context { 
		\StaffGroup
		\remove "Span_bar_engraver"	
	}
	\context { 
		\Voice 
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
	}
}


global= { 
	\key f \major
	\tempo 2 = 45
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


cantus = \new Voice {
	\transpose c c \relative c'' {
		d1 d2 r4 g,2 g g4 es'4. \ficta es8 c2. c4 cis2 d r1 r2 g,2. bes4
		a4. bes8 c bes a g f1 c'2 r r4 c2 bes4 a c2 bes8 a g2. fis4 g2 r
		R1 c4 a g c4. bes8 a g f2 f R1 d'2 d es4 \ficta es d2. c4
	}
	\addlyrics {
		A -- ve,  A -- ve san -- ctis -- si -- ma Ma -- ri -- a, Ma -- ter
		De -- _ _ _ _ _ _ i, Re -- gi -- na cœ -- _ _ _ _ li,
		Re -- gi -- na cœ -- _ _ _ _ li por -- ta Pa -- ra -- di -- si
	}
}

sextus = \new Voice {
	\transpose c c \relative c'' {
		bes1 a2 r4 d2 g, d'4 c4. c8 g2. g4 a2 a r2 r1 r
		R1 d2 g,4 a2 ~ a8 f d4 e8 f g a bes4 f'2. r2 r4 d a g8 a bes es d4. bes8 a4 f'
		d2 r1 r4 e2 e4 a, a bes8 c d bes g'2. d4 r1 r r2
	}
	\addlyrics {
		A -- ve,  A -- ve san -- ctis -- si -- ma Ma -- ri -- a, 
		Ma -- ter De -- _ _ _ _ _ _ _ i, Re -- _ gi -- _ na __ _ cœ -- _ _ _ 
		li por -- ta Pa -- ra -- di -- _ _ _ _ si
	}
}

altus = {
	\new Voice = "altus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			f1 f2 r4 b,2 \ficta b2 d4 g4. g8 es2. e!4 e2 fis r1 r2 r4 g, bes g4 ~ \break
			g fis4 g2 d'2. f2 e4. f8 g2 f8 e f2 f es4 d2 c4 d1 f2 \break
			R1 f4 f g g e2. d8 c d4. c8 d e f2 f4 r2 d4 d8 d g4 c, f f8 f g4 es \break
		}
	}
	\addlyrics {
		A -- ve,  A -- ve san -- ctis -- si -- ma Ma -- ri -- a, Ma -- ter De -- 
		_ i, Ma -- ter De -- _ _ _ _ _ i Re -- gi -- na cœ -- li
		por -- ta Pa -- ra -- di -- _ _ _ _ _ _ _ si Do -- mi -- na mun -- di, Do -- mi -- na mun -- di,
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			bes1 bes2 r4 d,2 g g c c4 c a a2 d4 d2 es4 d4. \ficta e!8 f e c d es4. d16 c d2
			d4 d2 c bes4 d c8 bes a2 g R1 a4 f g bes2 a8 g a2 g c4 a ~
			a c d g, c2 c1 cis4 d a2 a4 d2 d4 d d2 bes a4 bes2 r
		}
	}
	\addlyrics {
		A -- ve,  A -- ve san -- ctis -- si -- ma Ma -- ri -- a, Ma -- ter De -- _ _ _ _ _ _ _ _ _
		i, Re -- gi -- na cœ -- _ _ _ li, Re -- gi -- na cœ -- _ _ _ li, Re -- gi -- 
		na cœ -- li, por -- ta Pa -- ra -- di -- si, por -- ta Pa -- ra -- di -- _ si
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c c \relative c {
			\clef "treble_8"
			f1 f2 r4 d'2 d4 d2 g,2. g4 g e e2 d g2. bes4 a4. bes8 c4 bes8 a g2
			a r1 r c d2 c2. g4 R1 r4 g f2
			e4 f2 e4 r2 g g4 a2 a4 f f d4. e8 f g a f bes2 g4 c,4 c8 c d4 d g g8 g
		}
	}
	\addlyrics {
		A -- ve,  A -- ve san -- ctis -- si -- ma Ma -- ri -- a, Ma -- ter De -- _ _ _ _ _
		i, Ma -- ter De -- i, Re -- gi -- 
		na cœ -- li, por -- ta, por -- ta Pa -- ra -- di -- _ _ _ _ _ _ si Do -- mi -- na mun -- di, Do -- mi -- na
	}
}

bassus = {
	\new Voice = "bassus" {
		\transpose c c \relative c {
			\clef "bass"
			bes1 bes2 r4 g2 g'4 f2 es2 c'4 bes a e a2 d, r2 r1 r
			R1 R R R g, es'2 d es1
			d4 d2 d4 d2 a' R1 d,2 d4 bes2 bes4 as4. bes8 g2. f4 bes2 bes4 bes
		}
	}
	\addlyrics {
		A -- ve,  A -- ve san -- ctis -- _ si -- ma Ma -- ri -- a,
		Ma -- ter De -- i
		Re -- gi -- na cœ -- li, por -- ta Pa -- ra -- di -- _ _ si Do -- mi -- na
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff \with { instrumentName = #"C " shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"S "  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"A " shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"Q " shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"T " shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"B " shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
%	\midi { }
}
