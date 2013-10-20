\version "2.10.33"
\pointAndClickOff

\header {
	title = "Sibylla Persica"
	composer = "Orlando di Lasso"
	copyright = \markup { \small "Copyright ©2008 Cappella Gabrieli - www.cappellagabrieli.nl" }
	tagline = ##f 
}

global= { 
	\key c \major
	\time 4/2
	\tempo 2 = 100
	\set Score.timing = ##f 
	\override Score.LyricText #'font-size = #0
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 19) 
	#(set-accidental-style 'forget)
}

\paper {
%	annotate-spacing = ##t
	page-top-space = 0
	head-separation = 0
	between-system-padding = 0.5\cm 
	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

soprano = \new Voice {
	\relative c'' {
		r1 g1. g2 gis\breve r2 a1 a2 b1 c2 g1 g2 g g fis1 fis2 gis a1 \bar "" \break
		fis r r r2 c' e4 d c b a1. g2 fis1 g g g2 a a bes1 bes2 a1 \bar "" \break
		a1 d,\breve g2 a1 a2 gis1 a cis\breve d2 a1 a2 b1 g c \bar "" \break
		b1 g\breve r2 g2 \bar "" \break g4 fis2 g4 g2 e e f4 d2 d4 d2 cis1 r r\breve \bar "" \break
		r r d'1 d r a b1. b2 b\breve \bar "" \break g1 gis1. a2 a e2. 
		e4 g2 f1 fis\breve r1 e1. es2 d1. d2 d1 e2 e f1 g \bar "" \break e1.
		e2 e\breve cis1 e2 e fis1 g f f2 f1 g fis4 g fis1 g\longa \bar "|."
	}
}

alto = \new Voice {
	\relative c {
		\clef "treble_8"
		e1. e2 d1 e1. e2 fis\breve g1 e e2 e1 e2 dis1 dis2 e cis1 \bar ""
		d r2 e e4 d c b a2 a' g1 f2 e f e d1 b2 b1 e2 e f1 f2 g1 f \bar ""
		fis\breve g1 e2 e1 f2 e1 cis e\breve a,1 d1. e1 e e
		d4 c d2 e e1 d2 d e4 d2 e4 d2 g, c c4 bes2 bes4 g2 a e' c1. d2 e b 
		b c2. b4 b a8 g a1 b\breve r1 cis\breve d1. d2 dis\breve e1 e1. fis2 fis g2.
		c,4 e2 c1 d\breve cis1. cis2 c1 b a\breve c2 c d1 b c1. 
		c2 c1 b1 e cis2 cis d1 d2 d1 d2 d\breve d b\longa
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1. c2 b1 b1. b2 d\breve g,1. c2 b c1 b2 b1 b2 b e1 \bar ""
		a,2 a c4 b a b c2 f, c'2. a4 c d e d c b c2 c2. b4 a1 d d2 c c1. d2 es1 c \bar ""
		d b\breve c2 cis1 d2 b1 e a,\breve fis2 fis1 fis2 g2. a4 b2 c4 b a g a2
		g2. a4 b1 c b2 b c4 a2 c4 b2 c g a4 f2 g4 d2 e e f g a1 g \bar ""
		e2 a2. g4 g1 fis2 g\breve r1 e\breve g1. g2 fis\breve r2 c' b1. d2 d g,2.
		g4 c2 a1 a r2 a1 a2 a1 g\breve fis g1 r2 bes d1 g, \bar ""
		g1. g2 gis1 a a1. a2 bes1 bes2 bes1 bes2 bes1 a\breve d\longa
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		c1. c2 g'1 e1. e2 d1 d r c e2 c1 e2 b1 b2 e a,1 \bar ""
		d2 d a'4 b c b a2 a f1 c2 c f4 g a g f2 c d1 g,2 g'1 c,2 c f1 bes,2 es1 f \bar ""
		d r g c,2 a1 d2 e1 a, r a d\breve g,1 g2 c1 a2
		e'2 g2. f4 e d c1 g2 g' c,4 d2 c4 g2 c c f4 bes,2 g4 bes2 a a a' e f1 c4 d e f 
		g2 f e1 d g,\breve r1 a\breve g1. g2 b\breve c1 e1. d2 d c2. 
		c4 c2 f1 d\breve a1. a2 c1 g d'\breve c2 c bes1 g c1.
		c2 c2. d4 e1 a, a2 a d1 g, bes1. bes2 bes1 d\breve g,\longa
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 2)
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
