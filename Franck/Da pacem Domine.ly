% CPDL #36843
% Copyright ©2015 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "3"
\pointAndClickOff

#(set! paper-alist (cons '("custom" . (cons (* 21 cm) (* 7.425 cm))) paper-alist))

\paper {
  #(set-paper-size "custom")
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
	markup-markup-spacing #'padding = #2
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	poet = "Da pacem, Domine"
	composer = "Melchior Franck (c. 1579 – 1639)"
	tagline = ##f
}

\layout {
	indent = #0
  	ragged-right = ##f
  	ragged-last = ##f
	\context {
		\Score
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context { 
		\StaffGroup
		\remove "Span_bar_engraver"	
	}
	\context { 
		\Voice 
	}
}

global = { 
	\key g \major
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }

canon = {
	g2^"S" a4^"A" b c4. c8 b2^"T" r4^"B" d c a b g a a8 b c2 b a g 
}

soprano = \new Voice	{
	\relative c'' {
		\repeat volta 2 {
			\canon
			\showBarLine
		}
	}
	\addlyrics {
		Da pa -- cem Do -- mi -- ne,
		Da pa -- cem Do -- mi -- ne in di -- e -- bus no -- stris.
	}
}


\score {
	\new StaffGroup << 
		\new Staff << \global \soprano >> 
	>> 
	\header {
		piece = ""
	}
	\layout { }
}

\markup {
	SATB canon, with A and B down a fourth.
}

\markup \tiny {
	\year \with-url #"http://hilton.org.uk" "Peter Hilton" -
	\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
	Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
	\with-url #"http://www.cpdl.org/wiki/index.php/Da_pacem,_Domine_(Melchior_Franck)" "CPDL #36843" -
	revision \revision 
}
