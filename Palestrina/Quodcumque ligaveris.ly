% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "3"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 20\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	poet = \markup \medium \sans {
		"Secunda pars (Tu es Petrus)"
	}
	composer = \markup \sans \column \right-align { "Giovanni Pierluigi da Palestrina (1525-1594)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
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
	\key c\major
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
		R1 R r2 g1 c2 b b c4. a8 a4 b | \break 
		
		d4 e4. d8 c b a4 g a2 b1 R R R | \break 
		R R r4 g g a2 b c e g4 fis2 g | \break 
		R1 r2 r4 c,2 b4 d2 d4 d2 d4 e2 d4 b2 b4 c2 |
		
		b4 d2 d4 \break e2 d c4. c8 b4 a2 g4 f2 e4 c'2 e4 c2 c |
		a4. a8 a2 R1 \break r4 a b c d2 c R1 r4 e d e |
		f2 e4 g8 f e d c b a4 d2 \ficta cis4 d2 \break r4 c b c d2 g,4 c2 e4 f8 e d c |
		
		b4 g r d' b e4. d8 c2 b8 a b2 \break c1 R r2 r4 g |
		b2. b4 c2 b4 d2 d4 e2 d4 b c8 b c d \break e f g4. \ficta fis16 e \ficta fis4 g1 |
		R R r2 r4 g, d'2 b4. c8 \break d4 e2 d8 c b2 r4 a |
		
		d d b \ficta cis d1 R r4 d e2. e4 f2 \break e4 c2 c4 | 
		c2 c R1 r2 r4 e2 e4 f2 d4 e f e4. d8 b c d2 | \break
		r4 b2 b4 c2 b4 g a8 b c d e f g e \ficta fis4 g2 \ficta fis4 g2 r4 d g8 f e d e2 d1 \showBarLine \bar "|." |
	}
	\addlyrics {
		Quod -- cúm -- que li -- gá -- ve -- ris su --
		
		per ter -- _ _ _ _ _ _ ram,
		e -- rit li -- gá -- tum et in cœ -- lis,
		et in cœ -- lis: et quod -- cúm -- que, et quod -- cúm -- 
		
		que, et quod -- cúm -- que sól -- ve -- ris su -- per ter -- ram, et quod -- cúm -- que
		sól -- ve -- ris e -- rit so -- lú -- tum, e -- rit so -- 
		lú -- tum et __ _ _ _ _ _ _ in cœ -- lis, e -- rit so -- lú -- tum et in cœ -- _ _ _
		
		 _ lis, et in cœ -- _ _ _ _ _ lis, et
		ti -- bi da -- bo cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ _ _ rum,
		et ti -- bi __ _ _ da -- _ _ bo, et
		
		ti -- bi da -- _ bo, et ti -- bi da -- bo cla -- ves 
		re -- gni, cla -- ves re -- gni cœ -- ló -- rum, __ _ _ _ _
		cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ _ _ _ rum, cœ -- ló -- _ _ _ _ rum.
	}
}

quintus = \new Voice {
	\relative c'' {
		R1 R d e d4 d2 e4. c8 c4 d2 |
		
		b4 c4. b8 a g f4 g4. f16 e f4 g1 R R R |
		R R r4 b c c2 d e c b4 d2 b4 g |
		g a2 b c e g4 fis2 g r1 r4 d2 d4 e2 |
		
		d2 r R1 R R r4 e2 e4 f2 e |
		d4. d8 c4 a2 g4 f2 e r1 r4 a b c d2 c r |
		R1 R R r4 e d e f2 e4 g8 f e d c b a4 d2
		
		 \ficta cis4 d2 r4 b c2 d1 e4 c e2. e4 f2 e1 |
		R1 r2 r4 b2 b4 c2 b4 g a8 g a b c b b a16 g a2 g\breve |
		R1 R r4 g d'2 b c d1 |
		
		R1 r4 a b2. b4 c2 b r4 g c c a b c e2 e4 |
		f2 e d4 c4. d8 e f g2 e4 c2 c4 c2 b4 g a8 b c d e f g2 \ficta fis4 |
		g4 d2 d4 e2 d4 e f2 e d1 r4 g, g'4. f8 e d c b c2 b1 |
		
	}
	\addlyrics {
		Quod -- cúm -- que li -- gá -- ve -- ris su --

		per ter -- _ _ _ _ _ _ _ _ ram,
		e -- rit li -- gá -- tum et in cœ -- lis: e -- 
		rit li -- gá -- tum et in cœ -- lis, et quod -- cúm -- 
		
		que, et quod -- cúm -- que 
		sól -- ve -- ris su -- per ter -- ram, e -- rit so -- lú -- tum,
		e -- rit so -- lú -- tum et __ _ _ _ _ _ _ in
		
		cœ -- lis, et in cœ -- lis, et ti -- bi da -- bo 
		cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ _ _ rum,
		et ti -- bi da -- bo, 
		
		et ti -- bi da -- bo, et ti -- bi da -- _ bo cla -- ves 
		re -- gni cœ -- ló _ _ _ _ -- rum, cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ 
		rum, cla -- ves re -- gni cœ -- ló -- _ rum, cœ -- ló -- _ _ _ _ _ _ rum.
	}
}

altus = \new Voice {
	\relative c'' {
		R1 R g c, g'2 g a4. f8 f4 g |
		
		g8 f e d c2 d4 e d2 g, b c8 d e f g2 g r4 g e4. a8 a4 g |
		g4. f8 e2 d4 c d2 b r R1 R r2 r4 d |
		e e2 g g4. f8 e d e4 d4. d8 a'4 b b2 b4 c2 b R1 |
		
		r4 b2 b4 c2 b a4. a8 g4 f2 e4 d2 g,4 g'2 g4 a2 g4 a2
		 d,4 e2 f4 e d2 c4 c d f f g a e g a d,2 e r4 c' |
		a b c g c8 b a g f4 a2 g \ficta fis4 g e g g \ficta f!8 e d4 e1 r4 f |
		
		g2 a g4 g2 g4 g1 g2 r4 g c c a b c b8 a g2 |
		r4 g g g e \ficta fis g g2 g4 c,2 g'4 g f4. e16 d c8 d e4 d2 g r |
		r4 c, d e f2 e4 c d2 b r4 d2 g4 ~ g g4 a2 g4 g a2.
		
		 f4 g2 a r4 d, g g e \ficta fis g2 r R1 r4 g2 g4 |
		a2 g4 e a2. g4. f8 d4 e g2 g4 a2 g4 b c4. b8 a4 g a2 |
		g4 g2 g4 g2 g r4 a c4. b8 a4 g a2 g\breve ~ g1 |
	}
	\addlyrics {
		Quod -- cúm -- que li -- gá -- ve -- ris su --

		per __ _ _ _ _  ter -- _ _ ram, quod -- cúm -- _ _ _ _ que li -- gá -- ve -- ris su --
		per __ _ _ ter -- _ _ ram, e -- 
		rit li -- gá -- tum __ _ _ _ _ et in cœ -- lis: et quod -- cúm -- que,
		
		et quod -- cúm -- que sól -- ve -- ris su -- per ter -- ram, et quod -- cúm -- que sól -- 
		ve -- ris su -- per ter -- ram, e -- rit so -- lú -- _ tum, e -- rit so -- lú -- tum, e -- 
		rit so -- lú -- tum et __ _ _ _ _ in cœ -- _ lis, e -- rit so -- lú -- _ _ tum et 
		
		in cœ -- lis, et in cœ -- lis, et ti -- bi da -- _ bo, __ _ _ _
		et ti -- bi da -- _ bo cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ rum,
		re -- gni cœ -- ló -- _ _ _ rum, et ti -- bi da -- bo, et ti -- 
		
		bi da -- bo, et ti -- bi da -- _ bo cla -- ves 
		re -- gni cœ -- ló -- _ _ _ rum, cla -- ves re -- gni cœ -- ló -- _ _ _ _ 
		rum, cla -- ves re -- gni cœ -- ló -- _ _ _ _ rum.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		d1 e d R R R
		
		R R r2 d2 e1 d4 d2 e4. c8 c4 d2 |
		b4 c4. b8 a g \ficta fis4 g a2 g4 d' e e2 g g g g4 a2 g |
		r4 c,2 d e g g4 a2 g1. r4 g2 g4 g2 |
		
		g1 ~ g e4. e8 e4 c2 c4 a b c c2 c4 a2 c |
		f4. f8 e4 c2 c4 a2 a4 e' g a d,2 e4 c d f f g a e g g |
		f2 g8 f e d e2 r4 f g2 a g r4 g, a b c8 d e f g4 g f a4. 

		 g8 g2 \ficta fis4 g e2 e4 d1 c2 r4 e g a f2 g e |
		d4. c8 b4 g c a b2 R1 R R r4 d2 d4 |
		e2 d4 b c8 b c d e f g2 \ficta fis4 g1 r2 R1 r4 d f d8 e |
		 
		f g a2 g \ficta fis4 g2 R1 r4 g g2. a4 f2 g4 e2 e4 |
		c2 e4 g f2. e4 d2 c R1 R R |
		r4 d2 g, c4 d b c2 c2. b4 a d4. b8 e4 d2 e c d1 |
	}
	\addlyrics {
		Quod -- cúm -- que,

		quod -- cúm -- que li -- gá -- ve -- ris su -- 
		per ter -- _ _ _ _ _ _ ram, e -- rit li -- gá -- tum et in cœ -- lis,
		li -- gá -- tum et in cœ -- lis: et quod -- cúm -- 
		
		que sól -- ve -- ris su -- per ter -- _ ram, et quod -- cúm -- que 
		sól -- ve -- ris su -- per ter -- ram, e -- rit so -- lú -- tum, e -- rit so -- lú -- _ tum, e -- rit so -- 
		lú -- tum __ _ _ _ _ et in cœ -- lis, e -- rit so -- lú -- _ _ _ _ tum et in __ _
		
		cœ -- _ lis, et in cœ -- lis, et ti -- bi da -- bo, et 
		ti -- _ _ bi da -- _ bo cla -- ves 
		re -- gni cœ -- ló -- _ _ _ _ _ _ _ rum, et ti -- bi __ _
		
		 _ _ _ da -- _ bo, et ti -- bi da -- bo cla -- ves 
		re -- gni cœ -- ló -- _ _ rum,
		cla -- ves re -- gni cœ -- ló -- rum, __ _ _ cœ -- _ _ _ ló -- _ rum.
	}
}

sextus = \new Voice {
	\relative c' {
		\clef "bass"
		r2 g1 c2 b1 R R R
		
		R R r2 g1 c2 b b c4. a8 a4 b  |
		d e4. d8 c b a4 g2 \ficta fis4 g g c a2 g c, c' e4 d2 g, |
		R1 R R r4 g2 g4 c2 g R1 |
		
		r4 g2 g4 c2 g | a4. a8 e4 f2 c4 d2 | c r R1 |
		R R r4 a' g f \ficta bes2 a R1 r4 a b c |
		d2 c c d e d g, r R1 c2 d |
		
		e d g,1. r2 | r4 g4 c2. c4 d2 c1 |
		r4 b d d c2 d8 c b a g2 r R1 R r4 b2 b4 |
		c2 b4 g a8 g a b c b a g | a2 g R1 R r4 g d'2.
		
		 d4 e2 d r4 b d e c2 d4 g, c2. c4 d2 c4 c2 c4 |
		 a2 c4 c f,8 g a b c2 g r4 c2 c4 f,2 g4 g f8 g a b c d e4 d2 |
		 g,4 b2 d4 c g2 b4 a2 g r4 d'4. c8 a4 b c2 b4 c2 g1. |
	}
	\addlyrics {
		Quod -- cúm -- que,

		quod -- cúm -- que li -- gá -- ve -- ris su -- 
		per ter -- _ _ _ _ _ _ ram, e -- rit li -- gá -- tum et in cœ -- lis,
		et quod -- cúm -- que,

		et quod -- cúm -- que sól -- ve -- ris su -- per ter -- ram,
		e -- rit so -- lú -- tum, e -- rit so -- 
		lú -- tum et in cœ -- lis, __ _ et in 
		
		cœ -- _ lis, et ti -- bi da -- bo,
		et ti -- bi da -- bo __ _ _ _ _ cla -- ves 
		re -- gni cœ -- ló -- _ _ _ _ _ _ _ _ rum, et ti -- 
		
		bi da -- bo, et ti -- bi da -- bo, et ti -- bi da -- bo cla -- ves 
		re -- gni cœ -- ló -- _ _ _ _ rum, cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ 
		rum, cla -- ves re -- gni cœ -- ló -- rum, cœ -- _ _ _ _ _ ló -- rum.
	}
}

bassus = \new Voice {
	\relative c' {
		\clef "bass"
		g1 c, g' R R R
		
		R1 R r2 g c,1 g'2 g a4. f8 f4 g |
		g8 f e d c2 d4 e d2 g r R1 R r2 r4 g |
		c a2 g c, c' g4 d'2 g, r1 r4 g2 g4 c2 |
		
		g2 r R1 R R r4 c,2 c4 f2 e |
		d4. d8 a'2 f4 c d2 | a r1 r4 a'4 | g f \ficta bes2 a r |
		R1 R R r4 c, g' e d2 c1 r2 |
		
		r2 d e c g'1 c, R r2 c |
		g'2. g4 a2 g R1 R R r4 g2 g4 |
		c,2 g'4 g f4. e16 d c8 d e4 d2 g1. R1 R |
		
		R r4 d g2. g4 a2 g r R1 r4 c,2 c4 |
		f2 c4 c d8 e f g a b c2 b4 c2 R1 R R |
		r4 g2 g4 c,2 g'4 g f2 c d1 g c g |
	}
	\addlyrics {
		Quod -- cúm -- que,

		quod -- cúm -- que li -- gá -- ve -- ris su -- 
		per __ _ _ _ _ ter -- _ _ ram, e -- 
		rit li -- gá -- tum et in cœ -- lis: et quod -- cúm -- 
		
		que, et quod -- cúm -- que 
		sól -- ve -- ris su -- per ter -- ram, e -- rit so -- lú -- tum,
		e -- rit so -- lú -- tum 
		
		et in __ _ cœ -- lis, et 
		ti -- bi da -- bo cla -- ves 
		re -- gni cœ -- ló -- _ _ _ _ _ _ rum,
		
		et ti -- bi da -- bo cla -- ves 
		re -- gni cœ -- ló -- _ _ _ _ _ _ _ rum,
		cla -- ves re -- gni cœ -- ló -- _ rum, cœ -- ló -- rum.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff \with { instrumentName = #"CANTUS"  shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"QUINTUS" shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"ALTUS"   shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"TENOR"   shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"SEXTUS"  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"BASSUS"  shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
	\layout { }
%	\midi { }
}
