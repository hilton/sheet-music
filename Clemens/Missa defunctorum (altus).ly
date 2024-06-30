% http://www.cpdl.org/wiki/index.php/Missa_pro_defunctis_(Jacobus_Clemens_non_Papa)
% Copyright ©2024 Peter Hilton - https://github.com/hilton

\version "2.24.2"
revision = "15"

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
		"Missa defunctorum (altus)"
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
	\time 2/2
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

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f4 g f f \fermata \cadenzaOff
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		r2 f,2. g4 a bes c c d4. c16 bes
		a4 bes c d2 c4 d2 r4 f2 e4 d c2 bes4 c d c2 \mark \default c1
		r4 c2 c4 c2 f,4 f'2 e4 d c4. a8 d4 c1 \mark \default r4 f \[f2 c2.\]
			
		e4 f c \[d2 c\] a \[c d\] c4 d e2. c4 f e d1
		c4 bes c2 \cadenzaOn a\breve \cadenzaOff
		\showBarLine \bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn s8 f'8 s g8 a a s a8 a s a8 a s a8 s g8 g a \fermata s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"

		c,1 \[e2 f\] f4 f f f f2. f4
		f2. f4 f d f2 r4 c e f f2 f4 f f4. e8 d4 d bes c d2
		r4 c f f f4. e16 d c4 d \[e2 f2.\] e8 d e4 d d2. d4 c1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Re -- _ qui -- em 
		Ae -- _ _ _ _ ter -- _  _ _ _ _ _ _ _ nam, ae -- _ ter -- _ _ _ _ _ nam
		do -- na e -- is Do -- _ _ _ _ mi -- ne, et lux __ _ 	
		per -- pe -- tu -- a __ _ _ lu -- _ _ _ _ ce -- at __ _ e -- _ _ _ is.

		Te de -- _ cet hym -- nus De -- us in Sy -- on, __ _
		
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- _ am,
		ad te om -- nis __ _ _ _ ca -- ro __ _ _ _ _ _ ve -- ni -- et.
		
	}
}

\score {
	\transpose f g {
		<<
		      \new Staff << \globalF \alto >> 
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

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"		
		\time 2/2
		
		c1 \[e2 f\] \[f e\] f d4 e f2. d4 f e c2
		d c1 \cadenzaOn c\breve \cadenzaOff
		\showBarLine \bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2

		f1 \[f2 d\] f1 g4 f2 e4 f2 e4 d2 
		c4 d2 f1 d4 e \[d2 c\] \cadenzaOn d\breve \cadenzaOff 
		\showBarLine \bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		d1 \[bes2 f'\] \[f e\] f2. f4 g2 e f \[d es\] c4 c \mark #3 d2. c4 \[d2 c\]
		d d4. e8 f g f2 e4 f2 e4 f e d2 c4 d2 c \[d c\] c1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ e -- _ _ lei -- _ _ _ _ _ _ son.

		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- _ _ ste e -- lei -- _ son, e -- le -- i -- son, Chri -- ste e -- lei -- _ son.

		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _
		_ e -- lei -- _ _ _ _ son, e -- lei -- _ _ _ son, e -- _ _ _ _ lei -- son e -- _ _ _ _ lei -- _ _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \alto >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Kyrie }
	}
}

\pageBreak

% TRACTUS

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 g a b a g a a g s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		r1 \[c,2 f4.\] e8 d4 d e2 f f4 f4. 
		e16 d e4 e4. e8 e4 e2 g4. f8 e d c4 c d1 \mark #4 e4. f8 g4 f d2 d |

		\[g, a\] c c4. d8 e2 f4 d \mark #5 f1 g4 e f1 \cadenzaOn d1 ~ d\breve \cadenzaOff 
		\showBarLine \bar "|"
		\mark #6 r2 c \[c f2.\] e4 d2 e1 f4. e16 d c4 g |
		d'2 r4 g2 f8 e d4 d c4. c8 a b c2 b4 \mark #7 c2 | r4 c2 c4 e2 g4 g4.
		f8 e4 d4. d8 e4 e2 d c4 d d2 d4 c1 b2 \mark #8 r4 d \[d2 |

		g\] e4 e d2 f4 f c2 e g4. g8 d2 f4. f8 c2 f2. d4 |
		d2 r4 e2 e4 d1.
		\showBarLine \bar "||"
	}
	\addlyrics {
		Ab -- sol -- _ _ _ _ _ ve: __ _ 
		Do -- _ _ _ mi -- ne a -- ni -- mas __
		_ _ _ om -- ni -- um fi -- de -- _ _ _ _ li -- um de -- _ _ fun -- cto -- rum

		ab __ _ om -- ni __ _ _ vin -- cu -- lo de -- li -- cto -- rum. 
		Et gra -- _ ti -- a tu -- _ _ _ a il -- 
		lis suc -- _ _ _ cur -- ren -- _ _ _ _ _ te me -- re -- an -- tur e -- 
		_ _ va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- nis, et lu -- 

		_ cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- fru -- i, per -- fru -- 
		i, per -- fru -- i.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \alto >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Tractus }
	}
}

% OFFERTORIUM

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 f g g s g8 f g s g8 a bes g g f s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		\[d1 f\breve\] d4 f \[es2 d\] d
		r d d1 e2 f2. f4 f2 | f2. f4 g g f d f2 r4 d2

		d4 bes c d1 r2 e \[d e\] e d d4 \[e2 f4.\] e8 d c bes4 c |
		e2 d4 e f2 r4 d d d f f | e2 f r4 f2 f4 f2 d |
		f g2. g4 e g f4. e8 d2 d r4 d e2 f2. f4 f2 |
		f2. d4 e f4. e4 d16 c d2 e r d1 e2 d2. d4 d2 e |

		f f2. f4 d d e2 d r4 d f2. f4 f2 f2. f4 |
		d2 e d f2. f4 d4 f d2 d r4 d d f \[f2 e\] |
		d1 \cadenzaOn d\breve \cadenzaOff \showBarLine \bar "|" d1 es d2 f2. d4 c1 f2. 
		f4 d f | \ficta es8 d4 c8 d1 r2 f2 g2. f4 f d4. c8 a4 bes c d2 \cadenzaOn d\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ glo -- _ ri -- _ æ,
		li -- be -- ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- _ rum, de pœ -- _ nis in -- fer -- _ _ _ _ _ _ _
		_ _ _ ni et de pro -- fun -- do la -- cu, li -- be -- ra e -- 
		as de o -- re le -- o -- _ _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- _ _ _ _ rus, ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet e -- as in lu -- cem san -- _
		_ ctam. Quam o -- lim A -- bra -- hæ pro -- 
		mi -- si -- _ _ _ _ sti et se -- mi -- ni e -- _ _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \alto >> 
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

alto = \new Voice {
	\relative c' {
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		\set Score.currentBarNumber = #67
		d1 f |
		g f4. e8 d4 f \ficta es c d2 \mark #9 r4 d d c d4. f8 e4 d d2 r4 d |
		d c d2 es4 f \ficta es2 d2. bes4 c2 \mark #10 c1 r2 r4 f2 e4 |
		f g f1 r4 f f g g1 e2. f4 f2 r d4. c16 d |

		\ficta es4 d2 c4 d2. d4 e2 f2. f4 g2 f4 f d2 \mark #11 e d1 es1
		d2 | f2. d4 c1 f2. f4 d f d \ficta es d1 |
		r2 f g2. f4 f d4. c8 a4 bes c d2 d1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Tu __ _
		_ su -- _ _ _ _ sci -- pe pro a -- ni -- ma -- bus il -- _ lis, pro
		a -- ni -- ma -- bus __ _ il -- _ _ _ lis qua -- rum 
		ho -- di -- e me -- mo -- ri -- am fa -- ci -- mus, 
		fac __ _ _ 	_ e -- _ as de mor -- te trans -- i -- re ad vi -- tam. 
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- _ _ _ sti
		et se -- mi -- ni e -- _ _ _ _ _ ius.
	}
}


\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \alto >> 
		>> 
	}
}


% SANCTUS 

alto = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a \override Stem.transparent = ##f
		\showBarLine \bar "|"
		\time 2/2
		
		r2 e1 \[f2 e\] c4 e2 e4 e e f2 r4 f2 
		e4 f2 e d4 f2 f4 e e f f2 e8 d e4 f e2
		\showBarLine \bar "|"
		d1 \[d2 f\] f2. f4 f f e2 c d2. d4 e2 e f1 \fermata
		f1 f2 e d2. d4 b1 \cadenzaOn c\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
		San -- ctus
		San -- _ _ ctus Do -- mi -- nus De -- us Do -- _ _ _ _ _ mi -- nus De -- us Sa -- _ _ _ ba -- oth
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \alto >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Sanctus }
	}
}

% BENEDICTUS

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn
		\override Stem.transparent = ##t f8 g a a s a s a a s \override Stem.transparent = ##f 
		\cadenzaOff \showBarLine \bar "|"
		
		d,2 f4 f e1 f2. d4 d1\fermata e2. d8 c d2 e
		c d b1 c\breve
		\showBarLine \bar "||"
	}
	\addlyrics {
		Be -- ne -- di -- ctus qui ve -- nit.
		In no -- mi -- ne Do -- mi -- ni, O -- _ _ san -- na
		in ex -- cel -- sis. __
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \alto >> 
		>> 
	}
}

% AGNUS DEI

alto = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		e2 e4 e f1 d4 d e2 e1\fermata d f2 f2. f4 d2. e4 \cadenzaOn e\longa \cadenzaOff \showBarLine \bar "|" \break

		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		f2 f4 f e1 e4 c d2 e1\fermata e e2 f2. e8 d \[e2 f\] d2. d4 \cadenzaOn f\longa \cadenzaOff \showBarLine \bar "|" \break
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		e2 e4 e f1 d4 d f2 e1\fermata e e g e2 e2. e4 f2 f2. f4 d1 \cadenzaOn e\longa \cadenzaOff \showBarLine \bar "||"
	}
	\addlyrics {
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e is __ _ re -- _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \alto >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Agnus Dei }
	}
}

% COMMUNIO

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn a'8 s g f g a a g s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		e1 e2 e d4 e2 c4 d d b4. c8 d4 e a,2 |
		r4 d f e2 f4 d e4. c8 d4 e2. \mark #11 f4. e8 c4 f e4. d8 c b a4 d f2 |
		e4 f d e2 e4 d2 e \times 2/3 { c4 d e } a, e'2 d8 c b4 b c d e2 d1
		r4 \mark #12 b c d e2 d1. r4 b c d e2 d1 | \showBarLine \bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn g8 a c s  c c c s  c c s  c c s  d c c \fermata s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		
		g2 g4 g f2. f4 g2 g2.
		g4 g2 f4 d \cadenzaOn d2 ~ d\breve \cadenzaOff |
		d2 f e4 f d e4. c8 d4 e2. f4. e8 c4 f e4. d8 c b a4 d f2 |

		e4 f d e2 e4 d2 \mark #13 e \times 2/3 { c4 d e } a, e'2 d8 c b4 b c d e2 d1
		r4 b | c d e2 d1. r4 b c d e2 \cadenzaOn d\breve \cadenzaOff | \showBarLine \bar "|"

		\cadenzaOn \override Stem.transparent = ##t
		s8 g8 a a g s  a s  a g g-- s \showBarLine \bar "|"
		s8 s4_"*" s g g-- a-- s8 \showBarLine \bar "|."
		\cadenzaOff
	}
	\addlyrics {
		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- at e -- _ _ is Do -- _ _ _ mi -- ne
		cum san -- ctis tu -- is in __ _ _ æ -- ter -- _ _ _ _ _ _ _ num, cum san -- 
		ctis tu -- is in æ -- ter -- _ _ _ _ _ _ _ _ num,
		qui -- a pi -- us es, qui -- a pi -- us es, qui -- a pi -- us es.
		
		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 
		
		Et lux per -- pe -- tu -- a lu -- 
		ce -- at e -- _ is.
		Cum san -- ctis tu -- _ _ _ is, cum san -- _ ctis tu -- _ _ _ _ is
		in æ -- _ _ _ _ ter -- _ _ _ _ _ _ _ _ _ num, 
		qui -- a pi -- us es, qui -- a pi -- us es, qui -- a pi -- us es.
		
		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \alto >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Communio }
	}
}
