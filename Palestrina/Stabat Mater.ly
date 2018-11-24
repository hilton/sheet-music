% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "2"

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 8\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##f
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Stabat Mater"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "G.P. da Palestrina" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
%				\with-url #"https://www.cpdl.org/wiki/index.php/Stabat_Mater_(Giovanni_Pierluigi_da_Palestrina)" "CPDL #" -
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
			\line {
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music
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
		proportionalNotationDuration = #(ly:make-moment 7 10)
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
    \consists "Ambitus_engraver"
		\consists "Custos_engraver"
		\override Custos.style = #'hufnagel
	}
	\context {
		\Voice
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\remove "Forbid_line_break_engraver"
	}
}

global = { 
  \language "deutsch"
 	\key c \major
	\time 2/1
	\tempo 1 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }


cantusprimus =  \relative c''
	{
	a1 h
	c1 c2 c1 c2 b1
	a1 r
%5
	r\breve |
	r\breve
	r1 r2 e'1 d2 c h2 ~ h a1 \ficta gis2
%10
	a1 r |
	r\breve
	r\breve
	r\breve
	r\breve
%15
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%20
	r\breve |
	g'\breve
	g1 f
	f2 f1 f2
	d1 c2 f2 ~
%25
	f2 f2 e2. e4 |
	e2 d d1
	cis2 d1 d2
	c2 \ficta b c2. c4
	c1 r
%30
	r1 r2 e1 f2 e1
	d1 r
	r1 r2 d1 d2 d1
%35
	d2 e1 c2 |
	c1 d
	c2. d4 e2 e
	e1 r2 a,1 h2 c1
%40
	c2 d1 e2 |
	f2. e4 d2 e
	r\breve
	r\breve
	r1 r2 cis
%45
	d2 \ficta cis d e2. d4 c1 h2
	c1 r
	r\breve
	r\breve
%50
	r2 c1 c2 |
	c1 a2 b1 a2 c1
	c1 r
	r\breve
%55
	r2 d d c1 a2 h h
	c1 h
	r\breve
	r\breve
%60
	r\breve |
	r\breve
	r\breve
	r2 cis1 cis2
	d2 d f e
%65
	d\breve |
	d1 r
	r\breve
	r2 e1 e2
	d1 d
%70
	r2 d1 f2 |
	e1 r
	h1. h2
	cis\breve |
% Triple time
  \showBarLine \bar "|" \time 3/1
	\set Score.proportionalNotationDuration = #(ly:make-moment 4 3)
	\tempo \breve. = 50
	r\breve.
%75
	r\breve. |
	r\breve.
	r\breve.
	cis\breve cis1
	d\breve e1
%80
	d\breve d1 |
	cis\breve cis1
	d1 h c
	d1 e1. e2
	e1 r r
%85
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r\breve.
%90
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
% End of triple time
  \showBarLine \bar "|" \time 2/1
	\set Score.proportione alNotationDuration = #(ly:make-moment 7 10)
	\tempo 1 = 60
  d1. d2
%95
	d1 e2 e~ |
	e2 e g1
	f2 c1 c2
	c1 h2 c1 c2 c1
%100
	h\breve |
	r\breve
	r\breve
	r\breve
	r2 d e e1
%105
	d2 c c |
	h1 c
	r2 h c c1 h2 a a
	a1 gis2 h
%110
	c2 d1 c2 |
	h4 a a1 gis2
	a1 r
	r\breve
	r\breve
%115
	r\breve |
	r\breve
	r\breve
	r2 f'1 e2
	e1 d
%120
	d1. d2 |
	d1 r
	e1. e2
	e1 d2 e1 d4 c d2 e
%125
	f1 e |
	r2 g1 e2
	e1 c
	c2 d f e1 d4 c d2 d
%130
	f1 e2 g2. f4 f2 e e
	e1 r2 a,1 h2 c2. d4
	e2 e f1
%135
	d1 g,2 g |
	c2 c d e
	f1 e
	c2. \ficta b4 a2 d
	c1 d
%140
	b2. a4 g2 g |
	a1 r
	c1. c2
	c1 g2 h2 ~ h d2 d1
%145
	cis1 r |
	r\breve
	r\breve
	r\breve
	r\breve
%150
	r\breve |
	r\breve
	r2 e1 e2
	d1 e2 f1 e2 d1
%155
	d2 c1 c2 |
	h1 c2 d1 c2 h1
	h2 c1 c2
	h1 a1 ~
%160
	a1 a2. a4 |
	a1 r
	r\breve
	r1 r2 a
	c2 h1 a2
%165
	a2 gis a1 |
	\ficta gis2 h c1
	h2 c1 h4 a
	gis2 a1 gis2
	a1 r
%170
	r\breve |
	r1 e'
	f2 f1 e2
	d1 cis2 d1 cis2 r a
%175
	d2 d1 c2 |
	h4 g g'1 d2
	e1 r
	r\breve
	r\breve
%180
	r2 h1 a2 |
	g1 g2 g1 g2 g1
	g1 r
	r\breve
%185
	r\breve |
	r2 f'1 e2
	d2 c d e
	f2 e2. d4 d2~
	d2 cis4 h cis2 cis
%190
	d\longa |
	}

altusprimus =  \relative c' 
        {
	e1 g
	a1 a2 g1 a2 g1
	e1 r
%5
	r\breve |
	r\breve
	r1 r2 a1 a2 a g
	g2 f e\breve
%10
	r1 |
	r\breve
	r\breve
	r\breve
	r\breve
%15
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%20
	r\breve |
	g2. a4 h2 g1 c1 a2
	b1. b2
	b1 a2 c2 ~
%25
	c c2 c2. c4 |
	c2 a b1
	a2 a1 b2
	g2 f g2. g4
	a1 r
%30
	r1 r2 c1 c2 c1
	h1 r
	r1 r2 a1 h2 a1
%35
	h2 c1 g2 |
	a2. g4 f1
	e2 a1 \ficta gis2
	a1 r2 c1 h2 a1
%40
	g2 f1 e2 |
	d1 a'
	r\breve
	r\breve
	r1 r2 a
%45
	a1 a2 c |
	g1. g2
	g1 r
	r\breve
	r\breve
%50
	r2 a1 a2 |
	g1 f2 f1 f2 g1
	a1 r
	r\breve
%55
	r2 a a a1 e2 g g
	a1 g
	r\breve
	r\breve
%60
	r\breve |
	r\breve
	r\breve
	r2 a1 a2
	a2. a4 a2 a
%65
	a\breve |
	h1 r
	r\breve
	r2 c1 c2
	h1 h
%70
	r2 a1 a2 |
	a2. g8 f e1
	r2 e1 e2
	e\breve |
% Triple time
	r\breve.
%75
	r\breve. |
	r\breve.
	r\breve.
	a\breve a1
	a\breve a1
%80
	b\breve b1 |
	a\breve a1
	a1 d, a'
	a1 gis1. gis2
	a1 r r
%85
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r\breve.
%90
	r\breve. |
	r\breve.
	r\breve.
	r\breve. |
% End of triple time
	g1. g2
%95
	g1 g |
	c2 c c1
	a2 a1 a2
	g1 g2 g1 a2 e \ficta fis
%100
	g\breve |
	r\breve
	r\breve
	r\breve
	g1 c2 c1
%105
	h2 a a |
	gis1 a
	e1 a2 a1 g2 f f
	e1 e2 \ficta gis
%110
	a1 a |
        f1 e2. e4
	e1 r
	r\breve
	r\breve
%115
	r\breve |
	r\breve
	r\breve
	r2 c'1 c2
	c1 h2 g2 ~ g
%120
	fis4 e fis2 fis |
	g1 r
	g1. g2
	g1 g\breve g2 g
%125
	a1 c\breve r2 c1 a2 a f
	a2 \ficta b a1
	g1 r2 g
%130
	a1 g2 c |
	h4 a a1 gis2
	a1 r2 fis1 fis2 g g
	c,2 g' a1
%135
	g2 b1 b2 |
	a2 a f g
	\ficta b1 g\breve r2 f
	a1 \ficta b2 f
%140
	g4 f f1 e2 |
	f1 r
	f1 r2 c1 e2 e g2 ~ g g2 f1
%145
	a\breve |
	r\breve
	a1 h2 c1 h2 a a
	g1 f2 a
%150
	g1 e2 f |
	g1. g2
	g1 r
	r\breve
	r\breve
%155
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%160
	r\breve |
	r\breve
	r\breve
	r1 r2 e
	e2 g1 f2
%165
	e2 e1 d2 |
	e2 \ficta gis a1
	d,2 e g f
	e\breve~
	e1 r
%170
	r\breve |
	r1 r2 a1 d,2 a'2. g4
	f2 d e a
	a1 a2 a
%175
	a2 h g1 |
	g1. g2
	g1 r
	r\breve
	r\breve
%180
	r2 g1 f2 |
	e1 d2 c1 h2 e2. f4
	g2 d e1
	r\breve
%185
	r\breve |
	r\breve
	r2 a f g
	f2 a1 a2
%190
	a\longa
	s\breve |
	}

tenorprimus =  \relative c' 
	{
	cis1 d
	f1 f2 e1 f2 d1. cis2 r1
%5
	r\breve |
	r\breve
	r1 r2 e1 f2 e e
	d2. c4 h2 h
%10
	a1 r |
	r\breve
	r\breve
	r\breve
	r\breve
%15
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%20
	r\breve |
	d1 g
	e1 f
	d2 d1 f2
	f1 f
%25
	a2 a g2. g4 |
	g2 fis g1
	e2 f1 f2
	e2 f f e
	f1 r
%30
	r1 r2 g1 a2 g1
	g1 r
	r1 r2 fis1 g2 fis1
%35
	g2 g1 g2 |
	f2. g4 a1. a,2 h2. h4
	a1 r2 e'1
	e2 a,4 h c d
%40
	e2 a, a' a |
	a2. g4 f2 e
	r\breve
	r\breve
	r1 r2 e
%45
	f2 e f g2. f4 e d8 c d2 d
	c1 r
	r\breve
	r\breve
%50
	r2 f1 f2 |
	e1 d2 d
	d2 f2. e8 d e2
	f1 r
	r\breve
%55
	r2 d f e1 c2 d d
	f1 d
	r\breve
	r\breve
%60
	r\breve |
	r\breve
	r\breve
	r2 e1 e2
	f2 f d e
%65
	fis\breve |
	g1 r
	r\breve
	r2 g1 g2
	g1 g
%70
	r2 f1 d2 |
	e2 a,4 h c d e2. d8 c h4 a h2 h
	a\breve |
% Triple time
	r\breve.
%75
	r\breve. |
	r\breve.
	r\breve.
	e'\breve e1
	f\breve e1
%80
	f\breve g1 |
	e\breve e1
	fis1 g e
	a,1 h1. h2
	cis1 r r
%85
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r\breve.
%90
	r\breve. |
	r\breve.
	r\breve.
	r\breve. |
% End of triple time
	h1 h
%95
	g1 c2 g'~ |
	g2 g e1
	c2 f1 f2
	e1 d2 e1 f2 c1
%100
	d\breve |
	r\breve
	r\breve
	r2 d e e2 ~ e d2 c e
%105
	g1 e |
	r2 e e c1 h2 a c
	e2. d4 c a d2. c4 c2 h e1
%110
	f2 e e |
	d2. c4 h2 h
	a1 r
	r\breve
	r\breve
%115
	r\breve |
	r\breve
	r\breve
	r2 a'1 g2
	g2 g,2. a4 h2
%120
	r2 a1 d2 |
	h1 r
	r\breve
	r\breve
	r\breve
%125
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%130
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%135
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%140
	r\breve |
	r\breve
	a1 c
	e1 c2 d2 ~ d d1 a'1
%145
	e2 e f |
	g\breve
	c,1 d2 e
	d2. e4 f g f1 e2 r a,
%150
	h1 c2 a |
	g2. g4 g1
	r2 c1 c2
	g'1 e2 d1 e2 g1
%155
	g2 c,1 c2 |
	g1 c2 b1 c2 g1
	g2 c1 c2
	d\breve
%160
	f1 e2. e4 |
	d1 r
	r\breve
	r1 r2 e
	c2 d1 d2
%165
	c2 h a1 |
	h2 e e1
	g2. f4 e2 d4 c
	h2 a h h
	cis1 r
%170
	r\breve |
	r\breve
	a'1 d,2 a'1 g2 a f
	e2 e r d1
%175
	d2 h g |
	g2. a4 h2 h
	g1 r
	r\breve
	r\breve
%180
	r2 d'1 d2 |
	h1 h2 e1 d2 c2. h4
	g4 a h2 c1
	r\breve
%185
	r\breve |
	r\breve
	f2. e4 d2 c
	d2 e f1
	e1. e2
%190
	d\longa |
	}

bassusprimus  =  \relative c 
	{
	a'1 g
	f1 f2 c'1 f,2 g1
	a1 r
%5
	r\breve |
	r\breve
	r1 r2 a1 d,2 a' e
	g2 d e1
%10
	a1 r |
	r\breve
	r\breve
	r\breve
	r\breve
%15
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%20
	r\breve |
	g\breve
	c1 f,
	b2 b1 b2
	b1 f2 f2 ~
%25
	f f2 c'2. c4 |
	c2 d g,1
	a2 d1 b2
	c2 d c2. c4
	f,1 r
%30
	r1 r2 c'1 a2 c1
	g1 r
	r1 r2 d'1 h2 d1
%35
	g,2 c1 c2 |
	f,1. d2
	a'1 e
	a1 r2 a1 g2 f1
%40
	e2 d1 cis2 |
	d1. a'2
	r\breve
	r\breve
	r1 r2 a
%45
	d2 a d c1 c2 g1
	c,1 r
	r\breve
	r\breve
%50
	r2 f1 f2 |
	c1 d2 b1 d2 c1
	f1 r
	r\breve
%55
	r2 d d a'1 a2 g g
	f1 g
	r\breve
	r\breve
%60
	r\breve |
	r\breve
	r\breve
	r2 a1 a2
	d2 d d cis
%65
	d\breve |
	g,1 r
	r\breve
	r2 c1 c2
	g1 g
%70
	r2 d'1 d2 |
	a1 r
	e1. e2
	a,\breve |
% Triple time
	r\breve.
%75
	r\breve. |
	r\breve.
	r\breve.
	a'\breve a1
	d\breve c1
%80
	b\breve g1 |
	a\breve a1
	d,1 g a
	f1 e1. e2
	a1 r r
%85
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r\breve.
%90
	r\breve. |
	r\breve.
	r\breve.
	r\breve. |
% End of triple time
	g1 g
%95
	h1 c2 c~ |
	c2 c c1
	f,2 f1 f2
	c'1 g2 c1 f,2 a1
%100
	g\breve |
	r\breve
	r\breve
	r2 g c c2 ~ c h2 a a
%105
	g1 a |
	r2 e a a1 g2 f1
	e1 f2. g4
	a1 e
%110
	a1 a |
	d,2 d e2. e4
	a,1 r
	r\breve
	r\breve
%115
	r\breve |
	r\breve
	r\breve
	r2 f'1 c2
	c1 g'
%120
	d1. d2 |
	g1 r
	r\breve
	r\breve
	r\breve
%125
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%130
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%135
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%140
	r\breve |
	r\breve
	f1 a
	c1 c2 g2 ~ g g2 d'1
%145
	a1 a |
	h2 c1 h2
	a2 a g\breve f1
	r1 f
%150
	g1 a |
	h2 c1 h2
	c1 r
	r\breve
	r\breve
%155
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%160
	r\breve |
	r\breve
	r\breve
	r1 r2 a
	a2 g1 d2
%165
	e2 e f1 |
	e2 e a1
	g4 f e d c2 d
	e1 e
	a,1 r
%170
	r\breve |
	r1 a'
	d,2 d'1 \ficta cis2
	d2 \ficta b a1
	a1 r2 d,
%175
	d2 g1 c,2 |
	e2. f4 g2 g
	c,1 r
	r\breve
	r\breve
%180
	r2 g'1 d2 |
	e1 h2 c1 g'2 c,2. d4
	e4 f g2 c,1
	r\breve
%185
	r\breve |
	r\breve
	r2 f1 e2
	d2 \ficta cis d1
	a1 a
%190
	d\longa |
	}

cantussecundus =  \relative c''
	{
	r\breve
	r\breve
	r\breve
	r1 a
%5
	h1 c |
	c2 c1 c2
	b1 a
	r\breve
	r\breve
%10
	r2 cis1 cis2 |
	d2. d4 f2 e
	d\breve
	c\breve~
	c1 r2 f1
%15
	e2 d c |
	d2 d b1
	a2 c d e1 f1 e4 d
	\ficta cis2 d1 \ficta cis!2
%20
	d1 r |
	d\breve
	e1 c
	d2 d1 d2
	f1 f1 ~
%25
	f r1 |
	r\breve
	r\breve
	r\breve
	r2 c1 d2
%30
	c1 c |
	r\breve
	r2 h1 c2
	h1 a
	r\breve
%35
	r2 c1 e2 |
	f1 f
	r2 e1 h2
	c2. d4 e1
	r\breve
%40
	r\breve
	r1 r2 a,1 h2 c1
	c2 d1 e2
	f1 e
%45
	r\breve |
	r\breve
	r2 e1 e2
	d1 c2 c2 ~ c a2 b1
%50
	a1 r |
	r\breve
	r\breve
	r2 c d1
	c2 b a2. a4
%55
	a1 r |
	r\breve
	r1 r2 d
	d2 d1 d2
	e2 c d\breve
%60
	c2 c1 h2 a1
	gis2 a1 gis2
	a1 r
	r\breve
%65
	r2 d1 d2 |
	h1. g2
	h2 a g1
	g\breve
	r2 g'1 g2
%70
	f1 d |
	r2 e1 e2
	e\breve~
	e\breve |
% Triple time
	h\breve h1
%75
	c\breve h1 |
	a\breve a1
	gis\breve gis1
	r\breve.
	r\breve.
%80
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r1 a h
%85
	c1. c2 c1 |
	h1 a\breve
	gis1 gis a
	h1. h2 h1
	c1 c d
%90
	e1 e f |
	e1 e\breve
	d\breve \ficta cis1
	d\breve r1
% End of triple time
	h1. h2
%95
	d1 c |
	g'2 e c1
	c1 r
	r\breve
	r\breve
%100
	r1 d1. a2 c g2. a4 h c d2 c1 h2 c1
	r\breve
%105
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%110
	r\breve |
	r\breve
	r2 c1 h2
	a1 g2 c1 c2 d1
%115
	e1 e |
	d2 c1 c2
	d2 d b1
	a1 r2 c1 g2 h1
%120
	a2 d1 a2 |
	h1 r
	c1. c2
	c1 h2 c1 h4 a h2 c
%125
	d1 g,2 g'1 e2 e1
	c1 e2 f
	e2 d2. c4 c1 h4 a h2 h
%130
	c1 c2 e |
	d2. c4 h2 h
	cis1 r2 d1 d2 e2. d4
	c2 h c1
%135
	h2 d1 e2 |
	f2 f f e
	d1 c2 c
	e1 f\breve f1
%140
	d1 c2. c4 |
	c1 r
	f1. f2
	e1 e2 d2 ~ d d2 f1
%145
	e1 r |
	r\breve
	r\breve
	r\breve
	r\breve
%150
	r\breve |
	r\breve
	r2 c1 c2
	h1 c2 d1 c2 h1
%155
	h2 e1 e2 |
	d1 e2 f1 e2 d1
	d2 e1 e2
	d1 d2 f2 ~
%160
  f4 e4 d1 \ficta cis2 |
	d2 d d e1 d2 d cis
	d1 cis
	r\breve
%165
	r\breve |
	r\breve
	r\breve
	r\breve
	e1 f2 f1
%170
	e2 d1 |
	cis2 d1 cis2
	d1 r
	r\breve
	r2 e cis d1
%175
	h1 e2 ~ e4 d4 c1 h2
	c2 e1 d2
	c1 h2 cis1 d2 h1
%180
	h1 r |
	r\breve
	r1 r2 c1 h2 a g
	a2 h c h2.
%185
	a4 a1 \ficta gis2 |
	a2. h4 c1
	a1 r
	r1 d2. d4
	e2 e a,2. a4
%190
	a\longa |
	}

altussecundus =  \relative c'
	{
	r\breve
	r\breve
	r\breve
	r1 e
%5
	g1 a |
	a2 g1 a2
	g1 e
	r\breve
	r\breve
%10
	r2 a1 a2 |
	a2. a4 a2 a
	b\breve
	a2 f1 e2
	a2 g a a
%15
	a1 d,2 a' |
	g4 f f1 e2
	f2 a1 h2
	c4 h a g f2 g
	a1 a
%20
	a1 r |
	h\breve
	c1 a
	f2 f1 d2
	d1 f2. g4
%25
	a1 r |
	r\breve
	r\breve
	r\breve
	r2 a1 b2
%30
	a1 g |
	r\breve
	r2 g1 g2
	g1 fis
	r\breve
%35
	r2 g1 c2 |
	c2 a2. g4 f2
	a2 e e2. d4
	c4 h a h c d e2
	r\breve
%40
	r\breve |
	r1 r2 c'1 h2 a1
	g2 f1 e2
	d1 cis
%45
	r\breve |
	r\breve
	r2 c'1 c2
	b1 a2 a2 ~ a e2 g1
%50
	c,1 r |
	r\breve
	r\breve
	r2 a' b1
	a2 g e2. e4
%55
	fis1 r |
	r\breve
	r1 r2 g
	h2 a1 a2
	c2 g b\breve
%60
	g2 g1 g2 e f
	e2 d e\breve r1
	r\breve
%65
	r2 a1 a2 |
	g1. d2
	d2. d4 d1
	e\breve
	r2 d1 d2
%70
	a'1 a2 f4 g |
	a4 h c2. h4 a1 gis4 fis gis2 gis
	a\breve
% Triple time
	gis\breve gis1
%75
	a\breve g1 |
	f\breve f1
	e\breve e1
	r\breve.
	r\breve.
%80
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r1 e g
%85
	g1. g2 g1 |
	g1 e\breve
	e1 e fis
	g1. g2 g1
	g1 a\breve
%90
	gis1 a a |
	a\breve a1
	a\breve a1
	a\breve r1 |
% End of triple time
	g1. g2
%95
	g1 e2 e~ |
	e2 g g1
	a1 r
	r\breve
	r\breve
%100
	r\breve |
	r2 a1 e2
	g2. f8 e d2 g
	g2. g4 g1
	r\breve
%105
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%110
	r\breve |
	r\breve
	r2 e1 e2
	e1 e2 a1 a2 f2. e8 d
%115
	g2 g r g |
	g2 g1 a2
	g4 f f2. e8 d e2
	f1 r2 g1 g2 g g
%120
	a1 a |
	g1 r
	r\breve
	r\breve
	r\breve
%125
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%130
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%135
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%140
	r\breve |
	r\breve
	a1. a2
	g1 g2 g2 ~ g g2 a1
%145
	a1 r |
	r\breve
	r\breve
	r\breve
	r\breve
%150
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%155
	r2 g1 g2 |
	g1 g2 b1 g2 g1
	g2 g1 g2
	g1 f2. e4
%160
	d2 a'1 e2 |
	fis2 a a c1 h2 a a1 g2 a1
	r\breve
%165
	r\breve |
	r\breve
	r\breve
	r\breve
	r2 a1 d,2
%170
	a'2. g4 f2 d |
	e2 a a1
	f1 r
	r\breve
	r2 a a a1
%175
	g2. f4 e2 |
	g1 g
	e2 c'1 h2
	a1 gis2 a1 a2 d,1
%180
	g1 r |
	r\breve
	r\breve
	r1 c2. h4
	a2 g a e
%185
	e\breve |
	c'2. h4 a2 g
	f1 r
	r2 a2. a4 f2
	a2 a1 e2
%190
	fis\longa |
      }

tenorsecundus =  \relative c'
	{
	r\breve
	r\breve
	r\breve
	r1 cis
%5
	d1 f |
	f2 e1 f2
	d1. cis2
	r\breve
	r\breve
%10
	r2 e1 e2 |
	f2. f4 d2 e
	f\breve
	f2 a1 g2
	f2 e f2. e4
%15
	d2 e f2. e4 |
	d1 g
	c,1 r
	c1 d
	e2 f e e
%20
	fis1 r |
	g\breve
	g2 c,1 c2
	b1. b2
	b2 f4 g a g a b
%25
	c1 r |
	r\breve
	r\breve
	r\breve
	r2 f1 f2
%30
	f1 e |
	r\breve
	r2 d1 e2
	d1 d
	r\breve
%35
	r2 e1 e2 |
	a,1. a2
	c1 h2 e2. d4 c h a1
	r\breve
%40
	r\breve |
	r1 r2 e'1 e2 a,4 h c d
	e2 a, a' a
	a1 a
%45
	r\breve |
	r\breve
	r2 g1 g2
	g1 e2 f2 ~ f c2 d e
%50
	f1 r |
	r\breve
	r\breve
	r2 f f1
	f2 d d \ficta cis
%55
	d1 r |
	r\breve
	r1 r2 d
	g2 fis1 fis2
	g2 e f\breve
%60
	e2 e1 d2 c d
	h2 a h1
	cis1 r
	r\breve
%65
	r2 d1 d2 |
	d1. h2
	g2 a h1
	c\breve
	r2 h1 h2
%70
	d1 d |
	c1. c2
	h1 e2. e4
	cis\breve |
% Triple time
	e\breve e1
%75
	e\breve e1 |
	c\breve d1
	h\breve h1
	r\breve.
	r\breve.
%80
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r1 cis d
%85
	e1. e2 e1 |
	d1 c\breve
	h1 h d
	d1. d2 d1
	e1 a,\breve
%90
	h1 cis d |
	cis1. d2 e1
	f1 e1. e2
	fis\breve r1 |
% End of triple time
	d1. d2
%95
	h1 g2 c~ |
	c2 c e1
	f1 r
	r\breve
	r\breve
%100
	r2 g1 d2 |
	f1 c2. d4
	e4 f g2. f4 e2
	d2 d c1
	r\breve
%105
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%110
	r\breve |
	r\breve
	c2. h4 a2 h
	c1 h2 a
	a2 c1 h2
%115
	c1 r2 c |
	d2 e1 f2
	d2 d g1
	c,1 r2 e1 c2 d d
%120
	d4 e fis g a2 d, |
	d1 r
	c1. c2
	c1 g2 c4 d
	e4 f g1 e2
%125
	d1 c~ |
	c\breve
	r\breve
	r\breve
	r1 g'
%130
	f1 c |
	d1 e2. e4
	a,1 r2 d1 d2 c2. h4
	a2 g f1
%135
	g2 g'1 g2 |
	f2. e4 d2 c
	b1 c
	c1 d
	f1 b,\breve
%140
	c2. c4 |
	f,1 r
	c'1. c2
	c1 c2 h2 ~ h h2 d1
%145
	e1 c |
	d2 e1 d2
	e2 f g\breve c,1
	r2 c1 d1
%150
	e1 c2 |
	d2 e d1
	e1 r
	r\breve
	r\breve
%155
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%160
	r\breve |
	r2 d fis g1 g2 f e
	d1 e
	r\breve
%165
	r\breve |
	r\breve
	r\breve
	r\breve
	r1 a
%170
	d,2 a'1 g2 |
	a2 f e1
	d1 r
	r\breve
	r2 e e f1
%175
	d1 g2 ~ g4 f4 e2 d d
	c2 g'1 g2
	e1 e2 e1
	fis2 g1
%180
	d1 r |
	r\breve
	r\breve
	r1 r2 e2 ~ e d2 e2. d4
%185
	c2 a h h |
	a1 r
	r\breve
	r2 e' a, a2. h4 cis d e2 a,1
%190
	d1 d2 |
	d\breve |
	}

bassussecundus =  \relative c
	{
	r\breve
	r\breve
	r\breve
	r1 a'
%5
	g1 f |
	f2 c'1 f,2
	g1 a
	r\breve
	r\breve
%10
	r2 a1 a2 |
	d2. d4 d2 c
	b\breve
	f1 c'
	r1 d1.
%15
	c2 b a |
	\ficta b2 \ficta b! g1
	f2 f1 g2
	a1 \ficta b
	a1 a
%20
	d,1 r |
	g\breve
	c,1 f
	\ficta b,2 \ficta b!1 \ficta b!2
	\ficta b1 f'1 ~
%25
	f r1 |
	r\breve
	r\breve
	r\breve
	r2 f1 d2
%30
	f1 c |
	r\breve
	r2 g'1 e2
	g1 d
	r\breve
%35
	r2 c1 c2 |
	f2. e4 d1
	a1 e'2 e
	a,\breve
	r\breve
%40
	r\breve |
	r1 r2 a'1 g2 f1
	e2 d1 cis2
	d1 a'
%45
	r\breve |
	r\breve
	r2 c1 c2
	g1 a2 f2 ~ f a2 g1
%50
	f1 r |
	r\breve
	r\breve
	r2 f \ficta b1
	f2 g a2. a4
%55
	d,1 r |
	r\breve
	r1 r2 g
	g2 d'1 d2
	c2 c b\breve
%60
	c2 c1 g2 a d,
	e2 f e1
	a1 r
	r\breve
%65
	r2 d,1 d2 |
	g1. g2
	g2 fis g1
	c,\breve
	r2 g'1 g2
%70
	d1 d |
	a'1. a2
	e\breve
	a\breve |
% Triple time
	e\breve e1
%75
	a\breve e1 |
	f\breve d1
	e\breve e1
	r\breve.
	r\breve.
%80
	r\breve. |
	r\breve.
	r\breve.
	r\breve.
	r1 a g
%85
	c1. c2 c1 |
	g1 a\breve
	e1 e d
	g1. g2 g1
	c,1 f\breve
%90
	e1 a d, |
	a'1. h2 cis1
	d1 a a
	d,\breve r1 |
% End of triple time
	g1. g2
%95
	g1 c,2 c~ |
	c2 c c1
	f1 r
	r\breve
	r\breve
%100
	r\breve |
	d'1 a2 c1 g2 h c
	g1 c,
	r\breve
%105
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%110
	r\breve |
	r\breve
	r2 a'1 gis2
	a1 e2 f1 f2 d1
%115
	c1 c' |
	h2 c1 a2
	b2 b g1
	f1 r2 c'1 c2 g g
%120
	d'1. d2 |
	g,1 r
	r\breve
	r\breve
	r\breve
%125
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%130
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%135
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%140
	r\breve |
	r\breve
	f1. f2
	c1 c2 g'2 ~ g g2 d1
%145
	a'1 r |
        r\breve
	r\breve
	r\breve
	r\breve
%150
	r\breve |
	r\breve
	r\breve
	r\breve
	r\breve
%155
	r\breve |
	r\breve
	r\breve
	r2 c,1 c2
	g'1 d1 ~
%160
	d1 a'2. a4 |
	d,2 d' d c1 g2 a a
	b1 a
	r\breve
%165
	r\breve |
	r\breve
	r\breve
	r\breve
	a1 d,2 d'1
%170
	cis2 d \ficta b |
	a1 a
	r\breve
        r\breve
	r2 a a d1
%175
	g,2 h c |
	g\breve
	r2 c1 g2
	a1 e2 a1 d,2 g1
%180
	g1 r |
	r\breve
	r\breve
	r1 r2 c2 ~ c h2 a gis
%185
	a1 e |
	f2. g4 a h c2
	f,1 r
	a2. a4 f2 d
	a'1 a
%190
	d,\longa |
	}


lyricscantusprimus = \lyricmode {
	Sta -- bat Ma -- ter do -- lo -- ró -- sa
	dum pen -- dé -- bat Fí -- li -- us,
	O quam tri -- stis et af -- flí -- cta
	fu -- it il -- la be -- ne -- dí -- cta
	ma -- ter U -- ni -- gé -- ni -- ti!
	et do -- lé -- bat
	cum vi -- dé -- bat 
	na -- ti pœ -- nas in -- _ _ cly -- ti.
	Quis est ho -- mo qui non fle -- _ _ ret,
	in tan -- to sup -- plí -- _ _ ci -- o?
	pi -- am ma -- trem con -- tem -- plá -- ri
	Pro pec -- cá -- tis su -- æ gen -- tis
	vi -- dit su -- um dul -- cem na -- tum
	dum e -- mí -- sit spí -- ri -- tum,
	spí -- ri -- tum.
	Me sen -- tí -- re vim do -- ló -- ris
	fac, ut te -- cum lú -- ge -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cru -- ci -- fí -- xi fi -- ge pla -- gas
	Tu -- i na -- ti vul -- ne -- rá -- ti,
	tam di -- gná -- ti pro me pa -- ti,
	pœ -- nas me -- cum dí -- _ _ vi -- de.
	do -- nec e -- go ví -- xe -- ro.
	Jux -- ta cru -- cem te -- _ _ _ cum sta -- re,
	et me ti -- bi so -- ci -- á -- re __ _ _ _ 
	in plan -- ctu de -- _ _ sí -- de -- ro.
	Vir -- go vír -- gi -- num præ -- clá -- ra,
	mi -- hi jam non sis a -- má -- ra,
	fac __ _ _ me te -- cum plán -- _ _ ge -- re.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	Fac me pla -- gis vul -- ne -- rá -- ri,
	cru -- ce hac in -- e -- bri -- á -- ri
	et cru -- ó -- re Fí -- li -- i.
	per te, vir -- go sim de -- fen -- sus
	in di -- e ju -- _ _ _ di -- ci -- i.
	mor -- te Chri -- sti prae -- mu -- ni -- ri,
	con -- fo -- ve -- ri gra -- _ _ ti -- a.
	fac, ut a -- ni -- mae do -- ne -- tur
	pa -- ra -- di -- si glo -- ri -- a,
	glo -- _ _ _ _ _ ri -- a.
}


lyricsaltusprimus = \lyricmode {
	Sta -- bat Ma -- ter do -- lo -- ró -- sa
	dum pen -- dé -- bat Fí -- li -- us,
	O __ _ _ quam tri -- stis et af -- flí -- cta
	fu -- it il -- la be -- ne -- dí -- cta
	ma -- ter U -- ni -- gé -- ni -- ti!
	et do -- lé -- bat
	cum vi -- dé -- bat 
	na -- ti pœ -- _ _ nas ín -- cly -- ti.
	Quis est ho -- mo qui non fle -- ret,
	in tan -- to sup -- plí -- ci -- o?
	pi -- am ma -- trem con -- tem -- plá -- ri
	Pro pec -- cá -- tis su -- æ gen -- tis
	vi -- dit su -- um dul -- cem na -- tum
	dum e -- mí -- sit spí -- ri -- tum, __ _ _ _
	spí -- ri -- tum.
	Me sen -- tí -- re vim do -- ló -- ris
	fac, ut te -- cum lú -- ge -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cru -- ci -- fí -- xi fi -- ge pla -- _ gas
	Tu -- i na -- ti vul -- ne -- rá -- ti,
	tam di -- gná -- ti pro me pa -- ti,
	pœ -- nas me -- cum dí -- vi -- de.
	do -- nec e -- go vi -- _ _ _ xe -- ro.
	Jux -- ta cru -- cem te -- cum sta -- re,
	et me ti -- bi so -- ci -- á -- re
	in plan -- ctu de -- sí -- _ _ de -- ro.
	Vir -- go vír -- gi -- num præ -- clá -- ra,
	mi -- hi jam non sis a -- má -- ra,
	fac me te -- cum plán -- _ _ ge -- re.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	pas -- si -- ó -- nis fac con -- sór -- tem,
	et pla -- gas re -- có -- le -- re.
	per te, vir -- go sim de -- fen -- sus
	in di -- e ju -- di -- ci -- i.
	mor -- te Chri -- _ _ sti prae -- mu -- ni -- ri,
	con -- fo -- ve -- ri gra -- ti -- a.
	fac, ut a -- ni -- mae do -- ne -- _ _ _ tur
	pa -- ra -- di -- si glo -- ri -- a.
}


lyricstenorprimus = \lyricmode {
	Sta -- bat Ma -- ter do -- lo -- ró -- sa
	dum pen -- dé -- bat Fí -- _ _ li -- us,
	O __ _ quam tri -- stis et af -- flí -- cta
	fu -- it il -- la be -- ne -- dí -- cta
	ma -- ter U -- ni -- gé -- ni -- ti!
	et do -- lé -- bat
	cum vi -- dé -- bat 
	na -- ti pœ -- _ _ nas ín -- cly -- ti.
	Quis est ho -- _ _ _ _ mo qui non fle -- _ _ ret,
	in tan -- to sup -- plí -- _ _ _ _ _ ci -- o?
	pi -- am ma -- trem con -- tem -- plá -- _ _ _ ri
	Pro pec -- cá -- tis su -- æ gen -- tis
	vi -- dit su -- um dul -- cem na -- tum
	dum e -- mí -- sit spí -- ri -- tum,
	spi -- _ _ _ _ _ _ _ _ _ ri -- tum.
	Me sen -- tí -- re vim do -- ló -- ris
	fac, ut te -- cum lú -- ge -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cru -- ci -- fí -- xi fi -- ge pla -- gas
	Tu -- i na -- ti vul -- ne -- rá -- ti,
	tam di -- gná -- ti pro me pa -- _ _ _ _ _ _ ti,
	pœ -- nas me -- cum dí -- _ _ vi -- de.
	do -- nec e -- go __ _ _ ví -- xe -- ro.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	pas -- si -- ó -- nis fac con -- sór -- _ _ _ _ tem,
	et pla -- gas re -- có -- le -- re.
	Fac me pla -- gis vul -- ne -- rá -- ri,
	cru -- ce hac in -- e -- bri -- á -- ri
	et cru -- ó -- re Fí -- li -- i.
	per te, vir -- go sim de -- fen -- sus
	in di -- e __ _ _ _ _ _ ju -- di -- ci -- i.
	mor -- te Chri -- sti prae -- mu -- ni -- ri,
	con -- fo -- ve -- ri gra -- _ _ ti -- a.
	fac, ut a -- ni -- mae do -- ne -- _ _ _ _ tur
	pa -- _ _ ra -- di -- si glo -- _ ri -- a.
}


lyricsbassusprimus = \lyricmode {
	Sta -- bat Ma -- ter do -- lo -- ró -- sa
	dum pen -- dé -- bat Fí -- li -- us, __ _
	O quam tri -- stis et af -- flí -- cta
	fu -- it il -- la be -- ne -- dí -- cta
	ma -- ter U -- ni -- gé -- ni -- ti!
	et do -- lé -- bat
	cum vi -- dé -- bat 
	na -- ti pœ -- nas ín -- cly -- ti.
	Quis est ho -- mo qui non fle -- ret,
	in tan -- to sup -- plí -- ci -- o? __ _
	pi -- am ma -- trem con -- tem -- plá -- ri
	Pro pec -- cá -- tis su -- æ gen -- tis
	vi -- dit su -- um dul -- cem na -- tum
	dum e -- mí -- sit spí -- ri -- tum,
	spí -- ri -- tum.
	Me sen -- tí -- re vim do -- ló -- ris
	fac, ut te -- cum lú -- ge -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cru -- ci -- fí -- xi fi -- ge pla -- gas
	Tu -- i na -- ti vul -- ne -- rá -- ti,
	tam di -- gná -- ti pro me pa -- _ _ ti,
	pœ -- nas me -- cum dí -- vi -- de.
	do -- nec e -- go ví -- xe -- ro.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	pas -- si -- ó -- nis fac con -- sór -- tem,
	et pla -- gas re -- có -- le -- re.
	per te, vir -- go sim de -- fen -- sus
	in di -- e __ _ _ _ _ ju -- di -- ci -- i.
	mor -- te Chri -- sti prae -- mu -- ni -- ri,
	con -- fo -- ve -- ri gra -- _ _ ti -- a.
	fac, ut a -- ni -- mae do -- ne -- _ _ _ _ tur
	pa -- ra -- di -- si glo -- _ ri -- a.
}


lyricscantussecundus = \lyricmode {
	Jux -- ta cru -- cem la -- cry -- mó -- sa,
	cu -- jus á -- ni -- mam ge -- men -- tem,
	con -- tri -- sta -- tam et do -- lén -- tem
	per -- tran -- sí -- vit __ _ _ _ glá -- di -- us.
	O quam tri -- stis et af -- flí -- cta
	Quae mœ -- ré -- bat
	et tre -- me -- bat
	na -- ti pœ -- nas ín -- cly -- ti. __ _ _
	Chri -- sti ma -- trem si vi -- dé -- ret
	Quis non pos -- set con -- tri -- stá -- ri,
	do -- lén -- tem cum Fí -- li -- o?
	vi -- dit Jé -- sum in tor -- mén -- tis,
	et fla -- gél -- lis súb -- di -- tum;
	mo -- ri -- én -- tem, de -- so -- lá -- tum,
	dum e -- mí -- sit spí -- ri -- tum.
	E -- ja Ma -- ter, fons a -- mó -- ris,
	Fac, ut ár -- de -- at cor me -- um
	in a -- mán -- do Chri -- stum De -- _ um,
	ut si -- bi com -- plá -- ce -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cor -- di me -- o __ _ _ _ _ vá -- li -- de.
	Fac me te -- cum pi -- e fle -- re,
	cru -- ci -- fí -- xo con -- do -- lé -- re,
	do -- nec e -- go ví -- xe -- ro.
	Jux -- ta cru -- cem te -- _ _ _ cum sta -- re,
	et me ti -- bi so -- ci -- á -- re __ _ _ _ _ _ 
	in plan -- ctu de -- sí -- _ _ de -- ro.
	Vir -- go vír -- gi -- num præ -- clá -- ra,
	mi -- hi jam non sis a -- má -- ra,
	fac me te -- cum __ _ plán -- ge -- re.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	Fac me pla -- gis vul -- ne -- rá -- ri,
	cru -- ce hac in -- e -- bri -- á -- ri
	et cru -- ó -- re Fí -- _ _ li -- i.
	In -- flam -- ma -- tus et ac -- cen -- sus
	Fac me cru -- ce cu -- sto -- di -- _ ri,
	con -- fo -- ve -- ri gra -- _ _ ti -- a.
	Quan -- do cor -- pus mo -- ri -- e -- tur,
	pa -- ra -- di -- si glo -- ri -- a
	glo -- _ _ ri -- a __ _ _ _
	pa -- ra -- di -- si glo -- ri -- a.
}


lyricsaltussecundus = \lyricmode {
	Jux -- ta cru -- cem la -- cry -- mó -- sa,
	cu -- jus á -- ni -- mam ge -- men -- tem,
	con -- tri -- sta -- tam et do -- lén -- tem
	et do -- _ _ lén -- tem
	per -- tran -- sí -- _ _ _ _ vit glá -- di -- us.
	O quam tri -- stis et af -- flí -- cta __ _ _
	Quae mœ -- ré -- bat
	et tre -- me -- bat
	na -- ti pœ -- nas __ _ _ ín -- cly -- ti. __ _ _ _ _ _ _ _ _
	Chri -- sti ma -- trem si vi -- dé -- ret
	Quis non pos -- set con -- tri -- stá -- ri,
	do -- lén -- tem cum Fí -- li -- o?
	vi -- dit Jé -- sum in tor -- mén -- tis,
	et fla -- gél -- lis súb -- di -- tum;
	mo -- ri -- én -- tem, de -- so -- lá -- tum,
	dum e -- mí -- sit spi -- _ _ _ _ _ _ _ _ _ ri -- tum.
	E -- ja Ma -- ter, fons a -- mó -- ris,
	Fac, ut ár -- de -- at cor me -- um
	in a -- mán -- do Chri -- stum De -- um,
	ut si -- bi com -- plá -- ce -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cor -- di me -- _ _ _ o vá -- li -- de.
	Fac me te -- cum pi -- e fle -- _ _ _ re,
	cru -- ci -- fí -- xo con -- do -- lé -- _ _ _ re,
	do -- nec e -- go ví -- xe -- ro.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	cru -- ce hac in -- e -- bri -- á -- ri
	et cru -- ó -- re __ _ _ Fí -- li -- i.
	In -- flam -- ma -- tus et ac -- cen -- sus
	Fac me cru -- _ _ ce cu -- sto -- di -- ri,
	con -- fo -- ve -- ri __ _ _ gra -- ti -- a.
	Quan -- do cor -- pus mo -- ri -- e -- tur,
	pa -- ra -- di -- si glo -- ri -- a
	glo -- _ _ ri -- a
	pa -- ra -- di -- si glo -- ri -- a.
}
	

lyricstenorsecundus = \lyricmode {
	Jux -- ta cru -- cem la -- cry -- mó -- sa,
	cu -- jus á -- ni -- mam ge -- men -- tem,
	con -- tri -- sta -- tam et __ _ _ do -- lén -- _ _ _ tem
	per -- tran -- sí -- vit glá -- di -- us.
	O quam tri -- stis et af -- flí -- cta __ _ _ _ _ _ _
	Quae mœ -- ré -- bat
	et tre -- me -- bat
	na -- ti pœ -- nas ín -- cly -- ti. __ _ _ _ _
	Chri -- sti ma -- _ _ _ _ trem si vi -- dé -- ret
	Quis non pos -- set con -- tri -- stá -- _ ri,
	do -- lén -- tem cum Fí -- li -- o?
	vi -- dit Jé -- sum in tor -- mén -- tis,
	et fla -- gél -- lis súb -- di -- tum; __ _
	mo -- ri -- én -- tem, de -- so -- lá -- tum,
	dum e -- mí -- sit spí -- ri -- tum,
	spí -- ri -- tum.
	E -- ja Ma -- ter, fons a -- mó -- ris,
	Fac, ut ár -- de -- at cor me -- um
	in a -- mán -- do Chri -- stum De -- um,
	ut si -- bi __ _ _ com -- plá -- ce -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cor -- di me -- o __ _ _ _ _ _ _ vá -- li -- de.
	Fac __ _ _ me te -- cum pi -- e fle -- _ re,
	cru -- ci -- fí -- xo con -- do -- lé -- re,
	do -- nec e -- go ví -- _ _ _ _ xe -- ro.
	Jux -- ta cru -- cem te -- _ _ _ _ cum sta -- re,
	in plan -- ctu de -- sí -- de -- ro.
	Vir -- go vír -- gi -- num præ -- clá -- ra,
	mi -- hi jam non sis a -- má -- ra,
	fac me te -- cum plán -- ge -- re.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	pas -- si -- ó -- nis fac con -- sór -- tem,
	et pla -- gas re -- có -- le -- re. __ _
	In -- flam -- ma -- tus et ac -- cen -- sus
	Fac me cru -- ce cu -- sto -- di -- ri,
	con -- fo -- ve -- ri gra -- _ _ _ ti -- a.
	Quan -- do cor -- pus mo -- ri -- e -- tur,
	pa -- ra -- di -- _ _ si glo -- ri -- a
	pa -- ra -- di -- _ _ _ _ si glo -- ri -- a.
}


lyricsbassussecundus = \lyricmode {
	Jux -- ta cru -- cem la -- cry -- mó -- sa,
	cu -- jus á -- ni -- mam ge -- men -- tem, __ _
	con -- tri -- sta -- tam et do -- lén -- tem
	per -- tran -- sí -- vit glá -- di -- us.
	O quam tri -- stis et af -- flí -- cta
	Quae mœ -- ré -- bat
	et tre -- me -- bat
	na -- ti pœ -- _ _ nas ín -- cly -- ti.
	Chri -- sti ma -- trem si vi -- dé -- ret
	Quis non pos -- set con -- tri -- stá -- ri,
	do -- lén -- tem cum Fí -- li -- o?
	vi -- dit Jé -- sum in tor -- mén -- tis,
	et fla -- gél -- lis súb -- di -- tum; __ _
	mo -- ri -- én -- tem, de -- so -- lá -- tum,
	dum e -- mí -- sit spí -- ri -- tum. __ _
	E -- ja Ma -- ter, fons a -- mó -- ris,
	Fac, ut ár -- de -- at cor me -- um
	in a -- mán -- do Chri -- stum De -- um,
	ut si -- bi __ _ _ com -- plá -- ce -- am.
	San -- cta Ma -- ter, i -- stud a -- gas,
	cor -- di me -- o vá -- li -- de. __ _
	Fac me te -- cum pi -- e fle -- re,
	cru -- ci -- fí -- xo con -- do -- lé -- re,
	do -- nec e -- go ví -- xe -- ro.
	Fac, ut por -- tem Chri -- sti mor -- tem,
	et cru -- ó -- re Fí -- li -- i.
	In -- flam -- ma -- tus et ac -- cen -- sus
	Fac me cru -- ce cu -- sto -- di -- ri,
	con -- fo -- ve -- ri gra -- ti -- a.
	Quan -- do cor -- pus mo -- ri -- e -- tur,
	pa -- ra -- di -- si glo -- ri -- a __ _ _ _ _ _
	pa -- ra -- di -- si glo -- ri -- a.
}



\score {
	\transpose c b, {
		\new StaffGroup << 
			\new Staff << \global \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" 
	      \new Voice="v1" { \cantusprimus \showBarLine \bar "|." }
	      \new Lyrics \lyricsto "v1" {\lyricscantusprimus }
			>> 
			\new Staff << \global \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" 
	      \new Voice="v5" { \cantussecundus }
	      \new Lyrics \lyricsto "v5" {\lyricscantussecundus }
			>> 
			\new Staff << \global \set Staff.instrumentName = #"A1" \set Staff.shortInstrumentName = #"A1" 
	      \new Voice="v2" { \altusprimus }
	      \new Lyrics \lyricsto "v2" {\lyricsaltusprimus }
			>> 
			\new Staff << \global \set Staff.instrumentName = #"A2" \set Staff.shortInstrumentName = #"A2" 
	      \new Voice="v6" { \altussecundus }
	      \new Lyrics \lyricsto "v6" {\lyricsaltussecundus }
			>> 
			\new Staff << \global \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" 
	      \new Voice="v3" { \clef "treble_8" \tenorprimus }
	      \new Lyrics \lyricsto "v3" {\lyricstenorprimus }
			>> 
			\new Staff << \global \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" 
	      \new Voice="v7" { \clef "treble_8" \tenorsecundus }
	      \new Lyrics \lyricsto "v7" {\lyricstenorsecundus }
			>> 
			\new Staff << \global \set Staff.instrumentName = #"B1" \set Staff.shortInstrumentName = #"B1" 
	      \new Voice="v4" { \clef bass \bassusprimus }
	      \new Lyrics \lyricsto "v4" {\lyricsbassusprimus}
			>> 
			\new Staff << \global \set Staff.instrumentName = #"B2" \set Staff.shortInstrumentName = #"B2" 
	      \new Voice="v8" { \clef bass \bassussecundus }
	      \new Lyrics \lyricsto "v8" {\lyricsbassussecundus}
			>> 
		>> 
	}
	\header {
	}
	\layout { }
	\midi {	}
}
