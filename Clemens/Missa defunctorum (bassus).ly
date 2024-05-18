% http://www.cpdl.org/wiki/index.php/Missa_pro_defunctis_(Jacobus_Clemens_non_Papa)
% Copyright ©2024 Peter Hilton - https://github.com/hilton

\version "2.24.2"
% \pointAndClickOff
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
		"Missa defunctorum (bassus)"
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
	\time 2/2
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

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f4 g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		r1 f2. g4 a2 d,1
		c4 bes \ficta es2 d f4. e8 d4 c d1 c4 bes c2 \mark \default f,4 f'2 f4
		f2 c r4 f2 f4 f c d e f bes, c1 \mark \default f,2 r4 f' f2
			
		c f bes, c d4 f f a g f2 e8 d c4. d8 e4 f4. e8 c4 d2 
		bes c4 d c2 f, \fermata
		\showBarLine \bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn s8 f'8 s g8 a a s a8 a s a8 a s a8 s g8 g-- a-- s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"

		f1 c2 f f4 f f f d2. d4
		bes2. bes4 f' g f2 r4 f4 c f f2 f4 bes, bes f' g d \ficta es2 d
		r4 f f f f2. d4 c2 f c2. d4 bes1 f'
		\showBarLine \bar "||"
	}
	\addlyrics {
		Re -- _ qui -- em 
		Ae -- ter -- nam do -- na e -- is, ae -- ter -- _ _ _ _ _ _ _ nam do -- na e -- is,
		do -- na e -- is Do -- _ _ mi -- ne, __ _
		et lux __ _ per -- pe -- tu -- a lu -- ce -- at __ _ _ _ _ _ _ _ e -- _ _ _ _ _ _ _ is.

		Te de -- _ cet hym -- nus De -- us in Si -- on __ _
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro __ _ ve -- ni -- et. __ _
	}
}

\score {
	\transpose f g {
		<<
		      \new Staff << \globalF \bass >> 
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

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"		
		\time 2/2
		
		f1 c2 f f c f g f4 d f g d e f2
		bes, c1 f,2 \fermata
		\showBarLine \bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f'8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		bes,1 f'2 g f bes,4 bes'2 a4 g2 f4. e8 c4 d
		\ficta es2 d bes f' g4 c, d4. e8 f2 bes, \fermata
		\showBarLine \bar "|"

		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f'8 g a bes a a-- g-- s4_"*" a8 g f e f g f f-- \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		bes,1 es2 d4. \ficta es8 f2 c bes bes' g4 g a2 d, g es4 \ficta es f2 \mark #3 bes, f' bes,4 bes c2
		bes2 bes4 bes'4. a8 g f g2 f4. g8 a4 f g2 es d4. \ficta e!8 f2 bes, c f,1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ e -- _ lei -- _ _ _ son e -- lei -- _ _ son.

		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- _ _ ste __ _ e -- lei -- _ _ _ _ _ _ son, Chri -- _ ste e -- lei -- _ _ son.

		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ _ _ _ 
		e, Ky -- rie e -- lei -- son, Ky -- rie e -- lei -- son, Ky -- rie e -- lei -- 
		son, e -- _ _ _ _ _ lei -- _ _ son e -- _ lei -- _ _ _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalF \bass >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Kyrie }
	}
}


% TRACTUS

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 g a b a g a a-- g-- s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		r1 r r2 c, f4. e8 d4 d |
		c1 r4 c2 c4 c2 f4. f8 d4 d g4. g8 \mark #4 c,4 c2 a4 b4. c8 d2 |

		c2 r4 f2 a2 c4. b8 a g f4 g \mark #5 f4. e8 d4 d c2 f d d1
		g,2 \showBarLine \bar "|"
		\mark #6 r1 r r c2 c f2. e4 |
		d2 c d4 d2 bes4 f'2. e4 d2 \mark #7 c1 r2 r4 c2 c4 |
		e2 g4 f e4. e8 cis4 d e4. e8 d2 b c a g \mark #8 r4 g' d2 |

		c2. c4 g'2 d f c e g4. g8 d2 f2. f4 d1
		c2. c4 g1.
		\showBarLine \bar "||"
	}
	\addlyrics {
		Ab -- sol -- _ _ _ _ _ ve __ _ 
		Do -- _ _ _ mi -- 
		ne a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- fun -- cto -- _ _

		rum ab __ _ om -- _ _ _ _ ni vin -- _ _ cu -- lo de -- li -- cto --
		rum. Et gra -- _ ti -- 
		a tu -- a il -- lis suc -- cur -- ren -- te me -- re -- 
		an -- tur e -- va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- nis, et lu -- 

		cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- fru -- i, 
		per -- fru -- i.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalC \bass >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Tractus }
	}
}

% OFFERTORIUM

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 f g g s g8 f g s g8 a bes g g-- f-- s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		d2 g f1 bes,2. f'4 g d \ficta es c d2 g, |
		r g' d g c, f2. f4 f2 bes2. bes4 es, \ficta es f g f2 g2.

		d4 \ficta es2 d1 r2 c d c c g' g a bes4. a8 g4 f |
		g c, g'2 f r4 g d g f d a'2 d, bes2. bes4 f'2 g |
		f c2. g'4 a g a f g2 d r4 d c2 bes2. bes4 bes2 |
		bes' f4 g2 f4 g1 c,2 r g'1 c,2 d2. d4 d2 c |

		bes f'2. f4 g bes a2 d, r4 g4 f2. f4 f2 bes2. f4 |
		g2 c, d bes2. f'4 g f g2 d r4 d g f bes,2 c |
		d1 g, \showBarLine \bar "|"
		g'2. g4 es2 c d2. bes4 bes2 f'2. f4 bes,2 |
		f' g4 f g \ficta es d1 r2 d c2. d4 f g d f \ficta es2 d g, |
		\showBarLine \bar "|"
	}
	\addlyrics {
		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ _ glo -- ri -- æ, rex glo -- _ ri -- æ
		li -- be -- _ ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- rum, de pœ -- _ nis in -- fer -- _ _ _ _ _ 
		_ _ _ ni et de pro -- fun -- do la -- cu, li -- be -- ra e --
		as de o -- re le -- o -- _ _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- rus, __ _ ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet e -- as in lu -- cem san -- _
		_ ctam. Quam o -- lim __ _ A -- bra -- hæ pro -- mi -- si -- 
		_ _ _ _ _ sti et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalF \bass >> 
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
				\clef "bass"
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

bass = \new Voice {
	\relative c {
		\clef "bass"
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		g'1 f2. e8 d |
		c2 g'4. a8 bes4 f g f c \ficta es d2 g,4 \mark #9 g' f \ficta e! d2 g,4 g' g f g bes2
		a4 g4. f8 | es4 d c2 bes4 g d'2 c \mark #10 r4 f2 e4 f g f2 a4. g8 |
		f4 es f2 bes, bes' bes4 g g1 a2. d,4 f2 r g1
		
		\ficta es2 | d2. d4 c2 bes2. bes'4 es,2 f4 f g2 \mark #11 c, g'2. g4 es2 |
		c d2. bes4 bes2 f'2. f4 bes,2 f' g4 f g c, d1 |
		r2 d c2. d4 f g d f es2 d g,1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Tu su -- _ _ sci -- pe pro a -- ni -- ma -- bus il -- _ _ lis, pro a -- ni -- ma -- bus, pro a -- ni -- ma -- bus 
		il -- lis, pro a -- ni -- ma -- bus il -- lis __ _ qua -- rum ho -- di -- e, qua -- rum ho -- di -- e __ _
		me -- mo -- ri -- am fa -- ci -- mus, fac

		e -- as de mor -- te trans -- i -- re ad vi -- tam. Quam o -- lim __ _
		A -- bra -- hæ pro -- mi -- si -- _ _ _ _ _ sti
		et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalF \bass >> 
		>> 
	}
}


% SANCTUS 

bass = \new Voice {
	\relative c' {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4-- a-- \override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		r2 a1 d,2 e a, a'2. a4 f f \ficta bes2
		g2 f4. g8 a4 a d,4. e8 f4 d a'2 d,1 a 
		d g2 f f2. f4 d d e2 a, d2. d4 a2 e' d1 \fermata 
		f1 bes,2 c d2. d4 e1 a,2
		\showBarLine \bar "|"
	}
	\addlyrics {
		San -- ctus
		San -- _ _ ctus Do -- mi -- nus De -- us 
		Do -- mi -- _ nus De -- us __ _ _ Sa -- _ ba -- oth
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalC \bass >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Sanctus }
	}
}

% BENEDICTUS

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn
		\override Stem.transparent = ##t f8 g a a s a s a a s \override Stem.transparent = ##f 
		\cadenzaOff \showBarLine \bar "|"
		
		d,2 d4 d a'1 f2. g4 d1 \fermata c2 g'1 c,2
		f d e1 a,\breve
		\showBarLine \bar "||"
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
			\new Staff << \global \globalC \bass >> 
		>> 
	}
}

% AGNUS DEI

bass = \new Voice {
	\relative c' {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c,2 c4 c f1 g4 d c2 c1\fermata g' f2 d2. f4 g2. c,4 c2 \showBarLine \bar "|"
		
		\override Stem.transparent = ##t a'4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		f2 f4 f c1 e4 a, d2 c1\fermata e a,2 d2. a4 a'2 f g2. g4 f2 \showBarLine \bar "|"
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		a2 a4 a f1 g4 d d2 a1\fermata e' a g c,2 c2. c4 f2 f2. f4 g1 e \showBarLine \bar "||"
	}
	\addlyrics {
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalC \bass >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Agnus Dei }
	}
}

% COMMUNIO

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn a'8 s g f g a a-- g-- s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a,1 a8 b c d e4 c d a e'2 d e4 g4. f8 e d c4 d |
		b2 a r1 r1 r4 \mark #11 d f2 d4 e c f2 d4. e8 f g |
		a4 f g c, e4. f8 g2 c, r4 e | f g a2 g4. f8 e4 d c2 d4 g, |

		d'2 r4 \mark #12 g e d g c, d d2 g,4 d'2 r4 g, c b c2 g1 |
		\showBarLine \bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn g'8 a c s  c c c s  c c s  c c s  d c c-- s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		
		c,2 c4 c f2. f4 c2 c 
		g'2. e4 f g d2 g,1 |
		\showBarLine \bar "|"
		r1 r r r4 d' f2 d4 e c f2 d4. e8 f g |

		a4 f g c, e4. f8 g2 \mark #13 c, r4 e f g a2 g4. f8 e4 d c c d g, |
		d'2 r4 g e d g c, d2. g,4 d'2 r4 g, c b c2 g1 |
		\showBarLine \bar "|"
		
		\cadenzaOn \override Stem.transparent = ##t
		s8 g'8 a a g s  a s  a g g-- s \showBarLine \bar "|"
		s8 s4_"*" s g g-- a-- s8 \showBarLine \bar "|."
		\cadenzaOff
	}
	\addlyrics {
		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- _ _ _ _ _ at e -- is Do -- mi -- ne, __ _ _ _ _ _ _ _
		cum san -- ctis __ _ _ tu -- _ _ _ _ _ is in æ -- ter -- _ _ num,
		qui -- a pi -- us es, __ _ _ _ _ _ _ _ qui -- a pi -- us __ _ _ es, __ _ _ qui -- a pi -- us es.
		
		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 

		Et lux per -- pe -- tu -- a lu -- 
		_ ce -- at e -- is. __ _ 
		Cum san -- ctis tu -- is in æ -- _ _ _ _ _ _ _ ter -- _ _ num,
		qui -- a pi -- us es, __ _ _ qui -- a pi -- us __ _ es, qui -- a pi -- us __ _ es, __ _ _ qui -- a pi -- us es.
		
		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \global \globalC \bass >> 
		>> 
	}
	\header {
		piece = \markup \larger \sans { Communio }
	}
}
