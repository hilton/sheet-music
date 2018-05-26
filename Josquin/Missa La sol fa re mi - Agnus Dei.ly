% CPDL #

% Copyright ©2017 Peter Hilton - https://github.com/hilton



\version "2.18.2"

revision = "1" % 22-mei-2018

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

			"Missa La sol fa re mi"

			\vspace #1

		}

	}

	composer = \markup \sans \column \right-align { "Josquin Des Prez (1455 - 1521)" }

	copyright = \markup \sans {

		\vspace #2

		\column \center-align {

			\line {

				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -

% CdW				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -

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

	\key c \major

	\time 3/2

	\tempo 2 = 56

	\set Staff.midiInstrument = "Choir Aahs"

	\accidentalStyle "forget"

}



showBarLine = { \once \override Score.BarLine #'transparent = ##f }

ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }

singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }



soprano = \new Voice	{

	\relative c'' {

%    \set Score.currentBarNumber = #105
  r1. r1. a1. g2. f4 d2 e1 a2 g1 f2 \[ d e \] a g1 f2 d e1 r4 a a a e e g4. f8 d4 g f d4. e8 f g a4. g8 e4 a g e4. f8 g4 a2
  g4 e4. d8 f4. e8 d c b4 e4. d8 c a b2 r4 a
  c2 d4. e8 f4 c \[ f2 g \] a4. f8 \[ f2 g \] r4 c, f2 g a4. g8 f d f4 e b' c d4. c8 b a g4 a e b' c d4. c8 b a g1 r4 e g e g4. a8 b2 r4
  e,4 g e g4. a8 b c b4. a8 a4 g c4. b8 b4. a8 a4. g8 g f a\breve
  \showBarLine \bar "||"

  }

	\addlyrics {

		Ag -- nus _  De -- i Ag -- nus De -- _ i Ag -- nus De -- _ i
	}

}



alto = \new Voice	{

	\relative c' {

	  \clef "treble_8"
    e\breve d1 c1 a2 b1. r4 g c2. d4 e2 r4 e,4 f d f4. g8 a4. b8 c4 d e2 r4 e,4 f d f4. g8 a4. b8 c d e4
  a,4. b8 c2 r4 e e e b b d4. c8 a4 d c a4. b8 c d e4 c4. a8 b4 c d b c4. b8 d4. c8
  b a g4. f8  g4 a2 g4 a e2 f4 g2 c d b c d b c d b c d b4 e4. d8 f4. e8 d c b4 c4. d8 e4. d8 f4. e8 d c b2 
  r4 b c8 a c d e1 r4 b c8 a c d e2 r4 g g g f d e g g g f d e2 e\breve

  }

	\addlyrics {

		Ag -- nus De -- _ i Ag -- _ _ us De -- _ _ _ _ _ _ _ _ i De -- _ _ _ _ _ _ _ _ _ i _ _
	}

}



tenor = \new Voice {

	\relative c' {

	  \clef "treble_8"
    a1. \[ g2 f \] d e1 e' d c2 a1 b2 e d1 \[ c2 a \] b \[ e d1 \] c1. a1 b1 r2 r1. r1. r1.
  e1 d2 c a b a1 g2 f d e a1 g2 f d e r1. r1. r4 e'2 d4 c a b2
  r4 e2 d4 c a b2 r4 e2 d4. c8 a4 b e2 d4 c a b2 a\breve 
  }

	\addlyrics {

	Ag -- nus De -- _ i Ag -- nus De -- _ i Ag -- nus De -- _ i Ag -- nus De -- _ i 
	}


}



bass = \new Voice {

	\relative c {

		\clef bass

    a1. \[ c2 d1 \] a1. e'4. f8 g2 g, c2. d4 f2 e c d1 a2 f' e \[ c2 d \] b2 a1.
    r4 a' a a e e g4. f8 d4 g f d4. e8 f g a4. g8 e4 a2 g4 f d e a g f d2 e1
    r2 a1 g2 \[ f d \] e2 a1 g2 \[ f d \] e2 a1 g2 \[ f d \] e4 a2 g4 f2 d \[ e2 g \] a2 e
    r4 c g'2 a e r4 c g'4. f8 d4 f e c g'4. f8 d4 f e2 a,\breve 

  }

	\addlyrics {

		Ag -- nus De -- _ i _ _  Ag -- nus _  De -- _ _ _ i Ag -- nus De -- _ _ i

	}

}





\score {

	\transpose c d {

		\new StaffGroup <<

% CdW 			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)

			\set Score.barNumberVisibility = #all-bar-numbers-visible

			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>

			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>

			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>

			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>

		>>

	}

  \header {

		piece = \markup \larger \sans { Agnus Dei }

	}

	\layout { }

	\midi {	}

}