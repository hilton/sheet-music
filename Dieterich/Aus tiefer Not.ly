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
	composer = \markup \sans \column \right-align { "Sixt Dietrich (c. 1494-1548)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" - 
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				revision \revision - This work is licensed under the
			}
      \line {
				CC Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
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
	\set Timing.measureLength = #(ly:make-moment 4/2)
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c'' {
		a\breve g1 f e g a g fis\breve r1 g f g bes a ~ |
		a\breve  g1. f4 e d\breve c r1 f g f e d f d cis\breve |
		r1 d f g a bes g f d e f\breve r1 d d d |
		f a bes a f\breve r1 c' c c bes\breve a f1 f a\breve |
		g e f d c1 g' a bes g f e\breve f\longa | \showBarLine \bar "|."
  }
	\addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr Gott, er -- hör mein
    Ru -- _ _ _ fen. Dein gnä -- dig Oh -- ren kehr zu mir
		Und mei -- ner Bitt sie öf -- _ _ _ fen. Denn so du 
		wilt das se -- hen an, Was Sünd und Un -- recht ist ge -- tan,
    Wer kann, Herr, für dir __ _ blei -- _ _ _ ben?
	}
}

alto = \new Voice	{
	\relative c' {
		c\breve g1 bes c d f c d\breve r1 d d bes d\breve |
		c ~ c1 bes ~ bes\breve  a r1 c g bes c bes a d, e\breve |
		r1 g f c' a d c a d c a\breve r1 bes bes g |
		f f' bes, c d\breve r1 g, c c d e f\breve  d1 c c a |
		bes\breve g f1 r g\breve  e f1 d c r c'\breve c\longa |
  }
  \addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr Gott, er -- hör
    mein Ru -- fen. Dein gnä -- dig Oh -- ren kehr zu mir
		Und mei -- ner Bitt sie öf -- _ _ _ fen. Denn so du 
		wilt das se -- hen an, Was Sünd und Un -- recht ist ge -- tan,
    Wer kann, Herr, für dir, Wer kann, Herr, für dir blei -- ben?
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		f\breve e1 f g g f g a\breve r1 bes a g f\breve |
		e1 f g\breve f r f e1 f g g f g a\breve |
		r1 bes a g f\breve e1 f g\breve f r1 f g bes |
		a f g f d\breve r1 e c c g'\breve a bes1 a f\breve |
		r c' a bes g f e1 f g\breve f\longa
	}
	\addlyrics {
		Aus tie -- fer Not schrei ich zu dir, Herr Gott, er -- hör 
		mein __ _ Ru -- fen. Dein gnä -- dig Oh -- ren kehr zu mir,
		Und mei -- ner Bitt sie __ _ öf -- fen. Denn so du 
		wilt das se -- hen an, Was Sünd und Un -- recht ist ge -- tan, 
		Wer kann, Herr, für dir blei -- _ _ ben?
	}
	\addlyrics {
		
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		f,\breve c'1 d c g d' es d\breve r1 g d es bes d |
		a r c g bes\breve f r1 f c' d c g d' bes a\breve |
		r1 g d' e f bes, c d bes c f,\breve r1 bes g g |
		d' d g, a bes\breve r1 c f, a g\breve f bes1 f f\breve |
		g c d g, c f,1 bes c d c\breve f,\longa |
  }
  \addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr Gott, er -- hör mein __ _
		Ru -- _ _ fen. Dein gnä -- dig Oh -- ren kehr zu mir
		Und mei -- ner Bitt sie öf -- _ _ _ fen. Denn so du 
		wilt das se -- hen an, Was Sünd und Un -- recht ist ge -- tan, 
		Wer kann, Herr, für dir blei -- _ _ _ _ ben?
	}
}

\score {
	\transpose c f {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 2)
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
