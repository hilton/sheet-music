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
	system-system-spacing = #'( (padding . 10) (basic-distance . 20) (stretchability . 100) )
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 15) (stretchability . 100))
		proportionalNotationDuration = #(ly:make-moment 1 16)
		\override SpacingSpanner #'uniform-stretching = ##t
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
	\key c \major
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
		d1 b b4 e8 d c b a g a1 \break b2 r d1 b1.
		r2 \break b4 e8 d c b a g a2. g2 fis4 g2 R1 r2 d'4. e8 \break
		f4 d g1 r1 g2 c, r  r2 r4 g \break g a2 g2 c2 a4
		
		a2 b2. e4 b a g4. g8 g2 \break R1 c2 g r b4 b e a,2 g4 ~ \break 
		g fis4 a4. a8 d2 r R1 R \break a4 e'2 f4 d2 c4. d8 e f g2 fis4
		g2 r \break r4 d g2 g4 g e1 b2 R1 \break R r2 d 
		
		g,2 g g' g4 g \break e e a,2 a r r4 c2 c8. b16 a b c d e4 e2 \break
		r4 b e e e c4. d8 e fis g4. \ficta f!8 e2. d4 r2 \break r r4 f
		c2 c R1 d4 d4. c8 c8. d16 \break e d c b a2 a4
		
		r2 f'4 f8. g16 a g f e d4. c8 b8. cis16 d2 d \showBarLine \bar "|."
	}
	\addlyrics {
		Ve -- ni Cre -- a -- _ _ _ _ _ _ tor, ve -- ni 
		Cre -- a -- _ _ _ _ _ _ _ _ tor spi -- _ 
		_ ri -- tus, re -- ple tu -- o -- rum, re -- ple tu -- 
		
		o -- rum cor -- da fi -- de -- li -- um, re -- ple tu -- o -- rum cor -- da 
		fi -- de -- li -- um: et tu -- i a -- mo -- _ _ _ _ _ 
		ris, et tu -- i a -- mo -- ris in 
		
		e -- is i -- gnem, in e -- is i -- gnem ac -- cen -- _ _ _ _ _ _ de,
		et tu -- i a -- mo -- _ _ _ _ _ _ ris in 
		e -- is i -- gnem ac -- cen -- _ _ _ _ _ _ de,
		
		ac -- cen -- _ _ _ _ _ _ _ _ _ _ de.
	}
}

sextus = \new Voice {
	\relative c'' {
		R1 r2 r4 a1. f2. g4 e'8 d c b a g a4 b2. r4 g1
		e2. ~ e4 r4 r2 r fis4 c'8 b a g fis e e'4. d8 c2 d1 r2
		r a4. c8 a4 b c8 b a g a g a b c4 d e c r2 e2 b R1 r4 g g g2
		
		a2 a4 b2 g'2. e4 b c4 ~ c8 e8 b2 r d1 e, r4 a4 a
		d a2 d4 d e fis g g2 e4 b R1 r4 e, b'2 b4 c c2 e4 e c1
		b2 ~ b4 fis2 g d' d4 c2 b4. a8 g4 a8 b a2 a4 r r1 g2
		
		e e' c a r4 d2 b4 ~ b c2 a'2. f2 r4 a,4 a8. g16 a b c d
		e4 b8 a g a16 b c d e fis g2 g4 c,8 d e fis g4 a fis d1 e2 a,4  d8 c
		b a d4 e, a a8 g a8. b16 c2 b4 c d a a' e2 f
		
		e8. d16 c b a g f g a8 c d4 e8 fis4 g d1
	}
	\addlyrics {
		Ve -- ni Cre -- a -- _ _ _ _ _ _ tor, ve -- 
		ni Cre -- a -- _ _ _ _ _ _ tor, ve -- ni 
		spi -- ri -- tus Cre -- a -- _ _ _ _ _ _ _ _ _ _ tor, re -- ple tu -- o -- rum 
		
		cor -- da tu fi -- de -- _ _ li -- _ um, re -- ple tu -- o -- 
		rum cor -- da fi -- de -- _ li -- _ um: et tu -- i a -- mo -- ris, et tu --
		i, et tu -- _ i a -- mo -- _ _ _ _ _ ris in 
		
		e -- is i -- gnem, in e -- is i -- gnem ac -- cen -- _ _ _ _ _ 
		_ de, ac -- cen -- _ _ _ _ _ _ _ de, et __ _ _ _ tu -- i a -- mo -- ris in e -- _ 
		is __ _ i -- gnem ac -- cen -- _ _ _ _ de, in e -- is i -- gnem ac -- 
		
		cen -- _ _ _ _ _ _ _ _ _ de, ac -- cen -- _ de.
	}
}

altus = \new Voice {
	\relative c' {
		\clef "treble_8"
		r2 g1 e r4 c c'8 b a g f e f4 e2 a4. g8 fis4 g d1 r4 e4. 
		f8 g2 e4 e2 f1 d1 r4 e4 c'8 b a g f e e2 d4 a'4. g8
		f4 a g2 d' g,4 e e f e2 g4 a g4. g8 g2 g e fis4 b4. a8 g f e d c4
		
		d4 d4. c8 b4. b8 g'4 g2 d4 e e c' ~ c a4. g8 a f g4 g r g2 fis4 g g2 c4 f, g8 g
		a4. a8 d,2 r4 d e2 e4 f e2 e4 gis a2 ~ a a2. a2 c c4 a2
		g4. a8 b4 a8 g a2 g4 b,2 g'4 gis a g8 f e d e4 d2 c4 c'2 c4 c2 a g fis4
		
		r c'2 g2 g4 e2 e2. d4 d a'2 a8. b16 c b a g f8. g16 a2. g8 fis g a16 b c4
		b g b b2 a4 g4. a8 b c d4. c8 c4. b8 a4 e e c2 c4 f
		f a a8. b16 c b a g a2 f4 d d16 e f e d c d8 a'2 ~ a f4 f 
		a4. a8. b16 c8. b16 a g f8. g16 a4. g8 g2 fis4 g2
	}
	\addlyrics {
		Ve -- ni Cre -- a -- _ _ _ _ _ _ tor spi -- _ _ ri -- tus, spi -- 
		_ _ ri -- tus, ve -- ni Cre -- a -- _ _ _ _ _ _ tor spi -- _ 
		_ ri -- tus, re -- ple tu -- o -- rum cor -- da fi -- de -- li -- um, ve -- ni Cre -- a -- _ _ _ _ _ _ 
		
		tor spi -- _ _ ri -- tus, re -- ple tu -- o -- rum cor -- _ _ _ _ da, cor -- da, tu -- o -- rum cor -- da fi -- 
		de -- li -- um: et tu -- i a -- mo -- ris, et tu -- i, et tu -- i a -- 
		mo -- _ _ _ _ _ ris, et tu -- i a -- mo -- _ _ _ _ ris, et tu -- i a -- mo -- _ ris
		
		in e -- is i -- gnem, i -- gnem ac -- cen -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		de, et tu -- i a -- mo -- _ _ _ _ _ _ _ _ ris in e -- is i -- 
		gnem ac -- cen -- _ _ _ _ _ _ de, ac -- cen -- _ _ _ _ _ _ _ de, i -- 
		
		gnem ac -- _ cen -- _ _ _ _ _ _ _ _ _ de.
	}
}

quintus = \new Voice {
	\relative c' {
		\clef "treble_8"
		R1 R R R R r2 g'1.
		e1 r2 r4 c f8 e d c b a b4 a d e8 d c b a4 e' a1 f2
		R1 d2 c r g4 g'8 f e d c a c4 b r d4. c8 b4 ~ b8 b a4 r2 b4. a8 g4 a
		
		a2 e' b4 b b c b c2 c4 a4. a8 a2 c4 c d e2 c8 a e'4. e8 e4 c d4. d8
		d1. r4 g b,2. b4 b2 e,4 a ~ a a r d2 f f4 e2 d4. c8
		b a b c d b e4 ~ e d r1 e2 e,4. fis8 g a b4 e, e e'2 e4 e2 d2 d4 r2
		
		R1 r4 g,4 g'2 g4 a f2. f4 d c2 c4 c2 c r4 g
		g8. a16 b a g f e8 f g e a2 e r e' a,4 a c c g g a a8. b16
		c b a g f8 g a4 a f' f8. e16 d e f g a2 g4 r a,4 ~ a a a a8. b16
		
		c b a g f g a4 a8 a2 a8. g16 fis8 g16 a b a b g a2 g
	}
	\addlyrics {
		Ve -- 
		ni Cre -- _ _ _ _ _ _ a -- tor, Cre -- a -- _ _ _ _ tor, ve -- ni, 
		ve -- ni Cre -- a -- _ _ _ _ _ _ tor spi -- _ _ ri -- tus, spi -- _ _ ri -- 
		
		tus, re -- ple tu -- o -- rum cor -- da fi -- de -- li -- um, tu -- o -- rum cor -- da fi -- de -- li -- um, fi -- de -- li -- 
		um, fi -- de -- li -- um: et tu -- i, et tu -- i a -- mo -- _ 
		_ _ _ _ _ _ _ ris, a -- mo -- _ _ _ _ ris, et tu -- i a -- mo -- ris, 
		
		et tu -- i a -- mo -- ris in e -- is i -- gnem ac -- 
		cen -- _ _ _ _ _ _ _ _ _ _ de, in e -- is i -- gnem, i -- gnem ac -- cen -- _ 
		_ _ _ _ _ _ _ de, ac -- cen -- _ _ _ _ _ _ de, i -- gnem ac -- cen -- _ 
		
		_ _ _ _ _ _ _ de, ac -- cen -- _ _ _ _ _ _ _ _ _ de.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		R1 R R R r2 e1 b r4 b |
		g'8 f e d c b c4 b2 r | a4. g8 fis4 g a2 c1 a a4 a' ~ |
		a8 g f e d4 e g4. f8 e4 g c,1 | r2 e b4 b b d c2 d e4 e g f2
		
		a g4 | e4. e8 e2 R1 a2 d, r4 g, g2 a b c2. b4 |
		a4. a8 a4 a b2 b2. d4 b8 a g f | g4 d'8 d e4 e | f d4. e8 f g | f4 e8 d a'2 | g r |
		e g4 g r a, e'2 e4 d c4. d8 e f g2 g,4 | R1 r4 c f f bes,2 a4. b!8 |
		
		c d e2 e4 d2 c c4 a4. a8 a4 a8. g16 f g a b c4 e8 e a4 a f2. c8 d e f g4 |
		g d e1 e2 e4 d8 c b c a4 a' f g8 a g8. f16 e2 f4 c |
		a a e' e2 d e8. f16 f e d c d8. e16 f4 e c2 c4 f |
		
		f8. e16 d e f g a1 d,1. |
	}
	\addlyrics {
		Ve -- ni Cre -- 
		a -- _ _ _ _ _ _ tor spi -- _ _ ri -- tus, ve -- ni Cre -- a -- 
		_ _ _ _ tor spi -- _ _ ri -- tus, re -- ple tu -- o -- rum cor -- da, tu -- o -- rum cor -- 
		
		da fi -- de -- li -- um, re -- ple tu -- o -- rum cor -- da fi -- 
		de -- li -- um: et tu -- i a -- mo -- _ _ _ _ ris, et tu -- i a -- mo -- _ _ _ _ _ _ _ ris,
		et tu -- i, et tu -- i a -- mo -- _ _ _ _ ris, et tu -- i a -- mo -- _ 
		
		_ _ _ ris in e -- is i -- gnem ac -- cen -- _ _ _ _ _ _ de, et tu -- i a -- mo -- _ _ _ _ 
		ris, et tu -- i a -- mo -- _ _ _ _ ris, a -- mo -- _ _ _ _ ris in 
		e -- is i -- gnem ac -- cen -- _ _ _ _ _ _ _ _ de, i -- gnem ac -- 
		
		cen -- _ _ _ _ _ _ de.
	}
}

bassus = \new Voice {
	\relative c {
		\clef "bass"
		R1 R R R R r2 r4 bes2. c1
		a'4 a | b8 a c b a g a2 b e, ~ e8 d c4 b | a bes1 c4 d2 |
		R1 r2 a' | b4 a d8 c b a | c d e4 r2 | b4. a8 g4 fis | e fis b2 r c |
		
		f, r1 r4 e e e2 es4 ~ es d4 d c | bes2. c4 d2 r c' f, |
		r4 d e fis a g2 g4 e d c d e d c2 | R1 d'2 c bes2. a2
		g fis4 ~ fis8 e d cis b a' g fis e1 | a2 g1 f2 ~ | f4 f g a a2 d,2.
		
		d4 e8 fis g2 g g4 ~ g g2. | d4 g4. d8 g2 g4 g8. a16 b c d e | f8 g, a b c4 d |
		e2. e,8 d c d e4 e d | c2 b a a4 e'!8 d c d c4 d d |
		d8 c b8. a16 a'2 a4 g f e d e2 f4 ~ f e8. f16 g f e d c8. d16 |
		
		e8 f g4 d2 d2. g4 ~ g1
	}
	\addlyrics {
		Ve -- ni 
		Cre -- _ a -- _ _ _ _ _ _ tor spi -- _ _ ri -- tus, spi -- ri -- tus,
		Cre -- _ _ a -- _ _ _ _ _ tor spi -- _ _ _ _ ri -- tus, re -- 
		
		ple tu -- o -- rum cor -- da fi -- de -- _ li -- um, re -- ple 
		tu -- o -- rum cor -- da fi -- de -- li -- um, fi -- de -- li -- um: et tu -- i a -- 
		mo -- _ _ _ _ _ _ _ _ ris, a -- mo -- ris, et tu -- i a -- mo -- 
		
		_ _ _ _ ris in e -- is i -- _ gnem ac -- cen -- _ _ _ _ _ de, __ _ et __ _ tu -- i 
		a -- mo -- _ _ _ _ ris, et tu -- _ i a -- mo -- _ _ _ _ ris, a -- 
		mo -- _ _ _ _ ris in e -- is i -- gnem ac -- cen -- _ _ _ _ _ _ _ 

		_ de, __ _ ac -- cen -- de.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
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
