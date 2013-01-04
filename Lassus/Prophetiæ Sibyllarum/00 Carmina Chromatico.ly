\version "2.14.2"

\header {
	title = "Carmina Chromatico"
	composer = "Orlando di Lasso (1532-1594)"
	copyright = \markup \smaller {
		\column \center-align {
			\line { This edition copyright ©2013 Peter Hilton - Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - Licensed under the }
			\line { Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/ }
		}
	}
	tagline = ##f 
}

global= { 
	\key c \major
	\time 4/2
	\tempo 2 = 100
	\set Score.timing = ##f 
	\override Score.LyricText #'font-size = #0
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 17) 
	#(set-accidental-style 'forget)
}

\paper {
	top-margin = 15\mm
	bottom-margin = 10\mm
	page-top-space = 0
	head-separation = 0
	ragged-bottom = ##f
	ragged-last-bottom = ##f
	last-bottom-spacing #'padding = #6
}

soprano = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		r1 e1. d2 d1 dis\breve e1. gis2 gis1 a fis2 a g1 g2 f1 f2 fis2 g2. fis8 e fis2 \bar "" \break
		g1 e\breve gis a b1 g1. g2 fis fis fis1 gis\breve r2 e fis1 g2 g g1 \bar ""  \break
		g2 g a1 a2 bes bes2. bes4 bes2 a2. a4 b2 b e,2. a4 d,2 f\breve f1. e2 e1 a d,\longa \bar "|."
	}
	\addlyrics {
		Car -- mi -- na Chro -- ma -- ti -- co, quæ au -- dis mo -- du -- la -- ta te -- no __ _ _ _
		re, Hæc sunt il -- la, qui -- bus nos -- træ o -- lim ar -- ca -- na sa -- lu -- 
		tis Bis se -- næ in -- tre -- pi -- do, ce -- ci -- ne -- runt, ce -- ci -- ne -- runt o -- re si -- byl -- læ
	}
}

alto = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		r1 c1. b2 b1 b\breve gis1. e'2 e1 cis cis2 d1 e c2 d1 d2 c d1 \bar "" 
		d g\breve e\breve. fis1 g d e cis dis e dis2 e1 a,2. g4 a2 b e d1 \bar "" 
		e2 e f1 fis2 g g2. f4 f2 f2. e4 g2 gis a2. fis4g2 c,1 d\breve c2 c c\breve b\longa
	}
	\addlyrics {
		Car -- mi -- na Chro -- ma -- ti -- co, quæ au -- dis mo -- du -- la -- ta te -- no --
		re, Hæc sunt il -- la, qui -- bus nos -- træ o -- lim ar -- ca __ _ _ na sa -- lu -- 
		tis Bis se -- næ in -- tre -- pi -- do, ce -- ci -- ne -- runt, ce -- ci -- ne -- runt o -- re si -- byl -- læ
	}
}

tenor = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		g1. g2 g\breve fis cis'1. b2 b1 r2 a a1 b2 c1 a2 bes1 a2 g a1 \bar ""
		b c\breve b cis1 d g, b1. b2 ais ais b1 b1. b2 cis1 d2 d1 c2. b8 a b2 \bar ""
		c2 c c1 d2 d2 es2. d4 d2 c2. c4 d2 e cis2. d4 bes2 a1 bes1. bes2 a a2. g4 g1 f2 g\longa
	}
	\addlyrics {
		Car -- mi -- na Chro -- ma -- ti -- co, quæ au -- dis mo -- du -- la -- ta te -- no --
		re, Hæc sunt il __ _ la, qui -- bus nos -- træ o -- lim ar -- ca -- na sa -- lu __ _ _ _
		tis Bis se -- næ in -- tre -- pi -- do, ce -- ci -- ne -- runt, ce -- ci -- ne -- runt o -- re si -- byl __ _ _ _ læ
	}
}

bass = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "bass"
		r1 c1. g2 g1 b\breve cis1. e2 e1 fis fis g2 c,1 f2 bes,1 d2 es d1 \bar ""
		g c,\breve e a,1 d r2 g1 g2 e e fis1 b, e gis a d, g\breve \bar ""
		c,2 c f1 d2 g es2. bes'4 bes2 f2. a4 g2 e a2. d,4 g2 f1 bes,\breve f2 a c2. b4 a1 g\longa
	}
	\addlyrics {
		Car -- mi -- na Chro -- ma -- ti -- co, quæ au -- dis mo -- du -- la -- ta te -- no --
		re, Hæc sunt il -- la, qui -- bus nos -- træ o -- lim ar -- ca -- na sa -- lu -- 
		tis Bis se -- næ in -- tre -- pi -- do, ce -- ci -- ne -- runt, ce -- ci -- ne -- runt o -- re si -- byl __ _ _ læ
	}
}

\score {
	\new ChoirStaff \with {
		\override StaffGrouper #'staff-staff-spacing #'basic-distance = #12
	} << 
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
	\midi { }
}
