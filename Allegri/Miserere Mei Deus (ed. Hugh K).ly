% CPDL #
% Copyright ©2019 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "1"

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
			"Miserere Mei Deus"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Gegorio Allegri" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://www.cappellagabrieli.nl" "Cappella Gabrieli" -
				"Edited by HK - Typeset by Peter Hilton" -
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
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
%		proportionalNotationDuration = #(ly:make-moment 1 1)
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
		\Staff
		\consists "Custos_engraver"
		\override Custos.style = #'hufnagel
	}
	\context {
		\Voice
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\remove "Forbid_line_break_engraver"
	}
}

global = { 
	\time 2/1
	\tempo 1 = 40
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }

mezzo = \new Voice {
  \relative c'' {
    c2. c4 c2 c b1 c2 e1 d c b2 c1
    d2 d4 d d2 d2. d4 d d
    e1. d2 c1 b c b\breve \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ _ _ us:
    sé -- cun -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- _ am.
  }
}

alto = \new Voice {
  \relative c'' {
    a2. a4 a2 a g\breve a1 g\breve g1
    g2 g4 g g2 g2. g4 g g
    g1. f2 e1 e\breve e
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- us:
    sé -- cun -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- am.
  }
}

tenorA = \new Voice {
  \relative c' {
		\clef "treble_8"
		e2. e4 e2 e e1 e f1. e2 d1 e
		d2 d4 d d2 d2. d4 d d
		g,1 b2. b4 e,1. b'1 a gis4 fis gis1
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ _ us:
    sé -- cun -- dum mag -- nam mi -- se -- ri -- cór -- _ di -- am tu -- _ _ _ am.
  }
}

tenorB = \new Voice {
  \relative c' {
		\clef "treble_8"
		a2. a4 a2 a b g1 c2. b4 a2 b c d g, g1
		b2 b4 b b2 b2. b4 b b
		b1. d2 g, a1 gis2 a1 b\breve
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ _ _ _ _ _ us:
    sé -- cun -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- _ _ am.
  }
}

bass = \new Voice {
  \relative c {
		\clef "bass"
		a2. a4 a2 a e'1 c f g\breve c,1
		g'2 g4 g g2 g2. g4 g g
		e1 b c e a, e'\breve
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ us:
    sé -- cun -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- _ am.
  }
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \mezzo \set Staff.instrumentName = #"MS" \set Staff.shortInstrumentName = #"MS" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = "Choir 1"
	}
	\layout { }
%	\midi {	}
}

\score {
	\new Staff <<
		\set Staff.instrumentName = #"B"
		\key g \major
	  \time 2/1
		\new Voice {
			\relative c {
			  \clef "bass" e\breve \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"2. "
      \once \override LyricText.self-alignment-X = #LEFT
			"Et secúndum multitudinem miseratiónem tuárum: dele inituitátem meam."
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
  \relative c'' {
    \set Score.currentBarNumber = #11
    e2. e4 e2 e4 e e2 r e4 e e e e1 d2 e f4 e e1 d2 e\breve
    f2 f4 f f2 f e1. d1 c b4 a gis2 a1 gis2 a\breve
    \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"3. "
    Am -- pli -- us la -- va me ab in -- i -- qui -- tá -- _ te me -- _ _ _ a:
    et a pec -- ca -- to me -- o mun -- _ _ _ _ da -- me.
  }
}

sopranoB = \new Voice {
  \relative c'' {
    c2. c4 c2 c4 c c2 r c4 c c c c1 b1. a c2 b4 a b1
    d2 d4 d d2 d c1 b1. a1 d c2 b2. b4 cis\breve
  }
  \addlyrics {
    \set stanza = #"3. "
    Am -- pli -- us la -- va me ab in -- i -- qui -- tá -- te me -- _ _ _ a:
    et a pec -- ca -- to me -- o mun -- _ _ _ da -- me.
  }
}

alto = \new Voice {
  \relative c'' {
    a2. a4 a2 a4 a a2 r a4 a a a g\breve c,1 a2 a'1 gis4 fis gis1
    a2 a4 a a2 a a1 e e f e1. e2 e\breve
  }
  \addlyrics {
    \set stanza = #"3. "
    Am -- pli -- us la -- va me ab in -- i -- qui -- tá -- te me -- _ _ _ a:
    et a pec -- ca -- to me -- o mun -- _ _ da -- me.
  }
}

bass = \new Voice {
  \relative c' {
		\clef "bass"
		a2. a4 a2 a4 a a2 r a4 a a a c1 g a f e\breve
		d2 d4 d d2 d a'1 gis a d, e1. e2 a\breve
  }
  \addlyrics {
    \set stanza = #"3. "
    Am -- pli -- us la -- va me ab in -- i -- qui -- tá -- te me -- _ a:
    et a pec -- ca -- to me -- o mun -- _ _ da -- me.
  }
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = "Choir 2"
	}
	\layout { }
	\midi {	}
}

\score {
	\new Staff <<
		\set Staff.instrumentName = #"B"
		\key g \major
	  \time 2/1
		\new Voice {
			\relative c {
			  \clef "bass" e\breve \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"4. "
      \once \override LyricText.self-alignment-X = #LEFT
			"Quóniam iniquitátem mean ego cognósco: et peccátum meum contra me est semper."
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

