% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton/sheet-music

\version "2.18.2"
revision = "4"
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
	poet = \markup \sans { "Psalm 130" }
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
			g1 g2 g a g4. a8 b4 c2 b8 a g2 r4 g a c2 b4 c8 b a g f2 | \break
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
		Aus tie -- fer Not schrei’ __ _ ich zu __ _ _ dir,
		Herr __ _ Gott, er -- hoer’ __ _ _ _ _ mein Ru -- _ fen,
		fnen!
		Denn so du willst das __ _ _ _ se -- hen an,
		Was Sünd’ und __ _ _ _ _ Un -- recht ist ge -- tan,
		Wer kann, Herr, vor dir __ _ _ _ blei -- _ ben?
	}
	\addlyrics {
		Dein gnä -- dig’ Oh -- ren __ _ kehr zu __ _ _ mir,
		Und __ _ mei -- ner Bitt’ __ _ _ _ _ sie öf -- _ ""
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
		Aus tie -- fer Not __ _ _ schrei’ ich zu dir,
		Herr Gott, er -- hoer’ __ _ _ mein Ru -- _ _ _ fen,
		Denn so __ _ du willst das se -- _ hen an,
		Was Sünd’ und Un -- recht __ _ _ ist ge -- _ _ _ _ tan,
		Wer kann, Herr, __ _ vor __ _ _ _ dir blei -- ben?
	}
	\addlyrics {
		Dein gnä -- dig’ Oh -- ren __ _ kehr zu mir,
		Und mei -- ner Bitt’ __ _ _ sie öf -- _ _ _ fnen!
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\repeat volta 2 {
			b1 e,2 b' c b g a b r4 b c2 d c a |
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
		Aus tie -- fer Not schrei’ ich zu dir,
		Herr Gott, er -- hoer’ mein Ru -- _ fen,
		fnen!
		Denn so du willst das se -- _ hen an,
		Was Sünd’ und Un -- recht ist __ _ ge -- tan,
		Wer kann, Herr, vor dir blei -- _ ben?
	}
	\addlyrics {
		Dein gnä -- dig’ Oh -- ren kehr zu mir,
		Und mei -- ner Bitt’ sie öf -- _ ""
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
		Aus tie -- fer Not schrei’ ich zu dir,
		Herr Gott, er -- hoer’ mein __ _ _ _ Ru -- fen,
		fnen!
		Denn so du willst das __ _ _ se -- _ hen an,
		Was Sünd’ und Un -- recht ist ge -- _ tan,
		Wer kann, __ _ Herr, vor dir __ _ _ _ _ _ _ blei -- ben?
	}
	\addlyrics {
		Dein gnä -- dig’ Oh -- ren kehr zu mir,
		Und mei -- ner Bitt’ sie __ _ _ _ öf -- ""
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
