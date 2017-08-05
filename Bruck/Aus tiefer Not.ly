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
	composer = \markup \sans \column \right-align { "Arnoldus de Bruck (c. 1500 – 1554)" }
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
	\key c \major
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
    \repeat volta 2 {
      r\breve b e,1 b' c b g a b r2 b c1 d
      c a2. b4 c2 a2. g4 f2. e4 e1 d2 \showBarLine
    }
    \alternative {
      { e\breve \showBarLine \bar ":|." }
      {
        e1 r2 a ~ a g2 c1 
      }
    }
		b a
    d c2 b2. a4 a1 gis2 a1 r2 c1 b2 c1 d g,2. a4 b c d2. c4 b2 ~ b4 a4 g1 fis2
    g1 r2 g c1 b a2 e g1 f2 e2. f4 g2. f4 e1 d2 e\breve ~ e \showBarLine \bar "|."
  }
	\addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr Gott, er -- 
    hör mein __ _ Ru -- _ _ _ _ _ _ fen. fen. Denn so du wilt das
    se -- _ _ _ hen __ _ an, Was Sünd und Un -- recht __ _ _ _ _ _ ist __ _ _ ge -- 
    tan, Wer kann, Herr, für dir blei -- _ _ _ _ _ _ _ ben?
	}
	\addlyrics {
		Dein gnä -- dig Oh -- ren kehr zu mir
		Und mei -- ner Bitt sie __ _ öf -- _ _ _ _ _ _ ""
	}
}

alto = \new Voice	{
	\relative c {
    e\breve g1 g a2 e'1 e2 e1 e r2 e1 fis2 g1. d2 f2. e4 f2 g
    e1 f e2. d4 c2 d b c a1 ~  a\breve a1 r2 c b1 e e e
    d2. e4 f e g1 f2 e1 r e fis2 g a g f1 e r2 b d2. c4 d2 e d1
    r2 d e d e fis g e1 d4 c d1 ~ d2 c2. d4 e2 b c a2. b4 c2 g c1 b\breve
  }
  \addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr __ _ Gott, er -- 
    hör __ _ _ mein Ru -- _ _ _ _ _ _ _ fen. _ Denn so du wilt das
    se -- _ _ _ _ hen an, Was Sünd __ _ _ und Un -- recht ist __ _ _ _ ge -- 
    tan, Wer kann, Herr, für __ _ _ dir __ _ _ blei -- _ _ _ _ _ _ _ _ _ _ ben?
	}
	\addlyrics {
		Dein gnä -- dig Oh -- ren kehr zu mir
		Und __ _ mei -- ner Bitt __ _ _ sie öf -- _ _ _ _ _ _ _ fen. __ _
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		b\breve e,1 c' c b2 g a1 b2 e2 ~ e4 d4 c b c1 b\breve r1 b
		c d c a g f e\breve | e\breve r1 r2 a1 g2 c1
		b a2 d1 c2 b1 a\breve r1 r2 c1 b2 c1 d g,2. a4 b2 c a1 
		g\breve r1 g c b a e g f e\breve ~ e 
	}
	\addlyrics {
		Aus tie -- fer Not schrei ich zu dir, zu __ _ _ _ _ dir, 
		Herr Gott, er -- hör mein Ru -- _ fen. fen. Denn so du 
		wilt das se -- _ hen an, Was Sünd und Un -- recht __ _ ist __ _ ge -- 
		tan, Wer kann, Herr, für dir blei --_ ben?
	}
	\addlyrics {
		Dein gnä -- dig Oh -- ren kehr zu mir, zu __ _ _ _ _ mir,
		Und mei -- ner Bitt sie öf -- _ ""
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
    r\breve r r1 e a, e' e2 e a, a e'1 r2 g f a1 g2
    a a, d1 a r2 d e c d1 a\breve a r2 e' c a e'1 a,2 a'1 
    gis2 a gis4 fis gis2 a e1 a, r2 a'1 g2 f e d1 c g'2. a4 b2 g2 ~ g c,2 d1
    r2 g, c b a a e'1 a, r2 g d' a c2. d4 e2 c d1 a2 c1 b4 a e'\breve
  }
  \addlyrics {
    Aus tie -- fer Not schrei ich zu dir, Herr  Gott, er -- _
    hör mein Ru -- fen, er -- hör mein Ru -- fen. fen. Denn so du wilt das
    se -- _ _ _ _ _ _ hen an, Was __ _ Sünd und Un -- recht ist __ _ _ _ ge -- 
    tan, Wer kann, Herr, für dir blei -- ben? wer kann, Herr, für __ _ _ dir blei -- _ _ _ _ ben?
	}
	\addlyrics {
		Dein gnä -- dig Oh -- ren kehr zu mir
		Und mei -- _ ner Bitt sie öf -- fen, der Bitt sie öf -- ""
	}
}

\score {
	\transpose c d {
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
	\midi {	}
}
