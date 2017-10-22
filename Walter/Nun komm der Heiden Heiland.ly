% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton/sheet-music

\version "2.18.2"
revision = "3"
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
	ragged-last-bottom = ##t
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Nun komm der Heiden Heiland"
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
  	ragged-last = ##t
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

soprano = \new Voice	{
	\relative c'' {
		r1 r2 g g f bes2. a8 g a2 g4 f4 ~ f8 d8 g2 fis4 |
		g1 r4 g2 e4 f4. g8 a2 bes2. a8 g f2 g4. e8 a2. bes4 |
		g4. a8 bes2 g4 c4. bes8 a g f4 g2 fis4 g\breve r2 bes c1 |
		
		bes2. a4 g a g2 d4 d' c d e1 f4 d c f2 e8 d e2 |
		f2 f4 f e c4. bes8 a g f1 bes2. g4 c1 |
		a g f2 f' e c4 f2 e8 d e4 c4 ~ c
		
		bes4 c4. bes8 a g d'4. c8 c2 bes4 c2. a2 g4 a g8 f e2 r1 |
		r2 g bes a4 d2 c4 d1 r2 | d2 bes4 d4. c8 bes a g4 f2
		g4 a2 bes a4. bes8 c4 d g,2 ~ g4 c4. bes8 a g f4 g2 fis4 g\breve. ~ g\breve \showBarLine \bar "|."
	}
	\addlyrics {
		Nun komm der Hei -- _ _ _ den Hei -- _ _ _ land,
		Nun __ _ komm __ _ der Hei -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ den Hei -- _ land,
		der Jung -- frau -- _ _ _ _ _ _ _ _ _ _ _ en Kind er -- _ _ kannt,
		daß sich wun -- _ _ _ _ der al -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ le __ _ Welt, 
		al -- _ _ _ le Welt,
		Gott __ _ solch __ _ _ _ _ _ Ge -- burt ihm __ _ _ _ _ _ _ _ _ _ _ _ be -- stellt.
	}
}

mezzo = \new Voice	{
	\relative c' {
		r1 r r r r r r r d d c f1 |
		e2 d c1 d1 ~ d e1 d r |
		
		d e f g f2 e4 a2 g8 f g2 |
		a r r1 a g | a2 g4 a4 ~
		a8 g8 f e f2 e r a2. g2. a2. g8 f e4 f |
		
		g2 c,4. d8 e f g2 e4 d2 e4 g2 f8 e f4 g d2 g | d4 a'4. g8 g2
		fis4 g2 r4 g f d e2 d1 r2 r d1 d2 |
		c f d4 f2 e8 d e4 d c2 ~ c1 d\breve e1 d1 ~ d\breve |
	}
	\addlyrics {
		Nun komm der Hei -- den __ _ Hei -- _ _ land,
		der Jung -- frau -- _ _ en Kind er -- _ _ kannt,
		daß sich wun -- der al -- _ _ _ le Welt,
		daß sich wun -- _ _ _ _ der al -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ le Welt, 
		al -- _ _ le Welt,
		Gott solch Ge -- burt ihm __ _ _ _ _ _ _ _ be -- stellt.
	}
}

alto = \new Voice	{
	\relative c' {
		r1 r r r r r g g f bes1 a2 g f1 |
		g\breve a1 g r g a |
		
		bes c bes2 a4 d2 cis8 b cis2 d r r1 |
		d c d2 c4 d4. c8 bes a bes2 a r |
		d2. c d c8 bes a4 bes c2 f,4. g8 a bes c2 a4 |
		
		g2 a4 c2 bes8 a bes4 c g2 c g4 d'4. c8 c4 ~ c bes4 c2 r4 c bes g |
		a2 g1 r2 r g1 g2 f bes g4 bes2 a8 g |
		a4 g f1. g1 ~ g a1 g\breve. ~ g\breve |
	}
	\addlyrics {
		Nun komm der Hei -- den __ _ Hei -- _ _ land,
		der Jung -- frau -- _ _ en Kind er -- _ _ kannt,
		daß sich wun -- der al -- _ _ _ le Welt,
		daß sich wun -- _ _ _ _ der al -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ le Welt, 
		al -- _ _ le Welt,
		Gott solch Ge -- burt ihm __ _ _ _ _ _ _ _ be -- stellt.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		g2 g f bes2. a8 g a2 g8 a bes c d4 e f4. e8 d c d4 bes d2 c4 |
		d2 r4 d bes d2 c8 bes a4 bes a2 g2. f4 ~ \break f e8 d c4 c' d c2 bes4 |
		c2 bes c r1 a2 bes2. bes4 c4. bes8 g4. a8 bes1 a4. g8 a2 |
		
		g2 r r g2 f a g1 a4 bes c f,2. c'2 |
		f,4. g8 a4 bes g a4. bes8 c4 a2 r4 a bes4. c8 d4 e f c8 d e4 a, |
		r a2 f4 g4. a8 bes2 a4. bes8 c4 d e2 f c1 |
		
		d2 c4 a2 g8 f g4 a bes2 g r1 r2 g bes4 a bes c |
		d2 bes4 g4. a8 bes c d4 bes a2 d, r4 d'2 c8 bes a2 g r1 |
		r2 d'1 d2 g, r2 r1 r2 a2 bes4 g bes2 c1 bes2 g2 ~ g4 f8 e d2 d1 |
	}
	\addlyrics {
		Nun komm der Hei -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ den Hei -- _ land,
		der Hei -- _ _ _ _ _ _ _ _ _ _ den Hei -- _ _ _ _ _ land,
		der Jung -- frau -- _ _ en __ _ Kind er -- _ _ kannt,
		der __ _ Jung -- frau -- _ _ _ _ _ _ _ _ en Kind __ _ _ er -- kannt,
		daß __ _ sich wun -- der al -- _ _ le Welt,
		daß sich wun -- _ der al -- _ _ _ _ _ _ _ _ _ _ _ _ _ le Welt,
		daß sich __ _ wun -- _ _ der al -- _ _ _ _ _ le Welt, 
		al -- _ _ le Welt,  al -- le Welt,
		Gott solch Ge -- burt ihm __ _ _ _ _ be -- stellt.
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
		r1 r r g2 g f bes2 ~ bes4 a8 g a2 |
		g4 g,4. a8 bes4 c g bes c d1 g,2 r4 d' f2 e d1 |
		c2 g c es d1 g, c g2 r4 g'2 f8 e f2 |
		
		g g c, r4 c4 d4. e8 f2 e4. d8 e2 d e4 f d2 c |
		r4 f2 d4 e f4. g8 a4 d,4. e8 f4 d g1 f2 e4 f4 ~
		f8 e8 d c d4 f c2 r4 g' d f2  e8 d c2 a4 f f2 r |
		
		r1 r r2 c'4. d8 e4 f d e f g c,2 g'4 f g e |
		d2 g,1 r2 a bes g4 bes2 c4 d2 g, g'2. d4 |
		f e d2 bes d c4 bes c2 ~ c es2 d1 g, c g1 ~ g\breve
  }
	\addlyrics {
		Nun komm der Hei -- _ _ _ _ _ _ _ _ den Hei -- _ _ land,
		der Hei -- _ _ _ _ _ _ _ den Hei -- land,
		der __ _ _ Jung -- frau -- en Kind,
		der Jung -- _ _ frau -- _ _ en Kind __ _ er -- kannt,
		daß sich wun -- _ _ der al -- _ _ _ _ _ _ _ _ _ _ _ le Welt,
		daß sich wun -- der __ _ al -- _ le Welt,
		daß __ _ _ sich wun -- _ _ der al -- _ _ _ _ le Welt,
		Gott solch Ge -- burt ihm __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ be -- stellt.
	}
}

\score {
	\transpose c c {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 9)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano  \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \mezzo  \set Staff.instrumentName = #"M" \set Staff.shortInstrumentName = #"M" >>
			\new Staff << \global \alto  \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor  \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \bass  \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
	\layout { }
	\midi {	}
}
