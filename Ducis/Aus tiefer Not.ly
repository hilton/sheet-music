% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton/sheet-music

\version "2.18.2"
revision = "1"
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
	composer = \markup \sans \column \right-align { "Benedictus Ducis (c. 1492 - 1544)" }
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
    \repeat volta 2 {
			f1 e2 f g e1 f2 g a1
			r2 r1 r r2 r4 g f e4. d8 e c |
			d4. e8 f4 e2 c4 d e c f2 e4 \showBarLine
    }
    \alternative {
      {
				f1 \showBarLine \bar ":|."
			}
      {
				f1
      }
    }
		r4 f g bes
		a2 f4 g e2 d1 r2 r1 r4 f e d c e d f |
		e8 c f2 e4 f a a2. g4 f2 f4 g8 f e d e4 c f2 e4 f1 \showBarLine \bar "|."
  }
	\addlyrics {
		Dar -- um auf Gott will hof -- fen ich,
		Auf mein Ver -- _ _ _ dienst __ _ _ nicht __ _ _ _ bau -- _ _ en;
		en,
		Die mir zu -- sagt sein wer -- tes Wort,
		Das ist mein Trost und treu -- _ _ _ _ er Hort,
		Des will __ _ ich all -- zeit __ _ _ _ _ har -- _ _ ren.
	}
	\addlyrics {
		Auf ihn mein Herz soll la -- ßen sich,
		Und sei -- ner __ _ _ _ Gü -- _ _ te __ _ _ _ trau -- _ _ ""
	}
}

alto = \new Voice	{
	\relative c {
		\clef "treble_8"
		\repeat volta 2 {
			f1 c'2 d bes4 c4. bes8 a4 g g f f'2 e4 d c2 
			a4 g2 f r r1 r r4 c' g c2
			bes4 c1 bes4 g a c4. bes8 c4
		}
		\alternative {
			{ a1 }
			{ a2 r4 a }
		}
		bes2. bes4
		c d2 bes4 c2 bes1 r2 r g4. a8 bes c d4 c bes g4. a8 bes4 a |
		c d c2 a4 f' f4. e8 d c e4 d2. d4 c4. bes8 g4 c4. bes8 c4 a1 |
	}
	\addlyrics {
		Dar -- um auf Gott will __ _ _ hof -- fen ich,
		Auf mein Ver -- dienst nicht bau -- en;
		Auf mein Ver -- _ dienst nicht __ _ bau -- _ _ _ en;
		en,
		Die mir zu -- sagt sein wer -- tes Wort,
		Das __ _ _ _ _ ist mein Trost __ _ _ und treu -- _ er Hort,
		Des will __ _ _ _ _ ich all -- zeit __ _ _ har -- _ _ ren.
	}
	\addlyrics {
		Auf ihn mein Herz soll __ _ _ la -- ßen sich,
		Und sei -- ner Gü -- te trau -- en,
		Und sei -- _ ner Gü -- te __ _ trau -- _ _ ""
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\repeat volta 2 {
			r1 r r r r2 f1 
			e2 f g e1 f2 g a r |
			r4 bes a2 g4 f2 e4 f a g2
    }
    \alternative {
      { f1 }
			{ f1 }
    }
		r
		r r2 f g4 bes a2 f4 g e2 d r4 f f e f4. g8 |
		a4 bes g2 f1 r4 c' a2 bes g4. f8 e4 a g2 f1 |
  }
	\addlyrics {
		Dar -- um auf Gott will hof -- fen ich,
		Auf mein Ver -- dienst nicht bau -- _ _ en;
		en,
		Die mir zu -- sagt sein wer -- tes Wort,
		Das ist mein Trost und treu -- _ er Hort,
		Des will ich all -- _ _ zeit har -- ren.
	}
	\addlyrics {
		Auf ihn mein Herz soll la -- ßen sich,
		Und sei -- ner Gü -- te trau -- _ _ ""
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		\repeat volta 2 {
			r1 r r r r2 f,1 
			c'2 d bes4 c4. bes8 a4 g g f f'2 e4 d c4. bes8 a4 |
			g2 f8 g a bes c4 a bes c f,2 c'
    }
    \alternative {
			{ f,1 }
			{ f1 }
    }
		r
		r r4 a bes2. bes4 c d2 bes4 c2 bes r4 bes c2 bes4 d |
		c bes c2 d r4 d f c d2 bes c1. f,1 |
  }
	\addlyrics {
		Dar -- um auf Gott will __ _ _ hof -- fen ich,
		Auf __ _ mein Ver -- _ _ dienst nicht __ _ _ _ _ _ _ _ bau -- _ en;
		en,
		Die mir zu -- sagt sein wer -- tes Wort,
		Das ist mein Trost und treu -- er Hort,
		Des will ich all -- zeit har -- ren.
	}
	\addlyrics {
		Auf ihn mein Herz soll __ _ _ la -- ßen sich,
		Und __ _ _ sei -- _ _ ner Gü -- _ _ _ _ _ _ te trau -- _ ""
	}
}

\score {
	\transpose c c {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano  \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \alto  \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >>
			\new Staff << \global \tenor  \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >>
			\new Staff << \global \bass  \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
	\layout { }
	\midi {	}
}
