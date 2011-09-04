\version "2.14.2"

\header {
	title = "Congaudeant catholici"
	composer = \markup \column \right-align { "Albertus Parisiensis (fl. 1146 – 1177)" }
	tagline = \markup \small { 
		\left-align \center-column {
			\line { Version 2. Copyright ©2011 Peter Hilton. Licensed under the Creative Commons }
			\line { Attribution-Noncommercial-No Derivative Works 3.0 License - \with-url #"http://creativecommons.org/licenses/by-nc-nd/3.0" http://creativecommons.org/licenses/by-nc-nd/3.0 }
		}
	}
}

global = { 
	\key e \minor
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 17)
	#(set-accidental-style 'forget)
}

\paper {
	annotate-spacing = ##f
	top-margin = 10\mm
	bottom-margin = 10\mm
	left-margin = 15\mm
	right-margin = 15\mm
	system-system-spacing #'padding = #2
	ragged-last-bottom=##t
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }

cantus = \new Voice	{
	\relative c { 
		f4 e f d d8 c d e f2 c d g8 f f e d2 a' c d \times 2/3 { c4 b c } b a g2 b4 a
		\times 2/3 { a f g } f e d2 a'8 b a g f2 c'4 d a b a g \times 2/3 { a b c } b c \times 2/3 { b a g } \times 2/3 { a b c }
		\times 2/3 { b c a } b c d2 a4 b \times 2/3 { a g f } b c d2 a4 g \times 2/3 { a b a } b a f d e f \times 2/3 { g f e } d1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Con -- _ gau -- _ de -- _ _ _ ant ca -- tho -- li -- _ _ _ ci. le -- ten -- tur ci -- _ _ _ _ ves ce -- _
		li -- _ _ _ _ ci. di -- _ _ _ e i -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
		 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ sta
	}
	\addlyrics {
		Er -- _ go __ _ ca -- _ _ _ ren -- ti ter -- mi -- _ _ _ no. Be -- ne -- de -- ca -- _ _ _ _ mus Do -- _
		mi -- _ _ _ _ no. di -- _ _ _ e
	}
	\addlyrics {
		Ma -- _ gno __ _ pa -- _ _ _ tri fa -- mi -- li -- _ _ _ as sol -- va -- mus lau -- _ _ _ _ des gra -- _
		ti -- _ _ _ _ as. di -- _ _ _ e
	}
}

altus = \new Voice {
	\relative c { 
		\clef "treble_8"
		f2 a g f g a c a g f f4 a f1 g2 a
		c1 a2 g f a a a a4 c b2 g g
		f4 g g2 a a1 f2 a a1 b g f2 d
	}
	\addlyrics {
		Con -- gau -- de -- ant ca -- tho -- li -- ci. le -- ten -- tur __ _ ci -- ves ce --
		li -- ci. di -- e i -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ sta __ _
	}
	\addlyrics {
		Er -- go ca -- ren -- ti ter -- mi -- no. Be -- ne -- de -- _ ca -- mus Do --
		mi -- no. di -- e
	}
	\addlyrics {
		Ma -- gno pa -- tri fa -- mi -- li -- as sol -- va -- mus __ _ lau -- des gra --
		ti -- as. di -- e
	}
}

tenor = \new Voice {
	\relative c { 
		\clef "treble_8"
		f2 d e f e d c d e f f4 d f1 d2 e4 d
		c1 d2 e f f4 d d2 d c e g \times 2/3 { e4 g f }
		f e e2 d d f f d d1 b c d
	}
	\addlyrics {
		Con -- gau -- de -- ant ca -- tho -- li -- ci. le -- ten -- tur __ _ ci -- ves ce -- _
		li -- ci. di -- e i -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ sta
	}
	\addlyrics {
		Er -- go ca -- ren -- ti ter -- mi -- no. Be -- ne -- de -- _ ca -- mus Do -- _
		mi -- no. di -- e
	}
	\addlyrics {
		Ma -- gno pa -- tri fa -- mi -- li -- as sol -- va -- mus __ _ lau -- des gra -- _
		ti -- as. di -- e
	}
}

\score {
	<<
		\new ChoirStaff
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff << \global \transpose f c' { \cantus } >> 
			\new Staff << \global \transpose f c' { \altus } >> 
			\new Staff << \global \transpose f c' { \tenor } >> 
		>> 
	>>
	\layout {
		indent = #0
		\context { 
			\Score
			\override BarLine #'transparent = ##t
			\override BarNumber #'transparent = ##t
		} 
		\context { 
			\Voice 
			\consists "Ambitus_engraver" 
			\override NoteHead #'style = #'baroque
		} 
		\context {
			\Score
        }
	}
}
