% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "1"
\pointAndClickOff

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
			"Missa Ave Regina Caelorum"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Jakob Arcadelt (c. 1507 – 1568)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				revision \revision
			}
      \line {
				Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
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
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c' {
    \set Score.currentBarNumber = #105
    r1 r f2. e4 d2 e c2. c4 d4 f2 e4 f4. e16 d \[ e2 f \] r2 r1 |
    r2 r4 f g a bes g a4. g8 a bes c2 bes4 a2 g4 g g g a a f2 r1 a g2 a |
    bes1 a2 a g4. f8 g4 a4. g8 f2 e4 f\breve r1 r2 f4. f8 | f4 g a bes2
    
    a g4 a1 a r r2 r4 c2 a4 bes g a a g f4. g8 a f g4 e f2 g4 a |
    d,2 r r4 a'2 c4 bes a4. g8 a f g e f2 e4 d2 c4 f e c f4. g8 | a4 g r2 r r4 c2
    bes8 a bes4 g a c2 \ficta b4 c1 r r4 f,2 e8 d e4 c d8 e f d e4 f2 e4 f1 r4 f g a |
    
    bes a g8 f f2 e4 f2 r1 r2 r4 c d e f2 e4 a2 g4 a2 r r r4 f g a bes2 |
    a4 f g a2 g8 f e f g4. f8 f2 e4 f1 \fermata \showBarLine \bar "||" | er1 f2 f4 f a bes c4. bes8 a g c2 \ficta b4 c1 |
    r1 r r r4 c, d e f2. e4 d4. e8 f g2 f e4 f1 r |
    
    r r g2. g4 g2 a2. a4 a f bes1 g4 c4. bes8 a4 g f2 e4 f1 r4 f2 g4 |
    a2. a4 g a bes g a a bes c a bes c2 r4 f, g a f g a1 r2 r1 | r2 r4 a2
    g4 a c bes a4. g8 e4 f2 r4 a2 g4 a a f g d2 r r4 g a c4. bes8 g4 |
    
    a8 g f g a4 bes2 a4 \showBarLine \bar "|" \time 3/2 a1. ~ a1 r2 r1. a1 g2 a bes1 |
    a2 g1 f r2 r1. f1 d2 c f g |
    a bes1 a2 f2. g4 a2 g1 f e2 f1 r2 |
    
    r1. f1 d2 c f g a bes1 a2 f2. g4 |
    a2 g1 f e2 f1. ~ f ~ f \fermata \showBarLine \bar "|."
  }
	\addlyrics {
	}
}

alto = \new Voice	{
	\relative c' {
    r2 c
  }
	\addlyrics {
	}
}

tenor = \new Voice {
	\relative c' {
	  \clef "treble_8"
    c2.
  }
	\addlyrics {
	}
}

baritone = \new Voice {
	\relative c' {
    r1 r r r f2.
  }
	\addlyrics {
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
    r1 f2.
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
			\new Staff << \global \baritone \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
  \header {
		piece = \markup \larger \sans { Gloria }
	}
	\layout { }
%	\midi {	}
}
