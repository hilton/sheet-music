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
		"15. Domine Deus"
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
		\override TupletNumber #'stencil = ##f 
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
		R1 R r2 c4 b8 a g4 c, f e2 d4 e2 ~ \break
		e r4 g2 e fis4 g e e2 R1 r4 c'2 a8 g \break
		f4 g2 d'4. c8 d e a,1 d, r2 c'2 b2 ~ \break
		
		b4 c d e e2 r R1 g,2. f8 e d2 fis r a ~ \break
		a2 d,4 d2 c c' bes8 a g4 f a4. g8 a b c2 b4 r2 \break
		R1 d2 g,4 g a4. a8 d,2 d' a4 a c4. c8 cis4 e \break
		
		a,2. d2 g,4 r2 e' gis,4 gis b4. b8 d4 d b1.
		 r4 d, a'2 a4 a d c a g8 g e2 f R1
		g4 c2 b4 gis a8 a b2 a1 R d4. d8 b4 d8 c
		
		b8 a b2 a8 gis a2 g! R1 d'4. d8 d,4 a'4. a8 f4 a2
		fis4 g4 g2 c,4 e8 d e fis g1. a4 a4. a8 f4 g e
		r d'4. d8 b4 d d, r d'2. d4 gis, a2 gis8 fis \ficta gis2 a1 \showBarLine \bar "|."
	}
	\addlyrics {
		Do -- mi -- ne De -- us me -- _ _ us,
		ne de -- re -- lin -- quas me, Do -- mi -- ne 
		De -- us me -- _ _ _ _ us, ne de -- 
		
		re -- lin -- quas me, Do -- mi -- ne De -- us, De -- 
		us me -- us, Do -- mi -- ne De -- us me -- _ _ _ _ us, 
		et ne di -- sces -- se -- ris, et ne di -- sces -- se -- ris a
		
		me, et ne, et ne di -- sces -- se -- ris a me;
		in -- ten -- de in ad -- ju -- to -- ri -- um me -- um,
		in ad -- ju -- to -- ri -- um me -- um, Do -- mi -- ne De -- 
		
		_ _ _ _ _ _ _ us, Do -- mi -- ne, Do -- mi -- ne De -- 
		us sa -- lu -- tis me -- _ _ _ _ æ, Do -- mi -- ne De -- us,
		Do -- mi -- ne De -- us sa -- lu -- tis me -- _ _ _ æ.
	}
}

sextus = \new Voice {
	\relative c'' {
		R1 R R R r4 g2 e4 ~
		e fis g e e2 r R1 r4 d' a b c4. c8 c2 ~
		c4 b g2 r4 g4 f8 e d4 f2 fis fis d'4 b2 a4 d2 ~
		
		d4 c g2 r4 c f, f g4. g8 a4 f g2 r4 d'1 c8 b a2 cis ~
		cis d b4 g e2 R1 R r2 d'2 ~
		d4 c8 bes a4 c f,4 d g2. f8 e d4 a' a g r f e e a4. a8
		
		a2 d b e a,4 a b4. b8 g!4 g f! a g2. g4
		fis2 \ficta fis4 d d2 d R1 r4 e a f e g8 g a2
		e r e4. e8 fis4 e a c2 c c4 c4 c2 b4. b8 g4
		
		d4. d8 c2 e4 c8 d e2 r4 b' a a g4. f16 e d4 c R1
		r4 d'4. d8 d,4 g a8 b c2 b4 g d'2 e a,4. g8 f2 r
		d'4. d8 b4 d8 c b a g4 a2 d,8 f e d b4 e a e e2 e1
	}
	\addlyrics {
		Ne de -- 
		re -- lin -- quas me, et ne di -- sces -- se -- ris 
		a me, Do -- mi -- ne De -- us me -- us, ne de -- re -- lin -- 
		
		quas me, et ne di -- sces -- se -- ris a me, Do -- mi -- ne De -- us,
		De -- us me -- us, Do -- 
		mi -- ne De -- us me -- us, Do -- mi -- ne De -- us me -- us, et ne di -- sces -- se -- 
		
		ris a me, et ne di -- sces -- se -- ris a me, a me; in --
		ten -- de, in -- ten -- de in ad -- ju -- to -- ri -- um me -- 
		um, Do -- mi -- ne De -- us sa -- lu -- tis me -- æ, Do -- mi -- ne,
		
		Do -- mi -- ne De -- _ _ us sa -- lu -- tis me -- _ _ _ æ,
		Do -- mi -- ne De -- _ _ _ us sa -- lu -- tis me -- _ æ,
		Do -- mi -- ne De -- _ _ _ us sa -- lu -- _ _ _ tis, sa -- lu -- tis me -- æ.
	}
}

altus = {
	\new Voice = "altus" {
		\relative c' {
			\clef "treble_8"
			f2 e2. fis4 g e e1. r1 c4 b8 a
			g4 a e'4. d8 e f g4 g2 r4 g c, cis d4. d8 e2. g4 f2
			R1 r2 d4 c8 b a2 fis1 b2 e4 e d fis
			
			g2. e4 e a2 g8 f e2 a,4 f'2 e4 r2 a1. cis,4 cis
			e4. e8 a4 g e e a,2 a'4 d,2 d4 e4. e8 d4 a'2 gis4 \ficta g! f8 e
			d2. e4 f2. e8 d e4 f a g8 fis g4 g, a2 g r4 e'4
			
			d4 d fis4. fis8 g4. \ficta f!8 e1. r2 r4 d g,2 g4 b2
			 b2 g'4 fis2 fis r4 a, \ficta f'! d c2. a8 a e'4. d8 c b16 c d4
			g,4 g d'2. c4 b e,8 e c'2 f g4. g8 e4 a2 g4 g1
			
			 e\breve r4 f g g f1 e2
			R1 g2 a4 a d,4. c8 b a g2 g4 r2 a4. a8 g4 g'2
			 fis4 r g, g' g f1 e2 ~ e\breve
		}
	}
	\addlyrics {
		Ne de -- re -- lin -- quas me, Do -- mi -- ne 
		De -- us me -- _ _ _ _ us, et ne di -- sces -- se -- ris a me,
		Do -- mi -- ne De -- us me -- us, ne de -- re -- 
		
		lin -- quas me, Do -- mi -- ne De -- us me -- us, et ne di -- 
		sces -- se -- ris a me, et ne, et ne di -- sces -- se -- ris a me, Do -- mi -- ne 
		De -- us me -- _ _ _ us, Do -- mi -- ne De -- us me -- us, et

		ne di -- sces -- se -- ris a me, a me; in -- ten -- 
		de, in -- ten -- de in ad -- ju -- to -- ri -- um me -- _ _ _ _ _
		um, in ad -- ju -- to -- ri -- um me -- um, Do -- mi -- ne De -- us, De --
		
		us, sa -- lu -- tis me -- æ,
		sa -- lu -- tis me -- _ _ _ _ æ, Do -- mi -- ne De -- 
		us sa -- lu -- tis me -- æ.
	}
}

quintus = {
	\new Voice = "quintus" {
		\relative c' {
			\clef "treble_8"
			R1 r2 r4 c2 a b4 c a a1 r2
			r r4 b g2. a4 b2 a a c4 b8 a g4 c, c'4. b8
			c d e2 d4 d g, a2. d4 r2 r4 d g, gis a4. a8 b2
			
			e2 d4 b e,4 e b'2. b4 d2. c4 b2 R1 r2 e
			e, fis4 g2 e4 e2 r d'4 c8 bes a2. a4 e'2 b
			R1 r2 g c,4 c d4. d8 bes'4 d c2 r a ~
			
			a4 d,2 d4 d'4. d8 c4 c2 a4 r2 e' d d2. e4
			dis2 \ficta d!2 ~ d1 R1 e,4 e'2 d4 c b8 b a2
			c f,4. f8 e4 e' dis e e2 a, c1 d2 r
			
			r2 e,1 g2. g4 f2 d r1 e4. e8
			d2 d'4. d8 c4 e2 a,4 g d'2 d c8 b a g a4 d,2 r
			a' b2. b4 a2. b2 a4 c c b2 a1
		}
	}
	\addlyrics {
		Ne de -- re -- lin -- quas me,
		ne de -- re -- lin -- quas me, Do -- mi -- ne De -- us me -- _
		_ _ _ us, De -- us me -- us, et ne di -- sces -- se -- ris
		
		a me, et ne di -- sces -- se -- ris a me, ne
		de -- re -- lin -- quas me, Do -- mi -- ne De -- us me -- us,
		et ne di -- sces -- se -- ris a me, et
		
		ne di -- sces -- se -- ris a me; in -- ten -- de, in -- 
		ten -- de in ad -- ju -- to -- ri -- um me --
		um, Do -- mi -- ne De -- us sa -- lu -- tis me -- æ,
		
		sa -- lu -- tis me -- æ, Do -- mi -- 
		ne, Do -- mi -- ne De -- us sa -- lu -- tis me -- _ _ _ _ æ,
		sa -- lu -- tis me -- æ, sa -- lu -- tis me -- æ.
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c' {
			\clef "treble_8"
			R1 R R r2 r4 c2 b8 a g4 c,
			c'2 b1. R1 R c2 a ~
			a4 b c b b2 r d4 c8 b a4 b b8 a b cis d4 d, R1
			
			R a'2 d,4 d e4. e8 fis4 a g2 d' a1 e'2 a, ~
			a4 a2 b4. b8 c4 e2 d r R1 R
			bes4 a8 g f4 a d2 c2. c2 bes8 a g4 d e f c'2 e4 c
			
			f,4 fis a4. a8 b2 g e b'1 a2 r r4 e
			fis2 fis4 g a2 a b4 e d b2 a8 a cis4 d R1
			r2 a4 d b a2 gis8 gis a4. b8 c2 g r4 f'4. f8 d2 g,2

			 d4 a'1 b2 b c4 d d bes2 a8 \ficta b! c a d2 cis4
			d2 b4. b8 g2 r R1 e'4. e8 d4 f8 e d c d2 cis4
			d1 d d2. c4 e2 e,1.
		}
	}
	\addlyrics {
		Do -- mi -- ne De -- us 
		me -- us, ne de -- 
		re -- lin -- quas me, Do -- mi -- ne De -- us me -- _ _ _ _ us,
		
		et ne di -- sces -- se -- ris a me, et ne, et ne 
		di -- sces -- se -- ris a me,
		Do -- mi -- ne De -- us me -- us, Do -- mi -- ne De -- us, De -- us me -- us, et
		
		ne di -- sces -- se -- ris a me, a me; in --
		ten -- de, in -- ten -- de in ad -- ju -- to -- ri -- um me --	um,
		in ad -- ju -- to -- ri -- um me -- _ _ um, Do -- mi -- ne De -- 
		
		us sa -- lu -- tis, sa -- lu -- tis me -- _ _ _ _ _ _
		æ, Do -- mi -- ne, Do -- mi -- ne De -- _ _ _ _ _
		us sa -- lu -- tis me -- æ.
	}
}

bassus = {
	\new Voice = "bassus" {
		\relative c' {
			\clef "bass"
			R1 c4 b8 a g4 c, c'4. b8 a4 g8 f e d c4 c2 a4 b c2
			c e1. e2 a,4. a8 d4. d8 c1 f8 g a4 ~
			a g2 g f8 e d4 d d2 d d4 b b2 a r
			
			e'4 d8 c b4 g a a r1 r4 d g,2 g'2. f8 e d2. c8 b a2
			a r r4 c2 a4 f g8 a bes c d4 c d8 e f g a4 e2 r
			r4 f4. e8 d c bes2 c a bes8 c d4 g, bes a2 e'8 d c bes a4 a'
			
			a8 g fis e d2 g c,4 c c4. c8 e2 e f4 f g2. e4
			b2 b4 b d!2 d R1 r2 r4 d a' g2 f4
			c8 c d e f2 R1 a4. a8 f4 f e c2 f4 d g g,1
			
			 c4. b8 a2 e'1 a,4 d bes g8 a bes4 f'2 e8 d a2
			a'4. a8 g2 c, a r4 g'4 g2 c,2 f8 e d e f2 e
			d g1 d e2 e1 a,
		}
	}
	\addlyrics {
		Do -- mi -- ne De -- us me -- _ _ _ _ _ _ us, ne de -- re -- lin -- 
		quas me, et ne di -- sces -- se -- ris a __ _ _
		me, Do -- mi -- ne De -- us me -- us, De -- us me -- us,
		
		Do -- mi -- ne De -- us me -- us, a me, Do -- mi -- ne De -- us _ me -- 
		us, a me, Do -- mi -- ne De -- _ us me -- _ _ _ _ _ us,
		Do -- _ mi -- ne De -- us me -- _ _ _ _ _ us, De -- _ _ _ us me --
		
		_ _ _ _ us, et ne di -- sces -- se -- ris a me, a me; in -- 
		ten -- de, in -- ten -- de in ad -- ju -- to -- 
		ri -- um me -- _ um, Do -- mi -- ne De -- us sa -- lu -- tis me -- æ,
		
		Do -- mi -- ne De -- us sa -- lu -- _ _ tis me -- _ _ æ,
		Do -- mi -- ne De -- us sa -- lu -- tis me -- _ _ _ _ _ 
		æ, sa -- lu -- tis me -- æ.

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
