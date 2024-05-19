% http://www.cpdl.org/wiki/index.php/Missa_pro_defunctis_(Jacobus_Clemens_non_Papa)
% Copyright ©2024 Peter Hilton - https://github.com/hilton

\version "2.24.2"
\pointAndClickOff
revision = "14"

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
		"Missa defunctorum (tenor)"
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

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f4 g f f \fermata \cadenzaOff
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		r1 r2 \[f\breve g1 a1\] a1 f2 g g \mark \default f a
		a g a a c4. bes8 a4 g a bes g1 \mark \default f2 a \[a
			 
		g\] a bes g f1 r2 \[a c\] c \[c a\]
		bes a4 g8 f g2 f \fermata
		\showBarLine\bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn s8 f8 s g8 a a s a8 a s a8 a s a8 s g8 g a \fermata s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		
		
		a1 c c4 c c c d2. d4
		d2. d4 c bes c2 r4 a c c c2 c4 d d c bes a g2 a
		r4 a c c c2 a c1 c2. a4 bes4. a8 f4 g a1
		\showBarLine\bar "||"
	}
	\addlyrics {
		Re -- _ qui -- em 
		Ae -- _ _  ter -- _ _ nam, __ _ do --
		na __ _ e -- is __ _ _ _ _ Do -- mi -- ne, __ _ 
		et lux __ _ per -- pe -- tu -- a lu -- _ ce -- at __ _ _
		e -- _ _ _ is.
		
		Te de -- _ cet hym -- nus De -- us in Sy -- on, __ _

		Et ti -- bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro ve -- _ _ _ _ ni -- et.
	}
}

\score {
	\transpose f g {
		<<
		      \new Staff << \globalF \tenor >> 
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

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"		
		\time 2/2
		
		f4. g8 a4 f c'1 c2. c4 c d bes2 c4 d c bes8 c d4 g, \[a2
		bes\] g1 f2 \fermata
		\showBarLine\bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		d'1 \[c2 bes\] \[c d\] g,4 c2 bes4 c2. f,4
		bes g a2 d2. c4 bes c4. bes8 bes2 a4 bes2 \fermata
		\showBarLine\bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		
		bes1 \[g2 d'\] c1 d2. d4 \ficta es d2 c4 d2. bes4 c bes2 a4 \mark #3 bes2 r4 a bes2 g
		bes bes4. c8 d2. bes4 c2. d4 bes2. g4 a bes2 a4 \[bes2 g\] f1
		\showBarLine\bar "||"

	}
	\addlyrics {
		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- _ _ ri -- e, Ky -- ri -- e e -- lei -- _ _ _ _ _ _ _ _ _ _ son.
		
		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- _ _ ste __ _ e -- lei -- _ son, e -- lei -- _ son, e -- _ lei -- _ _ _ _ son.

		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ _ 	e e -- lei -- _ _ son, e -- lei -- _ _ son, 
		e -- lei -- _ son e -- _ lei -- _ son, e -- lei -- _ _ _ _ _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \tenor >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Kyrie }
	}
}


% TRACTUS

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 g a b a g a a g s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		\[g2 c4.\] b8 a4 a d2 r4 \[g,2 c4.\] b8 a g a4 b |
		c2 r4 c2 c4 c2 c4. c8 a2 a b4. b8 \mark #4 c2 c b a4. b8 |

		c2 f, r4 \[f2 a\] c b4 | \mark #5 \[c2 d4.\] d8 e4 c2 a4 d4. c8 b4 a8 g |
		a2 g 
		\showBarLine \bar "|"
		\mark #6 r1 r r2 g \[g c2.\] b4 a c4.
		b16 a b4 c2 a4. g8 a4 bes a4. \ficta b!8 c4 g d'2 \mark #7 g,4 g2 g4 a2 c1 |
		b2 b4 a c b a fis g2 a g e4 g4. \ficta fis16 e \ficta fis!4 g2 \mark #8 r4 b a2 |

		c1 b2 d a c g b d4. d8 a2 c bes |
		a c c4 c2 b8 a b1 |
		\showBarLine\bar "||"
	}
	\addlyrics {
		Ab -- sol -- _ _ _ _ _ ve: __ _ 
		Do -- _ _ _ mi -- ne, Do -- _ _ _ _ _ mi -- 
		ne a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- fun -- cto -- _

		_ rum ab __ _ om -- ni vin -- _ cu -- lo de -- li -- cto -- _ _ _ _ 
		_ rum. Et gra -- _ ti -- a tu -- 
		_ _ _ a il -- _ _ lis suc -- _ _ cur -- ren -- te me -- re -- an -- tur 
		e -- va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- _ _ _ _ nis, et lu -- 

		cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- fru -- 
		i, per -- fru -- i. __ _ _ _
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \tenor >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Tractus }
	}
}

% OFFERTORIUM

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 f g g s g8 f g s g8 a bes g g f s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		\[a2 bes c1\] d2. c4 bes d bes c a2 g |
		r bes \[a bes\] c c2. c4 c2 d2. d4 \ficta es4. d8 c4 bes c2 r4 bes2

		a4 g2 | a1 r2 c \[a c\] c bes \[bes c\] d4 g,2 a4 |
		bes c2 bes4 c2 r4 bes a bes c d2 c4 d2 r4 d d d2 c bes4 |
		c2 es2. d4 c d c4. a8 bes2 a r4 a c2 d2. d4 d2 |
		d2 c4 bes c d4. c8 c2 \ficta b4 c2 | r \ficta b1 c2 a2. a4 a2 c |

		d c2. a4 bes d4. c16 bes c4 a2 r4 bes c2. c4 c2 d2. c4 |
		bes2 c a d2. c4 bes c bes2 a r4 a bes c d2 c4. bes8 |
		a g bes4 a2 g1 
		\showBarLine \bar "|"
		
		bes \[g2 c\] a r4 bes bes2 bes4 a8 g a2 d2.
		c4 bes c bes g a1 r2 d2 e2. d4 c bes a f \[g2 a\] g |
		\showBarLine \bar "|"
	}
	\addlyrics {
		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ _ glo -- _ _ _ _ _ ri -- æ,
		li -- be -- _ ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- rum, de pœ -- _ nis in -- fer -- _ ni, in -- _
		fer -- _ _ ni et de pro -- fun -- do la -- cu, li -- be -- ra e -- _
		as de o -- re le -- o -- _ _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- _ _ _ _ rus, ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum __ _ _ lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet e -- as in lu -- cem san -- _ _
		_ _ _ _ ctam. Quam o -- _ lim A -- bra -- hæ __ _ _ _ pro -- 
		mi -- si -- _ _ _ sti et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \tenor >> 
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
				f4 g bes bes bes a s  g f s  g bes bes bes a s  f g bes s  bes g a g f f s  a g a bes s  a g f f g g-- s 
				\showBarLine\bar "|"
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

tenor = \new Voice {
	\relative c'' {
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		\[bes1 c2.\] d4 |
		e2 d2. c4 bes c4. bes8 g4 a2 \mark #9 g4 bes a g a2 g4. f8 d2 r |
		r r4 g g f g2 bes4 bes4. a8 f4 g2 \mark #10 f r4 c'2 bes4 c d c2 |
		d4 \ficta es c2 bes r4 d d d d2 es4 d2 c8 bes c4 d c2 r bes1 

		g2 a2. a4 c2 d2. d4 \ficta es2 c4 c4. bes16 a bes4 \mark #11 c2 bes1 \[g2 |
		c\] a r4 bes bes bes2 a8 g a2 d2. c4 bes8 g c4 bes c a1 |
		r2 d e2. d4 c bes a f \[g2 a\] g1
		\showBarLine\bar "||"
	}
	\addlyrics {
		Tu __ _ _ 	_ su -- _ _ _ _ _ _ _ _ _ _ _ sci -- _ pe 
		pro a -- ni -- ma -- bus il -- _ _ _ lis qua -- rum ho -- _ _ _ _ di -- e me -- mo -- ri -- am fa -- _ _ _ _ ci -- mus, fac

		e -- as de mor -- te trans -- i -- re ad __ _ _ vi -- tam.
		Quam o -- _ lim A -- bra -- hæ __ _ _ _ pro -- mi -- si -- _ _ _ _ sti
		et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \tenor >> 
		>> 
	}
}


% SANCTUS 

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a \override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a1 \[c2 d\] b a c2. c4 c c d2. 
		\ficta bes4 c d2 c4 d2 r4 d2 c4 d4. c8 a1.
		\showBarLine\bar "|"
		a1 \[b2 c\] c2. c4 d d b2 a a2. a4 c2 b d1 \fermata
		c1 d2 c a2. f4 g a2 g4 a2 \showBarLine\bar "|"
	}
	\addlyrics {
		San -- ctus
		San -- _ _ _ ctus Do -- mi -- nus De -- us __ _
		Sa -- _ ba -- oth Sa -- ba -- oth __ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- _ _ sis
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \tenor >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Sanctus }
	}
}

% BENEDICTUS

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn
		\override Stem.transparent = ##t 
		f8 g a a s a s a a s \override Stem.transparent = ##f 
		\cadenzaOff \showBarLine \bar "|"
		
		a2 d4 d2 c8 b c2 c2. b4 a1 \fermata c2. b8 a b2 c2.
		 a4 bes a a g8 f g2 a\breve \showBarLine\bar "||"
	}
	\addlyrics {
		Be -- ne -- di -- ctus qui ve -- nit.
		In no -- mi -- _ _ ne Do -- mi -- ni, O -- _ _ san -- na
		in __ _ ex -- cel -- _ _ _ sis. __
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \tenor >> 
		>> 
	}
}

% AGNUS DEI

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c2 c4 c c1 b4 a c2 c1\fermata b c2 d2. c4 c b8 a b4 c4 c2 \showBarLine\bar "|"
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c2 c4 c c1 b4 a a2 c1\fermata b c2 d2. c4 c2. b8 a b4 c2 b4 c2 \showBarLine\bar "|"
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c2 c4 c c1 b4 a d2 c1\fermata b c d c2 c2. c4 c2 c2. c4 c b8 a b2 b1  \showBarLine\bar "||"
	}
	\addlyrics {
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is  re __ _ _ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter __ _ _ _ nam.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \tenor >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Agnus Dei }
	}
}

% COMMUNIO

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn a'8 s g f g a a g s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a1 c2 b4 c a c4. b8 g4 a2 g4. a8 b4 c4. b16 a a2
		g4 a2 r2 r4 a | c b c2 a4 \mark #11 d4. c8 a4 | b2 a r4 a d c2
		d4 b c | g c2 b4 c4. b8 a4 g r b c4. d8 e4 d g,8 c4 b8 c4 e, f g |

		a a g \mark #12 g2 a4 b c a r8 d, f4 g a2 g2 ~ g\breve
		\showBarLine\bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn g8 a c s  c c c s  c c s  c c s  d c c \fermata s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		
		e2 e4 e a,2. a4 e'2 e2. 
		d8 c d4 c2 b4 a2 g1 |
		r1 r2 r4 a c b c2 a4 d4. c8 a4 b2 a | r4 a d c2

		d4 b c g c2 b4 \mark #13 c4. b8 a4 g r b c4. d8 e4 d g,8 c4 b8 c4 e, f g |
		a a g g2 a4 b c a d, f g a2 g2 ~ g\breve |
		\showBarLine\bar "|"
		
		\cadenzaOn \override Stem.transparent = ##t
		s8 g8 a a g s  a s  a g g-- s \showBarLine \bar "|"
		s8 s4_"*" s g g-- a-- s8 \showBarLine \bar "|."
		\cadenzaOff
	}
	\addlyrics {
		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- at e -- is Do -- _ _ _ _ _ _ _ _ _ _ 
		mi -- ne cum san -- ctis tu -- is in __ _ æ -- ter -- num, cum san -- ctis 
		tu -- is in æ -- ter -- _ _ _ _ num,
		qui -- a pi -- us es, __ _ _ _ _ qui -- _ _ _ a pi -- us __ _ _ _ es, qui -- a pi -- us es.
		
		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 
		
		Et lux per -- pe -- tu -- a lu -- 
		_ _ _ ce -- at e -- is.
		Cum san -- ctis tu -- is in __ _ æ -- ter -- num, cum san -- ctis 

		tu -- is in æ -- ter -- _ _ _ _ num,
		qui -- a pi -- us es, __ _ _ _ _ qui -- _ _ _ a pi -- us __ _ _ _ es, qui -- a pi -- us es.
		
		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}


\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \tenor >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Communio }
	}
}
