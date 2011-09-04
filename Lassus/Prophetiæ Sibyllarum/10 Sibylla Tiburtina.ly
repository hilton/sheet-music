\version "2.10.33"

\header {
	title = "10. Sibylla Tiburtina"
	composer = "Orlando di Lasso"
	copyright = \markup \center-align \tiny { 
		\line { Copyright ©2008 Cappella Gabrieli - \with-url #"http://cappellagabrieli.nl" http://cappellagabrieli.nl }
		\line { Licensed under the Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 License - \with-url #"http://creativecommons.org/licenses/by-nc-nd/3.0" http://creativecommons.org/licenses/by-nc-nd/3.0 }
	}
	tagline = ##f 
}

global= { 
	\key es \major
	\time 4/2
	\tempo 2 = 100
	\set Score.timing = ##f 
	\override Score.LyricText #'font-size = #0
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 18) 
	#(set-accidental-style 'forget)
}

\paper { 
	% annotate-spacing = ##t
	page-top-space = 0
	between-system-padding = 0.3\cm 
	ragged-bottom = ##f
	ragged-last-bottom = ##t 
} 

soprano = \new Voice { \transpose c es {
	\relative c' {
		\override NoteHead #'style = #'baroque
		cis\breve d1 g1. g1 f1. e\breve f1 f2 f1 fis g2 g2. e4 \bar "" \break
		e1 d b r2 c1 c2 a a cis1 d dis1. dis2 e e e1 f2 e e1 \bar "" \break
		e2 a, b2. b4 c2 e1 d2 d1. d2 f1 e2 e1 e2 e1 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 1)
			\time 3/1 e\breve a,1 b c c\breve \bar "" \break
		b1 a\breve b1 d e f1. e2 e1 d e g fis\breve 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 2)
			\time 4/2 g d e1. e2 \bar "" \break
		f\breve d cis1 e fis1. a2 g1. g2 f1 e cis r \bar "" \break
		r e \break d2 e f1 e2 f d1 cis2 d b1. b2 b1 c\breve b\longa \bar "||"
	}
	\addlyrics {
		Ver -- rax ip -- se De -- us __ de -- dit hæc mi -- hi mu -- ni -- 
		a fan -- di Car -- mi -- ne, quod sanc -- tam po -- tu -- i mon -- stra -- re pu -- el -- 
		lam. Con -- ci -- pi -- et, quæ Na -- zza -- re -- is in fi -- ni -- bus il -- lum, Quem sub car -- 
		ne De -- um Beth -- le -- mi -- ti -- ca ru -- ra vi -- de -- bunt. O ni -- mi -- 
		um fe -- lix cœ -- lo dig -- nis -- si -- ma ma -- ter, 
		Quæ tan -- tam sa -- cro lac -- ta -- bit ab u -- be -- re pro -- lem
	}
}}

alto = \new Voice { \transpose c es {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		e\breve g2. a4 b2 c b c2. b4 a g f1 g\breve a1. bes2 bes a1 c2 b2. c4
		c1 a d r2 g,1 g2 c c a1 a b1. b2 b c b1 d2 c b1
		cis2 cis d2. d4 e2 c2. b4 a g a2 a b2. b4 c2 d c2. b4 b\breve \time 3/1 cis\breve cis1 d g, a\breve
		g1 fis\breve g1 b c d1. c2 c1 a c b a\breve \time 4/2 d b c2. b8 a g2 g
		a\breve f1 g e a\breve a1 b2 b1 c2 a a2. \set suggestAccidentals = ##t gis8 fis gis2 \set suggestAccidentals = ##f e  e fis g
		a1 g2 a fis g a1 g2 a g1 e2 fis g1. gis2 gis1 a\breve gis\longa
	}
	\addlyrics {
		Ver -- rax __ _ _ ip -- se De __ _ _ _ _ us __ de -- dit hæc mi -- hi mu -- ni -- 
		a fan -- di Car -- mi -- ne, quod sanc -- tam po -- tu -- i mon -- stra -- re pu -- el -- 
		lam. Con -- ci -- pi -- et, quæ __ _ _ _ _ Na -- zza -- re -- is in fi -- ni -- bus il -- lum, Quem sub car -- 
		ne De -- um Beth -- le -- mi -- ti -- ca ru -- ra vi -- de -- bunt. O ni __ _ _ _ mi -- 
		um fe __ _ lix cœ -- lo dig -- nis -- si -- ma ma __ _ _ _ ter, 
		Quæ tan -- tam sa -- cro, quæ tan -- tam sa -- cro lac -- ta -- bit ab u -- be -- re pro -- lem
	}
}}

tenor = \new Voice { \transpose c es {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		a\breve b2. c4 d2 e1 e2 a,4 b c2. b8 a b2 c\breve c1. d2 d d1 e2 d2. g,4
		g2 g2. fis8 e fis2 g1 r2 e1 e2 f f e1 fis2 fis1 fis2 fis fis g1 gis a2 a2. gis4 gis2
		a e g2. g4 g2 g a fis2. fis4 fis2 r g a1. a2 gis\breve \time 3/1 a\breve e1 g e f\breve
		d1 d\breve d1 g g bes1. g2 g1 fis g d' d\breve \time 4/2 b r1 g\breve c1~ c2
		c2 c1 bes\breve a1 cis d cis2 d1 d2 e1 d2. c4 b a b2 a a a e
		c'1 c2 c a c c1 c2 c b1 a d2 d, e1. e2 e1 e e\longa
	}
	\addlyrics {
		Ver -- rax __ _ _ ip -- se De __ _ _ _ _ _ us __ de -- dit hæc mi -- hi mu -- ni -- 
		a fan __ _ _ _ di Car -- mi -- ne, quod sanc -- tam po -- tu -- i mon -- stra -- re pu -- el __ _ _
		lam. Con -- ci -- pi -- et, quæ Na -- zza -- re -- is in fi -- ni -- bus il -- lum, Quem sub car -- 
		ne De -- um Beth -- le -- mi -- ti -- ca ru -- ra vi -- de -- bunt. O ni -- mi -- 
		um fe -- lix cœ -- lo dig -- nis -- si -- ma ma __ _ _ _ _ ter, 
		Quæ tan -- tam sa -- cro, quæ tan -- tam sa -- cro lac -- ta __ _ bit ab u -- be -- re pro -- lem
	}
}}

bass = \new Voice { \transpose c es {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "bass"
		a\breve g2 g'1 c,2 e1 f2. e4 d1 c\breve f1. bes,2 bes d1 c2 g2. c4
		c1 d g, r2 c1 c2 f, f a1 d b1. b2 e c e1 d2 a e'1 
		a,1 r2 g2 c2. c4 a2 d1 d2 g2. g4 f2 d a2. a4 e'\breve \time 3/1 a,\breve a1 g c f,\breve
		g1 d\breve g1 g c bes1. c2 c1 d c g d'\breve \time 4/2 g, g' c,1. c2
		f\breve bes,1 g a\breve d1 fis2 fis g2. f4 e2 c  d1 e a,2 a d c
		f,1 c'2 a d c f,1 c'2 f,2 g1 a2 d g,2. g4 e\breve a e\longa
	}
	\addlyrics {
		Ver -- rax ip -- se De __ _ _ _ us __ de -- dit hæc mi -- hi mu -- ni -- 
		a fan -- di Car -- mi -- ne, quod sanc -- tam po -- tu -- i mon -- stra -- re pu -- el -- 
		lam. Con -- ci -- pi -- et, quæ Na -- zza -- re -- is in fi -- ni -- bus il -- lum, Quem sub car -- 
		ne De -- um Beth -- le -- mi -- ti -- ca ru -- ra vi -- de -- bunt. O ni -- mi -- 
		um fe __ _ lix cœ -- lo dig -- nis __ _ _ si -- ma ma -- ter, 
		Quæ tan -- tam sa -- cro, quæ tan -- tam sa -- cro  lac -- ta -- bit ab u -- be -- re pro -- lem
	}
}}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\override Score.MetronomeMark #'transparent = ##t
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\layout {
		indent = #0
	}
	\midi {
	}
}
