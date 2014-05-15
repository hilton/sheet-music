% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "3"
\pointAndClickOff

#(set-global-staff-size 14)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 14 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 15\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"Adoramus te Christe"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Claudio_Monteverdi" "Claudio Monteverdi" (1567 – 1643) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
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
	\context {
		\Score
		proportionalNotationDuration = #(ly:make-moment 1 14)
      \override SpacingSpanner #'uniform-stretching = ##t
	}
}


global= { 
	\key c \major
	\tempo 2 = 52
	\time 4/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantoA = \new Voice {
	\relative c'' {
		a1. a2 a1 g r2 b1 b2 b b a e'2 ~ | \break e1 cis8 \ficta cis d2 \ficta cis4 
		d d8 d d1 c4 c b1 a2 c | \break c4 b a4. a8 g2 a a4 g f4. f8 e2 e'
		
		e4 d c4. c8 e1 | \break d c \showBarLine \bar "|" r2 d2. c8 b a4 a8 b | \break c b c a b4 b e2. d8 c
		b4 b8 b c b c a b1 | \break a r1 R\breve | \break d2. c8 b
		
		a4 a8 a b a b g a1 g4 b2 a8 g | \break fis4 \ficta fis8 \ficta fis a2. g8 \ficta f! e4 e8 e
		g4 g b2. a8 g fis4 \ficta fis8 g a g a a gis1 \ficta gis2 c b
		
		b4 b a1 gis2 a1 \showBarLine \bar "|" | \break g1. fis2 g1 g1. d'1 c2 d1 b | \break d2. d4 
		d2 c b1 a g2. g4 g2 f e1 fis \fermata \showBarLine \bar "|."
	}
	\addlyrics {
		A -- do -- ra -- mus, a -- do -- ra -- mus te, te, a -- do -- ra -- _
		mus, a -- do -- ra -- mus te Chri -- ste, et be -- ne -- di -- ci -- mus, et be -- ne -- di -- ci -- mus, et
		be -- ne -- di -- ci -- mus ti -- bi. Qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum, qui -- a per 
		san -- gui -- nem tu -- um pre -- ti -- o -- sum, qui -- a per 
		san -- gui -- nem tu -- um pre -- ti -- o -- sum, qui -- a per san -- gui -- nem, qui -- a per san -- gui -- nem,
		qui -- a, qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de --
		mi -- sti mun -- _ dum. Mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- 
		re -- re no -- bis, mi -- se -- re -- re no -- bis.
	}
}

cantoB = \new Voice {
	\relative c' {
		f1. e2 fis1 g r2 g g a1 gis2 a1 a2. b8 b a1
		a2. a8 a gis4. \ficta gis8 a4 a2 gis8 fis \ficta gis2 a a a4 g f4. f8 e2 c' c4 b a4. a8 g2 c
		
		c4 b a4. a8 c2 c ~ c b2 c1 b2. a8 g fis2. \ficta fis8 g a g a fis g4 g c2. b8 a
		g4 g8 g a g a fis gis4 a2 \ficta gis4 a1 r1 r\breve b2. a8 g
		
		fis4 \ficta fis8 \ficta fis g \ficta fis g g \ficta fis4 g2 \ficta fis4 g d'2 c8 b a4 a8 a c2. b8 a g4 g8 g
		b4 b d2. c8 b a4 a8 b c b c a b1 b2 e d

		d c b1 a e1. c2 d1 e b'1. g2 a1 g b2. b4
		b2 a4 a2 gis8 fis8 \ficta gis2 a1 e2. e4 e2 d4 d2 cis8 b \ficta cis2 d1 \fermata
	}
	\addlyrics {
		A -- do -- ra -- mus, a -- do -- ra -- mus te, te, a -- do -- ra -- 
		mus, a -- do -- ra -- mus te Chri -- _ _ _ ste, et be -- ne -- di -- ci -- mus, et be -- ne -- di -- ci -- mus, et 
		
		be -- ne -- di -- ci -- mus ti -- _ bi. Qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum, qui -- a per 
		san -- gui -- nem tu -- um pre -- ti -- o -- _ _ sum, qui -- a per 
		
		san -- gui -- nem tu -- um pre -- ti -- o -- _ _ sum, qui -- a per san -- gui -- nem, qui -- a per san -- gui -- nem,
		qui -- a, qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de --
		
		mi -- sti mun -- dum. Mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- 
		re -- re no -- _ _ _ bis, mi -- se -- re -- re no -- _ _ _ bis.
	}
}

alto = \new Voice {
	\relative c' {
		d1. e2 d1 d r2 e1 fis2 e e e1 e2. e8 e e1
		fis2. \ficta fis8 \ficta fis e2 e4 e e1 e2 e e4 e c4. c8 c2 e e4 e c4. c8 c2 g'
		
		g4 g e4. e8 g1 g g g2. f8 e d2. c8 b a a a a e'4 e c2 d
		e a, e' e r1 e2. f4 g2 g g1 g
		
		r1 r\breve r1 r2 g2. 
		f8 e d2 d4 d d d e e e1 e2 g f
		
		e2 e e1 e c c2 c1 b2 c1 d g2 g1 fis2 g1 g2. g4
		g2 e e1 e c2. c4 c2 a a1 a \fermata
	}
	\addlyrics {
		A -- do -- ra -- mus, a -- do -- ra -- mus te, te, a -- do -- ra -- 
		mus, a -- do -- ra -- mus te Chri -- ste, et be -- ne -- di -- ci -- mus, et be -- ne -- di -- ci -- mus, et 
		
		be -- ne -- di -- ci -- mus ti -- bi. Qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de --
		mi -- sti mun -- dum, re -- de -- mi -- sti mun -- dum, qui -- 
		a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de --
		
		mi -- sti mun -- dum. Mi -- se -- re -- _ re, mi -- se -- re -- _ re, mi -- se -- 
		re -- re no -- bis, mi -- se -- re -- re no -- bis.
	}
}

tenoreA = \new Voice {
	\relative c' {
		\clef "treble_8"
		a1. a2 a1 b r2 b1 b2 b b c1 c2 e4 e a,1
		d2. d8 d b4. b8 c4 e2 d8 c b2 cis c! c4 g a f g2 c c4 g a f g2 r4 c,
		
		c' d a4. a8 c2 e8 d e c d1 e R\breve R
		R r1 r2 e2. d8 c b4 b8 c d c d b c4 c g2 g
		
		d'2 b d1 d2 r4 d ~ d c8 b a4 a8 a c2. b8 a
		g4 g8 g g2 d' a2 ~ a4 c4 b1 b2 c b
		
		g e e1 e e c g' g R\breve r1 d'2. d4 d4. c8 b4. a8
		g2 a b1 cis g2. g4 c,2 d e1 d \fermata
	}
	\addlyrics {
		A -- do -- ra -- mus, a -- do -- ra -- mus te, te, a -- do -- ra -- 
		mus, a -- do -- ra -- mus te Chri -- _ _ _ ste, et be -- ne -- di -- ci -- mus, et be -- ne -- di -- ci -- mus, et 
		
		be -- ne -- di -- ci -- mus ti -- _ _ _ _ bi. Qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de -- 
		mi -- sti mun -- dum, qui -- a per san -- gui -- nem, qui -- a per 
		san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de -- 
		
		mi -- sti mun -- dum. Mi -- se -- re -- re, mi -- se -- re -- _ _ _ 
		_ re no -- bis, mi -- se -- re -- re no -- bis.
	}
}

tenoreB = \new Voice {
	\relative c {
		\clef "treble_8"
		d2. e4 f2 a a d, d1 r2 g4. f8 e2 b' e, e e1 c'2. b8 b e2 a,
		a2. a8 a e2 e4 a b2 e, e a a4 e f4. f8 c2 r2 r1 r2 c'
		
		c4 g a4. a8 e1 g c, R\breve R 
		R r1 c'2. b8 a g2. g8 a b a b d c4 c r1
		
		r2 d2. c8 b a4 a8 a b a b g d'2 d, r r1
		b'2. a8 g fis2. e8 d a' a a a e1 e2 e b'
		
		b c8 b c a b1 cis R\breve R b1 g d' d b2. b4
		b2 e, e1 e e2. e4 e2 f4 a2 g8 f e4 a fis1 \fermata
	}
	\addlyrics {
		A -- _ _ do -- ra -- _ mus, a -- _ _ do -- ra -- mus te, te, a -- do -- ra -- _
		mus, a -- do -- ra -- mus te Chri -- _ ste, et be -- ne -- di -- ci -- mus, et 
		
		be -- ne -- di -- ci -- mus ti -- bi. Qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum,
		qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum,
		qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de -- 
		
		mi -- _ _ _ sti mun -- dum. Mi -- se -- re -- re, mi -- se -- 
		re -- re no -- bis, mi -- se -- re -- re no -- _ _ _ _ bis.
	}
}

basso = \new Voice {
	\relative c {
		\clef "bass"
		d1. cis2 d1 g, r2 e'1 dis2 e e a,1 a'2. gis8 \ficta gis a1
		d,2. d8 d e2 a,4 a e'1 a, r1 r2 a' a4 e f4. f8 c1
		
		R\breve R R R 
		R r1 a'2. g8 f e2. d8 c g' g g g c,4 c b2 c
		
		d g, d'1 g,2 r r1 r
		g'2. f8 e d2. c8 b a a a a e'1 e2 c d 
		
		e a, e'1 a, c1. a2 g1 c g'1. e2 d1 g g2. g4
		g2 c, e1 a, c2. c4 c2 f, a1 d \fermata
	}
	\addlyrics {
		A -- do -- ra -- mus, a -- do -- ra -- mus te, te, a -- do -- ra -- 
		mus, a -- do -- ra -- mus te Chri -- ste, et be -- ne -- di -- ci -- mus,
		
		Qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de -- 
		mi -- sti mun -- dum, qui -- a per san -- gui -- nem tu -- um pre -- ti -- o -- sum re -- de -- 
		
		mi -- sti mun -- dum. Mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- 
		re -- re no -- bis, mi -- se -- re -- re no -- bis.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\new Staff << \global \cantoA >> 
			\new Staff << \global \cantoB >> 
			\new Staff << \global \alto >>
			\new Staff << \global \tenoreA >>
			\new Staff << \global \tenoreB >>
			\new Staff << \global \basso >>
		>>
	>>
	\layout {
	}
	\midi { }
}
