% Copyright ©2016-2017 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "8"
\pointAndClickOff

#(set-global-staff-size 16.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 10\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
 	ragged-bottom = ##f
	ragged-last-bottom = ##f
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #4 \override #'(font-name . "Source Sans Pro") {
		\center-column {
			"Né più bella di queste"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Heinrich Isaac (c. 1450 – 1517)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				rev \revision
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
	\tempo 1 = 50
	\set Staff.midiInstrument = "acoustic guitar (nylon)"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }
singleDigitTime = { \once \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c' {
		\repeat unfold 4 {
			\repeat unfold 2 {
				f1 f2 f g g a1 g c c2 bes1 a2. g8 f g2 a1 r2 a
				a a bes2. a4 g2 f e1 \showBarLine \bar "|"
			}
			r1 r r r a2 a4 a bes2 a4 g2 f e4
			f1 \fermata r r r r g2 g4 g a2 g4 a g c2 \ficta b4 c1 \fermata \showBarLine \bar "|"
			\singleDigitTime \time 3/2 \tempo 1. = 50 a2 a a
			bes1 bes2 a1 a2 g \[ f g a \] f1 e1 r2 \showBarLine \bar "|"
			\time 2/2 \tempo 1 = 50 e2 e4 e d2 d c4. d8 e4 f g bes! a g g f2 e4 f1 \showBarLine \bar "||" \break
		}
	}
	\addlyrics {
		\set stanza = #"1. "
		Né più bel -- la di que -- ste, né più de -- _ _ _ _ gna
		Si tro -- "va al" -- cu -- na de -- _ a,
		Ju -- non ve -- de -- te che nel ciel su re -- _ _ _ _ gna.
		Ve -- de -- te Ci -- te -- re -- _ a,
		Ve -- de -- te qui Mi -- ner -- _ _ va,
		E’l mar -- ti -- al fu -- _ ro -- _ _ re,
		Do -- ma con l’ar -- "te et" con la sa -- pien -- _ _ _ za,
		Ve -- nu -- "te in" -- sie -- "me ad" a -- _ _ bi -- tar __ _ Fi -- o -- ren -- _ _ za.

		\set stanza = #"2. "
		Fio -- ren -- za, tu sa -- rai la più fa -- mo -- _ _ _ _ sa
		Cit -- tà che veg -- "ga il" so -- _ le;
		Di lor pre -- sen -- za sa -- rai glo -- ri -- o -- _ _ _ _ sa.
		Ju -- non tuo sta -- to vuo -- _ le
		Te -- ner don -- "ne e" ma -- ri -- _ _ ti
		Ter -- rà sen -- za dis -- _ cor -- di -- _ a,
		Fa -- "rà il" po -- pol fio -- rir fuor d’o -- "gni u" _ _ -- san -- za
		Sa -- "no e" ga -- gliar -- "do e" sem -- _ _ "pre in" ab -- _ bon -- _ dan -- _ _ za.

		\set stanza = #"3. "
		Mi -- ner -- va sag -- gia ci da -- rà vit -- to -- _ _ _ _ ria
		Con -- "tro à" ni -- mi -- "ci in" guer -- _ ra,
		Fa -- rac -- ci tri -- on -- far con som -- ma glo -- ri -- _ _ _ a
		E per ma -- "re e" per ter -- _ ra
		O di ma -- "no o" d’in -- ge -- _ _ gno.
		Fe -- li -- "ce in" og -- ni __ _ par -- _ _ te,
		Toc -- can -- "do il" ciel col -- la su -- per -- ba __ _ _ chio -- ma,
		Fio -- ren -- za bel -- la fig -- _ _ liuo -- la __ _ di __ _ Ro -- _ _ ma.

		\set stanza = #"4. "
		Ma Ve -- ner bel -- la sem -- "pre in" can -- "ti e’n" fe -- _ _ _ _ ste,
		In bal -- "li e’n" noz -- "ze e’n" mo -- _ stre,
		In va -- rie fog -- "gie e’n" nuo -- ve so -- pra -- ve -- _ _ _ _ ste,
		In tor -- nia -- men -- "ti e’n" gio -- _ stre
		Tut -- te __ _ don -- ne et don -- zel -- le.
		Fa -- rà dol -- ce con -- _ qui -- _ _ sta
		Ter -- rà sem -- pre Fio -- ren -- "za in" can -- "to e" __ _ _ ri -- so
		Et di -- ras -- si Fio -- ren -- _ _ "za è’l" pa -- _ ra -- _ di -- _ _ so.
	}
}

alto = \new Voice {
	\relative c' {
		\repeat unfold 4 {
			\repeat unfold 2 {
				f1 c2 d e e f1 e c c2 d2. g,4 c2 bes1 a r2 c
				c c d2. c4 bes2 a g1
			}
			r1 r r r c2 c4 c d2 c4 bes a bes g2
			f r c' c4 c d2 c4. d8 e4 f2 e4 f2 r e e4 e f2 e4 f e c d2 c1 \singleDigitTime c2 c c
			d1 bes2 c1 d2 e d2. c4 c1 \ficta b2 c1 r2 c c4 c bes2 bes a4 c2 bes8 a g2 f4 e f2 g f1
		}
	}
	\addlyrics {
		\set stanza = #"1. "
		Né più bel -- la di que -- ste, né più de -- _ _ _ gna
		Si tro -- "va al" -- cu -- na de -- _ a,
		Ju -- non ve -- de -- te che nel ciel su re -- _ _ _ gna.
		Ve -- de -- te Ci -- te -- re -- _ a,
		Ve -- de -- te qui Mi -- _ ner -- _ _ va,
		Che gl’in -- ge -- gni con -- _ ser -- _ _ va,
		E’l mar -- ti -- al fu -- _ ro -- _ _ re,
		Do -- ma con l’ar -- "te et" col -- la sa -- pien -- _ _ _ za
		Ve -- nu -- "te in" -- sie -- "me ad" a -- _ bi -- _ tar __ Fi -- o -- ren -- _ za.

		\set stanza = #"2. "
		Fio -- ren -- za, tu sa -- rai la più fa -- mo -- _ _ _ sa
		Cit -- tà che veg -- "ga il" so -- _ le;
		Di lor pre -- sen -- za sa -- rai glo -- ri -- o -- _ _ _ sa.
		Ju -- non tuo sta -- to vuo -- _ le
		Te -- ner don -- "ne e" ma -- _ ri -- _ _ ti
		E cit -- ta -- di -- ni u -- ni -- _ _ ti
		Ter -- rà sen -- za dis -- _ cor -- _ di -- a,
		Fa -- "rà il" po -- pol fio -- rir fuor d’o -- "gni u" -- _ san -- _ za
		Sa -- "no e" ga -- gliar -- "do e" sem -- _ "pre in" _ ab -- bon -- _ dan -- _ za.

		\set stanza = #"3. "
		Mi -- ner -- va sag -- gia ci da -- rà vit -- to -- _ _ _ ria
		Con -- "tro à" ni -- mi -- "ci in" guer -- _ ra,
		Fa -- rac -- ci tri -- on -- far con som -- ma glo -- _ ri -- _ a
		E per ma -- "re e" per ter -- _ ra
		O di ma -- "no o" d’in -- _ ge -- _ _ gno.
		So -- la pas -- se -- "rai el" __ _ se -- _ _ gno
		Fe -- li -- "ce in" og -- ni __ _ par -- _ _ te,
		Toc -- can -- "do il" ciel col -- la su -- _ per -- ba chio -- _ ma,
		Fio -- ren -- za bel -- la fig -- _ liuo -- _ la di __ _ Ro -- _ ma.

		\set stanza = #"4. "
		Ma Ve -- ner bel -- la sem -- "pre in" can -- "ti e’n" fe -- _ _ _ ste,
		In bal -- "li e’n" noz -- "ze e’n" mo -- _ stre,
		In va -- rie fog -- "gie e’n" nuo -- ve so -- pra -- ve -- _ _ _ ste,
		In tor -- nia -- men -- "ti e’n" gio -- _ stre
		Tut -- te __ _ don -- ne et don -- _ zel -- le.
		Con a -- mo -- ro -- sa __ _ vi -- _ _ sta
		Fa -- rà dol -- ce con -- _ qui -- _ _ sta
		Ter -- rà sem -- pre Fio -- ren -- "za in" can -- "to e" __ _ ri -- _ so
		Et di -- ras -- si Fio -- ren -- _ "za è’l" _ pa -- ra -- _ di -- _ so.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\repeat unfold 4 {
			\repeat unfold 2 {
				c1 a2. bes4 c2 c c1 c g c2 bes1 f'2 d e d1 r2 f
				f f f1 es2 d c1
			}
			\ficta e!2 e4 e f2 e4 d2 c \ficta b4 c2 r f2 f4 f f2 e4. d8 c4 d c2
			c r a a4 a bes2 a4 c bes8 a g f g2 f1 r r r r \singleDigitTime f2 f f
			bes2. c4 d e f1 f2 e f \[ e c d1 \] g, r2 g g4 g f2 f f' e4 d c g a c c \ficta b4 c2 c1
		}
	}
	\addlyrics {
		Né più bel -- la di que -- ste, né più de -- _ _ _ gna
		Si tro -- "va al" -- cu -- na de -- a,
		Ju -- non ve -- de -- te che nel ciel su re -- _ _ _ gna.
		Ve -- de -- te Ci -- te -- re -- a,
		Ma -- dre dol -- ce d’a -- mo -- _ _ re,
		Ve -- de -- te qui Mi -- _ ner -- _ _ va,
		Che gl’in -- ge -- gni con -- _ ser -- _ _ _ _ va,
		Do -- ma con l’ar -- _ te et con la sa -- _ pien -- _ _ za,
		Ve -- nu -- "te in" -- sie -- "me ad" a -- _ bi -- tar __ _ Fi -- o -- ren -- _ _ za.

		\set stanza = #"2. "
		Fio -- ren -- za, tu sa -- rai la più fa -- mo -- _ _ _ sa
		Cit -- tà che veg -- "ga il" so -- le;
		Di lor pre -- sen -- za sa -- rai glo -- ri -- o -- _ _ _ sa.
		Ju -- non tuo sta -- to vuo -- le
		Cre -- sce -- "re ed" in con -- cor -- _ di -- a
		Te -- ner don -- "ne e" ma -- _ ri -- _ _ ti
		E cit -- ta -- di -- ni u -- ni -- _ _ _ _ ti
		Fa -- "rà il" po -- pol __ _ fio -- _ ire fuor d’o -- "gni u" -- san -- _ _ za
		Sa -- "no e" ga -- gliar -- "do e" sem -- _ "pre in" ab -- _ bon -- _ dan -- _ _ za.

		\set stanza = #"3. "
		Mi -- ner -- va sag -- gia ci da -- rà vit -- to -- _ _ _ ria
		Con -- "tro à" ni -- mi -- "ci in" guer -- ra,
		Fa -- rac -- ci tri -- on -- far con som -- ma glo -- ri -- _ _ a
		E per ma -- "re e" per ter -- ra
		In tut -- te le buo -- _ "ne ar" -- _ te
		O di ma -- "no o" d’in -- _ ge -- _ _ gno.
		So -- la pas -- se -- "rai el" __ _ se -- _ _ _ _ gno
		Toc -- can -- "do il" ciel __ _ col -- _ la su -- per -- ba chio -- _ _ ma,
		Fio -- ren -- za bel -- la fig -- _ liuo -- la __ _ di __ _ Ro -- _ _ ma.

		\set stanza = #"4. "
		Ma Ve -- ner bel -- la sem -- "pre in" can -- "ti e’n" fe -- _ _ _ ste,
		In bal -- "li e’n" noz -- "ze e’n" mo -- stre,
		In va -- rie fog -- "gie e’n" nuo -- ve so -- pra -- ve -- _ _ _ ste,
		In tor -- nia -- men -- "ti e’n" gio -- stre
		Fa -- rà ga -- lan -- "te et" bel -- _ _ le
		Tut -- te __ _ don -- ne et don -- _ zel -- le.
		Con a -- mo -- ro -- sa __ _ vi -- _ _ _ _ sta
		Ter -- rà sem -- pre __ _ Fio -- _ ren -- "za in" can -- "to e" ri -- _ _ so
		Et di -- ras -- si Fio -- ren -- _ "za è’l" pa -- _ ra -- _ di -- _ _ so.
	}
}


bass = \new Voice {
	\relative c {
		\clef bass
		\repeat unfold 4 {
			\repeat unfold 2 {
				f1 f2 f c c f1 c c c2 g'1 f2 g1 d r2 f
				f f bes, bes es f c1
			}
			g'2 g4 g a2 g4 f e f d2 c r f f4 f bes,!2 c4 e f bes, c2
			f1 r r r r c2 c4 c f2 c4 f g a g2 c,1 \singleDigitTime a'2 a a
			g1 g2 f1 f2 \[ c2 d \] e f d1 c r2 c c4 c d2 bes f' c4 d e2 f4 c d2 c f1
		}
	}
	\addlyrics {
		Né più bel -- la di que -- ste, né più de -- _ _ gna
		Si tro -- "va al" -- cu -- na de -- _ a,
		Ju -- non ve -- de -- te che nel ciel su re -- _ _ gna.
		Ve -- de -- te Ci -- te -- re -- _ a,
		Ma -- dre dol -- ce d’a -- mo -- _ _ _ re,
		Ve -- de -- te qui Mi -- _ ner -- _ _ va,
		E’l mar -- ti -- al fu -- _ ro -- _ _ re,
		Do -- ma con l’ar -- "te et" con la sa -- _ pien -- _ _ za,
		Ve -- nu -- "te in" -- sie -- "me ad" a -- _ bi -- tar Fi -- o -- ren -- _ za.

		\set stanza = #"2. "
		Fio -- ren -- za, tu sa -- rai la più fa -- mo -- _ _ sa
		Cit -- tà che veg -- "ga il" so -- _ le;
		Di lor pre -- sen -- za sa -- rai glo -- ri -- o -- _ _ sa.
		Ju -- non tuo sta -- to vuo -- _ le
		Cre -- sce -- "re ed" in con -- _ cor -- _ di -- a
		Te -- ner don -- "ne e" ma -- _ ri -- _ _ ti
		Ter -- rà sen -- za dis -- _ cor -- _ di -- a,
		Fa -- "rà il" po -- pol fio -- rir fuor d’o -- _ "gni u" -- _ san -- za
		Sa -- "no e" ga -- gliar -- "do e" sem -- _ "pre in" ab -- bon -- _ dan -- _ za.

		\set stanza = #"3. "
		Mi -- ner -- va sag -- gia ci da -- rà vit -- to -- _ _ ria
		Con -- "tro à" ni -- mi -- "ci in" guer -- _ ra,
		Fa -- rac -- ci tri -- on -- far con som -- ma glo -- ri -- _ a
		E per ma -- "re e" per ter -- _ ra
		In tut -- te le buo -- _ _ ne ar -- te
		O di ma -- "no o" d’in -- _ ge -- _ _ gno.
		Fe -- li -- "ce in" og -- ni __ _ par -- _ _ te,
		Toc -- can -- "do il" ciel col la su -- per -- _ ba __ _ chio -- ma,
		Fio -- ren -- za bel -- la fig -- _ liuo -- la di __ _ Ro -- _ ma.

		\set stanza = #"4. "
		Ma Ve -- ner bel -- la sem -- "pre in" can -- "ti e’n" fe -- _ _ ste,
		In bal -- "li e’n" noz -- "ze e’n" mo -- _ stre,
		In va -- rie fog -- "gie e’n" nuo -- ve so -- pra -- ve -- _ _ ste,
		In tor -- nia -- men -- "ti e’n" gio -- _ stre
		Fa -- rà ga -- lan -- "te et" bel -- _ _ _ le
		Tut -- te __ _ don -- ne et don -- _ zel -- le.
		Fa -- rà dol -- ce con -- _ qui -- _ _ sta
		Ter -- rà sem -- pre Fio -- ren -- "za in" can -- _ "to e" __ _ ri -- so
		Et di -- ras -- si Fio -- ren -- _ "za è’l" pa -- ra -- _ di -- _ so.
	}
}

\score {
	\transpose c c {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto \set Staff.instrumentName = #"CT" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
	\layout { }
	\midi {	}
}
