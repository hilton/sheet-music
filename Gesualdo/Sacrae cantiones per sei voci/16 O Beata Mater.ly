% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "1"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
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
		"16. O Beata Mater"
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
		f2 e c a4 e'2 d4 g c, e2 a,4 c2 b8 a c4 g | r a2 c4 d f g2 e r4 a,2
		c d4 b c2 b4 | r c2 f,4 a d4 c b8 a b2 a r4 e'2 g4 f8 e d c b c d2
		c4 d2 r4 a2 c4 e f c2 d4 g2 f4 d2 b4 b2 g4 r2 a g
		
		a2. d4 a4. a8 c4. b8 c d e2 d c b8 a b2 a r e' ~ | \break
		e4 d8 c d4 g, c d c8 b a g f g a2 g fis4 g1. r2 c ~
		c4 c2 b4 g'1 c,2 c4 c2 a4 c2 f, r a4 a2 g4 g fis8 e g2 fis r
		
		g4 g g'1. b,2 r c4 c c2 ~ c b c1 b8 a b g d'4 a e' c2 c4
		f g e8 d e c f2 e r2 r4 f4 f f2 c b4 c b8 a c g c4 b2 r d
		d4 d2 c4 b b b a8 gis a4 c c1 b8 a b g g'4 e r g2 f e4 f1 \showBarLine \bar "|."
	}
	\addlyrics {
		O Be -- a -- ta Ma -- ter et in -- ta -- cta Vir -- _ _ _ go, O Be -- a -- ta Ma -- ter, O -- 
		Be -- a -- ta Ma -- ter et in -- ta -- cta Vir -- _ _ _ go, glo -- ri -- o -- _ _ _ _ _ _ 
		_ sa, O Be -- a -- ta Ma -- ter, O Be -- a -- ta Ma -- ter, Ma -- ter
		
		et in -- ta -- _ _ _ _ _ _ cta Vir -- _ _ _ go, Vir --
		_ _ _ go, glo -- ri -- o -- _ _ _ _ _ _ _ _ sa Re --
		gi -- na mun -- di, Re -- gi -- na mun -- di, Re -- gi -- na mun -- _ _ _ di, 
		
		in -- ter -- ce -- de, in -- ter -- ce -- de pro no -- _ _ _ _ bis ad Do -- mi -- 
		num, pro no -- _ _ _ _ bis, in -- ter -- ce -- de pro no -- _ _ _ _ _ bis, in -- 
		ter -- ce -- de, in -- ter -- ce -- _ _ _ de pro no -- _ _ _ _ bis  ad Do -- mi -- num.
	}
}

sextus = \new Voice {
	\relative c'' {
		R1 R f2 e c d4 e2 d4 g e | a,2 b4 a2 b8 a b4 c r d2 c4
		b a g2 f g4 d' | d2 e4 d c8 d e2 e r2 c b4 e8 d c b a b c2 a4
		g2 r | c d4 e2 f, a4 b2 c g g4 fis g b8 c d4. g8 f g d2 e4 ~ |
		
		e a,2 f'8 g d2 e r e,4 g f8 e16 f g2 a4 a1 b |
		e2. c8 b a2 e r f4 c' b8 a16 g a2 g4 a1 a2. g8 fis |
		g2  g c4 c c8 bes a g f g a4 c e e2. d4 c c f g2 d4 d2 ~ | d b1 r2
		
		g4 g g1. e1 e4 e e2 ~ | e e r g1 g' f4. e8
		d c bes2 a4 a2 r R1 c4 c c2 d e g e8 d e b a4 b2 g 
		a4 b2 | e r4 c c4. d8 e4 g e8 d c b16 c d2 c4 c e4. d8 c\breve |
	}
	\addlyrics {
		O Be -- a -- ta Ma -- ter et in -- ta -- cta Vir -- _ _ _ go, O Be -- 
		a -- ta Ma -- ter et in -- ta -- cta Vir -- _ _ _ go, glo -- ri -- o -- _ _ _ _ _ _ _ 
		sa, O Be -- a -- ta Ma -- ter, Ma -- ter et in -- ta -- _ _ _ _ _ _ _ cta
		
		Vir -- _ _ _ go, glo -- ri -- o -- _ _ _ _ _ sa, 
		Vir -- _ _ _ go, glo -- ri -- o -- _ _ _ _ sa, Vir -- _ _ 
		_ go, glo -- ri -- o -- _ _ _ _ _ _ sa, Re -- gi -- na mun -- di, Re -- gi -- na mun -- di, 
		
		in -- ter -- ce -- de, in -- ter -- ce -- de pro no -- _ _  
		_ _ _ _ bis, in -- ter -- ce -- de pro no -- _ _ _ _ _ bis, in -- 
		ter -- ce -- de ad Do -- mi -- num, pro no -- _ _ _ _ _ bis ad Do -- mi -- num.
	}
}

altus = \new Voice {
	\relative c'' {
		R1 r4 c2 a4 f2 e4 a2 g4 c2 f, g | c,4 e f c r d g, g'2 a4 a g8 f
		a1 g1 ~ | g2 r1 gis4 a \ficta g!8 f e d c d e f16 g a2. g4 r2 f2. 
		e4 d2 | c2 a4 a g' a2 g g,4 a2 d1 g4 d f d r c g g' ~ |
		
		g f f2. e8 d g4 g, a c a8 b16 c d4 a2 r R1 g'2 b!4 g ~ |
		g4 f8 e d c16 d e2 d4 a' c a8 g f e d c d4 a2 r r4 c c2. a4 e'2 ~ |
		e4 c r2 g'2. f8 e a2 g a4 c a8 g f e d e f4 d d d2. g,4 | g2 b1.
		
		b4 b b'1. gis2 r g4 g g2 ~ | g e2. c4 e c r2 a' g4. e8 f g a2 
		g4 a1. | d,4 d bes'2. a8 g a4 a2 gis4 a \ficta g!8 f g e a2 gis4 a4 a2 g
		fis4 g2 ~ | g4 e e4. d8 e c g'4. f8 e d e2 d e g e4 f g4. g8 a1 |
	}
	\addlyrics {
		O Be -- a -- ta Ma -- ter et in -- ta -- cta, in -- ta -- cta, et in -- ta -- cta Vir -- _ _ 
		_ go, glo -- ri -- o -- _ _ _ _ _ _ _ _ _ sa, O
		Be -- a -- ta Ma -- ter, Ma -- ter et in -- ta -- cta, et in -- ta -- cta, et in -- ta -- 
		
		cta Vir -- _ _ _ go, glo -- ri -- o -- _ _ _ sa, glo -- ri -- o -- 
		_ _ _ _ _ _ sa, glo -- ri -- o -- _ _ _ _ _ _ sa Re -- gi -- na mun -- 
		di, Vir -- _ _ _ go, glo -- ri -- o -- _ _ _ _ _ _ sa Re -- gi -- na mun -- di, 
		
		in -- ter -- ce -- de, in -- ter -- ce -- de pro no -- bis, pro no -- _ _ _ _ 
		_ bis, in -- ter -- ce -- _ _ _ de pro no -- _ _ _ _ _ _ bis ad Do -- 
		mi -- num, pro no -- _ _ _ _ _ _ _ _ bis, pro no -- bis ad Do -- mi -- num.
	}
}

quintus = \new Voice {
	\relative c' {
		\clef "treble_8"
		R1 R R r2 f d c | a1. r2 r4 e'2 d4
		a2 f4 f'2 e4 d2 ~ |  d4 c2 a f4 c'2 b r e4 a, e' d a'2. g8 f
		g2. d4 | r e f e8 d c b a b c2 g' r g,1. a1 c2 ~ |
		
		c d2. f2 e4 a1. a,2 e'4 b c b8 a b2 e, |
		r2 g' f8 e f d e2 d r d2. b4 c8 d e f g f e2 d4 a' a ~ |
		a a, d2 g,1 r4 e' e2 c4 c c2 a4 a'2 g fis4 fis d | e b e2 dis r
		
		d!4 d d2 b1.  r2 e4 e e2 ~ | e gis4 \ficta gis a2 g r4 b, a8 g a b c4 c r c
		bes4. \ficta bes8 a2 r4 d e4. e8 | f4 f2 f4 f1 e2. d4 c8 b e a, b2 a d4 d
		d2 b4 e | e e4. d8 c b a4 g2 g4 g'1. e2 a, g4. g8 f1
	}
	\addlyrics {
		O Be -- a -- ta, O Be -- 
		a -- ta, O Be -- a -- ta Ma -- ter, Ma -- ter et in -- ta -- cta Vir -- _ _ 
		_ go, glo -- ri -- o -- _ _ _ _ _ _ sa, O Be -- a -- 
		
		ta Ma -- ter et in -- ta -- cta Vir -- _ _ _ go, 
		Vir -- _ _ _ _ _ go, glo -- ri -- o -- _ _ _ _ _ _ sa Re -- gi -- 
		na mun -- di, Re -- gi -- na, Re -- gi -- na mun -- di, Re -- gi -- na mun -- di, mun -- di, 
		
		in -- ter -- ce -- de, in -- ter -- ce -- de pro no -- bis, pro no -- _ _ _ _ bis ad 
		Do -- mi -- num, ad Do -- mi -- num,  in -- ter -- ce -- de pro no -- _ _ _ _ bis, in -- ter -- 
		ce -- de, in -- ter -- ce -- _ _ _ _ de pro no -- bis ad Do -- mi -- num.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		R1 R R R | R R f2. e4 c2. a4
		e'2. d2 c4 g' g,4 ~ | g g'4 f e8 d f2 e e4 g e8 d c b a b c4. b16 a b8 c d4 a d2
		b4 g2 g'4 | e2 c1 f4 e d1 b2 e d a' f r4 g,
		
		c f,4. g8 a4. g8 a f g a16 b c4. b8 a b c4 a d a a'2. g8 f e4 d d2. c8 b |
		c2 b R1 r2 f'4 e8 d a'2 d, R1 r2 c4 a |
		c8 d e fis g4. \ficta f!8 e4 e c c2 a4 r2 r r4 a' a a, bes2 a \ficta b!4 b ~ | b g e2 fis r
		
		r g'4 g g1 e2 r g,4 g g2 ~ | g4 e r b' a8 g a f c'4 g d' d d2 e4 g a f2 
		d4 e4. e8 a,2 a4 a | a2 f4 bes c2. a4 R1 r4 c e2. d4 b2
		a4. a8 g2 | g4 b4. b8 e4 r e, e'8 d c b16 a g2 b4 b g2. g4 c\breve |
	}
	\addlyrics {
		O Be -- a -- ta
		Ma -- ter et in -- ta -- cta Vir -- _ _ _ go glo -- ri -- o -- _ _ _ _ _ _ _ _ _ _ _ sa, O 
		Be -- a -- ta Ma -- ter, O Be -- a -- ta Ma -- ter, Ma -- ter, et
		
		in -- ta -- _ _ _ _ _ _ _ _ _ _ _ _ _ cta, et in -- ta -- _ _ _ cta Vir -- _ _ 
		_ go, Vir -- _ _ _ go, glo -- ri -- 
		o -- _ _ _ _ _ _ sa, Re -- gi -- na, Re -- gi -- na mun -- di, Re -- gi -- na mun -- di, 
		
		in -- ter -- ce -- de, in -- ter -- ce -- de pro no -- _ _ _ _ bis, in -- ter -- ce -- de pro no -- bis 
		ad Do -- mi -- num, in -- ter -- ce -- de pro no -- bis, pro no -- bis ad 
		Do -- mi -- num, ad Do -- mi -- num, pro no -- _ _ _ _ _ bis ad Do -- mi -- num.
	}
}

bassus = \new Voice {
	\relative c' {
		\clef "bass"
		R1 R R R r2 r4 c4 ~ | c a4 f2 e4 d2 c4 c'2 b
		a a4 g f e g f8 e | d1 a'2 e' e, f c' b4 a g f e d
		e4. g16 a b4 c | b2 r4 g2 d a' g4 g2 a4 b2 c d4 d, e f4. g8 f4. g8
		
		d e f e16 d c4. d8 b2 g' f2. g4 g4. g8 a4. g8 b c d4 d, e2 fis g4 ~ |
		g a r2 R1 R d,4 a'8 b c4 d d2. c4 b8 a b c b a a4 |
		d,4 a'2 g bes \ficta a!4 a bes2 a4 d,2 c bes bes4 c2 d2. | \ficta b!1. r2
		
		R1 f'4 f f2 e r c4 c bes2 ~ | bes4 a a' a2 g g4 f4. e8 f2 e4 g d2
		d4 d c bes bes' a a4. a8 | d,2 d c2. b8 c d4 e2 f4 g f e d cis c! b b'
		a2 d, | cis c!4. c8 f4 r g g4. f8 e4 r g a a, b c d4. \ficta e!8 f1. |
	}
	\addlyrics {
		O Be -- a -- ta Ma -- ter et in -- 
		ta -- cta, in -- ta -- cta Vir -- _ _ _ go, __ _ _ glo -- ri -- o -- _ _ _ _ _ 
		_ _ _ _ _ sa, O Be -- a -- ta Ma -- ter, Ma -- _ _ ter, in -- ta -- _ _ _
		
		_ _ _ _ _ _ _ _ cta, et in -- ta -- _ _ _ _ _ _ _ cta Vir -- _ 
		go, Vir -- _ _ _ go glo -- ri -- o -- _ _ _ _ _ sa, 
		Re -- gi -- na mun -- di, Re -- gi -- na mun -- di, Re -- gi -- na mun -- di, 
		
		in -- ter -- ce -- de, in -- ter -- ce -- de pro no -- bis ad Do -- mi -- num, in -- ter -- ce -- 
		de pro no -- bis __ _ ad Do -- mi -- num, in -- ter -- ce -- _ _ _ de pro no -- bis, in -- ter -- ce -- de pro 
		no -- bis ad Do -- mi -- num, ad Do -- mi -- num, pro no -- _ bis ad Do -- mi -- num.
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
	\midi { }
}
