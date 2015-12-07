% CPDL #36844
% Copyright ©2015 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "12"
\pointAndClickOff

#(set-global-staff-size 16.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	bottom-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 10) (stretchability . 100) )
	ragged-bottom = ##f	
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Missa Pro Defunctis"
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
		\vspace #2
	}
	tagline = ##f
}

\markup { \vspace #4 }

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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 5) (stretchability . 100))
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
	\time 4/2
	\tempo 2 = 44
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

globalF = {
	\global
	\key f \major
}

globalAs = {
	\global
	\key as \major
}

globalC = {
	\global
	\key es \major
}


showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }


% INTROITUS

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key f \major
		\new Voice {
			\relative c' {
				\cadenzaOn
				\override Stem #'transparent = ##t 
				f4 f g s f s f s f g a s a g f g s g-- f-- \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Re -- _ _ qui -- em æ -- _ _ tér -- _ _ _ nam _
		}
	>>
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
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
		bes1 a2 f f1 r \noPageBreak R\breve r1 r2 c'2. 
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
			\new Staff << \globalF \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalF \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalF \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalF \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalF \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalF \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
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
		\set Staff.instrumentName = #"S"
		\key f \major
		\new Voice {
			\relative c' {
				\cadenzaOn
				\override Stem #'transparent = ##t 
				f4 g s g f s g a s a a s a a s a s g g-- a-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Te __ _ dé -- _ cet __ _ hým -- nus, Dé -- us, in Sí -- on __ _
		}
	>>
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}

sopranoA = \new Voice {
	\relative c' {
		\set Score.currentBarNumber = #25
		f1 g a a
		a a \break a a2 a a1 a a g \break \time 6/2 bes a1. 
		g2 \time 4/2 a\longa \showBarLine \bar "||" r\breve \break r1 f g a
		a2 a a a a a a1 a2 a a a
		f g a1 g2 f1 e2 f\breve \fermata \showBarLine \bar "|."
		\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
		\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
		\noPageBreak
	}
	\addlyrics {
		Et tí -- _ _ 
		bi red -- dé -- _ tur vo -- tum in Je -- _ rú -- 
		sa -- lem. __ Ex -- áu -- _
		di o -- ra -- ti -- ó -- nem mé -- am, ad __ _ te
		óm -- nis cá -- ro vé -- ni -- et.
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
		Et tí -- _ _ _ _ bi 
		et tí -- _ _ _ _ _ _ _ bi red -- dé -- tur vo -- 
		_ _ tum in Je -- rú -- sa -- lem. __ _ _ _
		Ex -- áu -- _ di o -- ra -- ti -- ó -- _ _ _ nem mé -- 
		_ am, ad te óm -- nis cá -- ro vé -- _ _ _ _ ni -- et.
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
		Et tí -- _ 
		_ _ bi red -- dé -- tur vo -- tum, et tí -- _ bi red -- 
		dé -- tur vo -- tum in __ _ _ Je -- rú -- sa -- lem.
		Ex -- áu -- _ _ _ _ _ _ _ _ di o -- ra -- ti -- ó -- _ 
		nem mé -- am, ad te __ _ óm -- nis
		cá -- ro __ _ vé -- _ ni -- _ _ et.
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
		Et tí -- _ bi red -- dé -- _ _ _ tur vo -- tum in 
		Je -- rú -- sa -- lem, in Je -- rú -- sa -- lem.
		Ex -- áu -- di o -- ra -- ti -- ó -- _ nem mé -- _ 
		_ am, ad te óm -- nis
		cá -- ro vé -- ni -- et.
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
		Et tí -- _ 
		bi red -- dé -- _ tur vo -- _ _ _ _ _ _ _ _ _ tum in Je -- 
		rú -- sa -- lem, __ _ _ _ _ in Je -- rú -- sa -- lem.
		Ex -- áu -- di o -- ra -- ti -- ó -- nem mé -- _ am, 
		ad te óm -- nis
		cá -- _ ro __ _ vé -- _ _ _ ni -- et.
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
		Et tí -- _ _ _ bi red -- dé -- _ _ _ tur vo -- tum 
		in Je -- rú -- _ _ _ _ sa -- _ lem.
		Ex -- áu -- di o -- ra -- ti -- ó -- nem mé -- _ _ _ _ am, 
		ad te óm -- nis cá -- _ ro vé -- _ _ ni -- et.
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalF \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalF \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalF \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalF \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalF \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalF \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
%	\midi {	}
}


\markup {
	\column {
		\fill-line {
			\line { }
			\line { }
			\line \right-align { Repeat \italic "Requiem æternam dona eis Domine: et lux perpetua luceat eis" }
		}
		\vspace #4
	}
}


% KYRIE 1

kyrieChant = \new Voice {
	\relative c' {
		\cadenzaOn \override Stem #'transparent = ##t \repeat volta 2 {
			f4 g a bes s8 a4 s8 a4-- g-- s a g f e s8 f4 s g s f s f-- \showBarLine \bar "|"
		}
		\cadenzaOff
	}
}
\addlyrics {
	Ký -- _ _ _ ri -- e __ _ e -- _ _ _ _ lé -- i -- son.
}

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key f \major
		\kyrieChant
	>>
	\header {
		piece = "Kyrie 1"
	}
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}

sopranoA = \new Voice {
	\relative c'' {
		R1 R as\breve bes1
		c c bes1 ~ \break bes des1 c
		as g bes as1. g2 as\breve \fermata \showBarLine\bar "||"
	}
	\addlyrics {
		Ký -- _ ri -- e e -- _ _ _ _ _ lé -- i -- son.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		as1 bes c1. d!2 es es2.
		des4 c2. bes4 as1 g2 f des'2. c8 bes as2. bes4 c1 
		d!2 es bes2. c4 des es f2 es1 es2 es\breve \fermata
	}
	\addlyrics {
		Ký -- _ ri -- e e -- lé -- _ _ _ _ i -- son,
		Ký -- ri -- _ _ _ _ _ e e -- _ lé -- _ _ _ i -- son.
	}
}

alto = \new Voice {
	\relative c'' {
		r2 as1 g2 as es f as1 g2
		as2. g8 f es2 f1 bes,2 bes bes'2. as8 g f4 g as1.
		as,2 es'1 f2 des1 c2 bes es c\breve \fermata
	}
	\addlyrics {
			Ký -- ri -- e __ _ e -- lé -- i -- son, __ _ _ _
			Ký -- ri -- e e -- _ _ _ _ lé -- _ _ i -- son,
			e -- lé -- i -- son.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		es1 es2. des4 c bes as1 as2 es'1
		es as2. g4 f2 es des1. des2 as\breve
		r2 es' des f2. des4 es2 es1 es\breve \fermata
	}
	\addlyrics {
		Ký -- ri -- _ _ _ _ e e -- lé -- _ _ _ _ _ i -- son,
		e -- lé -- _ _ _ i -- son.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1 bes2 es2. des4 c bes as2 f bes1
		as as bes2. c4 des es f2 des f1 es4 des
		es2 f bes,1. bes2 f as bes1 as\breve \fermata
	}
	\addlyrics {
		Ký -- ri -- e __ _ _ _ _ e -- lé -- i -- son,
		Ký -- _ _ _ _ ri -- e e -- _ _ _ _ lé -- _ _ i -- son.
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
		as1 es as2. g4 f1 es
		as,2 as'2. g4 f es d!2 es bes bes2. c4 des es f g as2.
		g4 f2 es1 bes2. c4 des2 as es' es as,\breve \fermata
	}
	\addlyrics {
		Ký -- ri -- e __ _ e -- _ _ lé -- _ _ _ _ i -- son,
		Ký -- _ _ _ _ ri -- e __ _ _ e -- lé -- _ _ _ _ i -- son.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalAs \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalAs \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalAs \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalAs \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalAs \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalAs \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}

% CHRISTE 1

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key f \major
		\new Voice {
			\relative c' {
				\cadenzaOn \override Stem #'transparent = ##t
				f4 g a bes s8 a4-- g-- s a g f e s8 f4 s g s f s f-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Chrí -- _ _ _ ste __ _ e -- _ _ _ _ lé -- i -- son.
		}
	>>
	\header {
		piece = "Christe 1"
	}
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #10
		es1 c bes c2 des bes1 c2. c4 bes1
		r r2 es es f d! es2. \ficta des!4 c bes c2 bes1 as g2
		r as a! bes bes a! bes1 r2 c c des bes es es1
		r es c bes2 c des1. c2 bes1 c\breve \fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Chrí -- ste e -- lé -- _ _ _ i -- son,
		Chrí -- ste e -- lé -- _ _ _ _ _ _ i -- son,
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- _ _ lé -- i -- son.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		R\breve R r2 es es f d! es1
		d!2 es c1 bes4 as bes2 bes c1 es c bes 
		c des c2. c4 des2 c4 bes c1 R\breve r2 c
		c des bes c as es'1 es2 f1 es1. es2 es\breve \fermata
	}
	\addlyrics {
		Chrí -- ste e -- lé -- _ i -- son,
		e -- lé -- _ _ i -- son,
		Chrí -- _ ste __ _ _ e -- lé -- _ i -- _ son,
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		r2 es es f d! es as, as'1 g2 as as1 g2
		f bes ~ bes as2 g as1 g2 as1. g4 f g2 f r es
		es f ~ f des2 es f bes, bes'1 as4 g as2 f g1 r2 as
		a! bes g as2. g8 f es4 f g2 as1 bes2. as4 as1 g2 as\breve \fermata
	}
	\addlyrics {
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- _ _ i -- _ son, __ _
		Chrí -- ste e -- lé -- _ i -- son,
		e -- lé -- _ _ i -- son,
		Chrí -- ste e -- lé -- _ _ _ _ _ _ _ _ _ _ i -- son.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		R\breve r2 es es f d! es as, f bes1.
		bes2 c2. des4 es2 des4 c bes2 es, as1 r2 es' es f d! es
		as,1 r r2 f' f ges es f f bes, es4 des c bes as2. g4 
		f2 bes es, as2. bes4 c des es2 as, des1 es1. es2 as,\breve \fermata
	}
	\addlyrics {
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- _ _ _ _ _ i -- son,
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste __ _ _ _ _ _ _ _ e -- lé -- _ _ _ _ _ _ _ i -- son.

	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}

% CHRISTE 2

sopranoA = \new Voice {
	\relative c'' {
		R\breve R es1 c bes c
		des c as bes bes as1. g2 as1 \fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Chrí -- ste __ _ _ _ _ _ _ e -- lé -- i -- son.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		es1 c bes as as2 bes r1 R\breve
		r2 bes c es1 d!2 es1 des1. c2 bes1 c1 \fermata
	}
	\addlyrics {
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- _ _ lé -- _ i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		R\breve R  r2 es f as1 g2 as2. g4
		f2 des es1 r2 f bes,1 des2. es4 f2 f1 es2 c1 \fermata
	}
	\addlyrics {
		Chrí -- ste e -- _ _ _ lé -- i -- son,
		Chrí -- ste e -- _ _ lé -- i -- son.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		es1 f2 as1 g2 f es4 des es1 r2 f1 es2 es as ~
		as g2 as es f as1 g2 f f1 c2 des bes es1 \fermata
	}
	\addlyrics {
		Chrí -- ste e -- lé -- i -- son, __ _ _
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- lé -- i -- son,
		e -- lé -- i -- son.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		R\breve es1 c1. bes2 as1 bes as
		bes as\breve r2 bes1 des2. c8 bes as2 bes1 as1 \fermata
	}
	\addlyrics {
		Chrí -- ste __ _ e -- _ lé -- i -- son,
		e -- lé -- _ _ _ i -- son.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		R\breve r2 es f as1 g2 f2. es4 d!2 es as,1
		r r2 as' f1 es bes2. c4 des es f2 des es as,1 \fermata
	}
	\addlyrics {
		Chrí -- ste e -- _ lé -- _ _ i -- son,
		Chrí -- ste e -- lé -- _ _ _ _ _ i -- son.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = "Christe 2"
	}
	\layout { }
%	\midi {	}
}


% KYRIE 2

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key f \major
		\kyrieChant
	>>
	\header {
		piece = "Kyrie 2"
	}
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}

sopranoA = \new Voice {
	\relative c'' {
		es1. as,2 as1 es' ~ es\breve
		f\breve es1 des c bes\breve
		as1 bes c bes2 as1 g2 as\breve \fermata \showBarLine \bar "|."
	}
	\addlyrics {
		Ký -- ri -- e e -- _ _ _ _ _ _ _ _ _ lé -- i -- son.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		r\breve r r 
		as2. bes4 c2 des1 c2. bes4 bes2 ~ \break bes as1 g2
		f f'1 f2 des1 es2 c des1 bes c\breve \fermata
	}
	\addlyrics {
		Ký -- _ _ ri -- e __ _ e -- lé -- i -- son,
		Ký -- ri -- e e -- _ lé -- i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		r\breve r1 r2 es2. des4 c bes c des es2
		es des c as'2. g8 f es2 f1 r2 f1 es2
		des bes c f bes, bes'1 as2. g4 f2 es1 c\breve \fermata
	}
	\addlyrics {
		Ký -- _ _ _ _ _ _ ri -- e e -- lé -- _ _ i -- son,
		Ký -- ri -- e e -- lé -- i -- son,
		e -- lé -- _ _ i -- son.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		r2 as2. g4 f es f g as1 g4 f es1 as,2 bes 
		c as'1 f2 as1 r2 f2 ~ f4 g4 as2 f bes1
		f2 f1 r2 des ges! f f1 bes,2 es es\breve \fermata
	}
	\addlyrics {
		Ký -- _ _ _ _ _ _ _ _ _ ri -- e e -- lé -- i -- son,
		Ký -- ri -- e e -- lé -- i -- son,
		Ký -- ri -- e e -- lé -- i -- son.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		as2. bes4 c2 des1 c2 bes1 bes2 as es'2. es4
		as,\breve r2 as1 bes2 c as bes bes2. 
		c4 des2 c des2. c4 bes as ges2 as bes1. bes2 as\breve \fermata
	}
	\addlyrics {
		Ký -- _ _ ri -- e e -- lé -- _ _ i -- son,
		Ký -- ri -- e __ _ e -- lé -- _ _ _ _ _ _ i -- son,
		e -- lé -- i -- son.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		R\breve r1 es2. f4 g2 as1 g2
		f1. des2 as1 des2 bes f'2. es4 d2 es
		bes1 f' ges2. f4 es2 f des1 es2. es4 as,\breve \fermata
	}
	\addlyrics {
		Ký -- _ _ ri -- e e -- lé -- i -- son,
		Ký -- _ ri -- e e -- lé -- _ _ _ _ _ _ _ i -- son.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}


% GRADUALE

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn
				\override Stem #'transparent = ##t 
				g4 b a a s a s8 a4 c a g s8 b4 g s8 a4 b s8 a4-- s8 a4-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Re -- _ qui -- em æ -- tér -- _ _ _ _ _ _ _ _ nam
		}
	>>
	\header {
		piece = "Graduale"
	}
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}

sopranoA = \new Voice {
	\relative c'' {
		R\breve r1 as bes2 c1 
		a2 bes bes c1 \break r2 g a bes1 a2
		
		bes bes c1 r r2 c1 bes2 ~ \break bes as2
		g es'1 es2 es1 f1. es4 d c d es2
		c d \break b c1 b2 c1 r2 c d d
		
		es2. d4 c d es c d es f2 ~ \break f4 es4 es1 d2 | es1
		r2 as, bes bes c bes bes as1 as2 \break g as1 
		g2 as\breve | r2 es'2. d4 c2 bes bes
		
		as4 f c'2 ~ \break \pageBreak c4 bes4 bes1 a2 | bes\breve r1
		r2 es2. d4 c2. bes4 as2 \break g g as2. bes4 | c1
		c r2 d es c b c1 b2 c\breve \fermata \showBarLine \bar "|."
	}
	\addlyrics {
		Dó -- na é -- is Dó -- mi -- ne,
		dó -- na é -- is Dó -- mi -- ne,
		dó -- na é -- is Dó -- mi -- ne,
		dó -- _ _ _ _ _ na é -- is Dó -- mi -- ne:
		et lux per -- pé -- _ _ _ _ _ _ _ _ _ _ tu -- a,
		et lux per -- pé -- tu -- a
		lú -- ce -- at é -- _ is,
		lú -- _ _ ce -- at é -- _ _ _ _ _ is,
		lú -- _ _ _ _ ce -- at é -- _ _ is,
		lú -- ce -- at é -- _ _ is.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		R\breve r2 es c d es1.
		c2 d4 es f2. es8 d es2 ~ es bes f'\breve

		r1 r2 c1 bes2 as4 f f'2. es4 d2 c1
		bes2 as c1 r r2 c2. bes8 as g2 as bes
		r1 r r2 d e! \ficta e f1. bes,2
		
		bes es2. d4 c2 bes bes as g r1 bes1
		c2 c d4 es f1 d2 es4 d c bes c1 r
		r2 es2. d4 c bes c2 d es1 r2 es1 d2
		
		c2. d4 es2 bes es1 r2 f2. es4 d2 c c
		c1 c r r2 c2. bes4 as2 g es 
		as4 bes c2. b8 \ficta a \ficta b2 c c d es d1 e\breve \fermata
	}
	\addlyrics {
		Dó -- na __ _ é -- is Dó -- _ _ _ _ _ mi -- ne,
		dó -- na é -- _ _ _ _ is Dó -- mi -- ne,
		Dó -- _ _ _ mi -- ne:
		et lux per -- pé -- tu -- a
		lú -- _ _ ce -- at é -- is,
		et lux per -- pé -- _ _ tu -- a __ _ _ _ _
		lú -- _ _ _ _ ce -- at,
		lú -- ce -- at __ _ _ é -- is,
		lú -- _ _ ce -- at é -- is,
		lú -- _ _ ce -- at é -- _ _ _ _ _ is,
		lú -- ce -- at é -- is.
	}
}

alto = \new Voice {
	\relative c' {
		es1 c es f g
		es d c bes des c
		
		bes as c c as2 bes c1
		es c bes c\breve es1
		f2. es4 d2 c d2. d4 c\breve r1
		
		es es d es f g
		es d f es c es
		bes as\breve R r1

		as bes c2 es1 d4 c d2 bes c\breve
		es1 c es f es
		f g es d2 c d1 c\breve \fermata
	}
	\addlyrics {
		Dó -- _ _ _ _ _ _ _ _ _ _ _ _ _ na é -- _ is Dó -- mi -- ne, __ _
		Dó -- _ _ _ _ _ mi -- ne:
		et lux per -- pé -- _ _ _ _ _ _ _ _ tu -- a
		lú -- ce -- at é -- _ _ _ _ is,
		lú -- ce -- at é -- _ _ _ _ _ _ _ is.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		R\breve R es1
		c2 es f2. g4 as2 g g g f1 r2 f1
		
		g2 as es es1 | f f r
		r2 c2. d4 es f g as bes1 as2 g es2. f4 g es
		as2 as | g\breve g1 a2 \ficta a bes2. \ficta as!4
		
		g as bes g as2 as f1 r2 es bes'1. g2
		as es f1 r2 f g es es f | g es2.
		d8 c bes2 c2. d4 es2 f | g\breve r1
		
		r2 as g f es c f1 r2 bes1 as2
		g2. f4 | g2 as es f g4 f es d c1 c\breve
		r2 g'2. f4 es2 g g g1 g\breve \fermata
	}
	\addlyrics {
		Dó -- na __ _ é -- _ _ is Dó -- mi -- ne,
		dó -- na é -- is Dó -- mi -- ne,
		é -- _ _ _ _ _ _ is Dó -- _ _ _ _ _ mi -- ne:
		et lux per -- pé -- _ _ _ _ _ _ tu -- a,
		et lux per -- pé -- tu -- a,
		et lux per -- pé -- tu -- a
		lú -- _ _ _ ce -- at é -- _ is,
		lú -- ce -- at é -- _ is,
		lú -- _ _ ce -- at __ _ é -- _ _ _ _ _ _ is,
		lú -- _ _ ce -- at é -- is.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 as | bes2 c2. bes4 as2 | g1.
		c2 f,1. g2 | g1 r r2 c
		
		d es2. \ficta des4 c bes as2 bes c f, c' d e f
		bes, c as4 bes c d es2 bes | f' f, c'2. bes4 as2 g
		f f' ~ f es2 d g, | c1. f,1 bes1
		
		es,2 as1 r r r2 bes es1. 
		c2 f d c d bes c1 as2 bes c4 d
		es1 es r2 as, | bes bes c4 d es f g2 f
		
		f1 R\breve R r2 f1
		es4 d c2. bes4 as bes c as bes2 c1 f,2 g a
		f f' es d c g'2. f4 es d8 c g'2 g, g\breve \fermata
	}
	\addlyrics {
		Dó -- na __ _ _ _ é -- is Dó -- mi -- ne,
		dó -- _ _ _ _ na é -- is Dó -- mi -- ne,
		dó -- na __ _ é -- is Dó -- _ _ _ _ mi -- ne,
		dó -- na __ _ _ é -- is Dó -- mi -- ne:
		et lux per -- pé -- tu -- a,
		et lux per -- pé -- tu -- a __ _
		lú -- ce -- at é -- _ _ _ is,
		et lux per -- pé -- _ _ _ _ tu -- a
		lú -- _ _ _ _ _ _ _ _ _ ce -- at é -- _ is,
		lú -- ce -- at é -- _ _ _ _ _ _ _ is.
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
		r2 as1 f2 g as2. g4 f2 | es c1
		c2 bes1 f'2 c es1 f | f
		
		bes,2 es as, as'1 g2 | f1 r r2 f
		g as1 as2 es g | f1 r2 c'1 bes2
		as f | g c, g'1 r2 c, f1 bes,
		
		es2 es as, as' bes bes c2. c4 bes1 r2 es,
		as c bes2. bes4 a2 bes g as2. g4 f2 | es\breve
		as,2 as'2. g4 f2 | es1 c2. d4 es2 bes
		
		f' f es d c1 | bes\breve f'1
		r2 c'2. bes4 as2. g4 f2 es c f1 c2 c'2.
		bes4 as2 | g1 c, g'\breve c,\breve \fermata
	}
	\addlyrics {
		Dó -- na é -- _ _ _ is Dó -- mi -- ne,
		dó -- _ na é -- is Dó -- mi -- ne,
		Dó -- mi -- ne,
		dó -- na é -- is Dó -- mi -- ne,
		dó -- na é -- is Dó -- mi -- ne:
		et lux per -- pé -- tu -- a,
		et lux per -- pé -- tu -- a,
		et lux per -- pé -- tu -- a
		lú -- ce -- at __ _ _ é -- is,
		et __ _ _ lux per -- _ pé -- tu -- a
		lú -- ce -- at é -- _ is,
		lú -- _ _ _ _ ce -- at é -- is,
		lú -- _ _ ce -- at é -- is.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalC \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalC \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = ##f
	}
	\layout { }
%	\midi {	}
}

% GRADUALE 2

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #34
		R\breve g2. g4 b2 c2.
		c4 c es2 d8 c d4 bes4 ~ | \break bes as8 g as2. g4 f f'2 es4 d4. d8
		c2. bes4. a16 g a4 bes4. \ficta as!8 g f g4 f f'4 ~ | f \break es8 d c2 bes r c a4 b2
		c4. f,8 c'2 b4 c1 r4 f \break d2 e f4. \ficta es!8 d c d4 c es2 d8 c
		
		d2 c b4 c4. b16 \ficta a \ficta b4 c2 es2 ~ | es4 \break d4 c bes as g c bes
		bes2 as4 des c2 r4 f4. es8 d4 c1 f,4. g8 | \break as bes c2 \ficta b4 c es4. d8 c4
		bes1 r4 c2 bes4 a bes2 a4 bes f'4. es8 d4 | \break \time 3/2 c d4. c8 c2 b4 \time 4/2 c\breve \fermata \showBarLine \bar "|."
	}
	\addlyrics {
		In me -- mó -- _ ri -- a æ -- _ _ _ tér -- _ _ _ _ na,
		in me -- mó -- ri -- a æ -- _ _ _ tér -- _ _ _ _ na,
		æ -- tér -- _ _ na
		é -- rit jú -- _ _ _ _ stus,
		é -- rit jú -- _ _ _ _ _ stus
		é -- _ _ _ _ rit jú -- _ _ _ stus:
		ab au -- di -- ti -- ó -- ne má -- la 
		non ti -- mé -- bit,
		non __ _ _ ti -- mé -- _ _ _ _ _ bit,
		má -- _ _ la,
		má -- la non ti -- mé -- bit,
		non __ _ _ ti -- mé -- _ _ _ bit.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		R\breve R |
		r2 g2. g4 bes2 | c2. c4 c c b2 | c4 g bes4. as8
		g f g4 f f'2 es4 d4. d8 c2 b | c4. d8 e4 f2 e8 d \ficta e2 | f r1
		r4 f2 d4 e2 f4. \ficta es!8 d c c4 ~ | c b4 r c a c2 b4 | c2 c
		
		bes4. as8 g f g2 g4 g1 g2 ~ g r1 r4 es'2
		d4 c bes as g c bes | bes2 as4 g8 f g4 a bes f'4 ~ | f es4 d2 c4 c4. bes8 as2
		g4 f g as2. g4 | f2 r4 f'4. es8 d4 c bes ~ bes as4 g1 ~ g\breve \fermata
	}
	\addlyrics {
		In me -- mó -- _ ri -- a æ -- tér -- na, æ -- tér -- _ _ _ _ na,
		in me -- mó -- ri -- a æ -- _ _ _ tér -- _ _ _ na
		é -- rit jú -- _ _ _ _ _ stus,
		é -- rit jú -- _ stus
		é -- _ _ _ _ _ rit jú -- stus:
		ab au -- di -- ti -- ó -- ne má -- la non ti -- _ _ _ mé -- bit,
		non ti -- mé -- bit,
		má -- _ _ la non ti -- mé -- _ bit,
		non __ _ _ ti -- mé -- _ bit.
	}
}

alto = \new Voice {
	\relative c' {
		R\breve R |
		c2. c4 es2 f2 ~ | f4 f4 f1 f2 | g2. f2
		es4. d8 d c16 bes | c2 bes c f | g2. as4 g1 | f2 r1
		as2 | f g as1 | g f2 g | es4 g f1
		
		es2. d8 c d2 c r | es2. es4 es es es2 |
		f2. f4 es2. d8 c | bes2 c4. d8 es2 d | f g es c4. d8 |
		es2 bes as4 as8 bes c d es2 d4 c2 d f2 ~ | f4 f4 es2 d c\breve \fermata
	}
	\addlyrics {
		In me -- mó -- _ ri -- a æ -- _ tér -- _ _ _ _ _ _ _ na,
		æ -- _ tér -- _ na
		é -- rit __ _ jú -- _ stus, __ _
		é -- rit jú -- _ _ _ _ stus:
		ab au -- di -- ti -- ó -- _ ne má -- _ _ _ _ _ _ _ la, __ _
		má -- _ _ _ _ la non __ _ _ _ _ ti -- mé -- bit,
		non ti -- mé -- _ bit.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		g2. g4 b2 c2. c4 c2 d4 es4. c8 f2 
		es8 d es4. d8 c bes c4 bes2 | f r4 f'2 es4 d4. d8 | c2 bes
		c4. bes8 a4 bes | f2 r4 f'2 es4 d4. d8 | c2. as4 bes2 c | f,4 f'2 d4
		e2 f4. \ficta es8 | d c d4 c2 f,2. f4 | g2 c r1 | c2 a 
		
		bes c | g1 r4 es'2 d4 | c bes as g c4. bes8 as4 es |
		bes'2 r4 bes c4. bes8 a4 bes8 c | d es f2 es8 d c bes c4 bes2 | r1 c4. bes8 as2 |
		es4 es'2 d4 c4. bes8 as4 es f1 bes2 f f g1 c\breve \fermata
	}
	\addlyrics {
		In me -- mó -- _ ri -- a æ -- tér -- _ _ _ _ _ _ _ _ _ na, __ _
		in me -- mó -- ri -- a æ -- _ _ _ tér -- na,
		in me -- mó -- ri -- a æ -- tér -- _ na
		é -- rit jú -- _ _ _ _ _ stus,
		é -- rit jú -- stus,
		é -- rit jú -- _ stus:
		ab au -- di -- ti -- ó -- ne má -- _ _ _ la 
		non ti -- _ _ mé -- _ _ _ _ _ _ _ _ _ bit,
		má -- _ _ la, má -- la non __ _ _ ti -- mé -- bit,
		non ti -- mé -- bit.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
		>> 
	}
	\header {
		piece = ##f
	}
	\layout {
	  	ragged-last = ##t
	}
%	\midi {	}
}