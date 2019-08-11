% CPDL #
% Copyright ©2019 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "4"

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
	composer = \markup \sans \column \right-align { "Gregorio Allegri (edited by Hugh Keyte)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year "Hugh Keyte" -
				"Typeset by Peter Hilton" -
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
		proportionalNotationDuration = #(ly:make-moment 1 2)
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

chantLayout = \layout {
	ragged-right = ##t
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
    instrumentName = #"T"
    clefTransposition = #-7
    middleCPosition = #1
  }
  \context {
    \Voice
    \override Stem #'transparent = ##t
  }
  \context {
    \Lyrics
    \override LyricSpace.minimum-distance = #2.0
    \override LyricHyphen.minimum-distance = #2.0
  }
}

global = { 
	\time 2/1
	\tempo 1 = 40
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

lyricLeft = { \once \override LyricText.self-alignment-X = #LEFT }
showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }


% Verse 1

mezzo = \new Voice {
  \relative c'' {
    c2. c4 c2 c b1 c2 e1 d c b2 c1 \break
    r4 d d4 d d2 d2. d4 d d
    e1. d2 c1 b c b\breve \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ _ _ us:
    se -- cún -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- _ am.
  }
}

alto = \new Voice {
  \relative c'' {
    a2. a4 a2 a g\breve a1 g\breve g1
    r4 g g4 g g2 g2. g4 g g
    g1. f2 e1 e\breve e
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- us:
    se -- cún -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- am.
  }
}

tenorA = \new Voice {
  \relative c' {
		\clef "treble_8"
		e2. e4 e2 e e1 e f1. e2 d1 e
		r4 d d4 d d2 d2. d4 d d
		g,1 b2. b4 e,1. b'1 a gis4 fis gis1
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ _ us:
    se -- cún -- dum mag -- nam mi -- se -- ri -- cór -- _ di -- am tu -- _ _ _ am.
  }
}

tenorB = \new Voice {
  \relative c' {
		\clef "treble_8"
		a2. a4 a2 a b g1 c2. b4 a2 b c d g, g1
		r4 b b4 b b2 b2. b4 b b
		b1. d2 g, a1 gis2 a1 b\breve
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ _ _ _ _ _ us:
    se -- cún -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- _ _ am.
  }
}

bass = \new Voice {
  \relative c {
		\clef "bass"
		a2. a4 a2 a e'1 c f g\breve c,1
		r4 g' g4 g g2 g2. g4 g g
		e1 b c e a, e'\breve
  }
  \addlyrics {
    \set stanza = #"1. "
    Mi -- se -- ré -- re me -- i De -- _ us:
    se -- cún -- dum mag -- nam mi -- se -- ri -- cór -- di -- am tu -- _ am.
  }
}

\score {
	\new StaffGroup << 
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \mezzo \set Staff.instrumentName = #"MS" \set Staff.shortInstrumentName = #"MS" >> 
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
		\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
		\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
	>> 
	\header {
		piece = \markup \concat { "Verse 1: Original version (Cappella Sistina manuscript 205, mid 17" \super th "century)"}
	}
	\layout { }
}


% Verse 2

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve c4 d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"2. "
			\lyricLeft "Et secúndum multitudinem miseratiónem" tu -- á -- rum:
			\lyricLeft "dele iniqui" -- tá -- tem me -- am.
		}
	>>
	\layout { \chantLayout }
}


% Verse 3

sopranoA = \new Voice {
  \relative c'' {
    \set Score.currentBarNumber = #12
    e2. e4 e2 e4 e e2 r e4 e e e e1 d2 e f4 e e1 d2 e\breve
    f2 f4 f f2 f e1. d1 c b4 a gis2 a1 gis2 a\breve
    \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"3. "
    Am -- pli -- us la -- va me ab in -- i -- qui -- tá -- te __ _ me -- _ _ _ a:
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
    et a pec -- ca -- to me -- o mun -- _ _ _ da me.
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
	\new StaffGroup << 
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
		\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
	>> 
	\header {
		piece = \markup \concat { "Verse 3: Original version (Cappella Sistina manuscript 206, mid 17" \super th "century)"}
	}
	\layout { }
}


% Verse 4

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve c4 d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"4. "
			\lyricLeft "Quóniam iniquitátem meam ego" cog -- nós -- co:
			\lyricLeft "et peccátum meum contra" me est sem -- per.
		}
	>>
	\layout { \chantLayout }
}


% Verse 5

soprano = \new Voice {
  \relative c'' {
    \set Score.currentBarNumber = #24
    e2. e4 e2 e4 e e2 e1 e2 e1 e2 c2. a4 f'2. e4 e d8 c d1 c
    d2 d d4 d d2 d d4 d d2. d4 d2 d d d2 d1 d r r2 
    d1 c4 b c2 f2. e8 d e1 \ficta d!4 c b a gis b c1 b b\breve \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"5. "
    Ti -- bi so -- li pec -- ca -- vi, 
    et ma -- lum co -- _ ram __ _ te __ _ _ fe -- ci:
    ut ju -- sti -- fi -- cé -- ris in ser -- mó -- ni -- bus tu -- is, et vín -- cas
    cum ju -- di -- cá -- _ _ _ _ _ _ _ _ _ _ _ _ ris.
  }
}

mezzo = \new Voice {
  \relative c'' {
      c2. c4 c2 c4 c c2 c1 c2 b1 c2 e1 d c2. b8[ a] b c4 b8 c1
      b2 b b4 b b2 b b4 b b2. b4 b2 b b b2 b1 b r r
      a1 a2 a g c1 b4 a gis a b2. a4 a1 gis4 fis gis\breve
  }
  \addlyrics {
    \set stanza = #"5. "
    Ti -- bi so -- li pec -- ca -- vi, et ma -- lum co -- _ ram __ _ te __ _ _ fe -- ci:
    ut ju -- sti -- fi -- cé -- ris in ser -- mó -- ni -- bus tu -- is, et vín -- cas
    cum ju -- di -- cá -- _ _ _ _ _ _ _ _ _ _ ris.
  }
}

alto = \new Voice {
  \relative c'' {
    a2. a4 a2 a4 a a2 a1 a2 g1 g a2 a g1 g e
    g2 g g4 g g2 g g4 g g2. g4 g2 g g g2 g1 g2 g1 f4 e f1
    e1 r r4 g g g f1 e1 ~ e\breve e\breve
  }
  \addlyrics {
    \set stanza = #"5. "
    Ti -- bi so -- li pec -- ca -- vi, et ma -- lum co -- ram te fe -- ci:
    ut ju -- sti -- fi -- cé -- ris in ser -- mó -- ni -- bus tu -- is, et vín -- cas
    cum ju -- di -- cá -- ris, cum ju -- di -- cá -- _ ris.
  }
}

tenor = \new Voice {
  \relative c' {
		\clef "treble_8"
    a2. a4 a2 a4 a a2 a1 a2 b2 g c1 a2 d4 c b a8 g c2 g1 g
    d'2 d d4 d d2 d d4 d d2. d4 d2 d d d2 d1 b a a1.
    c2 c1 c a2 b1 e4 d c2. d4 e2 e, e\breve
  }
  \addlyrics {
    \set stanza = #"5. "
    Ti -- bi so -- li pec -- ca -- vi, et ma -- lum co -- _ ram __ _ _ _ _ te fe -- ci:
    ut ju -- sti -- fi -- cé -- ris in ser -- mó -- ni -- bus tu -- is, et vín -- cas
    cum ju -- di -- cá -- ris, cum ju -- di -- _ cá -- _ _ _ ris.
  }
}

bass = \new Voice {
  \relative c {
		\clef "bass"
    a2. a4 a2 a4 a a2 a1 a2 e'1 c f g2 g g,1 c
    g'2 g g4 g g2 g g4 g g2. g4 g2 g g g2 g1 g d d2 f
    a1 a, c d e a, e' e\breve
  }
  \addlyrics {
    \set stanza = #"5. "
    Ti -- bi so -- li pec -- ca -- vi, et ma -- lum co -- ram te fe -- ci:
    ut ju -- sti -- fi -- cé -- ris in ser -- mó -- ni -- bus tu -- is, et vín -- cas
    cum ju -- di -- cá -- ris, cum ju -- di -- cá -- _ ris.
  }
}

\score {
	\new StaffGroup << 
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
		\new Staff << \global \mezzo \set Staff.instrumentName = #"MS" \set Staff.shortInstrumentName = #"MS" >> 
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
	>> 
	\header {
		piece = "Verse 5: Original version (Cappella Sistina manuscript 185)"
	}
	\layout { }
	\midi {	}
}


% Verse 6

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve c4 d c c4. s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"6. "
			\lyricLeft "Ecce enim in iniquitátibus" con -- cép -- tus sum:
			\lyricLeft "et in peccátis concépit me" ma -- ter me -- a.
		}
	>>
	\layout { \chantLayout }
}


% Verse 7

sopranoA = \new Voice {
  \relative c'' {
    \set Score.currentBarNumber = #41
    e2. e4 e2 e e4 e e2 e e1 d2 e f4 e e2 r4 a2 g4 f e4. f8 d4 e1. ~ e\breve \break
    f2 f f4 f4. f8 f2 f4 f4. f8 f4 f8 f f2 f f f f
    e1. d2 ~ d8 e c b c1 b8. c16 a4 gis2 a1 gis2 a\breve
    \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"7. "
    Ec -- ce e -- nim ver -- i -- tá -- tem di -- _ lex -- í -- _ _ _ _ _ _ _ _ sti
    in -- cér -- ta et oc -- cúl -- ta sa -- pi -- én -- ti -- æ tu -- æ 
    ma -- ni -- fes -- tá -- sti __ _ _ _ mi -- _ _ _ _ _ _ hi.
  }
}

sopranoB = \new Voice {
  \relative c'' {
    c2. c4 c2 c c4 c c2 c c1 b1. a ~ a1 c2 b8. c16 a4 b2 ~ b\breve
    d2 d d4 d4. d8 d2 d4 d4. d8 d4 d8 d d2 d d d d
    c1 b1. a1 d2. c4 c b8 a b1 cis\breve
  }
  \addlyrics {
    \set stanza = #"7. "
    Ec -- ce e -- nim ver -- i -- tá -- tem di -- lex -- í -- _ _ _ _ sti
    in -- cér -- ta et oc -- cúl -- ta sa -- pi -- én -- ti -- æ tu -- æ 
    ma -- ni -- fes -- tá -- sti mi -- _ _ _ _ _ _ hi.
  }
}

alto = \new Voice {
  \relative c'' {
    a2. a4 a2 a a4 a a2 a g1 g c, a2 a'\breve gis8. a16 fis4 gis2 ~ gis\breve
    a2 a a4 a4. a8 a2 a4 a4. a8 a4 a8 a a2 a a a a
    a1 e e f e\breve e
  }
  \addlyrics {
    \set stanza = #"7. "
    Ec -- ce e -- nim ver -- i -- tá -- tem di -- lex -- í -- _ _ _ _ _ sti
    in -- cér -- ta et oc -- cúl -- ta sa -- pi -- én -- ti -- æ tu -- æ 
    ma -- ni -- fes -- tá -- sti mi -- _ _ hi.
  }
}

bass = \new Voice {
  \relative c' {
		\clef "bass"
		a2. a4 a2 a a4 a a2 a c1 g a f\breve e1. ~ e\breve
    d2 d d4 d4. d8 d2 d4 d4. d8 d4 d8 d d2 d d d d
    a'1 gis a d, e\breve a,
  }
  \addlyrics {
    \set stanza = #"7. "
    Ec -- ce e -- nim ver -- i -- tá -- tem di -- lex -- í -- _ sti
    in -- cér -- ta et oc -- cúl -- ta sa -- pi -- én -- ti -- æ tu -- æ 
    ma -- ni -- fes -- tá -- sti mi -- _ _ hi.
  }
}


\score {
	\new StaffGroup << 
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
		\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
	>> 
	\header {
		piece = \markup \concat { "Verse 7: conjectural early ornamentation of original version"}
	}
	\layout { }
}


% Verse 8

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve c4 d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"8. "
			\lyricLeft "Aspérges me hyssópo et" mun -- dá -- bor:
			\lyricLeft "lavábis me et super nivem" de -- al -- bá -- bor.
		}
	>>
	\layout { \chantLayout }
}


% Verse 9

soprano = \new Voice {
  \relative c'' {
    \set Score.currentBarNumber = #56
    e4 e e8. e16 e1 e2 e4. e8 e2. e4 e1 s4 e\breve c2 f1 e2 d1. d2 c1\fermata
    \dynamicUp
    \break d2 d4 d d2 d d1\> d2\! r r\breve r2 d2.\p e4 c b c2 f2. e4 e1
    d4 c b a gis b c\breve b\breve\fermata \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"9. "
    Au -- dí -- tu -- i me -- o da -- bis gáu -- di -- um 
    et lae -- tí -- _ _ ti -- am:
    et ex -- sul -- tá -- bunt os -- sa
    Hu -- mi -- li -- á -- _ _ _ _ _ _ _ _ _ _ _ ta
  }
}

mezzo = \new Voice {
  \relative c'' {
    \dynamicUp
    c4 c c8. c16 c1 c2 c4. c8 c2. c4 c1 s4 b1\p\< c\! a g2 c1 b4 a b2. b4 c1\fermata
    b2 b4 b b2 b b1 b2 r r\breve r a2\p d4 d g,2 c1
    b4 a gis a b gis a\breve ~ a2 gis8. a16 fis4 g1\fermata
    
  }
  \addlyrics {
    \set stanza = #"9. "
    Au -- dí -- tu -- i me -- o da -- bis gáu -- di -- um 
    et lae -- tí -- _ _ _ _ _ ti -- am:
    et ex -- sul -- tá -- bunt os -- sa
    Hu -- mi -- li -- á -- _ _ _ _ _ _ _ _ _ _ _ ta
  }
}

alto = \new Voice {
  \relative c'' {
    \dynamicUp
    a4 a a8. a16 a1 a2 a4. a8 a2. a4 a1 s4 g1 g1. f4 a d,2 e g1. g2 g1\fermata
    g2 g4 g g2 g g1 g2 g2.\p a4 f e f2. g4 a\breve ~ a1 g f e ~ e\breve e\fermata    
    
  }
  \addlyrics {
    \set stanza = #"9. "
    Au -- dí -- tu -- i me -- o da -- bis gáu -- di -- um 
    et lae -- _ _ _ _ tí -- ti -- am:
    et ex -- sul -- tá -- bunt os -- sa
    Hu -- mi -- li -- á -- _ _ _ _ _ _ ta
  }
}

tenor = \new Voice {
  \relative c' {
		\clef "treble_8"
    \dynamicUp
    c4 c c8. c16 c1 c2 c4. c8 c2. c4 c1 s4 g2 b e1. d8. e16 c4 b2 c d1. d2 e1\fermata
    d2 d4 d d2 d d1 b2 r a1\p a2. g4 f2 f' e1. d1 c2
    a2 b\breve a4 gis a1 b\breve\fermata
    
  }
  \addlyrics {
    \set stanza = #"9. "
    Au -- dí -- tu -- i me -- o da -- bis gáu -- di -- um 
    et lae -- tí -- _ _ _ _ _ _ ti -- am:
    et ex -- sul -- tá -- bunt os -- sa
    Hu -- mi -- li -- á -- _ _ _ _ _ _ _ _ _ ta
  }
}

bass = \new Voice {
  \relative c {
		\clef "bass"
    \dynamicUp
    a4 a a8. a16 a1 a2 a4. a8 a2. a4 a1 s4 e'1 c f g2 c, g1. g2 c1\fermata
    g2 g4 g g2 g g1 g2 r d'1\p d2. e4 f2. g4 a1 a,2. b4 c1
    d e a,\breve e'\fermata
  }
  \addlyrics {
    \set stanza = #"9. "
    Au -- dí -- tu -- i me -- o da -- bis gáu -- di -- um 
    et lae -- tí -- _ _ _ ti -- am:
    et ex -- sul -- tá -- bunt os -- sa
    Hu -- mi -- li -- á -- _ _ _ _ _ _ _ _ ta
  }
}

\score {
	\new StaffGroup << 
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
		\new Staff << \global \mezzo \set Staff.instrumentName = #"MS" \set Staff.shortInstrumentName = #"MS" >> 
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
	>> 
	\header {
		piece = "Verse 9: later 18th century version (published Charles Burney, 1771)"
	}
	\layout { }
	\midi {	}
}




% Verse 10

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"10. "
			\lyricLeft "Avérte fáciem tuam a peccátis" me -- is:
			\lyricLeft "et omnes iniquitátes" me -- as de -- le.
		}
	>>
	\layout { \chantLayout }
}


% Verse 11

sopranoA = \new Voice {
  \relative c'' {
    \set Score.currentBarNumber = #72 \cadenzaOn
    e2 \cadenzaOff e1 e e2 e e1 d2 e f4 e e2 r4 a4 ~ a4. g8 f4. e8 d8. e16 c4
    d2 d e\breve e1\fermata
    \cadenzaOn f2 \cadenzaOff f2. f4 f2 f1 f2 f2. f4 f1 f2 f
    e1. d1 c b4 a gis b a8. b16 g4 a2 a1 gis8. a16 fis4 gis1 a\breve\fermata
    \showBarLine \bar "|"
  }
  \addlyrics {
    \set stanza = #"11. "
    Cor mun -- dum cre -- a in __ _ me De -- _ _ _ _ _ _ _ _ _ _ _ _ us:
    et spí -- ri -- tum rec -- tum ín -- no -- va in vi -- 
    scé -- ri -- bus me -- _ _ _ _ _ _ _ _ _ _ _ is.
  }
}

sopranoB = \new Voice {
  \relative c'' {
    c2 c1 c c2 c c1 b1. a2 c\breve
    r1 c2 b8. c16 a4 b1 b\fermata
    d2 d2. d4 d2 d1 d2 d2. d4 d1 d2 d
    c1 b1. a1 d1. c4 c b8. c16 a4 b\breve cis\fermata
  }
  \addlyrics {
    \set stanza = #"11. "
    Cor mun -- dum cre -- a in me De -- _ _ _ _ _ _ us:
    et spí -- ri -- tum rec -- tum ín -- no -- va in vi -- 
    scé -- ri -- bus me -- _ _ _ _ _ _ is.
  }
}

alto = \new Voice {
  \relative c'' {
    a2 a1 a a2 a g1 g c,2. b4 a2 a'\breve ~ a gis8. a16 fis4 gis1\fermata
    a2 a2. a4 a2 a1 a2 a2. a4 a1 a2 a
    a1 e\breve f1 e\breve ~ e e\fermata
  }
  \addlyrics {
    \set stanza = #"11. "
    Cor mun -- dum cre -- a in me De -- _ _ _ _ _ _ us:
    et spí -- ri -- tum rec -- tum ín -- no -- va in vi -- 
    scé -- ri -- bus me -- is.
  }
}

bass = \new Voice {
  \relative c' {
		\clef "bass"
		a2 a1 a a2 a c1 g a f1 ~ f\breve e\breve e1\fermata
    d2 d2. d4 d2 d1 d2 d2. d4 d1 d2 d
    a'1 gis a d, e\breve ~ e a,\fermata
  }
  \addlyrics {
    \set stanza = #"11. "
    Cor mun -- dum cre -- a in me De -- _ _ us:
    et spí -- ri -- tum rec -- tum ín -- no -- va in vi -- 
    scé -- ri -- bus me -- _ is.
  }
}


\score {
	\new StaffGroup << 
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
		\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
	>> 
	\header {
		piece = \markup \concat { "Verse 11: the first (‘A’ and ‘B’) of two embellishments (A-D) in the first printed publication to include them (Alfieri, 1840)"}
	}
	\layout { }
}


% Verse 12

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g a a4. \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"12. "
			\lyricLeft "Ne projícias me a fácie" tu -- a:
			\lyricLeft "et spíritum sanctum tuum ne" áu -- fe -- ras a me.
		}
	>>
	\layout { \chantLayout }
}


% Verse 13



% Verse 14

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"14. "
			\lyricLeft "Docébo iníquos vías" tu -- as:
			\lyricLeft "et ímpii ad te" con -- ver -- tén -- tur.
		}
	>>
	\layout { \chantLayout }
}


% Verse 15



% Verse 16

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve c4 d c c4. s4 \showBarLine \bar "|" s
			  c\breve c4 b g4. a \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"16. "
			\lyricLeft "Dómine, lábia mea" a -- pé -- ri -- es:
			\lyricLeft "et os meum annuntiábit" lau -- dem tu -- am.
		}
	>>
	\layout { \chantLayout }
}


% Verse 17



% Verse 18

\score {
	\new Staff <<
		\new Voice {
			\relative c' {
			  \cadenzaOn c\breve c4 c c d4. c s4 \showBarLine \bar "|" s
			  c\breve c4 b g a a4. \showBarLine \bar "|"
			}
		}
    \addlyrics {
      \set stanza = #"18. "
			\lyricLeft "Sacrifícium Deo spíritus" con -- tri -- bu -- lá -- tus:
			\lyricLeft "cor contritum, et humiliátum, Deus," non de -- spí -- ci -- es.
		}
	>>
	\layout { \chantLayout }
}


% Verse 19


% Verse 20


