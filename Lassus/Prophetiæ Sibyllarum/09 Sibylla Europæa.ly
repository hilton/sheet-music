% Copyright ©2013 Peter Hilton - https://github.com/hilton
% CPDL #30372
% http://www.cpdl.org/wiki/index.php/Prophetiae_Sibyllarum_-_IX._Sibylla_Europaea_(Orlando_di_Lasso)

\version "2.16.2"
\pointAndClickOff

#(set-global-staff-size 16)

\paper { 
	% annotate-spacing = ##t
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	top-margin = 15\mm
	left-margin = 15\mm
	right-margin = 15\mm
	system-system-spacing = #'( (padding . 10) (basic-distance . 20) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##t 
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"9. Sibylla Europæa"
	}
	subtitle = \markup \medium \sans {
		"Prophetiæ Sibyllarum"
	}
	composer = \markup \sans {
		"Orlando di Lasso"
	}
	copyright = \markup \tiny \sans {
		\vspace #6
		\column \center-align {
			\line {
				This edition copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music
			}
			\line {
				Licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/
			}
		}
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
	\accidentalStyle "forget"
}

soprano = \new Voice { \transpose c es {
	\relative c' {
		\override NoteHead #'style = #'baroque
		r1 e1. e2 cis cis d1 e\breve fis1. fis2 g c, e1. a,2 b c1 c2 
		b1 b r2 e, a1  a2 cis d1 d2 e2. e4 e2 g1 g r2 fis1 g2 e1 d2 e2. e4 e1 e2 
		f1. f2 e1 f2 f d1 e1~ e1 e1 e2 e a, bes a1 c\breve c d
		d2 e e1 dis\breve r1 b2. b4 d2 e d2. b4 b2 b e1 a,1. a2 c1 b2 b c1 
		c2 c d1 c2 c1 f e2 d1 cis r d1. d2 c1 b e1. e2 f1 d cis\longa
	}
	\addlyrics {
		Vir -- gi -- nis æ -- ter -- num __ ve -- ni -- et de cor -- po -- re ver -- bum
		pu -- rum. Qui val -- les et mon -- tes trans -- i -- et al -- tos, il -- le vol -- lens e -- ti -- am stel --
		la -- to mis -- sus o -- lym -- po __ E -- de -- tur mun -- do pau -- per, qui __ cunc -- 
		ta si -- len -- ti __ rex e -- rit im -- pe -- ri -- o. Sic cre -- do, sic cre -- do et men -- 
		te fa -- te -- bor. Hu -- ma -- no si -- mul et di -- vi -- no se -- mi -- ne na -- tus.
	}
}}

alto = \new Voice { \transpose c es {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		e1. e2 gis1 a b gis\breve a1. a2 c g a1. e2 g e1 e2 
		e1 e r2 cis d1 d2 e fis1 g2 g2. g4 a2 b1 b r2 a1 d2 g,1 g2 g2. g4 g2 a1 
		a2 a bes1 g a2 c2. b8 a b2 c1 a a2 a a1 fis2 g2. fis8 e fis2 g\breve f fis
		g2 gis a1 fis\breve r1 g2. g4 g2 g fis2. g4 g2 g c1 cis2 cis d1 e r2 d g,1 
		a2 g bes1 a r2 c c c a1 a bes1. bes2 a1 a gis1. gis2 a1 c b a\longa 
	}
	\addlyrics {
		Vir -- gi -- nis æ -- ter -- num __ ve -- ni -- et de cor -- po -- re ver -- bum
		pu -- rum. Qui val -- les et mon -- tes trans -- i -- et al -- tos, il -- le vol -- lens e -- ti -- am stel --
		la -- to mis -- sus o -- lym __ _ _ _ po __ E -- de -- tur mun -- do pau __ _ _ _ per, qui __ cunc -- 
		ta si -- len -- ti __ rex e -- rit im -- pe -- ri -- o. Sic cre -- do, sic cre -- do et men -- 
		te fa -- te -- bor. Hu -- ma -- no si -- mul et di -- vi -- no se -- mi -- ne na __ _ tus.
	}
}}

tenor = \new Voice { \transpose c es {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		r1 b1. b2 e, e g1 b\breve d1. d2 e1 cis2 cis1 cis2 d g,1 a2 
		gis1 gis r2 a fis1 fis2 a a1 b2 c2. c4 cis2 d1 d r2 d1 b2 c1 d2 c2. c4 c1 c2 
		c c d1 c2 c c a r g g g c1 cis\breve d e a, a
		b2 b c1 b\breve r1 d2. d4 b2 c a2. d4 d1 r2 a fis1 fis2 fis g1 g2 g e1 
		f2 e f1 f2 f a1 g f e g1. g2 f1 e2 e1 e2 b'1 c2. b4 a g a2 g1 e\longa
	}
	\addlyrics {
		Vir -- gi -- nis æ -- ter -- num __ ve -- ni -- et de cor -- po -- re ver -- bum
		pu -- rum. Qui val -- les et mon -- tes trans -- i -- et al -- tos, il -- le vol -- lens e -- ti -- am stel --
		la -- to mis -- sus o -- lym -- po E -- de -- tur mun -- do pau -- per, qui __ cunc -- 
		ta si -- len -- ti __ rex e -- rit im -- pe -- ri -- o. Sic cre -- do, sic cre -- do et men -- 
		te fa -- te -- bor. Hu -- ma -- no si -- mul et di -- vi -- no se -- mi -- ne na __ _ _ _ _ tus __ _.
	}
}}

bass = \new Voice { \transpose c es {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "bass"
		r1 e,1. e2 a a g1 e2 e'1 e2 d\breve c1 a1. a2 g \bar "" \break c1 a2 
		e1 e r2 a d,1 d2 a' d1 g,2 c2. c4 a2 g'1 g \bar "" \break r2 d1 g,2 c1 b2 c2. c4 c1 a2 
		f f bes1 c f g c, \bar "" \break r a a2 a d g, d'1 c\breve f, d 
		g2 e a1 b\breve \bar "" \break r1 g2. g4 g2 c d2. g,4 g1 r\breve d'1 c g2 g c1 
		f,2 c' bes1 \bar "" \break f2 f1 f'2 c1 d a g1. g2 d1 a'1 e1. e2 a1 f g a\longa \bar "||"
	}
	\addlyrics {
		Vir -- gi -- nis æ -- ter -- num __ ve -- ni -- et de cor -- po -- re ver -- bum
		pu -- rum. Qui val -- les et mon -- tes trans -- i -- et al -- tos, il -- le vol -- lens e -- ti -- am stel --
		la -- to mis -- sus o -- lym -- po __ E -- de -- tur mun -- do pau -- per, qui __ cunc -- 
		ta si -- len -- ti __ rex e -- rit im -- pe -- ri -- o. Sic cre -- do et men -- te fa -- te 
		-- bor. Hu -- ma -- no si -- mul et di -- vi -- no se -- mi -- ne na __ _ tus.
	}
}}

\layout {
	indent = #0
	\context {
		\Score
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 15) (stretchability . 100))
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\override Score.MetronomeMark #'transparent = ##t
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\layout {	}
%	\midi {	}
}
