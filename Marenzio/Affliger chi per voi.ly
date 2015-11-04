% Copyright ©2015 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "4"
\pointAndClickOff

#(set-global-staff-size 16.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Affliger chi per voi; Nulla da voi"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Luca Marenzio (1553-1599)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
		}
	}
	tagline = ##f
}

\layout {
	indent = #0
  	ragged-right = ##f
  	ragged-last = ##f
	\context {
		\Score
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 12) (stretchability . 100))
	}
	\context { 
		\Staff
		\remove "Time_signature_engraver"
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

global = { 
	\key c \major
	\time 2/2
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

soprano = \new Voice	{
	\relative c' {
		f1 a gis2 a a a4 d,2
		g f4 e2 e \break e' d
		
		c b a g2. f2 e
		d cis4 d fis fis fis g g a2
		a d4. c8 b2 a r2 r4 a
		a a b b cis2 d4 d, d d e e

		fis2 g r4 g a4. g8 f2 e4 g2
		c b4 a2 gis4 gis2 a4 a2
		b4 c4. b8 a2 gis4 r a2 a a
		b4 e, c' ~ \break c b4 cis d a1

		b2 e, g2. f4 e2 d
		g e4 f ~ \break f e4 d2 c1
		r4 g' g g fis2 g1 a2 b4 c2
		b4 a2 g1 r4 c2 b

		a4 g f e f g a b2 b
		e d4 c b a g c d e b2
		c1 a2 g4 f e d c d
		e fis gis a4. gis16 fis gis4 a1\fermata \showBarLine \bar "||"

		R1 R R \break a2 a4 a
		g2. fis4 g e f g a4. g8 f2
		e r2 R1 d'2 c4 a
		a b c4. c8 cis4 d e2. d8 c

		b2 a4 c c2. b4 a g
		f e d c d2 d r4 g2 a4 ~ \break a
		g!4 gis2 a1. r4 g
		g g fis2 g a d,

		r r4 d' d d cis d e a,
		r8 a4 d b c a b g a
		d, g e c' b a g fis8 r2
		g1 e2 a2. f4

		e1 fis8 a4 d b c a b 
		g a d, g e c' b a
		g fis8 r2 g1 e2
		a2. f4 e1 fis\fermata \showBarLine \bar "|."
	}
	\addlyrics {
		Af -- flig -- ger chi per voi la vi -- ta pia -- gne
		Che vien man -- can -- "do e’l" fi -- "ne ha" da vi -- ci -- no, 
		È na -- tu -- ral fie -- rez -- "za, O" mio de -- sti -- no,
		è na -- tu -- ral fie -- rez -- za,
		è na -- tu -- ral fie -- rez -- za, o mio de -- sti -- no,
		Che sí da voi pie -- tà par -- "ta e" scom -- pa -- _ _ gne?
		Cer -- to, per -- ch’io mi strug -- "ga e" di duol ba -- gne 
		"Gli o" -- chi do -- glio -- "si e’l" vi -- so tri -- "sto e" chi -- no,
		E qua -- "si in" -- fer -- "mo e" stan -- co pe -- re -- gri -- no 
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- _ _ _ _ gne,

		Nul -- la da voi fin qui mi ve -- "ne a" -- i -- _ _ ta.
		Nè pur per en -- "tro I’ll" vo -- "stro a" -- cer -- "bo or" -- go -- _ _ _ glio
		Men fa -- ti -- co -- so cal -- "le ha’l" pen -- sier mi -- o.
		As -- pro co -- stum’ è in bel -- la don -- "na e" ri -- o,
		in bel -- la don -- "na e" ri -- o,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so co -- me du -- ro sco -- glio,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so co -- me du -- ro sco -- glio.
	}
}

alto = \new Voice {
	\relative c' {
		d1 f2 e1 r4 f2 e4 fis2
		g4 e2 d4 cis2 cis r r4 a'2 

		g f e d4 c2 b
		c4 a a2 a r4 d d d e e
		fis1 g2 r4 d d d e e
		fis2 g4 g, g g a a b2 c1
		
		r4 d e4. d8 c2 d r
		e f4 d f e e2. c2 f 
		e4 e2 e r4 e2 e e4
		fis g2 a4 ~ a g2 f e4 fis2

		g2 r4 e2 d4 cis d2 c! b
		e4 cis d ~ d c!2 b4 c e e e
		d2 e c d4 e2 d4. cis16 b cis4 e2
		d4 g ~ g f2 e4 e d e1

		d2 r r e d4 c b a
		g a b c d2 e4 a2 g f4
		e d c d e f e\breve ~ e1 e\fermata r2 e
		
		e4 e d2. cis4 d e f8 e e2 d4
		e b c d e8 d c b a4 g R1
		g'2 f4 d d e f4. f8 fis4 g a f
		r g e f e g g a e f8 a4
		
		gis16 fis gis4 a2 r4 e e g c, c
		d g g fis g2 g r4 e2 f4 ~ f
		e4 d4. e8 f2 e r4 a, b8 c d2
		cis4 d2 g,4 d' c2 b

		e4 e d2 d4 g2 f4 e2
		fis g r4 d g e 
		f d e c f e d c g' f
		e d c2 g' f4 e4. d8 d2

		cis8 b cis2 d2. r4 r d
		g e f d e c f e 
		d c g' f e d c2 g'
		f4 e4. d8 d2 cis8 b cis2 d1\fermata
	}
	\addlyrics {
		Af -- flig -- ger chi per voi la vi -- ta pia -- gne
		Che vien man -- can -- "do e’l" fi -- "ne ha" da vi -- ci -- no, 
		È na -- tu -- ral fie -- rez -- za, 
		è na -- tu -- ral fie -- rez -- za,
		è na -- tu -- ral fie -- rez -- za,
		O mio de -- sti -- no,
		Che sí da voi pie -- tà par -- "ta e" scom -- pa -- gne?
		Cer -- to, per -- ch’io mi strug -- "ga e" di duol ba -- gne 
		"Gli o" -- chi do -- glio -- "si e’l" vi -- so tri -- "sto e" chi -- _ no,
		E qua -- "si in" -- fer -- "mo e" stan -- co pe -- re -- _ _ _ gri -- no,
		e stan -- co pe -- re -- gri -- no
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,

		Nul -- la da voi fin qui mi ve -- "ne a" -- i -- _ ta,
		mi ve -- "ne a" -- i -- _ _ _ _ ta.
		Nè pur per en -- "tro I’ll" vo -- "stro a" -- cer -- "bo or" -- go -- glio,
		Nè pur per en -- "tro I’ll" vo -- "stro a" -- cer -- "bo or" -- go -- _ _ _ glio
		Men fa -- ti -- co -- so cal -- "le ha’l" pen -- sier mi -- o.
		As -- pro co -- stum’ __ _ _ è in bel -- la don -- "na e" ri -- o,
		As -- pro co -- stum’ "è in" bel -- la don -- "na e" ri -- _ o,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so co -- me du -- ro sco -- _ _ _ glio,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so co -- me du -- ro sco -- _ _ _ glio.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r2 a1 c2 b d2. cis4 d2
		b4 c2 d4 a2 a c!4 b2 a4

		c4. b16 a g4 d' r2 g, a d,4 g2 
		f4 e2 fis4 a a a b b cis2
		d4. c!16 b a2 r4 g d'4. c8 b2 a
		r4 d d d e e fis2 g4 g, g g

		a a b2 c a8 b c4. b16 a b4 c2
		r4 g a b c2 b4 b2 a d
		c4 c2 b r4 cis2 cis cis4
		d b c4. d8 e2 a,4 d2 cis4 d2

		g, c2. b4 a2 gis4 a fis g!
		e2 a g1 c,2 r4 g'
		g g g2 a r4 g g g fis2 g1
		a2 b4 c2 b4 a2 e

		r2 c'1. b4 a g f
		e f g a b2 c r4 c, e f
		g g r2 c b4 a g f e fis
		gis a b1 cis\fermata c!2 c4 c

		b2. a4 b g a b c4. b8 a2
		b r r d c4 a a b
		c e d8 c b a b4 b a2. g4 r2
		d' c4 a a b c4. c8 cis4 d

		e2 a, r4 a c d f8 c e4
		a, r8 c b4 a b2 b c1 ~ c2
		b2 cis4 d2 cis4 d1
		r2 r4 d, e8 f g2 fis4 g2

		c, r4 a' b8 c d b cis4 d4. cis16 b c4
		d2 r8 g,4 c d b c a
		b g g8 a4 a8 d, e f g4 a b8 e4 d
		c b8 r4 e2 d4 c b a1. 

		a2 r8 g4 c d b
		c a b g g8 a4 a8 d, e f
		g4 a b8 e4 d c b8 r4 e2 d4
		c b a1. a1\fermata
	}
	\addlyrics {
		Af -- flig -- ger chi per voi la vi -- ta pia -- gne
		Che vien man -- can -- _ _ _ do "e’l" fi -- "ne ha" da vi -- ci -- no, 
		È na -- tu -- ral fie -- rez -- za, __ _ _ _ O mio de -- sti -- no,
		è na -- tu -- ral fie -- rez -- za,
		è na -- tu -- ral fie -- rez -- "za, O" mio de -- sti -- _ _ _ no,
		Che sí da voi pie -- tà par -- "ta e" scom -- pa -- gne?
		Cer -- to, per -- ch’io mi strug -- _ _ "ga, e" di duol ba -- gne 
		"Gli o" -- chi do -- glio -- "si e’l" vi -- so tri -- "sto e" chi -- no,
		E qua -- "si in" -- fer -- mo,
		e qua -- "si in" -- fer -- "mo e" stan -- co pe -- re -- gri -- no 
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,
		d’as -- pre mon -- ta -- gne,
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,

		Nul -- la da voi fin qui mi ve -- "ne a" -- i -- _ _ ta.
		Nè pur per en -- "tro I’ll" vo -- "stro a" -- cer -- _ _ _ _ "bo or" -- go -- glio
		Nè pur per en -- "tro I’ll" vo -- "stro a" -- cer -- "bo or" -- go -- glio
		Men fa -- ti -- co -- so cal -- le ha’l pen -- sier mi -- o.
		As -- pro co -- stum’ __ _ è in bel -- la don -- "na e" ri -- o,
		in bel -- la don -- "na e" ri -- _ _ _ _ o,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so, a mez -- "zo il" cor -- so co -- me du -- ro sco -- glio,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so, a mez -- "zo il" cor -- so co -- me du -- ro sco -- glio.
	}
}


bass = \new Voice {
	\relative c {
		\clef bass
		r2 d1 e d2 R1
		R r2 r4 a' ~ a g2 f

		e d c b4 a2 g
		a1 d R1
		r4 d d d e e fis2 g r
		r4 d g4. \ficta f!8 e2 d r4 g, c4. b8

		a2 g r4 c f4. e8 d2 c
		r4 c f g a2 e4 e2 f d
		a4 c4. d8 e2 a, a' a
		R1 R R

		R R R
		R R r4 c, c c
		b2 c a b4 c2 b4 a2 g1 
		R1 r2 r4 a'2 g
		
		f4 e d c d e f g1
		g2 ~ g1 r4 f2 e d4
		c b a b c d e\breve ~ e1 a,\fermata a'2 a4 a

		g2. fis4 g e \ficta f! g a4. g8 f2
		e r r4 c d e f4. e8 d2
		c r g' f4 d d e f4. f8
		fis4 g a2 a,4 r r2 R1

		r4 a' a2. g4 f e
		d c g' a g2 g R1
		R a1 fis2 g
		e d c4 b a2 g4 g'

		g g fis2 g a1
		d,4 d g e f d e c
		d b c a d c b a g1
		c2. b4 a g f4. g8

		a1 d4 d g e f d 
		e c d b c a d c
		b a g1 c2. b4
		a g f4. g8 a1 d\fermata
	}
	\addlyrics {
		Af -- flig -- ger
		Che vien man -- can -- "do e’l" fi -- "ne ha" da vi -- ci -- no, 
		È na -- tu -- ral fie -- rez -- za, O mio de -- sti -- no,
		O mio de -- sti -- no, O mio de -- sti -- no,
		Che sí da voi pie -- tà par -- "ta e" scom -- pa -- _ _ gne?
		Cer -- to,
		E qua -- "si in" -- fer -- "mo e" stan -- co pe -- re -- gri -- no 
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,
		Man -- chi per du -- ra via d’as -- pre mon -- ta -- gne,

		Nul -- la da voi fin qui mi ve -- "ne a" -- i -- _ _ ta,
		mi ve -- "ne a" -- i -- _ _ ta.
		Nè pur per en -- "tro I’ll" vo -- "stro a" -- cer -- "bo or" -- go -- glio
		Men fa -- ti -- co -- so cal -- "le ha’l" pen -- sier mi -- o.
		As -- pro co -- stum’ "è, as" -- pro co -- stum’ è in bel -- la don -- "na e" ri -- o,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so co -- me du -- ro sco -- _ _ glio,
		Di sde -- "gno ar" -- mar -- "si, e" rom -- per l’al -- trui vi -- ta
		A mez -- "zo il" cor -- so co -- me du -- ro sco -- _ _ glio.
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano >>
			\new Staff << \global \alto >>
			\new Staff << \global \tenor >>
			\new Staff << \global \bass >>
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
	\midi {	}
}

