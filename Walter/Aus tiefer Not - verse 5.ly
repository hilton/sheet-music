% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton/sheet-music

\version "2.18.2"
revision = "2"
\pointAndClickOff

#(set-global-staff-size 16.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	top-margin = 10\mm
	bottom-margin = 10\mm
	left-margin = 15\mm
	right-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (stretchability . 100) )
	ragged-last-bottom = ##f
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Aus tiefer Not schrei ich zu dir"
			\vspace #2
		}
	}
	composer = \markup \sans \column \right-align { "Johann Walter (1496–1570)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" - 
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				rev \revision - This work is licensed under
			}
      \line {
				the CC Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
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
	\key c \major
	\time 2/2
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c'' {
    \repeat volta 2 {
			g1 g2 g a g4. a8 b4 c2 b8 a g2 r4 g a c2 b4 c8 b a g f2 |
			g4 e2 d4 \showBarLine
    }
    \alternative {
      { e1 \showBarLine \bar ":|." }
      { e2 r4 c' }
    }
		b2 a d c4 b8 a b4 a2 g4 a2 r4 a g2 g4. a8 |
		b c d2 c4 b g2 f4 g2 r4 g a2 b4 d c2. b8 a g4 e2 d4 e\breve | \showBarLine \bar "|."
  }
	\addlyrics {
		\set stanza = #"5. "
		Ob bei uns ist der __ _ Sün -- _ den __ _ viel,
		Bei __ _ Gott ist viel __ _ _ _ _ mehr Gna -- _ de;
		de.
		Er ist all -- ein der __ _ _ _ gu -- te Hirt,
		Der Is -- ra -- _ _ _ el er -- lö -- _ sen wird
		Aus sei -- nen Sün -- _ _ _ den al -- _ len.
	}
	\addlyrics {
		Sein' Hand zu hel -- fen __ _ hat kein __ _ _ Ziel,
		Wie __ _ groß auch sei __ _ _ _ _ der Scha -- _ ""
	}
}

alto = \new Voice	{
	\relative c' {
		\repeat volta 2 {
			e1 e2 d e2. d8 c b4 e2 d4 e2 r4 e e f g4. f8 e4 c d4. c8 |
			b4 c a2 |
    }
    \alternative {
      { r1 }
      { r4 a e'4. f8 }
    }
		g2 f d r4 g2 f4 e2 c r4 e e2 e |
		d4 b2 e4 d e d4. c8 b4 g a g2 f4 g2 c4 d e4. d8 b4 c a2 c1 b |
  }
	\addlyrics {
		\set stanza = #"5. "
		Ob bei uns ist der __ _ Sün -- _ den viel,
		Bei Gott ist viel __ _ _ mehr Gna -- _ _ _ de;
		Er ist __ _ all -- ein der gu -- _ te Hirt,
		Der Is -- ra -- _ el er -- lö -- sen wird __ _ _
		Aus __ _ sei -- _ nen Sün -- _ _ _ _ _ den al -- len.
	}
	\addlyrics {
		Sein' Hand zu hel -- fen __ _ hat __ _ kein Ziel,
		Wie groß auch sei __ _ _ der Scha -- _ _ _ de.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\repeat volta 2 {
			b1 e,2 b' c b g a b r4 b c2 d c b |
			g f
    }
    \alternative {
      { e1 }
      { e2 r4 a }
    }
		g2 c b a4 d2 c4 b2 a r4 c b2 c |
		d g, b4 c a2 g r4 g c2 b a e g f e\breve |
  }
	\addlyrics {
		\set stanza = #"5. "
		Ob bei uns ist der Sün -- den viel,
		Bei Gott ist viel mehr Gna -- _ de;
		de.
		Er ist all -- ein der gu -- _ te Hirt,
		Der Is -- ra -- el er -- lö -- _ sen wird
		Aus sei -- nen Sün -- den al -- _ len.
	}
	\addlyrics {
		Sein' Hand zu hel -- fen hat kein Ziel,
		Wie groß auch sei der Scha -- _ ""
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		\repeat volta 2 {
			e1 c2 b a e' e f e r4 e a2 g c,4 f2 d4 |
			e c d2 |
    }
    \alternative {
      { a1 }
      { a2 r4 a }
    }
		e'2 f g a4 g8 f g4 a e2 a, r4 a e'2 c |
		b4 g2 c4 d c d2 r4 g, c b a2 g a4. b8 c d e2 c4 d2 a1 e' |
  }
	\addlyrics {
		\set stanza = #"5. "
		Ob bei uns ist der Sün -- den viel,
		Bei Gott ist viel mehr Gna -- _ _ _ de;
		de.
		Er ist all -- ein der __ _ _ gu -- _ te Hirt,
		Der Is -- ra -- _ el er -- lö -- sen wird
		Aus __ _ _ sei -- nen Sün -- _ _ _ _ _ den al -- len.
	}
	\addlyrics {
		Sein' Hand zu hel -- fen hat kein Ziel,
		Wie groß auch sei der Scha -- _ _ ""
	}
}

\score {
	\transpose c c {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano  \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto  \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor  \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \bass  \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
	\layout { }
%	\midi {	}
}
