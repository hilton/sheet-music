% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.18.0"
revision = "5"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
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
		\override TimeSignature.style = #'default \time 2/2
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
	\tempo 1 = 60
	\time 2/1
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantus = \new Voice {
	\relative c'' {
		R\breve R r1 g\breve c1 b b c2. a4 a2 b | \break 
		
		d2 e2. d4 c b a2 g a1 b\breve R R R | \break 
		R R r2 g g a1 b c e g2 fis1 g | \break 
		R\breve r1 r2 c,1 b2 d1 d2 d1 d2 e1 d2 b1 b2 c1 |
		
		b2 d1 d2 \break e1 d c2. c4 b2 a1 g2 f1 e2 c'1 e2 c1 c |
		a2. a4 a1 R\breve \break r2 a b c d1 c R\breve r2 e d e |
		f1 e2 g4 f e d c b a2 d d \ficta cis d1 \break r2 c b c d1 g,2 c1 e2 f4 e d c |
		
		b2 g r d' b e2. d4 c1 b4 a b1 \break c\breve R r1 r2 g |
		b1. b2 c1 b2 d1 d2 e1 d2 b c4 b c d \break e f g2. \ficta fis8 e \ficta fis2 g\breve |
		R R r1 r2 g, d'1 b2. c4 \break d2 e1 d4 c b1 r2 a |
		
		d d b c d\breve R r2 d e1. e2 f1 \break e2 c1 c2 | 
		c1 c R\breve r1 r2 e1 e2 f1 d2 e f e2. d4 b c d1 | \break
		r2 b1 b2 c1 b2 g a4 b c d e f g e \ficta fis2 g1 \ficta fis2 g1 r2 d g4 f e d e1 d\breve \showBarLine \bar "|." |
	}
	\addlyrics {
		Quod -- cúm -- que li -- gá -- ve -- ris su --
		
		per ter -- _ _ _ _ _ _ ram,
		e -- rit li -- gá -- tum et in cœ -- lis,
		et in cœ -- lis: et quod -- cúm -- que, et quod -- cúm -- 
		
		que, et quod -- cúm -- que sól -- ve -- ris su -- per ter -- ram, et quod -- cúm -- que
		sól -- ve -- ris e -- rit so -- lú -- tum, e -- rit so -- 
		lú -- tum et __ _ _ _ _ _ _ in cœ -- _ lis, e -- rit so -- lú -- tum et in cœ -- _ _ _
		
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
		R\breve R d e d2 d1 e2. c4 c2 d1 |
		
		b2 c2. b4 a g \ficta fis2 g2. \ficta fis8 e \ficta fis2 g\breve R R R |
		R R r2 b c c1 d e c b2 d1 b2 g |
		g a1 b c e g2 fis1 g r\breve r2 d1 d2 e1 |
		
		d1 r R\breve R R r2 e1 e2 f1 e |
		d2. d4 c2 a1 g2 f1 e r\breve r2 a b c d1 c r |
		R\breve R R r2 e d e f1 e2 g4 f e d c b a2 d d
		
		 \ficta cis2 d1 r2 b c1 d\breve e2 c e1. e2 f1 e\breve |
		R\breve r1 r2 b1 b2 c1 b2 g a4 g a b c b b a8 g a1 g\breve ~ g\breve |
		R\breve R r2 g d'1 b c d\breve |
		
		R\breve r2 a b1. b2 c1 b r2 g c c a b c e1 e2 |
		f1 e d2 c2. d4 e f g1 e2 c1 c2 c1 b2 g a4 b c d e f g1 \ficta fis2 |
		g2 d1 d2 e1 d2 e f1 e d\breve r2 g, g'2. f4 e d c b c1 b\breve |
		
	}
	\addlyrics {
		Quod -- cúm -- que li -- gá -- ve -- ris su --

		per ter -- _ _ _ _ _ _ _ _ ram,
		e -- rit li -- gá -- tum et in cœ -- lis, e -- 
		rit li -- gá -- tum et in cœ -- lis: et quod -- cúm -- 
		
		que, et quod -- cúm -- que 
		sól -- ve -- ris su -- per ter -- ram, e -- rit so -- lú -- tum,
		e -- rit so -- lú -- tum et __ _ _ _ _ _ _ in
		
		cœ -- _ lis, et in cœ -- lis, et ti -- bi da -- bo 
		cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ _ _ rum,
		et ti -- bi da -- bo, 
		
		et ti -- bi da -- bo, et ti -- bi da -- _ bo cla -- ves 
		re -- gni cœ -- ló _ _ _ _ -- rum, cla -- ves re -- gni cœ -- ló -- _ _ _ _ _ _ _ 
		rum, cla -- ves re -- gni cœ -- ló -- _ rum, cœ -- ló -- _ _ _ _ _ _ rum.
	}
}

altus = \new Voice {
	\relative c'' {
		R\breve R g c, g'1 g a2. f4 f2 g |
		
		g4 f e d c1 d2 e d1 g, b c4 d e f g1 g r2 g e2. a4 a2 g |
		g2. f4 e1 d2 c d1 b r R\breve R r1 r2 d |
		e e1 g g2. f4 e d e2 d2. d4 a'2 b b1 b2 c1 b R\breve |
		
		r2 b1 b2 c1 b a2. a4 g2 f1 e2 d1 g,2 g'1 g2 a1 g2 a1
		 d,2 e1 f2 e d1 c2 c d f f g a e g a d,1 e r2 c' |
		a b c g c4 b a g f2 a1 g \ficta fis2 g e g g \ficta f!4 e d2 e\breve r2 f |
		
		g1 a g2 g1 g2 g\breve g1 r2 g c c a b c b4 a g1 |
		r2 g g g e \ficta fis g g1 g2 c,1 g'2 g f2. e8 d c4 d e2 d1 g r |
		r2 c, d e f1 e2 c d1 b r2 d1 g2 ~ g g2 a1 g2 g a1.
		
		 f2 g1 a r2 d, g g e \ficta fis g1 r R\breve r2 g1 g2 |
		a1 g2 e a1. g2. f4 d2 e g1 g2 a1 g2 b c2. b4 a2 g a1 |
		g2 g1 g2 g1 g r2 a c2. b4 a2 g a1 g\longa |
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
		d\breve e d R R R
		
		R R r1 d1 e\breve d2 d1 e2. c4 c2 d1 |
		b2 c2. b4 a g \ficta fis2 g a1 g2 d' e e1 g g g g2 a1 g |
		r2 c,1 d e g g2 a1 g\breve ~ g1 r2 g1 g2 g1 |
		
		g\breve ~ g e2. e4 e2 c1 c2 a b c c1 c2 a1 c |
		f2. f4 e2 c1 c2 a1 a2 e' g a d,1 e2 c d f f g a e g g |
		f1 g4 f e d e1 r2 f g1 a g r2 g, a b c4 d e f g2 g f a2. 

		 g4 g1 \ficta fis2 g e1 e2 d\breve c1 r2 e g a f1 g e |
		d2. c4 b2 g c a b1 R\breve R R r2 d1 d2 |
		e1 d2 b c4 b c d e f g1 \ficta fis2 g\breve r1 R\breve r2 d f d4 e |
		 
		f g a1 g \ficta fis2 g1 R\breve r2 g g1. a2 f1 g2 e1 e2 |
		c1 e2 g f1. e2 d1 c R\breve R R |
		r2 d1 g, c2 d b c1 c1. b2 a d2. b4 e2 d1 e c d\breve |
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
		r1 g\breve c1 b\breve R R R
		
		R R r1 g\breve c1 b b c2. a4 a2 b  |
		d e2. d4 c b a2 g1 \ficta fis2 g g c a1 g c, c' e2 d1 g, |
		R\breve R R r2 g1 g2 c1 g R\breve |
		
		r2 g1 g2 c1 g | a2. a4 e2 f1 c2 d1 | c r R\breve |
		R R r2 a' g f \ficta bes1 a R\breve r2 a \ficta b! c |
		d1 c c d e d g, r R\breve c1 d |
		
		e d g,\breve ~ g1 r1 | r2 g2 c1. c2 d1 c\breve |
		r2 b d d c1 d4 c b a g1 r R\breve R r2 b1 b2 |
		c1 b2 g a4 g a b c b a g | a1 g R\breve R r2 g d'1.
		
		 d2 e1 d r2 b d e c1 d2 g, c1. c2 d1 c2 c1 c2 |
		 a1 c2 c f,4 g a b c1 g r2 c1 c2 f,1 g2 g f4 g a b c d e2 d1 |
		 g,2 b1 d2 c g1 b2 a1 g r2 d'2. c4 a2 b c1 b2 c1 g1 ~ g\breve |
	}
	\addlyrics {
		Quod -- cúm -- que,

		quod -- cúm -- que li -- gá -- ve -- ris su -- 
		per ter -- _ _ _ _ _ _ ram, e -- rit li -- gá -- tum et in cœ -- lis,
		et quod -- cúm -- que,

		et quod -- cúm -- que sól -- ve -- ris su -- per ter -- ram,
		e -- rit so -- lú -- tum, e -- rit so -- 
		lú -- tum et in cœ -- _ lis, et in 
		
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
		g\breve c, g' R R R
		
		R\breve R r1 g c,\breve g'1 g a2. f4 f2 g |
		g4 f e d c1 d2 e d1 g r R\breve R r1 r2 g |
		c a1 g c, c' g2 d'1 g, r\breve r2 g1 g2 c1 |
		
		g1 r R\breve R R r2 c,1 c2 f1 e |
		d2. d4 a'1 f2 c d1 | a r\breve r2 a'2 | g f \ficta bes1 a r |
		R\breve R R r2 c, g' e d1 c\breve r1 |
		
		r1 d e c g'\breve c, R r1 c |
		g'1. g2 a1 g R\breve R R r2 g1 g2 |
		c,1 g'2 g f2. e8 d c4 d e2 d1 g1 ~ g\breve R\breve R |
		
		R r2 d g1. g2 a1 g r R\breve r2 c,1 c2 |
		f1 c2 c d4 e f g a b c1 b2 c1 R\breve R R |
		r2 g1 g2 c,1 g'2 g f1 c d\breve g c g |
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
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 3)
			\new Staff \with { instrumentName = #"CANTUS"  shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"QUINTUS" shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"ALTUS"   shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"TENOR"   shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"SEXTUS"  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"BASSUS"  shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
	\layout { }
	\midi { }
}
