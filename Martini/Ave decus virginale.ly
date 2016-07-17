% Copyright ©2016 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "1"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	bottom-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	poet = \markup \sans "Ave decus virginale"
	composer = \markup \sans \column \right-align { "Johannes Martini (1440 - 1497)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				rev \revision 
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
%		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
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
	\key f \major
	\time 2/2
	\tempo 2 = 40
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

soprano = \new Voice	{
	\relative c'' {
		g2. f8 e d2. e4 f2. e8 d e1 d r2 f g2. f4 f2 g a bes c4. bes8 a4 g f2 g4 a4. g8 g2 f4 |
		g2 r g a1 f2 g c d bes1 a2 bes r g a bes1 a2 d1 c2 d4 bes4. a8 a2
		g8 f g2 a bes4 a2 g8 f e2 d r bes' a g c bes4 a4. g8 g2 f4 g2 r1 | r
		
		r | \time 3/2 r1. g2 g a
	}
	\addlyrics {
	}
}

alto = \new Voice {
	\relative c' {
		r1 r r g2 a bes1 a2 d c1 d\breve g,1 a2 bes4 a f g a2 |
		g4. a8 bes4. c8 d4. e8 f2 c d e1 d2 f1 f2 d bes c2. bes8 a g2 g' f d4 g2 f4 e2 d f |
		d e d1 r2 a a2. bes c2 bes4 d2 c4 d e4. d8 d2 c4 d2 c bes | g 
	
		r2 r1 |	g2 g a bes1 a2
	}
	\addlyrics {
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 r r r r r g2 a bes1 a2 d c1 d d2 r |
		d2. d4 d2 c1 bes a2 bes d c1 bes r r r r g2 a |
		bes1 a2 d c1 d d2 r r1 r r2 bes a g | c
		
		bes4 a2 g f4 | g1 a2 r1. 
		
	}
	\addlyrics {
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		g2 a bes1 a2 d c1 d2 g f d e2. d8 c bes2 g d'1 e d2 g4 f2 e4 d2 |
		g2. a4 bes2 f1 d2 c1 bes f' g c, g'2. f8 e d2 g, g'2 a bes f |
		g1 d a' d,2. bes f'2 g4 bes a2 g4 c2 bes4 a2 g4 g2 f4 g e2 c4
		
		d2 c4 bes a2 | g1 r2 r1. 
	}
	\addlyrics {
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}
