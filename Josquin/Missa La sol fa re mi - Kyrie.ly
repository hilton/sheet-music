% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "3"
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
	ragged-last-bottom = ##t
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
				Copyright \year \with-url #"http://hilton.org.uk" "Kees de With & Peter Hilton" -
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
  a1 g2 f1 d2 \[ e2 a \] g2 f1 d2 \break
	e4 g4. f8 g4 a b c4. b8 g4 a4. g8 f e d4 g4. c,8 c4 d f e4. a,8 a4 a'2 \ficta gis4 
	a1 r2 a1 a2 \[ g2 c \] b2 a1 a2 
	\set Timing.timing = ##f \ficta gis\breve.
  \showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #15 \time 2/2
  a1 g \[ f2 d \] e2 a2 ~ \break
	
	a4 g4 g2 f d e\breve r1 r1 
	r1 r1 r1 r2 b'2 c2. b8 a c2 b a1g2 c1 b2 a4 c b a2 \ficta gis8 \ficta fis \ficta gis2 a\breve
  \[ d,2 d' \] c2 a2. b4 c2 d1 \set Timing.timing = ##f	\ficta cis\breve
  \showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #44 \time 3/2
  a2 g4 f2 d4 e a g f2 d4 e a g f d2 e r a g4 c b a2 g8 f g4 e g a f2 e8 f g a
  b4 c a c b2 r c b4. a8 b4 c2 b8 a g4 c b a2 \ficta gis4 a c b a4. g8 f4 e2 r
  f e4. d8 e4 f2 e8 d c2 b4 a c4. d8 [ e f ] g2 e4 f e4. d8 g4. f8 e2 d4 
	\set Timing.timing = ##f	e\breve. \set Timing.timing = ##t	\showBarLine \bar "|." 
  }
	\addlyrics {
    Ky -- _ _ ri -- e_e -- _ _ le -- i -- 
		son, e -- _ _ _ _ le -- _ _ _ _ i -- _ son,
    Ky -- ri -- e  e -- _ le -- _ _ _ i -- son,
    Ky -- ri -- e_e -- _ _ le -- i -- son.
    Chri -- _ _ _ ste_e -- le -- _ _ _ i -- son, Chri -- _ _ _ _ _ ste
    e -- le -- _ _ _ _ _ _ _ i -- son,
    e -- _ le -- _ _ _ i -- son.
    Ky -- _ _ ri -- e_e -- le -- _ _ i -- son,
    Ky -- _ _ ri -- e  e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son,
    e -- le -- _ _ _ _ _ _ _ _ _ i -- son, e -- le -- _ _ i -- son,
    e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son.
	}
}

alto = \new Voice	{
	\relative c' {
		r1. r1. r1. r1. 
		e1 d2 c1 a2 \[ b e \] d c2. a4 b2 
    e4. d8 c4 a b2 r4 a2. d2 b4 e2 c4 d e f c d c f2 
		e\breve. \time 2/2 r1 e d c2 a \[b e2. \] d4 d2 c a b1 r1 r1 r1 r1 e d c \[ a2 b \] \[ c d \] \[ b a \] e'1 f e1 c2 d a1 bes a2. g4 
		a'1 \[ \ficta bes1 a\breve \] \time 3/2
    r1. r1. r1. r1. r2 
		r4 a c d b c b c
    d8 c b a g4. f8 g4 a c4. d8 [e f] g2 e4 f e4. d8 g4. f8 e2 d4 e2 r e c d1
    g,4 c2 a4 bes a4. g8 c4. \ficta bes8 a2 g4 a 
		e d c a2 b4 e d c a2 b4 e d c a2 b\breve.
  }
	\addlyrics {
		Ky -- _ _ ri -- e_e -- _ _ le -- i -- son, 
		Ky -- _ _ ri -- e  Ky -- _ ri -- e e -- _ _ le -- _ _ _ i -- son.
		Chri -- _ _ _ ste_e -- le -- _ _ _ i -- son,
		Chri -- _ _ _ ste  e -- _ le -- _ _ _ _ i -- son,
		e -- _ le -- _ _ i -- son.
		Ky -- _ ri -- e  e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son
		Ky -- ri -- e e -- le -- _ _ _ _ _ _ _ i -- son, 
		Ky -- _ _ ri -- e, Ky -- _ _ ri -- e_e -- le -- _ _ i -- son.
	}
}

tenor = \new Voice {
	\relative c' {
	  \clef "treble_8"
		a1 b4 c d2 r4 a b d c a2 g8 f e2 d4 d'4. e8 f2 e8 d 
		c2 r4 c, f g a4. g8 e4 f2 d4 g4. e8 e4 a d,2 a'2. f4 e2
		r4 a2 c4 d e f c d c f2 e4. d8 c4 a b e, r a d, a'4. d 
		b\breve. \time 2/2
    r1 r1 r1 r1 
		
		r1 r1 a1 g f2 \[ d e \] a2 ~ \break
		a4 g4 g2 f2. e8 d e4 f8 g a4 c b a2 \ficta gis4 \[ a1 e' \] f1 e \[ a,2 b \] \[ c2 d \] b2
    e,2 f2. e8 d \[ f2 e \] \[ f g \] \[ e d \] 
		f2 e \[ f g \] e\breve \time 3/2
    a2 b4 a d2 c4 f, e d d'2 c4 a b a b d c2 b4 a c d b a 		
		r1 r1. e'2 d4 c2 a4 b e d c2 a4 b e d c a2 b4 e4. d8 c a b2 r4
    a4 g f2 d4 e a g f2 d4 e a g f d2 e4
		e g a f2 e r1 r d2 g\breve.
  }
	\addlyrics {
		Ky -- _ ri -- e  e -- _ _ le -- _ _ _ i -- son, e -- _ le -- i -- _
		son, Ky -- ri -- e_e -- le -- _ _ _ _ _ i -- son,  e -- _ le -- i -- son,
		
    Ky -- _ _ ri -- e e -- le -- i -- son
    Ky -- _ _ ri -- e __ _ e -- _ le -- i -- son.
    Chri -- _ _ _ ste_e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ i -- son, __ _ _ _
    Chri -- _ ste __ _  e -- _ le -- _ _ _ _ _ _ _ _ 
		_ _ i -- _ son.
		Ky -- _ _ ri -- e   e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ i -- son, __ _
    Ky -- _ _ ri -- e_e -- le -- _ _ i -- son, Ky -- _ _ ri -- 
		e_e -- le -- _ i -- _ son, Ky -- _ _ ri -- e_e -- le -- _ _ i -- son,
    Ky -- _ _ ri -- e, 
		e -- le -- _ i -- son, i -- son.
	}

}

bass = \new Voice {
	\relative c' {
		\clef bass
    r1. r1. r1. r1. 
		r1. r1. r1. r1. 
		a1 g2 f1 d2 \[ e2 a \] g2 f1 d2 
		e\breve. \time 2/2 r1 r1 r1 r1 
		
		r1 r1 r1 e1 d c2 a 
		b e1 d2 c a b1 r2 a'1 g2 \[ f d \] e2  a1 g2 \[ f d \] e1
    r2 d1 c2 \[ bes2 g \] a d1 c2 \[ \ficta bes g \] a\breve
    \time 3/2
    r1. r1. r1. a'2 g4 f2 d4 e a4 g f2 d4 e a g f \[ d2 e \] r2
    a2 g4 e g a f a g e g a f2 e4 c d f e2 a, r2 d c4 a c d bes d c a c d \ficta bes2 a r
    a'2 g4 e g a f a g e g a f2 e\breve.
  }
	\addlyrics {
    Ky -- _ _ ri -- e_e -- _ _ le -- i -- son.
    Chri -- _ _ _ ste_e -- le -- _ _ i -- son,
    Chri -- _ _ _ ste_e -- le -- _ i -- _ son,
    Chri -- _ _ _ ste_e -- le -- _ i -- _ son. 
    Ky -- _ _ ri -- e, Ky -- _ _ ri -- e_e -- le -- _ _ i -- son,
    Ky -- _ _ _ _ _ _ _ _ _ _ ri -- e  e -- le -- _ i -- son,
    Ky -- _ _ _ _ _ _ _ _ _ _ ri -- e  e -- le -- _ _ _ _ _ _ _ _ _ i -- son.
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
  \header {
		piece = \markup \larger \sans { Kyrie }
	}
	\layout { }
	\midi {	}
}
