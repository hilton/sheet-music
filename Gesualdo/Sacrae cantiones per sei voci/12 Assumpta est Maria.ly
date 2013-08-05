% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "2"

#(set-global-staff-size 15.5)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15.5 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 5) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"12. Assumpta est Maria"
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
		\Voice 
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\consists "Ambitus_engraver"
	}
}


global= { 
	\key f \major
	\tempo 2 = 48
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantus = \new Voice {
	\transpose c c \relative c' {
		R1 R r2 f f2. f4 \break a a c4. bes8 a g a4. bes16 c d4
		c2 c4 f,2 e8 f16 g a2 e d2 ~ \break d4 g2 fis4 g4. a8 bes c d4 g,2 f
		
		f4 f a1 r4 g \break d'1 d2 r4 c2 d cis8 b
		cis2 d2. bes2 c4 ~ \break c8 bes8 a4 d, d8 e f g a2 g4 bes8 c d bes c4. c8
		d1 r2 r4 a8 bes \break c a c2 b4 c d2 d4 c d4. c16 bes a8 b
		
		c4 g2 c8 bes a g a4 d,2 \break f4. f8 d2 r d4 d'4. c16 bes c4 f,8 g a bes
		c4 \tupletUp \times 1/1 { f,2 e } c d4 ~ \break d4 c4 e4. e8 f2 r \tupletUp \times 1/1 { c'2 bes2. } g4 a2
		f2 g4. g8 \break f4 a d4. c16 d es2 c r4 c,2 c' a4 a b!
		
		c2. a4 \break d4. d8 g,4 e g4. a16 bes c4 c c2. bes4 a c c2. c4 c2 \showBarLine \bar "|."
	}
	\addlyrics {
		As -- sum -- pta est Ma -- ri -- _ _ _ _ _ _ _
		a, Ma -- ri -- _ _ _ _ a in cæ -- _ _ _ _ _ _ lum, as -- 
		
		sum -- pta est Ma -- ri -- a in cæ -- _ _
		_ lum, in cæ -- _ _ lum: gau -- _ _ _ _ dent An -- _ _ _ _ ge --
		li, gau -- _ _ _ _ _ dent An -- ge -- li, gau -- _ _ _ _
		
		_ dent, gau -- _ _ _ _ dent An -- ge -- li, lau -- dan -- _ _ _ tes__ _ _ _
		_ be -- _ ne -- di -- cunt Do -- mi -- num, be -- _ ne -- di -- 
		cunt Do -- mi -- num, lau -- dan -- _ _ _ tes, lau -- dan -- tes be -- ne -- 
		di -- cunt Do -- mi -- num, lau -- dan -- _ _ _ tes be -- ne -- di -- cunt Do -- mi -- num.
	}
}

sextus = \new Voice {
	\transpose c c \relative c' {
		R1^\markup { \italic "Resolutio in Diapason" } R R R R f2 f2.
		 f4 a4 bes c1. d2 R1 R r2 bes1
		
		 \tupletUp \times 1/1 { c1 bes2 ~ bes1. } a1 r2
		R1 R R r2 bes4. a8 g a bes2 a8 g
		f2 g R1 R r4 bes2 bes4 a1
		
		R1 r2 bes c4. bes16 c d2 c r R1
		R r2 f, g4. f16 g a1 g r2 R1
		R1 r2 \tupletUp \times 1/1 { bes1 a } g2 a f
		
		g4. g8 f2 R1 \tupletUp \times 1/1 { c'2 a } g a f g2. g4 a2
	}
	\addlyrics {
		As -- sum -- 
		pta est Ma -- ri -- a in
		
		cæ -- _ lum:
		gau -- _ _ _ _ _ _
		_ dent An -- ge -- li,
		
		lau -- dan -- _ _ _ tes,
		lau -- dan -- _ _ _ tes
		be -- _ ne -- di -- cunt
		
		Do -- mi -- num, be -- _ ne -- di -- cunt Do -- mi -- num.
	}
}

altus = {
	\new Voice = "altus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			R1^\markup { \italic "Resolutio in Diapente" } R R R R R
			c2 c2. c4 e f g1 ~ g2 a2 R1 R
			
			r2 f1 \tupletUp \times 1/1 { g2 ~ g f\breve } e1
			r2 R1 R R r2 f4. e8
			d e f2 e8 d c2 d R1 R r4 f2 f4
			
			e1 R r2 f g4. f16 g a2 g r
			R1 R r2 c, d4. c16 d e1 d r2
			R1 R r2 \tupletUp \times 1/1 { f1 e } d2
			
			e2 c d4. d8 c2 ~ c\longa
		}
	}
	\addlyrics {
		As -- sum -- pta est Ma -- ri -- a
		in cæ -- _ lum:
		
		gau -- _
		_ _ _ _ _ _ dent An -- ge -- 
		li, lau -- dan -- _ _ _ tes,
		lau -- dan -- _ _ _ tes
		be -- _ ne --
		di -- cunt Do -- mi -- num. __ _
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c c \relative c {
			\clef "treble_8"
			R1^\markup { \italic "Canon in Diapason et Diapason" }  R f2 f2. f4 a bes c1. d2
			R1 R1 r2 bes2 ~ bes \tupletUp \times 1/1 { c1 bes\breve
			
			 } a1 r2 R1 R R
			r2 bes4. a8 g a bes2 a8 g f2 g R1 R
			r4 bes2 bes4 a1 R1 r2 bes2 c4. bes16 c d2
			
			c2 r R1 R r2 f, g4. f16 g a1
			 g1 r2 R1 R r2 \tupletUp \times 1/1 { bes1 a1
			 } g2 a f g4. g8 f2 R1 \tupletUp \times 1/1 { c'2 a }
			 
			g2 a f g2. g4 a c2 bes4 a2. c4 g2. g4 f2
		}
	}
	\addlyrics {
		As -- sum -- pta est Ma -- ri -- a
		in cæ -- _ lum:
		gau -- _ _ _ _ _ _ _ dent 
		An -- ge -- li, lau -- dan -- _ _ _
		
		tes, lau -- dan -- _ _ _
		tes be -- _
		ne -- di -- cunt Do -- mi -- num, be -- _ ne -- 
		di -- cunt Do -- mi -- num, be -- ne -- di -- cunt Do -- mi -- num.
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c c \relative c' {
			\clef "treble_8"
			R1 c2 c2. c4 \tupletUp \times 1/1 { d2 c } f,2 ~ f g2 a d,
			f2. e8 d c2 c'4 c2 g4. a8 bes c d2 a4 a e'2 d r f,4 f'8 es
			
			d8 c d4 c c c c es2 d d4 d, bes' bes c8 bes a g f4 e8 d a'2
			a4 a d1 g,4 c d4. c8 bes a bes4 a d, d'4. c8 d e f es16 d c8 f, f'2
			 d4 r2 f,8 g a f f'4 f e8 d e c d4 d g, d'2 d,4 a' d, f4. e16 f
			
			g2 c,4 g' c4. bes16 c bes4 g r2 d4 bes'4. a16 g c4 a2 r4 c d8 e f4.
			 e8 d2 c4 c, e f e8 d g4 e2 a a4 c4. bes16 a g1 g2. f4
			d a' c4. bes16 c d8 e f e d4. d8 bes4 bes c4. bes16 c a4 f g e e e f4. f8
			
			c2 r a' e'8 d c d e2 e4 e,2 g4 c8 d16 e f4. c8 f2 e8 d e4. e8 f2
		}
	}
	\addlyrics {
		As -- sum -- pta est __ _ Ma -- ri -- a in
		cæ -- _ _ _ lum, Ma -- ri -- _ _ _ _ a in cæ -- lum, in cæ -- _
		
		_ _ _ lum, as -- sum -- pta est, as -- sum -- pta est Ma -- ri -- _ _ _ _ _ _ _
		a in cæ lum, in cæ -- _ _ _ _ lum, in cæ -- _ _ _ _ _ _ _ _ _ 
		lum: gau -- _ _ _ _ dent An -- _ _ _ _ ge -- li, An -- ge -- li, lau -- dan -- _ _
		
		_ tes, lau -- dan -- _ _ _ tes, lau -- dan -- _ _ _ tes, lau -- dan -- _ _
		_ _ tes be -- ne -- di -- _ _ _ cunt Do -- mi -- num, __ _ _ _ be -- ne -- 
		di -- cunt Do -- _ _ _ _ _ _ _ mi -- num, lau -- dan -- _ _ _ tes be -- ne -- di -- cunt Do -- mi -- 
		
		num, lau -- dan -- _ _ _ _ tes be -- ne -- di -- _ _ _ cunt Do -- _ _ _ mi -- num.
	}
}

bassus = {
	\new Voice = "bassus" {
		\transpose c c \relative c {
			\clef "bass"
			f2 f2. f4 a a c2. bes2 a8 bes c4 d c f,2 e4 f4. g8 a2
			r f g c,1 bes4 g8 a bes a bes c a2 g g4 g'8 f es2. d8 c
			
			bes2 f'4 f f, a g2 ~ g4 g4 bes bes d d f4. g8 a2 a,2.
			 a4 bes8 c d e16 f g4. f8 es d \ficta es4 d2 g4 g, d' e!8 f g2. d4 f2
			bes, r1 d8 e f d e f g e f4 d c bes!2 f'4 f a d,2
			
			e4. f8 g f e4 f2 g8 a bes g a f g a bes4 d, e2 d g4 f8 e d4. c16 bes
			a4 bes c2 c4 c'4. bes16 a g8 f e4. e8 c bes a4 d8 e f4 e c4. d8 e f g4. a8 bes2 r
			d, e d4 a bes4. bes8 es2 r f4 a e8 d c bes a bes c a d2
			
			r2 r4 f d2 e4. d8 c d e4 a,4. bes8 c4 d8 e f1 c f,2
		}
	}
	\addlyrics {
		As -- sum -- pta est Ma -- ri -- _ _ _ _ _ _ _ _ a, __ _ _
		Ma -- ri -- _ _ _ _ _ _ _ _ _ a in cæ -- _ _ _ _ 
		
		_ lum, as -- sum -- pta est, as -- sum -- pta est Ma -- ri -- _ _ a
		in cæ -- _ _ _ _ _ _ _ _ _ _ lum, in cæ -- _ _ _ _ _
		lum: gau -- _ _ _ _ _ _ _ _ _ dent An -- ge -- li, lau -- dan -- 
		
		_ _ _ _ tes gau -- _ _ dent __ _ An -- _ _ ge -- li, lau -- dan -- tes lau -- dan -- _ _ _ _
		_ _ tes lau -- dan -- _ _ _ _ _ _ _ _ tes be -- ne -- di -- cunt Do -- _ mi -- _ num __ _ _
		be -- ne -- di -- cunt Do -- mi -- num, lau -- dan -- _ _ _ _ _ _ _ _ tes
		
		lau -- dan -- _ _ _ _ tes be -- ne -- di -- cunt _ Do -- mi -- num.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 16)
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
