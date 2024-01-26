% http://www.cpdl.org/wiki/index.php/Missa_pro_defunctis_(Jacobus_Clemens_non_Papa)
% Copyright ©2024 Peter Hilton - https://github.com/hilton

\version "2.24.2"
\pointAndClickOff
revision = "13"

\paper {
	#(define fonts (set-global-fonts #:sans "Source Sans Pro"))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 10\mm
	top-margin = 10\mm
	bottom-margin = 10\mm
 	markup-system-spacing = #'( (padding . 1) )
	indent = 0
	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #4 \override #'(font-name . "Source Sans Pro Light") {
		"Missa defunctorum (superius)"
	}
	composer = \markup \sans { Clemens non Papa }
	copyright = \markup \sans \teeny {
		\vspace #1
		\column \center-align {
			\line {
				Copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision - This work is licensed under the
			}
			\line {
				Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
			}
		}
	}
	tagline = ##f
}

\layout {
	ragged-right = ##f
	ragged-last = ##f
	\context {
		\Score
		\override SpanBar.transparent = ##t
		\override BarLine.transparent = ##t
		\remove "Bar_number_engraver"
		\remove "Metronome_mark_engraver"
		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
	}
	\context { 
		\Voice 
		\override NoteHead.style = #'baroque
		\consists "Horizontal_bracket_engraver"
	}
}

global = { 
	\tempo 2 = 44
	\set Score.barNumberVisibility = #all-bar-numbers-visible
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

globalF = { 
	\key f \major
}


globalC = { 
	\key c \major
}

showBarLine = {
	\once \override Score.BarLine.transparent = ##f
	\once \override Score.SpanBar.transparent = ##f 
}
ficta = { \once \set suggestAccidentals = ##t }


% INTROITUS

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f4 g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		f2. g4 a bes c4. bes8 a4 c bes a2
		g8 f e4 d g2 f4. e8 d4 c d e f a4. g8 f4 e8 d f2 e4 \mark \default f2 r4 f2
		f4 e2 e4 f8 g a bes a2 g4 f g4. f8 f2 e8 d e2 \mark \default f4 c'4. bes8 a2 g8 f
		
		e4 c'4. bes8 a4 g f2 e4 f a a c bes a a g8 f g2. f4 a g f2.
		g4. f8 f2 e4 f2 \fermata \showBarLine \bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn s8 f8 s g8 a a s a8 a s a8 a s a8 s g8 g-- a-- s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"

		f1 g2 a a4 a a a a2. a4
		bes2. bes4 a g a2 r4 f g a a2 a4 bes bes a g f g2 f
		r4 a a a a2. f4 g2 a g2. f4 f\breve \showBarLine \bar "||"
	}
	\addlyrics {
		Re -- _ qui -- em 
		Ae -- _ _ _ _ _ _ _ ter -- _
		_ _ _ _ _ nam, __ _ _ _ _ _ _ ae -- _ _ _ _ _ ter -- nam do --
		na e -- is Do -- _ _ _ _ _ _ _ _ _ _ _ mi -- ne, et __ _ lux __ _ _
		
		_ per -- _ _ pe -- _ tu -- a lu -- ce -- at e -- _ is, __ _ _ _ lu -- ce -- at e --
		_ _ _ _ is.
		
		Te de -- _ cet hym -- nus De -- us in Si -- on __ _

		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro __ _ ve -- ni -- et.

	}
}

\score {
	\transpose f g {
		<<
		      \new Staff << \globalF \soprano >> 
		>>
	}
	\header {
		piece = \markup \larger \sans { Introitus }
	}
}



\markup {
	\column {
		\fill-line {
			\line { }
			\line { }
			\line \right-align { Repeat \italic " Requiem aeternam dona eis Domine, et lux perpetua luceat eis." }
		}
	}
}

% KYRIE

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"		
		\time 2/2

		f1 g2 a a g a bes a2. bes4 a g f a
		g f2 e8 d e4 e f2 \fermata \showBarLine \bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		bes1 a2 g a bes bes1 a2 g4 f
		g2 f bes2. a4 g2 f1. \fermata \showBarLine\bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		f1 g2 a a g bes1. a1 g1 f2 \mark #3 f2. a4 g f2 e4
		f1 bes a g f2. a4 g f4. e16 d e4 f1 \showBarLine \bar "||"
	}
	\addlyrics {
		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ _ _ _ e -- _ _ _ _ _ _ _ _ le -- i -- son.
		
		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- ste __ _ _ _ e -- _ _ _ _ _ _ le -- i -- son.
		
		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e, __ _ Ky -- _ ri -- e e -- _ _ _ lei -- 
		son, Ky -- _ ri -- e e -- lei -- _ _ _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \soprano >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Kyrie }
	}
}


% TRACTUS

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g8 g a b a g a a-- g-- s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		r2 g2 c4. b8 a g a2 b4 c2 a d4. d8 |
		g,4 g2 g4 g g4. g8 e2 g4 f2. f4 g2 | \mark #4 g e4 a4. g8 g4. f8 f4.

		e16 d e4 f2 | f a c4. b8 a4 g \mark #5 a2. b4 | c g a8 b c a b4 a4. g8 g2
		fis4 g2 \showBarLine \bar "|" 
		\mark #6 g g c2. b4 | a c4. b16 a b4 c2 r4 g a2. g4
		f2 e d f f4 a2 g4 | f2 \mark #7 e1. r2 e
		e4 g2 a2 gis4 a4. a8 g4 g fis4. fis8 g4 g2 e4 | a2 d, \mark #8 r4 g4 f2

		e4 e g1 a2. c2 g2 b2 d4. d8 a2 c4. b8 a4. g8 g2 
		fis4 g2 ~ g\breve \showBarLine \bar "||"

	}
	\addlyrics {
		Ab -- sol -- _ _ _ _ _ ve __ _ 
		Do -- _ _ _ _ _ mi -- ne, Do -- _ mi -- 
		ne a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- fun -- cto -- _ _ _ _

		_ _ _ rum ab __ _ om -- _ _ ni vin -- cu -- lo de -- li -- _ _ _ _ cto -- _ _
		_ rum. Et gra -- _ ti -- a tu -- _ _ _ a, et gra -- ti -- 
		a tu -- a il -- lis suc -- cur -- ren -- te me -- 
		re -- an -- tur e -- va -- de -- re iu -- di -- ci -- um ul -- ti -- o -- nis, et lu -- 

		cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- _ _ _ _
		fru -- i.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Tractus }
	}
}

% OFFERTORIUM

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 f g g s g8 f g s g8 a bes g g-- f-- s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		f2 g a1 bes2. a4 g a4. g8 g4. f16 e f4 g2 |
		r2 g f g g a2. a4 a2 bes2. bes4 bes bes a g | a2 r4 g2

		f4 g2. f8 e f2 r g f g g g2. bes4 a2 f4 bes2 a4 |
		g1 a2 r4 g f g a a a2 a bes2. bes4 a2 g |
		a2 c2. bes4 a bes4. a8 a2 g4 a2 r4 f g2 bes2. bes4 bes2 |
		bes2 a4 g a2 g1. r2 g1 g2 f2. f4 f2 g |

		bes a2. a4 g f a2 f r4 g a2. a4 a2 bes2. a4 |
		g2 g f bes2. a4 g a4. g8 g4 f2 r4 f g a bes2 a4 g2
		f8 e f2 g1 | \showBarLine \bar "|" r2 g1 g2 f d f2. f4 f2 bes2.
		a4 g a4. g8 g2 f8 e f2 r a c2. bes4 a g f a4. g8 g2 \ficta fis4 g2 \showBarLine \bar "|" |
	}
	\addlyrics {
		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ _ glo -- _ _ _ _ _ ri -- _ _ æ,
		li -- be -- _ ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- _ _ rum, de pœ -- _ nis in -- _ fer -- _ _ _
		_ ni et de pro -- fun -- do la -- cu, li -- be -- ra e -- 
		as de o -- re le -- _ _ o -- nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- rus, ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet __ _ e -- as in lu -- cem san -- _ _
		_ _ _ ctam. Quam o -- lim __ _ A -- bra -- hæ pro -- 
		mi -- si -- _ _ _ _ _ sti et se -- mi -- ni __ _ _ e -- _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \soprano >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Offertorium }
	}
}

\score {
	\transpose f g {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\once \omit Staff.TimeSignature
				\cadenzaOn
				\override Stem.transparent = ##t 
				f4 g bes bes bes a s  g f s  g bes bes bes a s  f g bes s  bes g a g f f s  a g a bes s  a g f f g g-- s \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ho -- sti -- _ as __ _ _ et __ _ pre -- _ ces __ _ _ ti -- bi __ _ 
			Do -- mi -- _ _ _ ne lau -- _ dis __ _ of -- _ fe -- ri -- _ mus.
		}
	>>
	}
}


soprano = \new Voice {
	\relative c'' {
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		\set Score.currentBarNumber = #67
		g1 a2. bes4 |
		c2 bes2. a4 g a4. g8 g2 f4 | \mark #9 g2 r4 g g f g bes2 a4 g f |
		g a bes g4. a8 bes4 c2 f,4 g4. f8 f2 e4 \mark #10 f a2 g4 a bes a2 r4 a4. 
		f8 bes2 a4 | bes1 r4 bes bes bes bes2 a2. a4 a2 r g1

		g2 f2. f4 g2 bes2. bes4 bes2 a4 a g2 \mark #11 g r g1
		g2 f d f2. f4 f2 bes2. a4 g a4. g8 g2 f8 e f2
		r a c2. bes4 a g f a4. g8 g4. \ficta fis16 e \ficta fis4 g1 \showBarLine \bar "||" |
	}
	\addlyrics {
		Tu __ _ _
		_ su -- _ sci -- _ _ _ _ pe pro a -- ni -- ma -- bus il -- lis, pro
		a -- ni -- ma -- bus __ _ _ _ il -- _ _ _ _ lis qua -- rum ho -- di -- e, qua -- 
		rum ho -- di -- e me -- mo -- ri -- am fa -- ci -- mus, fac

		e -- as de mor -- te trans -- i -- re ad vi -- tam. Quam
		o -- lim __ _ A -- bra -- hæ pro -- mi -- si -- _ _ _ _ _ sti
		et se -- mi -- ni __ _ _ e -- _ _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \soprano >> 
		>> 
	}
}

% SANCTUS 

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4-- a-- \override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a2 c2. \ficta b!8 a b4 a2 g4 a1 r4 a2 a4 f f
		bes2 a2. a4 a2 a a r4 a a d2 c8 b c2 \showBarLine \bar "|"
		f,1 g2 a a2. a4 a a g2 e f2. f4 a2 g a1 \fermata
		a1 bes2 g f2. f4 e1 e2 \showBarLine \bar "|"
	}
	\addlyrics {
		San -- ctus
		San -- _ _ _ _ _ _ ctus San -- ctus Do -- mi -- 
		nus De -- us Sa -- ba -- oth Sa -- ba -- oth __ _ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Sanctus }
	}
}

% BENEDICTUS

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn
		\override Stem.transparent = ##t f8 g a a s a s a a s \override Stem.transparent = ##f 
		\cadenzaOff \showBarLine \bar "|"
		\time 2/2
		
		a2 a4 a a1 a2. g4 f1 \fermata g g2. g4
		f2 f e1 e\breve \showBarLine \bar "||"
	}
	\addlyrics {
		Be -- ne -- di -- ctus qui ve -- nit
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
		>> 
	}
}

\pageBreak

% AGNUS DEI

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		g2 g4 g a1 g4 f g2 g1\fermata g a2 a2. a4 g2. g4 g2 \showBarLine \bar "|" \break

		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		a2 a4 a g1 g4 e f2 g1\fermata g a2 a2. a4 a1 g a2 \showBarLine \bar "|" \break
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		a2 a4 a a1 g4 f a2 a1\fermata g a b g2 g2. g4 a2 a2. a4 g1 g \showBarLine \bar "||"
	}
	\addlyrics {
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Agnus Dei }
	}
}

% COMMUNIO

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn a'8 s g f g a a-- g-- s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a1 a4 g2 a4 f a4. g8 g2 f4 g1 e4 f2
		e8 d c4 a' | c2 b4 c a g4. f8 g4 a \mark #11 b2 a g4 a1 r4 a2
		a4 g2 | g1 r4 e f g a g2 f4 g2 r8 e f4 g a2 g2
		
		\ficta fis4 g \mark #12 d | e f g2 f8 e f g a4 g2 \ficta fis4 g2 ~ g\breve | \showBarLine \bar "|" | 

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn g8 a c s  c c c s  c c s  c c s  d c c-- s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		
		c2 c4 c c2. c4 c2 c |
		b4. a8 b4 c a g2 \ficta fis4 g1 | \showBarLine \bar "|"
		r2 a c b4 c a g4. f8 g4 | a b2 a g4 a1 r4 a2
		
		a4 g2 g1 \mark #13 r4 e f g a g2 f4 g2 r8 e f4 g a2 g
		\ficta fis4 g d e \ficta f! g2 f4 \ficta bes a g2 \ficta f!4 g2 ~ g\breve |
		\showBarLine\bar "|"
		\cadenzaOn \override Stem.transparent = ##t
		s8 g8 a a g s  a s  a g g-- s \showBarLine \bar "|"
		s8 s4_"*" s g g-- a-- s8 \showBarLine \bar "|."
		\cadenzaOff
	}
	\addlyrics {
		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- at e -- is Do -- _ _ mi -- ne, Do -- _
		mi -- _ ne cum san -- ctis tu -- is in __ _ _ æ -- ter -- _ _ num, in
		æ -- ter -- num, qui -- _ a pi -- _ us es, qui -- _ a pi -- _
		us es, qui -- _ a pi -- _ _ _ _ _ _ us es.

		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 
		Et lux per -- pe -- tu -- a lu -- 
		ce -- _ _ at e -- _ _ is.
		Cum san -- ctis tu -- is in __ _ _ æ -- ter -- _ _ num, in

		æ -- ter -- num, qui -- _ a pi -- _ us es, qui -- _ a pi -- _
		us es, qui -- _ a pi -- _ _ _ _ us es.

		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Communio }
	}
}
