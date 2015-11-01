% CPDL #36844
% Copyright ©2015 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "4"
\pointAndClickOff

#(set-global-staff-size 16.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Missa Pro Defunctis - Introitus"
			\vspace #2
		}
	}
	composer = \markup \sans \column \right-align { "Manuel Cardoso (c1566-1650)" }
	poet = \markup \sans { "Liber primus missarum, Lisbon (1625)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				\with-url #"http://www.cpdl.org/wiki/index.php/Missa_Pro_Defunctis_(Manuel_Cardoso)" "CPDL #36844" -
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
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context { 
		\Staff
		\remove "Time_signature_engraver"
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
	\time 4/2
	\tempo 2 = 44
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }


% INTROITUS

\score {
	\new Staff <<
		\key f \major
		\new Voice {
			\once \override AmbitusNoteHead #'transparent = ##t
			\relative c' {
				\cadenzaOn
				\override Stem #'transparent = ##t 
				f4^"solo" f g s f s f s f^"tutti" g a s a g f g s g-- f-- \showBarLine\bar "||"
				\cadenzaOff
			}
		}
		\addlyrics {
			Re -- _ _ qui -- em æ -- _ _ tér -- _ _ _ nam _
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c' {
		r1 f g a\breve a1 g a \break c a 
		g a bes a g f \break f g a g 
		f a a g \break f a g a g f 
		a g \break a c a g a bes a g \break
		f g \time 6/2 a g\breve f\breve \fermata \time 4/2 \showBarLine \bar "|." 
		\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
		\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
		\mark Fine 
		\break
	}
	\addlyrics {
		Do -- _ _ na e -- _ _ _ _ _ _ _ _ is Dó -- _ _ mi -- ne:
		et lux per -- pé -- _ _ _ tu -- a
		lú -- ce -- at __ _ _ _ _ e -- _ _ _ _ _ _ is.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		a2. b4 cis2 d b c!2. bes!4 a g f g a2. d,4 d'2
		d c2. bes4 a2 g1 f r r2 d'1 bes2 c d
		d c4 bes a g a2 ~ a4 g4 f2 f e f c'1 c2 a1 r
		r4 c c a bes2 bes a4 d d a cis2 d d c1 c2
		bes1 a2 f f1 r r\breve r1 r2 c'2. 
		bes4 a g f2 f f4 g a bes c2 bes a4 g a bes c1.
		a2 d1 c a\breve \fermata
	}
	\addlyrics {
		Do -- _ _ _ na e -- _ _ _ _ _ _ _ _ 
		is Dó -- _ _ mi -- ne, do -- _ _ _ 
		na e -- _ _ _ _ _ _ _ _ is Dó -- mi -- ne:
		et lux per -- pé -- tu -- a, et lux per -- pé -- tu -- a lú -- ce -- 
		at e -- _ is, lú --
		_ _ _ _ ce -- at __ _ _ _ _ _ e -- _ _ _ _ 
		is, e -- _ is.
	}
}

alto = \new Voice {
	\relative c' {
		r2 f2. e4 d c d2 e f1. e2 d a bes g c1 ~
		c\breve r2 g'1 fis2 g1 c,2 f1 e2 f1 r2 c1 g2
		c c c2. c4 f,2 f' f4 e2 d2 c8 bes a4 f g g' g d4 ~ d
		f2 d4 e2 d r1 r4 c c a bes2 d d1 c1. d2
		d1 e2 f c f1 e2 f f2. e4 d1 c2. g4 bes2
		f1 r2 c'1 c2 bes1 g2 c c\breve \fermata
	}
	\addlyrics {
		Do -- _ _ _ _ _ _ na e -- is Dó -- mi -- ne,
		do -- na e -- is Dó -- mi -- ne, do -- na 
		e -- is Dó -- mi -- ne: et lux per -- pé -- _ _ _ tu -- a, et lux per -- 
		pé -- tu -- a, __ _ et lux per -- pé -- tu -- a lú -- ce -- 
		at e -- _ is, lú -- ce -- at e -- _ _ _ _ _ 
		is, lú -- ce -- at e -- _ is.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		r\breve r1 c d2 e f1. e2 f f,
		g1 a2 f'1 e4 d c2 a d1 f2. e4 d2 g, d'1
		c r2 c1 f e2 f1 r2 r4 f f e e d d2 g,
		a1 r2 f' f e f f d1 r2 a2. bes4 c d e f g2 ~ g 
		fis2 g2 c, f2. e4 d2 c4 bes a2 c d1 r2 f e d
		d4 e f d e f g2. f4 f1 e4 d e1 f\breve \fermata	}
	\addlyrics {
		Do -- na __ _ e -- is Dó -- _ 
		mi -- ne, do -- _ _ _ _ na e -- _ _ _ _ 
		is Dó -- _ mi -- ne: et lux per -- pé -- tu -- a, __ _
		_ et lux per -- pé -- tu -- a lú -- _ _ _ _ _ _ 
		ce -- at __ _ e -- _ _ _ _ _ _ is, lú -- ce -- at 
		e -- _ _ _ _ _ _ _ _ _ _ _ is.
	}
}

tenorB = \new Voice {
	\relative c {
		\clef "treble_8"
		f2. g4 a2 bes g c1 f,2 a2. g4 f2 d g1 f
		c2 c'1 a2 c1 a g a2 f g1 r2 f2 ~ f4
		g4 a2 g1 f g r2 d' d4 a c d a1 r
		r2 r4 a a e f2 g2. g4 f1 r2 d2. e4 f2. g4 a bes c2 bes
		a d c4 bes a g f1 g f f f g a2 d, g e f1 g g2 c, f\breve \fermata	}
	\addlyrics {
		Do -- _ _ _ na e -- is Dó -- _ _ _ _ mi -- 
		ne, do -- na e -- is __ _ Dó -- mi -- ne, Dó -- 
		_ _ mi -- ne: __ _ et lux per -- pé -- tu -- a,
		et lux per -- pé -- _ tu -- a lú -- _ _ _ _ _ _ _ 
		ce -- at e -- _ _ _ _ _ is, __ _ lú -- _ 
		ce -- at e -- _ _ _ _ _ is.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r\breve r1 f2. e4 d2 cis d2. c4 bes2 c f, f'2 ~ f
		e2 f1 c2. bes4 c2 d g, g' f4 e d c bes2 c d2. e4
		f1 c f, c' d r2 r4 d d a c d g,1
		d' a2 d b c f, f g4 a bes! c d2. e4 f2 f c g
		d'1 r2 f2. e4 d c b2 c f,1 bes!2. c4 d e f2 c g
		d'1 c2. bes4 a2 f bes1 c f,\breve \fermata	}
	\addlyrics {
		Do -- _ _ na e -- _ _ _ is Dó -- 
		mi -- ne, do -- na e -- _ is, do -- _ _ _ _ _ _ na __ _ 
		e -- is Dó -- mi -- ne: et lux per -- pé -- tu -- a,
		et lux per -- pé -- _ tu -- a lú -- _ _ _ _ _ _ ce -- at e -- 
		is, lú -- _ _ _ _ ce -- at e -- _ _ _ _ is, lú -- 
		ce -- at __ _ _ _ e -- _ is.
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
%	\midi {	}
}

\score {
	\new Staff <<
		\key f \major
		\new Voice {
			\once \override AmbitusNoteHead #'transparent = ##t
			\relative c' {
				\cadenzaOn
				\override Stem #'transparent = ##t 
				f4 g s g f s g a s a a s a a s a s g a-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Te __ _ de -- _ cet __ _ hym -- nus, De -- us, in Sí -- on;
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c' {
		f1 g a a
		a a \break a a2 a a1 a a g \break \time 6/2 bes a1. 
		g2 \time 4/2 a\longa \showBarLine \bar "||" r\breve \break r1 f g a
		a2 a a a a a a1 a2 a a a
		f g a1 g2 f1 e2 f\breve \fermata \showBarLine \bar "|."
		\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
		\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
		\mark "D.C. al Fine"
	}
	\addlyrics {
		Et ti -- _ _ 
		bi red -- dé -- _ tur vo -- tum in Ie -- _ rú -- 
		sa -- lem. __ Ex -- au -- _
		di o -- ra -- ti -- ó -- nem me -- am, ad __ _ te
		om -- nis ca -- ro vé -- ni -- et.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		a1 bes2 d2. cis8 b cis2 d1
		r1 r2 d, a' c2. bes4 a g f d d'2 c c c1 c2 bes2 ~ bes4
		a4 g2 f f bes bes a d1 cis4 b cis\breve
		f,1 g a a2 a bes bes c d2. a4 d2 cis d1
		cis2 d d, e f e f1
		e2 f c'2. bes4 a2 g c c\breve
	}
	\addlyrics {
		Et ti -- _ _ _ _ bi 
		et ti -- _ _ _ _ _ _ _ bi red -- dé -- tur vo -- 
		_ _ tum in Ie -- rú -- sa -- lem. __ _ _ _
		Ex -- au -- _ di o -- ra -- ti -- ó -- _ _ _ nem me -- 
		_ am, ad te om -- nis ca -- ro vé -- _ _ _ _ ni -- et.
	}
}

alto = \new Voice {
	\relative c' {
		d1 d2. e4
		f2 e f f f f, a1 a r2 a d f e c1
		f2 e g g d2. e4 f2 d1 f2 f e1 ~ e\breve
		d2 f1 e4 d e2 f2. e4 d c bes2 g r d' d d e f
		e a, a f' e d e a,
		r bes c f e c2. bes8 a g2 a\breve \fermata
	}
	\addlyrics {
		Et ti -- _ 
		_ _ bi red -- dé -- tur vo -- tum, et ti -- _ bi red -- 
		dé -- tur vo -- tum in __ _ _ Ie -- rú -- sa -- lem.
		Ex -- au -- _ _ _ _ _ _ _ _ di o -- ra -- ti -- ó -- _ 
		nem me -- am, ad te __ _ om -- nis
		ca -- ro __ _ vé -- _ ni -- _ _ et.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		r\breve
		r1 a d2 f e f f e4 d e2 f1 d2 e e
		f c1 d2 bes1 r2 d bes d1 a2 a1 ~ a\breve
		a1 d cis2 d d d d1 f1. f2 e d
		e1 d2 a2 ~ a a2 a a
		d, g c\breve c1 c\breve \fermata
	}
	\addlyrics {
		Et ti -- _ bi red -- dé -- _ _ _ tur vo -- tum in 
		Ie -- rú -- sa -- lem, in Ie -- rú -- sa -- lem.
		Ex -- au -- di o -- ra -- ti -- ó -- _ nem me -- _ 
		_ am, ad te om -- nis
		ca -- ro vé -- ni -- et.
	}
}

tenorB = \new Voice {
	\relative c {
		\clef "treble_8"
		d1 g2 bes
		a a f d d a'2. g4 f e f g a bes c2 d a a1 a2
		a f g4 a bes c d1 r2 d,1 g2 f d e1 ~ e\breve
		r1 d a' f2 a g bes a a f d a'\breve r2 d cis d1 cis2
		d bes a f g a4 f g2. g4 f\breve \fermata
	}
	\addlyrics {
		Et ti -- _ 
		bi red -- dé -- _ tur vo -- _ _ _ _ _ _ _ _ _ tum in Ie -- 
		rú -- sa -- lem, __ _ _ _ _ in Ie -- rú -- sa -- lem.
		Ex -- au -- di o -- ra -- ti -- ó -- nem me -- _ am, 
		ad te om -- nis
		ca -- _ ro __ _ vé -- _ _ _ ni -- et.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r\breve
		a1 d2 f2. e4 d2 cis d d c!4 bes a2 d d1 a
		f c'2 g2 ~ g4 a4 bes c d1 g, d' a ~ a\breve
		d1 bes a2 d d d g, g' f4 e d c d1 a\breve 
		d1 a a2 a bes g f1 c'2 f, c'2. c4 f,\breve \fermata
	}
	\addlyrics {
		Et ti -- _ _ _ bi red -- dé -- _ _ _ tur vo -- tum 
		in Ie -- rú -- _ _ _ _ sa -- _ lem.
		Ex -- au -- di o -- ra -- ti -- ó -- nem me -- _ _ _ _ am, 
		ad te om -- nis ca -- _ ro vé -- _ _ ni -- et.
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
%	\midi {	}
}
