% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton/sheet-music

\version "2.18.2"
revision = "1"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
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
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
	\set Score.barNumberVisibility = #(every-nth-bar-number-visible 2)
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c'' {
		a1 g2 f e g a g fis1 r2 g f g bes a ~ |
		a1  g2. f8 e d1 c r2 f g f e d f d cis1 |
		r2 d f g a bes g f d e f1 r2 d d d |
		f a bes a f1 r2 c' c c bes1 a f2 f a1 |
		g e f d c2 g' a bes g f e1 f\breve | \showBarLine \bar "|."
  }
	\addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr Gott, er -- hör mein
    Ru -- _ _ _ fen. Dein gnä -- dig Oh -- ren kehr zu mir
		Und mei -- ner Bitt sie öf -- _ _ _ fen. Denn so du 
		wilt das se -- hen an, Was Sünd und Un -- recht ist ge -- tan, __ _
    Wer kann, Herr, für dir __ _ blei -- _ _ _ ben?
	}
}

alto = \new Voice	{
	\relative c' {
		c1 g2 bes c d f c d1 r2 d d bes d1 |
		c ~ c2 bes ~ bes1  a r2 c g bes c bes a d, e1 |
		r2 g f c' a d c a d c a1 r2 bes bes g |
		f f' bes, c d1 r2 g, c c d e f1  d2 c c a |
		bes1 g f2 r g1  e f2 d c r c'1 c\breve |
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
		f1 e2 f g g f g a1 r2 bes a g f1 |
		e2 f g1 f r f e2 f g g f g a1 |
		r2 bes a g f1 e2 f g1 f r2 f g bes |
		a f g f d1 r2 e c c g'1 a bes2 a f1 |
		r c' a bes g f e2 f g1 f\breve
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
		f,1 c'2 d c g d' es d1 r2 g d es bes d |
		a r c g bes1 f r2 f c' d c g d' bes a1 |
		r2 g d' e f bes, c d bes c f,1 r2 bes g g |
		d' d g, a bes1 r2 c f, a g1 f bes2 f f1 |
		g c d g, c f,2 bes c d c1 f,\breve |
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
