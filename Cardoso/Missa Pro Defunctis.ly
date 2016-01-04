% CPDL #36844
% Copyright ©2015 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "19"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	bottom-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 6) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 5) (stretchability . 50))
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
		\noPageBreak
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
		piece = "Kyrie"
	}
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		r1 r as\breve bes1
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
		piece = " "
	}
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #10
		es1 c bes c2 des bes1 c2. c4 bes1
		r \pageBreak r2 es es f d! es2. \ficta des!4 c bes c2 bes1 as g2
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
		r\breve r r2 es es f d! es1
		d!2 es c1 bes4 as bes2 bes c1 es c bes 
		c des c2. c4 des2 c4 bes c1 r\breve r2 c
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
		r\breve r2 es es f d! es as, f bes1.
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
		\set Score.currentBarNumber = #26
		r\breve r es1 c bes c
		des c as bes bes as1. g2 as1 \fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Chrí -- ste __ _ _ _ _ _ _ e -- lé -- i -- son.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		es1 c bes as as2 bes r1 r\breve
		r2 bes c es1 d!2 es1 des1. c2 bes1 c1 \fermata
	}
	\addlyrics {
		Chrí -- ste e -- lé -- i -- son,
		Chrí -- ste e -- _ _ lé -- _ i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		r\breve r r2 es f as1 g2 as2. g4
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
		r\breve es1 c1. bes2 as1 bes as
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
		r\breve r2 es f as1 g2 f2. es4 d!2 es as,1
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
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #34
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
		r\breve r1 es2. f4 g2 as1 g2
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
	}
}

sopranoA = \new Voice {
	\relative c'' {
		r\breve r1 as bes2 c1 
		a2 bes bes c1 \break r2 g a bes1 a2
		
		bes bes c1 r r2 c1 bes2 ~ \break bes as2
		g es'1 es2 es1 f1. es4 d c d es2
		c d \break b c1 b2 c1 r2 c d d
		
		es2. d4 c d es c d es f2 ~ \break f4 es4 es1 d2 | es1
		r2 as, bes bes c bes bes as1 as2 \break g as1 
		g2 as\breve | r2 es'2. d4 c2 bes bes
		
		as4 f c'2 ~ \break c4 bes4 bes1 a2 | bes\breve r1
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
		r\breve r2 es c d es1.
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
		bes as\breve r r1

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
		r\breve r es1
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
		
		f1 r\breve r r2 f1
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
	\layout { }
%	\midi {	}
}

% GRADUALE 2

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #34
		r\breve g2. g4 b2 c2.
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
		r\breve r |
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
		r\breve r |
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
		e2 f4. \ficta es!8 | d c d4 c2 f,2. f4 | g2 c r1 | c2 a 
		
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
	\layout {
	  	ragged-last = ##t
	}
%	\midi {	}
}


% OFFERTORIUM

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key f \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				g4 s8 f4 g s8 g4 s  g s8 g4 f s g s8 g4 bes g s8 g4-- s8 f4-- s \breathe
				bes-- s8 a4 bes c s  a g bes-- s8 a4 bes s8 g4 s8 a4 g s8 f4 g s8 g4 bes g s8 g4-- s8 f4-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Dó -- mi -- _ ne Jé -- su __ _ Chrí -- ste __ _ _ _ _ Rex __ _ _ _ gló -- _ _ _ _ _ _ _ ri -- _ æ. __ _ _ _ _
		}
	>>
	\header {
		piece = "Offertorium"
	}
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		c1 a2 bes bes1 bes |
		c2. c4 bes1 bes2 c2. bes4 bes bes c2 bes bes bes |
		
		des c des bes \break c bes bes as bes bes bes c |
		des2. c8 bes as bes c4. bes8 bes4 ~ \break bes a8 g \ficta as2 r1 r\breve |
		bes2 as bes des ~ \break des c1 bes2 as c as bes |
		
		des2. c2 bes a4 \break bes2 es es4. des8 c4 bes8 as bes4 c des2 c r as bes2.
		des2 c4 ~ \break c8 bes8 bes2 a4 bes2 c4 des2 c4. bes8 bes2 a8 g \ficta a4 \ficta a bes1. r4 bes | \break
		bes2 as f as bes c c bes des1 c | \break

		bes2 bes c d es2. \ficta des!4 c bes a2 bes des c bes | \break
		bes c des es es4. des8 c4 bes8 as bes4. c8 des1 c4 as2 c c4 | \break
		bes4. as8 bes c des4. c8 bes2 a8 g \time 3/2 a2 bes r | \showBarLine \bar "|"
		\time 5/2 bes1 bes2 as f \break \time 4/2
		
		as2 bes c2. c4 bes2. des2 des4 c2 bes c1 bes2 | as des
		es c \break bes2. bes4 as2 f as4. bes8 c4 des c2 bes\breve \fermata \showBarLine \bar "|."
	}
	\addlyrics {
		Lí -- be -- _ ra á -- _ ni -- mas óm -- _ ni -- um fi -- dé -- _ li -- um
		de -- fun -- _ ctó -- _ rum de poé -- _ nis in -- fér -- _ _ _ _ _ _ _ _ _ _ ni
		et de pro -- fún -- do lá -- cu:
		lí -- be -- ra é -- as de ó -- re le -- ó -- _ _ _ _ _ _ nis, __ _
		ne ab -- sór -- _ _ _ be -- at é -- as tár -- _ _ _ _ _ ta -- rus,
		ne cá -- _ dant in ob -- _ scú -- _ _ _ rum:
		sed __ _ sí -- _ gni -- fer sán -- ctus Mí -- cha -- el
		re -- præ -- sén -- _ tet é -- _ _ _ _ _ _ _ as in lú -- cem sán -- _ _ _ _ _ _ _ _ _ ctam.
		Quam o -- _ lim Á -- _ _ bra -- hæ pro -- mi -- sí -- _ _ sti __ _
		et __ _ sé -- _ mi -- ni é -- _ _ _ _ _ ius.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		r2 c2. c4 des f2 es d8 c d2 es4. es8 |
		f1 r2 r4 es ~ \break es des4 c f es2 f2. f4 d es2 d4 es bes2
		
		as4. bes8 c4 as des4. c8 bes4 ~ bes a4 bes2 r r4 f' d es2 \ficta d4 es2. as,4 |
		bes2 r r1 r4 c c d es2. c4 des2 c r4 bes bes c |
		des2 c4 f des es f2 r4 f es c es as,2 \ficta ges4 f2 r r1 |
		
		r2 f' c4 es des c des8 c bes as bes4 c c4. bes8 as2 g4 as bes2. as8 g as2 | r\breve
		r4 bes c es2 d4 es f2 es4 \ficta des ges f1 r4 f f2 des bes4 es |
		es2 c as4 as4. as8 des4. c8 bes4 as2 r r4 bes2 f as4. bes8 c des es2 ~
		
		es4 d4 es1 r2 r4 bes es2. \ficta des4 c f4. es8 des c bes2 as4 f f es |
		r f g as2 bes4 c2 bes as4 es'2 es4 as, as bes2 as4 c f2 es2 ~
		es4 bes4 des8 c bes as bes c des4 c f4. es16 des c4 d2 r d es \ficta des! c4 f4. es8 des4 |
		
		c4 es es1 r4 f2 es4 des8 c bes as bes2 r1 r4 f'2 es4 es4. des8 | c4 des bes2
		r4 es2 f4 ~ f8 es8 des c bes4 g c2. bes4 \time 5/2 c2 r4 f4. es16 \ficta d c4 d2 es \time 2/2 d1\fermata |
	}
	\addlyrics {
		Lí -- be -- ra á -- _ _ _ _ _ ni -- mas óm -- ni -- um fi -- dé -- _ li -- um
		de -- fun -- ctó -- rum, de -- _ _ fun -- ctó -- _ _ _ rum de poé -- nis in -- fér -- _ ni
		et de pro -- fún -- do lá -- cu, et de pro -- fún -- do lá -- _ _ cu, et de pro -- fún -- do lá -- cu:
		lí -- be -- ra é -- as de __ _ _ _ _ ó -- re __ _ _ le -- ó -- _ _ _ nis,
		ne ab -- sór -- be -- at é -- as tár -- ta -- rus,
		ne cá -- _ dant, ne cá -- _ dant in ob -- scú -- _ _ rum, in ob -- scú -- _ _ _ _ _ rum:
		sed sí -- gni -- fer sán -- _ _ _ _ ctus Mí -- cha -- el
		re -- præ -- sén -- tet é -- _ as, re -- præ -- sén -- tet é -- as 
		in lú -- cem, in lú -- _ _ _ _ _ _ cem sán -- _ _ _ ctam.
		Quam o -- _ lim Á -- _ _ _ bra -- hæ pro -- mi -- sí -- _ _ _ sti, pro -- mi -- sí -- _ _ _ sti
		et sé -- _ _ _ _ mi -- ni é -- ius, é -- _ _ _ _ _ ius.
	}
}

alto = \new Voice {
	\relative c' {
		r\breve r2 r4 f2 f4 g bes2
		a8 g \ficta a4 a bes2 r r4 bes2 \ficta as! g4 f f as4. g8 f4 es f bes4. as8 g4 |
		
		f4. g8 as2. f4 des ges \ficta ges f2 es8 des es2 f | r r4 f ges es r f2
		des4 es es f1 f r4 g g as bes bes, f'2 f r |
		r r4 f f g as des,8 es f g as2 es f4 r2 r4 as2 g4 f es f g |
		
		as4 bes f as4. g8 es4 f2 des4 es es1 r2 r1 r2 r4 f | es as2 g4
		f bes2 as4 f g es2 r\breve r4 f f2 des bes4 f' f2 ges2 ~ 
		ges4 es4. des8 c4. bes8 as' g f4 f2 f4 f2 c4 es2 bes des4. des8 f4 es1 |
		
		r4 f g2 as2. as,4 | es' es2 bes4 f'4. f8 f2 | r4 f2 g4 as2. g8 f |
		g as bes2 as8 g f2 es r4 es2 es4 es2 f f4 bes, c2 r4 as' as2 |
		ges4 es f8 es des c bes2 c1 bes2 r f' es4 bes bes4. bes8 c4 as'4. g8 f4 |
		
		es4 as2 g4 as2 as4. g8 f4 bes, des4. es8 f2 es r4 bes'2 as4 g as2 g4 | as2 r4 bes
		g as as4. g8 f4 bes, bes2 r4 as'2 bes4 as f f1 f2 r4 bes, bes1\fermata |
	}
	\addlyrics {
		Lí -- be -- ra á -- _ _ _ ni -- mas óm -- _ ni -- um fi -- dé -- _ _ li -- um
		de -- _ _ fun -- _ _ ctó -- rum, de -- fun -- ctó -- _ _ _ rum de poé -- nis,
		de poé -- nis in -- fér -- ni et de pro -- fún -- do lá -- cu,
		et de pro -- fún -- do __ _ _ _ _ lá -- cu:
		lí -- be -- ra é -- as de ó -- re le -- ó -- _ _ nis, le -- ó -- nis,
		ne ab -- sór -- be -- at é -- as tár -- ta -- rus,
		ne cá -- _ dant, ne cá -- _ dant __ _ _ _ _ _ _ in ob -- scú -- rum, in ob -- scú -- _ _ rum:
		sed sí -- _ gni -- fer sán -- ctus Mí -- cha -- el
		re -- præ -- sén -- _ _ _ _ _ _ _ _ tet, 
		re -- præ -- sén -- _ tet é -- as in lú -- cem sán -- ctam, __ _ _ _ _ sán -- ctam.
		Quam o -- lim Á -- bra -- hæ pro -- _ _ mi -- sí -- _ sti,
		pro -- _ _ mi -- sí -- _ _ sti, pro -- mi -- sí -- _ _ sti,
		et sé -- mi -- ni __ _ _ é -- ius, et sé -- mi -- ni é -- ius, é -- ius.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 f2 f4 des f ges f2 r1 |
		r4 c2 c4 des f2 bes,4 bes2 r r1 r4 as'2 g4 f f g4. as8 |
		
		bes4 f2 es4 f2 r r1 r2 r4 f2 ges4 f bes, es4. des8 c2 |
		bes bes des4 c des2 c f, c' r4 f f g as2. f4 ges2 |
		f1 r2 r4 bes as f as as as4. \ficta ges8 f4 es8 des c4 as r2 r4 as'2 g4 |
		
		f4 des4. es8 f4 es2 r4 f ~ f g2 as g8 f es2 es f f f | r\breve |
		r2 r4 es f2 as | as4 as f es des c8 bes c4 c | bes1 r4 bes' bes2
		ges4. f8 es4 f r f f2 des c4 as'2 es4 g4. as8 bes4. as16 g f4. g8 as1 |
		
		f2 r r4 es as2. g8 f g4 g as f2 c4 des4. es8 f4 bes, c2 r |
		r1 r4 f g as2 g4 as2 g f r4 f f2 as2. es4 ~
		es4 ges4 f f des f f1 f2 r f ges f f2. as4 ~ |
		
		as es4 es es4. des8 c bes as4 as'2 g4 f2. bes2 as4 g f f2 r r4 es2 f4. es8 des4
		c as r as' | bes4. as8 g4 g f2 r4 f | f4. g8 a4 bes2 a4 bes4. \ficta as!8 ges4 es f1\fermata |
	}
	\addlyrics {
		Lí -- be -- ra á -- ni -- mas, lí -- be -- ra á -- ni -- mas óm -- ni -- um fi -- dé -- _ _ _ li -- um
		de poé -- nis in -- fér -- _ _ ni, de poé -- nis in -- fér -- _ ni
		et de pro -- fún -- do lá -- cu, et de pro -- fún -- do lá -- _ _ _ _ _ cu:
		lí -- be -- ra é -- _ _ as de ó -- _ _ _ _ re le -- ó -- nis,
		ne ab -- sór -- be -- at é -- as tár -- _ _ _ ta -- rus,
		ne cá -- _ _ _ dant, ne cá -- _ dant in ob -- scú -- _ _ _ _ _ _ _ rum:
		sed sí -- _ _ _ gni -- fer sán -- ctus Mí -- _ _ cha -- el
		re -- præ -- sén -- tet é -- _ as in lú -- _ cem sán -- ctam, in lú -- cem sán -- ctam.
		Quam o -- _ lim Á -- bra -- hæ pro -- _ _ _ _ mi -- sí -- sti, pro -- mi -- sí -- _ sti
		et sé -- mi -- ni é -- ius, et sé -- mi -- ni é -- ius, et sé -- _ _ mi -- ni é -- _ _ _ ius.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		r2 f f4 f bes,4. c8 d4 es bes1 es,4 ges |
		f2 r4 f' f des f ges f1 r4 es2 des4 c as bes4. bes8 bes4 bes2 es4 |
		
		des2 as des2. des4 c f, bes2 r4 bes des c bes es, bes'2 es, as |
		r\breve r2 r4 f' es c es f bes,2 f4 c' c d es2 |
		des4 bes c2 bes r2 r\breve r4 f'2 c4 des c bes es |
		
		des4. c8 bes4 as2 bes4 r f bes2 g4 es as4. bes8 c des es2 as,4 des2 r4 c as des2 c4 bes es2
		des8 c bes4 c | des es c2 bes r r1 r2 r4 f'4 f2 des bes es, |
		bes'4 es, as2 r1 r4 bes4 f2 as g f1 r |
		
		r4 bes es2. c4 as2 bes bes as4 bes c2 bes r r4 c d es ~ |
		es d es f4. es8 \ficta des!4 c as es'2 as, es4 es' des4. c8 bes as bes4 f2 r4 c' c2 |
		es des f2. c2 f,4 f2 r bes bes4. c8 des es f4. es16 des c4 des as ~ | 
		
		as8 bes c4 bes2 as4 as2 as4 bes1 bes2 r4 es2 des4 c f, c'4. des8 es2 | as,4 des4. es8 f4		
		es4 c c2 r4 des es4. des8 c4 as des2 c f, r4 f2 bes4. as8 ges4 f1\fermata |
	}
	\addlyrics {
		Lí -- be -- ra á -- _ _ ni -- mas, á -- ni -- mas, lí -- be -- ra á -- ni -- mas
		óm -- ni -- um fi -- dé -- li -- um de -- fun -- ctó -- rum,
		de -- fun -- ctó -- _ rum de poé -- nis in -- _ fér -- _ ni
		et de pro -- fún -- do lá -- cu, et de pro -- fún -- do lá -- _ cu:
		lí -- be -- ra é -- as de ó -- re le -- ó -- nis, de ó -- re le -- ó -- _ _ _ _ _ nis,
		ne ab -- sór -- be -- at é -- _ _ _ as tár -- ta -- rus, __ _
		ne cá -- _ dant, ne cá -- _ dant in ob -- scú -- _ rum:
		sed sí -- gni -- fer sán -- ctus Mí -- cha -- el __ _
		re -- præ -- sén -- tet é -- _ _ _ as, re -- præ -- sén -- tet é -- _ _ _ _ _ as
		in lú -- _ cem sán -- ctam, sán -- ctam.
		Quam o -- _ _ _ _ _ _ _ lim Á -- _ _ bra -- hæ pro -- mi -- sí -- sti,
		pro -- mi -- sí -- sti, pro -- mi -- sí -- sti
		et __ _ _ sé -- mi -- ni, et sé -- mi -- ni é -- _ _ ius, é -- _ _ _ ius.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r\breve r |
		r4 f f f bes,4. c8 d4 es bes2 f'4. g8 as4 es bes'2 f bes bes, es4 es |
		
		bes8 c des es f g as4 des,2 ges4. f8 es4 f ges1 f2 r r4 bes2 \ficta g!4 as f |
		bes4. as8 ges2 f1 ~ f r1 r4 bes as f as bes es,2 |
		bes f' r4 es des bes des2 as4 as'4. \ficta ges8 f es des4 es f2 r r1 |
		
		r4 bes2 f4 as g f2 | bes,4 es4. des8 c bes as4 as'2 g8 f | es4 des8 c bes c des es f2. des4 | as'2 es
		bes r r1 r4 bes' as des4. des8 as4 bes es, f2. f4 bes,2 r4 bes'4 bes2 ges |
		es r4 f4 f2 des bes r4 f'2 c4 es4. des8 bes4. c8 des2 as1 |
		
		bes2 r4 es4 as4. g8 f4 f es2 es f f bes, bes f' r |
		r\breve r r2 r4 f4 f2 as |
		 es bes1 f' bes,2 r bes es bes f' des |
		 
		as2 es' as4. g8 f es f4 d es bes2 r4 bes c4. des8 es4 bes f'2 r1 | r2 bes
		c4. bes8 as4 f bes2 es, f4. es8 des4 bes f'2. bes,4 f'4. f8 bes,2 es bes1\fermata |
	}
	\addlyrics {
		Lí -- be -- ra á -- _ _ ni -- mas óm -- _ _ ni -- um fi -- dé -- li -- um
		de -- fun -- _ _ _ _ _ _ ctó -- _ _ _ _ _ rum de poé -- nis in -- fér -- _ _ ni
		et de pro -- fún -- do lá -- _ cu, et de pro -- fún -- do lá -- _ _ _ _ _ cu:
		lí -- be -- ra é -- as de ó -- _ _ _ re le -- _ _ ó -- _ _ _ _ _ _ nis, le -- ó -- _ nis,
		ne ab -- sór -- be -- at é -- as tár -- ta -- rus,
		ne cá -- _ dant, ne cá -- _ dant in ob -- scú -- _ _ _ _ _ rum:
		sed sí -- _ _ gni -- fer sán -- _ ctus Mí -- cha -- el
		in lú -- _ cem sán -- _ ctam.
		Quam o -- _ lim Á -- bra -- hæ pro -- _ _ _ _ mi -- sí -- sti, pro -- mi -- _ _ sí -- sti
		et sé -- mi -- ni é -- ius, et sé -- mi -- ni é -- ius, et sé -- mi -- ni é -- ius.
	}
}

% HOSTIAS

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
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

soprano = \new Voice {
	\relative c'' {
		as2 bes des2. des4 c c bes1 bes2 | as bes
		des c4. c8 \break bes4 c2 bes4 as2 bes bes as2. as4 bes2 |
		bes4. c8 des es f4. es8 des2 c4 ~ \break c bes4 c2 bes1 | bes
		as2 bes des c1 bes2 ~ \break bes as2 es' des | es f4. es8
		des4 c bes2 bes bes a bes \break des2. c8 bes c4 bes as1 bes2
		
		c as | f as bes2. bes4 \break | bes2 des c bes | as c
		d es \ficta des! c bes c \break | \time 6/2 des c bes\breve\fermata \showBarLine \bar "|."
	}
	\addlyrics {
		Hó -- _ _ sti -- as et pré -- ces tí -- bi
		Dó -- _ mi -- ne láu -- dis of -- _ fé -- _ ri -- mus:
		tu __ _ _ _ _ _ _ sú -- sci -- pe pro a -- ni -- má -- _ bus íl -- lis,
		quá -- _ rum hó -- _ _ di -- e me -- mó -- ri -- am fá -- _ _ _ ci -- mus:
		fac __ _ e -- as Dó -- _ mi -- ne de mór -- _ te trans -- _ í -- _ re __ _ ad ví -- _ tam.
	}
}

alto = \new Voice {
	\relative c' {
		f2 g4. g8 f2 f as g4 f8 es f2 r4 es es f4. f8 g4
		a8 g16 \ficta a bes4. bes8 \ficta as!4 g f8 es f4. f8 es4 f ges2. f4 es2 r r4 f2
		bes as8 g f4. es8 des4 f f2 r4 f d es bes8 c \ficta des! es f es16 f ges4 f f4.
		\ficta g!8 as2 g4 f2 r4 es4. f16 g as2 g8 f g2 as r r4 as2 g4 f8 es des es
		f g as2 g4 f2 es f ges4. \ficta ges8 f4 f2 es8 des es4 es f2 r4 f f g
		
		as4. g8 f es f2 des4 es as2 g4 f2 | r4 es des8 es f g as4 as2 g4 f2 f1 
		r2 r4 bes g a bes g \ficta as!2 | f4. g8 as2. g4 f2 f1\fermata
	}
	\addlyrics {
		Hó -- _ sti -- as et pré -- ces __ _ _ _ tí -- bi
		Dó -- mi -- ne láu -- _ _ _ dis of -- fé -- _ _ _ ri -- mus, of -- fé -- ri -- mus:
		tu sú -- _ _ _ _ _ sci -- pe pro a -- ni -- má -- _ _ _ _ _ _ _ bus íl -- _ _ _ lis, íl -- _ _ _ _ _ _ lis,
		quá -- rum hó -- _ _ _ _ _ _ di -- e me -- mó -- _ ri -- am fá -- _ _ _ ci -- mus:
		fac e -- as Dó -- _ _ _ _ mi -- ne de mór -- te trans -- í -- _ _ _ _ re ad ví -- tam,
		de mór -- te trans -- í -- re __ _ _ _ ad ví -- tam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		c2 es4. es8 des4 bes8 c des es f des es4 f4. es8 es4. d16 c \ficta d4 es bes | c \ficta des!4. des8 es4
		f ges es f4 ~ f8 es8 es2 d4 es \ficta des!2 es4. des8 des2 c8 bes c des es2 d8 c |
		d4 es f2 r4 bes, f'4. es8 des4 des c2 r r4 f | d es bes8 c \ficta des! es
		f2. es4 des as4. bes8 c des es1 | r4 es4. des8 c bes c4 bes as2 bes4. c8 des es f2
		es4 es es2 des c8 bes c4 c es2 | as,4 as as2 r r4 c | c c d es
		
		as,2. f4 bes8 c des bes c des16 es f4. es8 es2 d4 es2 r4 bes as8 bes c des es4 es c c2 bes8 as
		bes2 r r r4 f' d es2 f4 ~ f des4 es f d8 c16 \ficta d es2 \ficta d8 c d1\fermata
	}
	\addlyrics {
		Hó -- _ sti -- as et __ _ _ _ _ _ _ pré -- _ _ _ _ _ ces tí -- bi
		Dó -- mi -- ne láu -- dis of -- fé -- _ _ ri -- mus, of -- fé -- _ _ _ _ _ _ _ _ _ _ ri -- mus:
		tu sú -- _ _ sci -- pe pro a -- ni -- má -- _ _ _ _ bus íl -- lis, __ _ _ _ _
		quá -- _ _ _ _ rum hó -- _ _ _ _ _ di -- e me -- mó -- _ _ _ ri -- am fá -- ci -- mus:
		fac e -- as Dó -- mi -- ne de mór -- _ _ _ _ _ _ _ _ _ _ te trans -- í -- _ _ _ _ re ad ví -- _ _ tam,
		de mór -- te trans -- í -- re ad ví -- _ _ _ _ _ tam.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		f2 es bes'2. bes4 as2 bes bes es, r1
		r2 r4 f | g as4. as8 bes4 c des ges,1 as2. ces4 bes2
		r2 r4 f bes2. as4 | bes2 f r\breve
		r4 f d es bes8 c \ficta des! es f g as2 as,4 es'2 ~ | es as,4 as'2 g4 f2 es des2.
		as4 es'2 bes' ges f es4 es | des4. es8 f g as2 g4 f1 r2
		
		r4 c' c c des bes as f bes2 bes4 bes, es8 f g as bes4 bes, f' as es2 f1
		r4 bes g a bes8 \ficta as! ges f es4 f bes, es as f bes2 as bes4 es, bes'2 bes,1\fermata
	}
	\addlyrics {
		Hó -- _ _ sti -- as et pré -- ces tí -- bi
		Dó -- mi -- ne láu -- dis of -- fé -- ri -- mus:
		tu sú -- sci -- pe __ _ pro a -- ni -- má -- _ _ _ _ _ _ bus íl -- lis,
		quá -- rum hó -- _ _ di -- e me -- mó -- _ ri -- am fá -- _ _ _ _ ci -- mus:
		fac e -- as Dó -- mi -- ne de mór -- te trans -- í -- _ _ _ _ re ad ví -- _ tam,
		de mór -- te trans -- _ _ _ _ í -- re, de mór -- te trans -- í -- re ad ví -- tam.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalAs \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \globalAs \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalAs \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \globalAs \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout {
	  	ragged-last = ##t
	}
%	\midi {	}
}

\markup {
	\column {
		\fill-line {
			\line { }
			\line { }
			\line \right-align { Repeat \italic "Quam olim Abrahæ promisisti et semini eius." }
		}
%		\vspace #4
	}
}


% SANCTUS

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				a4 s8 a4-- g4-- \showBarLine \bar "|"
				\cadenzaOff
%				\noPageBreak
			}
		}
		\addlyrics {
			Sán -- ctus _
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		c\breve ~ c1 c1 \time 2/2 b \showBarLine \bar "||" \time 4/2 \break

		a1 bes c\breve c c1 c \break
		c c\breve bes1 bes c1. c2 c1 \showBarLine \bar "||" \break
		as1 as2 as bes1 c c2 c c1 bes des | \break
		
		c1 c\breve bes1 as as bes c | \break
		c\breve  c1 bes bes c\breve c1\fermata \showBarLine \bar "||" |
	}
	\addlyrics {
		Sán -- ctus. __ _ Sán -- _ _ ctus Dó -- mi -- nus Dé -- us Sá -- _ ba -- oth.
		Plé -- ni sunt caé -- _ li et tér -- ra gló -- ri -- a tú -- a.
		O -- sán -- _ na in ex -- cél -- _ sis.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		e1 f\breve \ficta es1 d
		
		f2. es4 d c bes2. as4 as g8 f g1 f2 f'1 es2 es1 r2 c2 ~
		c4 bes4 as g as2. bes4 c d es2. d8 c d2 es es2. d4 c bes as2 as g1 |
		r2 c1 c2 d f1 f2 f1 e2 f2. \ficta es!4 des c bes2 as |
		
		g1 f r\breve r2 f'1 es2 d es es1 |
		r\breve r2 es1 d2 d bes1 as4 g as2 f g1\fermata
	}
	\addlyrics {
		Sán -- _ ctus. __ _ Sán -- _ _ _ _ _ _ _ _ _ ctus Dó -- mi -- nus 
		Dé -- _ _ _ _ _ _ _ _ _ _ _ us Sá -- _ _ _ _ ba -- oth.
		Plé -- ni sunt caé -- li et tér -- _ _ _ _ _ _ _ ra gló -- ri -- a tú -- a.
		O -- sán -- na in ex -- _ cél -- _ sis.
	}
}

alto = \new Voice {
	\relative c' {
		r2 c1 f2. es8 d c4 d es2 c d1
	
		f1 f\breve r2 g as as g1 es2 es1 f2
		f2 f1 f2 es1 r2 bes'1 g2 as as2. g4 f2 e1 |
		r f2. es4 d c d2 c1 as2 f' c c des bes r1 |
		
		r2 c2. bes4 as g as bes c d es f g2 f f1 as2. g8 f g2 as1 ~ |
		as r2 as1 g2 g f2. es4 d2 c1 c c\fermata |
	}
	\addlyrics {
		Sán -- _ _ _ _ _ _ _ ctus. Sán -- ctus Dó -- mi -- nus Dé -- us Sá -- ba -- oth,
		Sá -- ba -- oth, Dé -- us Sá -- ba -- _ _ oth.
		Plé -- _ _ _ _ ni sunt caé -- li et tér -- ra gló -- _ _ _ _ _ _ _ _ _ _ ri -- a tú -- _ _ _ a.
		O -- sán -- na in __ _ _ ex -- cél -- sis.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		g1 as1. f2 g\breve
		
		c,2 f2. es4 d2 c f, c'\breve r2 g'1 as2 as1 ~
		as r2 as1 as2 f1 g es f2 c c1 |
		f c2 f f1 as1. as2 g f1 g2. f4 f2 ~ |
		
		f4 e8 d \ficta e2 f as as as g es r\breve r |
		r2 as1 f2 es2. f4 g as bes2 f1. f2 f1 e1\fermata |
	}
	\addlyrics {
		Sán -- _ _ ctus. Sán -- _ _ _ _ _ ctus Dó -- mi -- nus, Dó -- mi -- nus Dé -- us Sá -- ba -- oth.
		Plé -- ni sunt caé -- _ li et tér -- _ _ _ _ _ _ ra gló -- ri -- a tú -- a.
		O -- sán -- na __ _ _ _ _ in ex -- cél -- sis.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1 f,2. g4 as1 g\breve
		
		f1 bes f2 f'2. e8 d \ficta e2 f f, c'1 r2 c2. bes4 as g
		as2 f c'\breve r1 bes as2 c1 f,2 g1 |
		c1. c2 bes1 as f2 c'1 as2 bes1. f2 |
		
		c'1 f,2 f'1 es2 es2. d4 c2 f, as1 r2 es'1 c2 |
		c f1 c2 c1 r2 bes1 f c'2. bes4 as2 g1\fermata |
	}
	\addlyrics {
		Sán -- _ _ _ ctus. Sán -- _ ctus, Sán -- _ _ _ ctus, Sán -- ctus
		Dó -- _ _ _ _ mi -- nus Dé -- us Sá -- ba -- oth.
		Plé -- ni sunt caé -- li et tér -- ra, et tér -- ra gló -- ri -- a __ _ _ tú -- a.
		O -- sán -- na, O -- sán -- na in ex -- cél -- _ _ sis.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r\breve f1 c g'
		
		r\breve r1 c,1 f c2 c'2. bes4 as g as2 f
		f1 f2. g4 as1 bes es, as f c |
		f1. f2 bes,1 f'\breve c2 f bes,\breve |
		
		c1 r2 f2. g4 as2 es1 f2. es4 des2 c bes es as, as' ~ |
		as f f1 c2. d4 es2 bes bes1 f'\breve c1\fermata |
	}
	\addlyrics {
		Sán -- ctus. __ _ Sán -- _ ctus Dó -- _ _ _ _ mi -- nus Dé -- _ _ _ us Sá -- ba -- oth.
		Plé -- ni sunt caé -- li et tér -- ra gló -- _ _ ri -- a __ _ tú -- _ _ _ a.
		O -- sán -- na in __ _ _ ex -- cél -- _ sis.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalC \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalC \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}


% BENEDICTUS

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c' {
				\cadenzaOn \override Stem #'transparent = ##t
				f4 s8 f s8 g a s8 a4-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Be -- ne -- dí -- ctus _
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #24
		c1 c\breve c1 |
		bes des c c \break bes\breve as1 as |
		f as bes bes \break c bes a2 bes1 a2 bes\breve\fermata \showBarLine \bar "|."
	}
	\addlyrics {
		qui vé -- nit in nó -- mi -- ne Dó -- mi -- ni.
		O -- sán -- _ na in __ _ ex -- cél -- _ sis.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		e1 f\breve \ficta es1 |
		r2 bes1 f2. g4 as bes c d es c d es f1 e2 f1 c2. c4 |
		bes1 r2 es1 d2 es1 ~ es es1 c2 bes c f f\breve\fermata |
	}
	\addlyrics {
		qui vé -- nit in nó -- _ _ _ _ _ _ _ _ _ _ mi -- ne Dó -- mi -- ni.
		O -- sán -- na in ex -- _ cél -- _ sis.
	}
}

alto = \new Voice {
	\relative c' {
		r1 r2 f1 c2. d4 es f |
		g1 f as as2 g f1 g2. g4 c,1 r2 f1 
		d2 es1 f g es2 es1 bes2 r f' f c d\breve\fermata |
	}
	\addlyrics {
		qui vé -- _ _ _ _ nit in nó -- mi -- ne Dó -- mi -- ni.
		O -- sán -- na __ _ in ex -- cél -- sis, in ex -- cél -- sis.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		g1 as\breve g1 |
		r\breve r2 f f es d1 bes f' f2 f |
		d d c1 r2 bes'1 g2 as as1 g2 f\breve f\fermata |
	}
	\addlyrics {
		qui vé -- nit in nó -- mi -- ne, in nó -- mi -- ne Dó -- mi -- ni.
		O -- sán -- na in ex -- cél -- sis.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1 f,2. g4 as g as bes c1 |
		g2 bes bes4 c des es f2 c c1 r2 bes1 g2 as c1 as2 |
		bes1 c r r2 es ~ es c2 es es1 d2 c1 bes\breve\fermata |
	}
	\addlyrics {
		qui vé -- _ _ _ _ _ _ nit in nó -- _ _ _ _ mi -- ne Dó -- mi -- ni.
		O -- sán -- na, __ _ O -- sán -- na in ex -- cél -- sis.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r\breve f1 c2. d4 |
		es f g as bes1 f2 f as1 bes2 bes g2. g4 f\breve |
		r2 bes as c bes1 es, as es f\breve bes,\breve\fermata |
	}
	\addlyrics {
		qui vé -- _ _ _ _ _ _ nit in nó -- mi -- ne Dó -- mi -- ni.
		O -- sán -- na in ex -- cél -- _ _ sis.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalC \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalC \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout {
	  	ragged-last = ##t
	}
%	\midi {	}
}


% AGNUS DEI 1

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				g4 s8 g s8 g a s8 a4-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ag -- nus Dé -- _ i
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
	 c1 c c
	 b c1. as2 bes1 c c b
	 c d bes c\breve c1 b\breve \showBarLine \bar "||"
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ di,
		dó -- na é -- is ré -- qui -- em.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		r\breve r1
		r2 d2 es1 c2 c d e f1 \ficta e r1
		r r2 d1 e2 f1 \ficta es!2 es1 es2 d\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di,
		dó -- na é -- is ré -- qui -- em.
	}
}

alto = \new Voice {
	\relative c' {
		e1 f e
		r2 g g es f2. es4 d2 g c,\breve r1
		r f g as g2 g1 g2 g\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ _ _ di,
		dó -- na é -- is ré -- qui -- em.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		g1 as g2 g
		g2. f4 es2 g as1 f2 bes2. as8 g as2 g1 g2. f4
		es2 f2. es4 d c d2 bes r c2. d4 es2 c1 d\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- _ _ ta mún -- di,
		dó -- _ _ _ na é -- _ _ _ _ _ _ _ is ré -- _ _ qui -- em.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1 f, c'2 c
		es d c\breve bes1 r r2 c d es ~
		es4 d c2 bes1 bes as2. bes4 c1. g2 g\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di,
		dó -- na é -- _ _ is ré -- _ _ _ qui -- em.
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
		r\breve r1
		g c, f2 f bes g f1 c g'
		as bes2. as4 g f g2 f1 c1. c2 g'\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di,
		dó -- na é -- _ _ _ _ is ré -- qui -- em.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalC \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalC \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}

% AGNUS DEI 2

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				g4 s8 g s8 g a s8 a4-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ag -- nus Dé -- _ i
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #10
		c1 c\breve c1 b c1.
		as2 bes1 \break c c b c d bes
		c\breve c1 \time 6/2 b\breve \showBarLine \bar "||"
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ di,
		dó -- na é -- is ré -- qui -- em.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		r1 r2 c2 es1. c2 d1 es
		c d2 es2 ~ es4 d4 c bes as2 g r2 d'2 e f2. \ficta es!4 d2. c4 bes1
		as2 g es'1 es2 d\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- _ ta mún -- _ _ _ _ di,
		dó -- na __ _ _ _ _ _ é -- is ré -- qui -- em.
	}
}

alto = \new Voice {
	\relative c'' {
		g1 as g2 es g as g1 es2 c4 d
		es c f1 es4 d c1 c r\breve f2. es4 d2 d
		c2. d4 es2 c c c d\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di, mún -- _ _ _ _ _ _ _ di,
		dó -- _ _ na é -- _ _ is ré -- qui -- em.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		r\breve r r1 g
		as f2 g as es f g g g1 a2 bes f1 g
		f2 g g1 g2 g\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ di,
		dó -- na é -- is ré -- qui -- em, ré -- qui -- em.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1 f es2 c es f d1 c\breve
		r1 r2 c2. d4 es2 d1 c bes bes2. as4
		g2 c c2. bes8 as g1 ~ g\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di,
		dó -- _ _ na é -- is ré -- _ _ qui -- em. __ _ _ _
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
		r\breve r g1 c
		as2 f bes es, as2. g4 f2 c g' g c, f bes, bes'2. as4 g f
		es2 f c1 c g'\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ _ _ di,
		dó -- na é -- is ré -- _ _ _ _ _ _ qui -- em.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalC \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalC \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout {
	  	ragged-last = ##f
	}
%	\midi {	}
}

% AGNUS DEI 3

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				g4 s8 g s8 g a s8 a4-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ag -- nus Dé -- _ i
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #19
		c1 c c
		1 b c1. as2 bes1 c \break c b c
		d bes c1. c2 b1 \break \ficta b1. \ficta b2 \time 6/2 c1 b\breve \showBarLine \bar "|."
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ di,
		dó -- na é -- is ré -- qui -- em sem -- pi -- tér -- nam.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		e1 f f2 g
		g1  e f d r2 c2 ~ c4 d4 es2 d d c1
		r r2 es1 f es2 d1 d1. d2 es1 d\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di,
		dó -- _ _ na é -- is ré -- _ qui -- em sem -- pi -- tér -- nam.
	}
}

alto = \new Voice {
	\relative c'' {
		g1 f f2 es
		d1 c2 g' f4 c f2. es4 d2 c1 ~ c r2 g'1 a2
		bes1. g2 es4 d c bes c2 c d1 d1. d2 c1 d\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta __ _ mún -- _ _ _ _ di,
		dó -- na é -- is ré -- _ _ _ _ qui -- em sem -- pi -- tér -- nam.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		g1 as as2 g
		g\breve as1 f2. g4 as1 g\breve r1
		r2 f g1 as2 as as g g1 g1. g2 g1 g\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- _ _ di,
		dó -- na é -- is ré -- qui -- em sem -- pi -- tér -- nam.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c1 c2 f, c'1
		d2 g,1 c2 c f,1 bes2 as f g c d1 e
		f es2. d4 c2 f,1 g2 g1 g1. g2 g1 g\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta mún -- di, pec -- cá -- ta mún -- di,
		dó -- na é -- _ is __ _ _ ré -- qui -- em sem -- pi -- tér -- nam.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		c1  f f2 c 
		g'1 c, f bes, f' c g' c
		bes es, as2. g4 f2 c g'1 g1. g2 c,1 g'\breve
	}
	\addlyrics {
		qui tól -- lis pec -- cá -- ta __ _ mún -- _ di,
		dó -- na é -- is ré -- _ _ qui -- em sem -- pi -- tér -- nam.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 6)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \globalC \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \globalC \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \globalC \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \globalC \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout {
		ragged-last = ##t
	}
%	\midi {	}
}


% COMMUNIO

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				a4 s8 g4 f s8 g a s8 g-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Lux æ -- _ tér -- _ na
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		c1 es d1. es1
		c1. ~ \break c2 bes1 a1 bes1
		c1. es1 \break d es1.
		c1 d es2 c bes \break c1
		bes1 | g2 as bes4 c4. bes8 bes2 a8 g \ficta a4 \ficta a bes1 \fermata \showBarLine \bar "||"
	}
	\addlyrics {
		lú -- ce -- at é -- is Dó -- mi -- ne,
		cum sán -- ctis tú -- is in æ -- tér -- _ _ num,
		qui -- _ a pí -- _ _ _ _ _ us es.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		r1 r4 c bes g bes4. c8 d es f4. es8 d4 c c2 
		bes4 as2 g r4 c es es es2. d4 c c | c f4. es8 d c
		bes4 es4. d8 c4. bes8 as2 as4 g c bes g bes4. c8 d es f4 bes, c bes1 
		f' f2 r4 bes, g c4. d8 es4 es2 r r4 es
		f4 es2 d4 | c1 es2 f4 g f2. f4 d1\fermata |
	}
	\addlyrics {
		lú -- ce -- at é -- _ _ _ _ _ _ is Dó -- mi -- ne, __ _
		lú -- ce -- at é -- is Dó -- mi -- ne, Dó -- _ _ _ _ _ _ _ _ _ mi -- ne,
		cum sán -- ctis tú -- _ _ _ _ is in æ -- tér -- num, in æ -- tér -- _ _ num,
		qui -- a pí -- us es, qui -- a pí -- _ us es.
	}
}

alto = \new Voice {
	\relative c' {
		r2 f es4 c es4. f8 g as bes2 as8 g f4 bes, c4. d8 |
		es8 f g4. f8 f2 e4 f2 | r4 g4. f8 es d16 c bes8 c d es f1 f2
		g c, r4 f es c r g'4. as8 bes4 ~ bes8 as8 f4. g8 as4 g es g2. 
		g4 f2 f d g4. f8 es4 c r c es2 es es
		r1 | r2 r4 as g c,4. d8 es4 c1 bes1\fermata |
	}
	\addlyrics {
		lú -- ce -- at é -- _ _ _ _ _ _ _ is Dó -- _ _ _ _ _ _ mi -- ne, Dó -- _ _ _ _ _ _ _ _ _ mi -- ne, __ _
		cum sán -- ctis tú -- _ _ _ _ _ _ is in æ -- tér -- num, in æ -- tér -- _ _ num, in æ -- tér -- num,
		qui -- a pí -- _ _ us es.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		r\breve r |
		r1 r2 r4 as | g es g2 g4 f2 es8 d | c4. c8 bes4 bes'4.
		as8 g f es2 f c1 r2 r f2 es4 c es4. f8 |
		g as bes2 a8 g a2 bes1 r4 g as as4. g16 f g4 | as2. as4
		f4 g4. f8 f2 e4 f2 r4 as2 g4 | as8 g f es f4 f f1\fermata |
	}
	\addlyrics {
		lú -- ce -- at é -- is Dó -- _ _ _ mi -- ne, Dó -- _ _ _ _ mi -- ne,
		cum sán -- ctis tú -- _ _ _ _ _ _ _ is in æ -- tér -- _ _ _ num,
		qui -- a pí -- _ _ us es, qui -- a pí -- _ _ _ _ us es.
		
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 r2 r4 c bes g bes4. c8 d es f bes, es d c bes |
		as4 g as4. bes8 c4. bes8 as4 f g2 r4 bes2 bes4 c c2 c4 d d
		es2 r4 c as f as4. bes8 c d es4. d16 c bes4 bes2 r r\breve
		r4 f'2 d g4. f8 es d es4 as, bes2 | as r4 c
		d4 es4. d16 c bes4 | c4. c8 f,4 f' es2 c1 f,2 f1\fermata |
	}
	\addlyrics {
		lú -- ce -- at é -- _ _ _ _ _ _ _ _ _ _ is Dó -- _ _ _ _ mi -- ne,
		lú -- ce -- at é -- is Dó -- mi -- ne,
		cum sán -- ctis tú -- _ _ _ _ _ _ _ is in æ -- tér -- _ _ _ _ _ _ num,
		qui -- a pí -- _ _ _ _ us es, qui -- a pí -- us es.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r\breve r
		r1 r2 f es4 c es4. f8 g as bes4 f2 | f bes4. as8
		g4 es as2 f r4 f es c es4. f8 | g as bes4. as8 f4 g as es1
		f bes,4 bes'2 g4 c4. bes8 as2 es | as,1
		r1 | r2 r4 f' g as4. g16 f es4 f2. f4 bes,1\fermata |
	}
	\addlyrics {
		lú -- ce -- at é -- _ _ _ _ is Dó -- _ _ _ mi -- ne, __ _
		cum sán -- ctis tú -- _ _ _ _ _ _ is in æ -- tér -- num, in æ -- tér -- _ _ _ num,
		qui -- a pí -- _ _ _ _ us es.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
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


% CPDL #36844
% Copyright ©2015 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "8"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
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


% COMMUNIO

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S1"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				g4 a c s8 c4 s8 c4 s8 c4 s8 c4 s8 c4 s8 c4 s8 c4 s8 d4 d s8 c4 c-- \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ré -- qui -- em æ -- tér -- nam dó -- na é -- is Dó -- _ mi -- ne.
		}
	>>
	\layout {
		ragged-right = ##t
	}
}

sopranoA = \new Voice {
	\relative c'' {
		\set Score.currentBarNumber = #13
		es2 es es es1 es2 es1 es d2 es \break |
		c1 bes2 r r1 c es
		d | \break es1. c1 d es2 c bes
		c1 | \break bes g2 as bes4 c4. bes8 bes2 a8 g \ficta a4 \ficta a bes\breve | \showBarLine \bar "|."
	}
	\addlyrics {
		et lux per -- pé -- tu -- a lú -- ce -- at é -- is.
		Cum sán -- ctis tú -- is in æ -- tér -- _ _ num,
		qui -- _ a pí -- _ _ _ _ _ us es.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		c2 c bes c2. c4 bes2 c c4 bes bes2 c r1 |
		r2 f d4 bes c2 c as4 f as1 g4 c bes g
		bes4. c8 d es f4 | bes, c bes1 f' f2 r4 bes, g c4. d8 es4 es2
		r2 r4 es | f es2 d4 c1 es2 f4 g f2. f4 d\breve |
	}
	\addlyrics {
		et lux per -- pé -- tu -- a lú -- ce -- at é -- is.
		Cum sán -- ctis tú -- is in æ -- tér -- num,
		cum sán -- ctis tú -- _ _ _ _ is in æ -- tér -- num, in æ -- tér -- _ _ num,
		qui -- a pí -- us es, qui -- a pí -- _ us es.
	}
}

alto = \new Voice {
	\relative c' {
		es2 es es c4. d8 es4 es es2 c4. d8 es4. f8 g as bes2 a4 bes2 g |
		f f1 r4 f es c2 des4 c1. r1
		f2 | es4 c es4. f8 g as bes2 a8 g a2 bes1 r4 g as as4. g16 f g4
		as2. as4 | f g4. f8 f2 e4 f2 r4 as2 g4 as8 g f es f4 f f\breve
	}
	\addlyrics {
		et lux per -- pé -- _ _ tu -- a lú -- _ _ _ _ _ _ ce -- at é -- _ is.
		Cum sán -- ctis tú -- is, cum sán -- ctis tú -- _ _ _ _ _ _ _ is in æ -- tér -- _ _ _ num,
		qui -- a pí -- _ _ us es, qui -- a pí -- _ _ _ _ us es.
	}
}

tenorA = \new Voice {
	\relative c'' {
		\clef "treble_8"
		g2 g2. g4 as2. as4 g2 as g2. f4 es2 f es4 bes' ~ |
		bes a8 g \ficta a4 \ficta a bes4 f4. g8 as4. g16 f es4 f2 r4 f es c r g'4. as8 bes4. 
		as16 g f4. g8 as4 | g es g2. g4 f2 f d g4. f8 es4 c r c es2
		es es | r1 r2 r4 as g c,4. d8 es4 c1 bes\breve |
	}
	\addlyrics {
		et lux per -- pé -- tu -- a lú -- _ ce -- at é -- is,  lú -- _ _ _ ce -- at é -- _ _ _ _ _ is.
		Cum sán -- ctis tú -- _ _ _ _ _ _ _ is in æ -- tér -- num, in æ -- tér -- _ _ num, in æ -- tér -- num,
		qui -- a pí -- _ _ us es.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		c2 c4 g4. as8 bes4 as4. bes8 c4 as bes2 as4. bes8 c d es2 d4 c2 bes es, |
		f1 bes2 r1 r4 bes as f as4. bes8 c d es4. d16 c bes4
		bes2 r | r\breve r4 f'2 d g4. f8 es d es4 as, bes2
		as r4 c | d es4. d16 c bes4 c4. c8 f,4 f' es2 c1 f,2 f\breve |
	}
	\addlyrics {
		et lux per -- _ _ pé -- _ _ tu -- a lú -- _ _ _ _ ce -- at é -- _ _ is.
		Cum sán -- ctis tú -- _ _ _ _ _ _ _ is in æ -- tér -- _ _ _ _ _ _ num,
		qui -- a pí -- _ _ _ _ us es, qui -- a pí -- us es.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		c2 c es as, as' es r1 r\breve |
		r1 r4 bes' as f as4. g8 f4 bes, f'2 r4 f es c es4. f8
		g as bes4. as8 f4 | g as es1 f bes,4 bes'2 g4 c4. bes8 as2 es
		as,1 | r r2 r4 f' g as4. g16 f es4 f2. f4 bes,\breve |
	}
	\addlyrics {
		et lux per -- pé -- tu -- a
		Cum sán -- ctis tú -- _ _ _ is, cum sán -- ctis tú -- _ _ _ _ _ _ is
		in æ -- tér -- _ _ _ num, in æ -- tér -- num,
		qui -- a pí -- _ _ _ _ us es.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \globalC \sopranoB \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \globalC \sopranoA \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
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

\score {
	\new Staff <<
		\set Staff.instrumentName = #"S"
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem #'transparent = ##t
				g4 s8 a s8 a s8 g s8 a s8 a g s8 g-- s8 \showBarLine \bar "|"
				s8 g s8 g-- a-- s8 \showBarLine \bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
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
