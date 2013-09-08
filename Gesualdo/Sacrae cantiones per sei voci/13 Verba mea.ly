% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "3"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 70) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"13. Verba mea"
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
	\relative c' {
		R1 R R R R \break
		
		r2 a'2. f4 e2 c r r r4 b'4. b8 a4 b8 a g a \break
		b c d2 cis4 d d2 d,4 g2 r4 b e,2. e4 e' c c4. f,8 \break
		a4 g2 fis4 g1 b4 a8 g fis2. b4 d2 r4 e e,2. e4 f2 ~ \break
		
		f r4 a a2 d,4 e4. d8 d2 c4 d2 r4 d' d a b a8 g \break
		c b a g a2. gis4 a1 fis2 g e a1 c2. a4 b2 e, \break
		r2 a4 g2 c,4 r2 a'4 bes2 a4 c2 a1 r4 f2 fis4 g a2 g4 e2 \break
		
		gis2 r \ficta g! e8 f g a b a16 b c2 c4 a a g g2 g4 r2 R1 \break
		r4 d'4 d2. b4 b b r a c8 b a g f g a2 g4 a a a2. d,2 d'4 \break
		d b b2 b r d4 d g, g2 g4 r g g a a1 a1. \showBarLine \bar "|."
	}
	\addlyrics {
		Ver -- ba me -- a au -- ri -- bus per -- _ _ _ 
		_ _ _ ci -- pe, Do -- mi -- ne, in -- tel -- li -- ge cla -- mo -- rem 
		me -- _ _ um, Do -- _ _ _ mi -- ne, in -- tel -- li -- ge 
		
		cla -- mo -- rem me -- _ _ _ um, cla -- mo -- rem me -- _ _
		_ _ _ _ _ _ um. In -- ten -- de, in -- ten -- de vo -- ci,
		in -- ten -- de, in -- ten -- de vo -- ci o -- ra -- ti -- o -- nis me -- 

		æ, Rex me -- _ _ _ _ _ _ _ us et De -- us me -- us, 
		et De -- us me -- us, Rex me -- _ _ _ _ _ _ _ us et De -- us, et
		De -- us me -- us, et De -- us me -- us, et De -- us me -- us.
	}
}

sextus = \new Voice {
	\relative c'' {
		R1 R R R R
		
		R r2 r4 g2 e4 c d a'4. a8 e2 e8 d e f g4 g ~
		g fis8 g a2 b8 a g a b c d2 g,4 g2 a4 g8 f e4 c8 d e4 c' f,4. f8
		e2 r b'4 d2 g, b a8 g fis4 g fis4. \ficta fis8 b4 g b2. a2 d4 ~
		
		d a r2 r4 d2 c8 bes a4 bes a2 d d,4 f f2 d
		c4 e r2 R1 c'2 d b r4 e, f1 e2 r r r4 a ~
		a g d d2 c4 r e f2 c4 f2 c4 r2 c f4 d2 a4 bes d2 g4 g2
		
		e2 r R1 r2 r4 a c8 b a g16 f e8 f g2 d4 r b' b b g2
		fis2. \ficta fis4 g2. g4 e e r2 R1 a4 a2 d, d'4 d b
		b g fis2 g4 b b2 g4 g d d2 d4 r g e2 e4 a a e a,2 a1
	}
	\addlyrics {
		Ver -- ba me -- a au -- ri -- bus per -- _ _ ci -- pe, per -- 
		ci -- _ pe, per -- _ _ _ _ _ _ ci -- pe, Do -- _ _ _ mi -- _ ne, in -- tel -- li -- 
		ge cla -- mo -- rem me -- _ _ um, in -- tel -- li -- ge cla -- mo -- rem me -- 
		
		um, cla -- _ _ mo -- _ rem me -- um, cla -- mo -- rem 
		me -- um. In -- ten -- de, in -- ten -- de, in -- 
		ten -- de vo -- ci, in -- ten -- de vo -- ci, vo -- ci o -- ra -- ti -- o -- nis me -- 
		
		æ, Rex me -- _ _ _ _ _ _ _ us et De -- us me -- 
		us, et De -- us me -- us, et De -- us, et De -- us,
		De -- us me -- us, et De -- us, De -- us me -- us, et De -- us, et De -- us me -- us.
	}
}

altus = {
	\new Voice = "altus" {
		\relative c' {
			\clef "treble_8"
			R1 r4 e2 c4 a2 g4 g2 e4 c' a d4. d8 b2
			
			c8 b a b c d e2 d4 e c2 g4 c f2 e4 c b c4. c8 b2 ~
			b e,4. e8 g4 b8 c d c b a b4 c b e2 d8 c b4 c g' a2 a,4
			e'2 a d,2. d4 e2. d4 d g, b2 g'4 g g2 c,2 d8 c16 d e4 ~
			
			e d r e a, a bes2 r f'4 f2 d4 r2 d4 d2 b4
			e2. d4 e1. r2 d4 e2 c4 f2. c4 g'2 a4 fis g2 c,4 c
			d2. b4 r2 c d f1 f2. c4 r bes \ficta bes c d2. d4 b2
			
			e2. e4 c8 d e f g2. c,2 f4 f e e2 e4 d d1 e2
			fis4 a a2 d, e e4 c c2 a r r4 e'4 d8 e fis g fis e16 fis g2 g4
			R1 g,2 g2. g'4 d2 d r4 e e2 c4 c c e e2 e1
		}
	}
	\addlyrics {
		Ver -- ba me -- a, ver -- ba me -- a au -- ri -- bus 
		
		per -- _ _ _ _ _ _ ci -- pe, Do -- mi -- ne, ver -- ba me -- a au -- ri -- bus,
		au -- ri -- bus, per -- _ _ _ _ _ _ ci -- pe, Do -- _ _ _ mi -- ne, Do -- mi --
		ne, in -- tel -- li -- ge cla -- mo -- rem me -- um, cla -- mo -- rem me -- _ _ _ 
		
		um, in -- tel -- li -- ge cla -- mo -- rem, cla -- mo -- rem
		me -- _ um. In -- ten -- de vo -- ci, in -- ten -- de vo -- ci, in -- 
		ten -- de, in -- ten -- de vo -- ci o -- ra -- ti -- o -- nis me -- 
		
		æ, Rex me -- _ _ _ _ us et De -- us me -- us, et De -- us,
		De -- us me -- us, et De -- us me -- us, Rex me -- _ _ _ _ _ _ _ us
		et De -- us me -- us, et De -- us, et De -- us me -- us.
	}
}

quintus = {
	\new Voice = "quintus" {
		\relative c' {
			\clef "treble_8"
			a2. g4 e2 c4 f4. f8 d4 e8 d c d e fis g2 fis4 g2 d'4 c8 b
			
			a4 c e4. c4 c8 a4 c4. d8 e d c b a2. c4 e1.
			d4. d8 e2 b8 c d c b a g fis g4. e8 g2 R1 r4 f' e8 d c4 ~
			c e c2 R1 b2. fis4 b2 r4 d g,2. g4 a2 a4 a4 ~
			
			a d, e d8 c c'4 d r2 f4 f,2 f4 a f' f bes, a2 g
			R1 r2 r4 c2 e d4 r b c1 a2 e'2. c4 R1
			r2 fis,4 g2 e4 a2 d, r f4 a2 c4 c2 a4 d d c bes d, d2 e ~
			
			e2 r r r4 e g8 f e d c2. e4 g2 g1 fis2 e4 e
			d d2 d4 r2 e4 e'8 d c b a4 g8 f e4 f f2 d8 e f g a4 fis d' d2 b ~
			b1 b b2 r r r4 c c2 a4 e' e cis cis2 cis1
		}
	}
	\addlyrics {
		Ver -- ba me -- a au -- ri -- bus per -- _ _ _ _ _ _ ci -- pe, Do -- _ _

		_ mi -- ne, au -- ri -- bus per -- _ _ _ _ _ _ ci -- pe,
		au -- ri -- bus per -- _ _ _ _ _ _ _ _ ci -- pe, Do -- _ _ _ 
		mi -- ne, Do -- mi -- ne, in -- tel -- li -- ge cla -- mo -- 
		
		rem me -- _ _ _ um, in -- tel -- li -- ge cla -- mo -- rem me -- um.
		In -- ten -- de, in -- ten -- de vo -- ci, 
		in -- ten -- de vo -- ci, in -- ten -- de vo -- ci o -- ra -- ti -- o -- nis me -- æ,
		
		Rex me -- _ _ _ _ us et De -- us, et De -- 
		us me -- us, Rex me -- _ _ _ _ _ _ _ us, Rex me -- _ _ _ _ us et De -- us
		me -- us, et De -- us, et De -- us me -- us.
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c' {
			\clef "treble_8"
			R1 R R r2 r4 c2 b4 g2
			
			e1 r2 g4. g8 e2 f8 e d e f g a2 gis4 a2 g ~
			g4 d a' a d,2. d4 d' e e b c b8 a e'4 e, c'2. f,4
			c'2 r b1 e,4 e fis b b e, fis e8 d d' c b a b2 e, r
			
			a4 a2 e4 f e8 d g2 d a' d,4 d d'2 r d4 d
			a c2 b8 a b2 a1. g2. a2 f4 c'2 c, r e'4 b2 a4
			b2 a4 d e2 e, a4 g8 f c'1 f, r4 f4 f a d,2 g g
			
			b4 b a8 b c d e4. d8 c2 d4 a a c c2 c2. b2 g8 a b c d2 cis4
			d1 b4 d8 c b a g4 a2 e'4 e2 d4 d2 c a2. g4. a8 b c
			d b e2 dis4 e2. d4 d b b2 b r4 g g e e1 e1.
		}
	}
	\addlyrics {
		Ver -- ba me -- 
		
		a au -- ri -- bus per -- _ _ _ _ _ _ ci -- pe, Do -- 
		mi -- ne, in -- tel -- li -- ge cla -- mo -- rem me -- _ _ _ um, Do -- mi --
		ne, in -- tel -- li -- ge cla -- mo -- rem me -- _ _ _ _ _ _ _ um,
		
		cla -- mo -- rem me -- _ _ _ um, in -- tel -- li -- ge cla -- mo -- 
		rem me -- _ _ _ um. In -- ten -- de vo -- ci, vo -- ci, in -- 
		ten -- de, in -- ten -- de vo -- _ _ _ ci o -- ra -- ti -- o -- nis me -- 
		
		æ, Rex me -- _ _ _ _ _ _ us et De -- us me -- us, Rex me -- _ _ _ _ _ 
		us, Rex me -- _ _ _ _ us et De -- us me -- us, Rex me -- _ _ _
		_ _ _ _ us et De -- us me -- us, et De -- us me -- us.
	}
}

bassus = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			R1 R r2 r4 e2 c4 a2 g r
			
			a4. a8 a2 f'4. f8 c2 R1 a4. b8 c d e4 a,2 e'4 d8 c
			b2 a g r r4 c e4. e8 a4 a2 g4 c, f4. g8 a4 ~
			a8 b c b a2 g g4 g2 e4 b1 b2 b'4 e,4. e8 e4 r2 d
			
			f4 e8 d c4 b a2 g R1 d''4 bes2 \ficta bes4 f d g2
			a4 a8 b a g f4 e2 a, r d g, c f, a r a' e2. a,4
			d2 d c a r f' f, r f' f,4 bes \ficta bes a g f! bes b! r2
			
			R1 R r4 a c8 b a g f4 c' c e g g r2 b, g'
			a a g4 g2 e4 a4 g8 f e4 c d f8 e d c b4 a2 d4 d2 b4 b g8 a
			b1 e2 g4 g2 g4 g2 g, r4 c4 e a, a1 a1.
		}
	}
	\addlyrics {
		Ver -- ba me -- a 
		
		au -- ri -- bus, au -- ri -- bus per -- _ _ _ ci -- pe, Do -- _ _ 
		_ mi -- ne, in -- tel -- li -- ge cla -- mo -- rem me -- _ _
		_ _ _ _ um cla -- mo -- rem me -- um, in -- tel -- li -- ge cla -- 
		
		mo -- rem __ _ me -- _ _ um, in -- tel -- li -- ge cla -- mo -- 
		rem me -- _ _ _ _ _ um. In -- ten -- de vo -- ci, in -- ten -- de 
		vo -- ci, vo -- ci, vo -- ci, vo -- ci o -- ra -- ti -- o -- nis me -- æ,
		
		Rex me -- _ _ _ us et De -- us me -- us, De -- us 
		me -- us, et De -- us me -- _ _ _ us, Rex me -- _ _ _ _ us et De -- us, De -- us __ _
		me -- us, et De -- us me -- us, et De -- us me -- us.
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
