% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "2"
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
		"17. Ad te levavi animam meam"
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
		R1 R R a2 c r r4 c | \break g'2. f4 d2. c8 c |
		a2 e' R1 r4 b g'2 | \break r2 a,1 e' d2. 
		e2 d8 d b c d4. c16 b c4 | \break b2 a4 b8 c e4 fis g2. f2 e4 f2 a,1. | \break
		
		b1 r4 d e1 a,1. R1 | \break R |
		R R R e'4 d8 d b a b c | \break d c b c c d e f g2 e4 f f2. e2 
		d cis4 d1 R | \break r4 d d2 r4 e e2 c b a1 |
		
		r2 c4 d8 e | \break f2 e4 g4. fis8 \ficta fis e16 \ficta fis g1 g,4 a a2. g4 g'2. f4 | \break e2 a,
		R1 e'2. a,4 b b b2 e,1. r2 | \break
		e'2 f4 d2 d4 d2 dis e fis4 \ficta fis \ficta fis2 f!\breve \showBarLine \bar "|."
	}
	\addlyrics {
		Ad te le -- va -- vi a -- ni -- mam 
		me -- am, ad te le -- va -- vi 
		a -- ni -- mam me -- _ _ _ _ _ am, Do -- mi -- ne De -- us me -- _ _ us, ad
		
		te le -- va -- vi 
		a -- ni -- mam me -- _ _ _ _ _ _ _ _ _ _ _ _ am, in te con -- 
		fi -- _ do, in te, in te con -- fi -- do, 
		
		Do -- mi -- ne De -- us me -- _ _ _ _ _ us in te, in te con -- fi -- do,
		non, non e -- ru -- be -- scam,
		non, non e -- ru -- be -- scam, non e -- ru -- be -- scam.
	}
}

sextus = \new Voice {
	\relative c'' {
		R1 r2 r4 c1 d4 e g1 f4 d4. e8 | c2 d8 c b a b4. a16 g a2 |
		g8 f e2 r4 R1 r2 r4 g | b2 r4 a d8 c b2 a2. r2 |
		r r4 d, a'1 r4 e c'2 c g4 f8 f | e4 a bes2 a r R1 |
		
		r2 r4 e4. fis8 g4 a2 e r r4 c'4 c2 r e2 ~ | e4 d2 a4 |
		g2 d g4 g2 a4 g2 a1. | R1 R r4 d,2. |
		a'1 r4 fis2. g1 a2 g | d' c R1 r2 d4 c8 b |
		
		g4 f2. c'2 ~ c8 b a b16 c c2 b | g4 r r1 d'4 d2 c4 e2 a,1 |
		R r2 g e e4 e2. a2 ~ a2. b4 ~ |
		b a2 a g4 g2 b b a4 a a2 f\breve |
	}
	\addlyrics {
		Ad te le -- va -- vi a -- ni -- mam me -- _ _ _ _ _ _ _ 
		_ _ am, ad te le -- va -- _ _ vi,
		ad te le -- va -- vi a -- ni -- mam me -- _ _ am,
		
		Do -- mi -- ne De -- us, in te con -- fi -- do,
		in te, in te con -- fi -- do, in 
		te, in te con -- fi -- do, __ _ Do -- mi -- ne
		
		De -- us me -- _ _ _ _ _ _ us, in te con -- fi -- do,
		in te con -- fi -- do, non,
		non e -- ru -- be -- scam, non e -- ru -- be -- scam.
	}
}

altus = \new Voice {
	\relative c' {
		R1 f2 a1. r2 r4 c, | f2 e4 f g g a2 fis4 g2 c,4 |
		c'2. b8 b a b c a a gis a2 g8 a b4 g ~ g g2 f8 f e2 b' r r4 g, |
		g'2 g4 a2 g a4 ~ | a g8 g c,4 b8 a a' b c4 c\breve r2 cis,4 d8 e f4 fis |
		
		g8 f16 e d4 e2 r e4 g2 g,4 a a | e'2. d8 c a'2 e4 g ~ g f8 f d2 |
		d2 e4 fis8 g a4 b c b8 a g4 b,2 b'4 b2 r | a2. g2 e4 a2 a g4 g ~ |
		g f e2 d1 d4 e8 f g2 ~ | g4 a b2. a2 g8 f e d c a b2 c1 |
		
		e4 f g8 f16 g a4 ~ a8 g8 a b c4 g a a g e2 d8 c d b e4 a,2 r | e'4 e2 a4 ~ a g2 fis4 ~ |
		fis fis2 g4 g g2 e4 r2 r4 b | cis \ficta cis \ficta cis2 c! c' |
		e, d2. d4 d2 fis g a1 bes4 \ficta bes \ficta bes2 a1 |
	}
	\addlyrics {
		Ad te le -- va -- vi, ad te, ad te le -- va -- vi 
		a -- ni -- mam me -- _ _ _ _ _ _ _ _ _ am, a -- ni -- mam me -- am, ad 
		te le -- va -- vi a -- ni -- mam me -- _ _ _ _ _ am, Do -- mi -- ne De -- us
		
		me -- _ _ _ us, ad te, ad te le -- va -- _ _ _ vi a -- ni -- mam me -- 
		am, Do -- mi -- ne De -- us me -- _ _ _ us, in te con -- fi -- do, in te, in te
		con -- fi -- do, Do -- mi -- ne De -- us me -- _ _ _ _ _ _ _ _ us,
		
		De -- us me -- _ _ _ _ _ _ _ us, in te con -- fi -- _ _ _ _ _ do, in te con -- fi -- do,
		in te con -- fi -- do, non e -- ru -- be -- scam, non,
		non e -- ru -- be -- scam, non, non e -- ru -- be -- scam.
	}
}

quintus = \new Voice {
	\relative c {
		\clef "treble_8"
		R1 R f2 a2. d,4 a'1. | g2 r1 r4 c,2 
		c'8 d e2 e1 r2 g, ~ | g a4. f8 c'2 b4 d2 c8 c b c d2 
		c8 b c4 a r d e2 ~ | e a,1 e'2 c1. r2 r4 f, a d, |
		
		g2 e4 e'2 d8 d b c d2 cis4 d2 | r r4 f2 e8 e a,4 g R1 |
		R r2 a4 b8 c d2 e2. f2 e4 ~ | e d r g,2 a8 b c2 c r |
		cis4 d e a,2 a4 a2 b g ~ | g1 e R f |
		
		e2 c R1 r2 e2. g8 a b4 cis | d2. b4 R1 r2 r4 d,
		d2 d'4 d c b2 a4 d,1 e2. e4 e1 |
		a2 d, g4 g g2 fis r a1 f4 f f2 c'1 |
	}
	\addlyrics {
		Ad te le -- va -- vi, le -- 
		va -- _ _ vi, ad te le -- va -- vi a -- ni -- mam me -- _ _ 
		_ _ _ am, ad te le -- va -- vi, ad te le -- 
		
		va -- vi a -- ni -- mam me -- _ _ _ am, a -- ni -- mam me -- am,
		Do -- mi -- ne De -- us me -- _ us, Do -- mi -- ne De -- us,
		De -- us me -- us, in te con -- fi -- do, con -- 
		
		fi -- do, Do -- mi -- ne De -- us me -- us, in 
		te, in te con -- fi -- do, non e -- ru -- be -- 
		scam, non e -- ru -- be -- scam, non e -- ru -- be -- scam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		c2 d2. a4 f'1 e4 e2 d8 d c d e4. d16 c d4 c2 ~ | c1 b2 g'4. f8 |
		e4 a, r b c2 r4 a e'1 d2 r1 e g2 |
		g,2. d'4. c8 b a g4 c r2 f4 e8 e c1 a2 r r4 a2 c4 r a d2 |
		
		b4 g'2 b,8 b a2 g1 r4 d'2 c8 c a4 f | g a8 b c2 ~ c4 d f8 g a2
		g4 a2 e e4 d b2 e, R1 | r2 e' e r R1 |
		R r2 a4 a2 g4 e2 ~ e4 d d e8 f g f e d e1 dis4 e2 d8 c d2 |
		
		c1 R R R r2 g2. a8 b c4 c e2. d4 |
		d d b2 g2. a2 gis8 fis gis2 | a4 a a b2 a g4 |
		c2 r1 b4 b b2. g4 d' d d1 f1. |
	}
	\addlyrics {
		Ad te le -- va -- vi a -- ni -- mam me -- _ _ _ _ _ am, le -- va -- _ 
		_ vi, ad te le -- va -- vi, ad te 
		le -- va -- _ _ _ _ vi a -- ni -- mam me -- am, ad te le -- va -- 
		
		vi a -- ni -- mam me -- am, a -- ni -- mam me -- am, Do -- mi -- ne De -- us me -- _ _ 
		_ us, in te con -- fi -- do, in te,
		in te con -- fi -- do, Do -- mi -- ne De -- _ _ _ _ us me -- _ _ _ 
		
		us, Do -- mi -- ne De -- us me -- us,
		in te con -- fi -- _ _ _ _ do, in te con -- fi -- do,
		non e -- ru -- be -- scam, e -- ru -- be -- scam.
	}
}

bassus = \new Voice {
	\relative c {
		\clef "bass"
		d\breve e1 a,2 g f' g f8 e d e f4. e16 d e2 d4 r |
		r e c'2 r4 e,4 b'1 c2 r4 c1 b8 b d c b4. a16 g fis4 g2 |
		r4 a, f'1 r4 a, e'2 f | e4 d'8 c bes2. a4 g2 f r a d,4 c |
		
		b2 cis d4 c8 b a2 a'1 r2 r4 d, d'2 r c2. b2
		a d d,4 c'2 b4 a2. R1 | r4 e2 a r4 r2 R1 |
		r2 r4 a d2 c b2. bes8 \ficta bes a2. g4 | g2 a8 b c d a2 a a1 |
		
		e'2 r R1 R R fis,4 \ficta fis2 e2. e2 ~ e d |
		d' cis4 b a g fis2. e | a1 a,2 a |
		g1 ~ g4 g g a b2 g | d'1 bes4 \ficta bes \ficta bes2 f'1 |
	}
	\addlyrics {
		Ad te le -- va -- vi a -- ni -- mam me -- _ _ _ _ _ am,
		ad te le -- va -- vi a -- ni -- mam me -- _ _ _ _ _ am,
		ad te le -- va -- vi a -- ni -- mam me -- _ _ am, Do -- mi -- ne 
		
		De -- us me -- _ _ _ us, in te con -- fi -- 
		do, in te con -- fi -- do, in te 
		con -- fi -- do, Do -- mi -- ne De -- us me -- _ _ _ _ _ us, me --
		
		us, in te con -- fi -- do,
		in te con -- fi -- do, in te con -- fi -- do,
		non e -- ru -- be -- scam, non, non e -- ru -- be -- scam.
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
