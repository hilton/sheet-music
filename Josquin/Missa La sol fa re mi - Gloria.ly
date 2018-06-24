% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "5"
\pointAndClickOff

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
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
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
	\key c \major
	\time 3/2
	\tempo 2 = 56
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem #'transparent = ##t 
        c d f s f s f s s  e s s  f s g s e s g f e s e-- s s \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Gló -- _ _ ri -- a in ex -- cél -- sis Dé -- _ _ o,
		}
	>>
	\header {
		piece = \markup \larger \sans { Gloria }
	}
	\layout {
		ragged-right = ##t
    \context {
  		\Voice
  		\remove "Ambitus_engraver"
  	}
	}
}

soprano = \new Voice	{
	\relative c' {
    e1 g2 a1 a2 g4. a8 b2. a8 b c4 b4. a8 a2 \ficta gis4 
    a2 r4 a a g a f g e2 d4 e1 r2 g2 a1 
    g2 e r4 g f g a2 g r4 e f g a a g2 e4 g a
    b4 c4. b8 g4 a2 g8 \ficta fis g4 e g4. a8 b c d4 c b4. a8 a2 \ficta gis4 a c2 c4 c b c b c b g2 r1. r1.
    r4 g b a c4. b8 g4. c b a g a g f e a g8 [ e g a ] f4 e4. c8
    e4 g2 a4 b c4. b8 a4. g8 f e d1 r4 d g2 a4 b4. g8 g2c4 a b4. g8 g e e4 a f g4. e8 e c c4
    g'2 e4 f2. e8 d d4 g4. f8 e d \[ c2 d \] c2 r4 g' a c4. b8 g b a4. g8 e4b' c4. b8
    g4 a2 \ficta gis4 a c b c2 b4 a b ~ b a4 g a2 \ficta gis4 a e f1 
    \set Timing.timing = ##f e\breve \showBarLine \bar "||" \set Timing.timing = ##t \break
    
    \set Score.currentBarNumber = #41 \time 2/2
    r1 a1 c2 c b g a b c b4 a \break 
    g1 r2 g1 g2 g1 f2. e8 d f4 e2 d8 c e4 d r d2 c8 
    b b4 a8 g g2 g'2 g2. f8 e e4 c g'2. a4 b c ~
    c b8 a g4 a2 g8 f e2 r g2. g4 g2 g4 g g e \ficta fis2
    g2 a1 d,\breve r1 r2 d e4. f8 [g a] b4 ~ \break
    b8 a8 a2 \ficta gis4 a2 r r1 r r a4. b8 [c d] e4 ~ \break
    e d2 \ficta cis4 d a c b a g f2 e r r4
    a4 g g a f e2 r \tuplet 3/2 {a4 a a}  \tuplet 3/2 {g2 g4}  \tuplet 3/2 {a f2} e2 r r4 a g g a f e2 \break
    r b' c b4 g4. f8 g a b4 b e,2 r4 g g4. a8 b c b4. a8 c2 b8 a g\breve r1 r2 r4 e e4. f8 g a b4. a8 a2 \ficta gis4 \break
    a a a a c2 b4 g a g c b e, a g4. f8 d4. e8 f g a b c4. b8 g4 a b2 c4. b8 g4 d
    a'4. g8 e4 g a b c2. b8 a g\breve
    \showBarLine \bar "|."
  }
	\addlyrics {
    Et in ter -- ra pax __ _ _ _ _ _ ho -- _ mi -- ni -- bus.
    Bo -- ne vo -- lun -- ta -- _ _ _ tis. Lau -- da -- 
		mus  te, a -- do -- ra -- mus  te, glo -- ri -- fi -- ca -- mus te. Gra -- _ ti -- as 
		a -- _ _ gi -- _ _ mus __ _ ti -- _ _ _ _ _ _ _ _ _ bi,
    prop -- ter mag -- nam glo -- ri -- am  tu -- am
    Do -- mi -- ne  De -- _ us
    Rex  cae -- les -- tis  De -- us Pa -- ter
    om -- _ _ _ _ _ ni -- po -- tens, om -- _ _ ni -- _ _ _ po -- _ tens.
    Do -- mi -- ne  Fi -- _ li  u -- ni -- ge -- _ _ ni -- te,
    Je -- su  Chri -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ te.
    Do -- mi -- ne __ _ _ _  De -- _ us Ag -- _ nus De -- _ _ i  Fi -- _ _ _  li -- us  Pa -- _ _ _ _ _ _ tris.
    Qui tol -- lis pec -- _ ca -- ta  mun -- _ _ di,
    mi -- se -- re -- re __ _ _ _  no -- _ _ _ bis,
    qui __ _ _  tol -- _ _ lis pec -- ca -- _ _ _ ta  mun -- _ _ _ _ _ _  di, __ _ _ _
    su -- sci -- pe de -- pre -- ca -- ti -- o -- nem  nos -- tram.
    Qui  se -- _ _ _ _ _ _ _ des ad __ _ _ _ _ dex -- te -- ram __ _   Pa -- _ _ _ _ tris 
    mi -- se -- re -- re  no -- bis.
    Quo -- ni -- am  tu  so -- lus  Sanc -- tus,
    tu so -- lus  Do -- mi -- nus,
    tu so -- lus  Al -- _ _ _ tis -- si -- mus
    Je -- su __ _ _ _  Chri -- _ _ _ _ ste
    Cum Sanc -- _ _ _ _ to Spi -- ri -- tu, in glo -- ri -- a
    De -- i Pa -- _ _ _ tris
    A -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ men.
	}
}

alto = \new Voice	{
	\relative c' {
    b2 c b a c2. d4 e1 r2 e e e c4. d8 e4 c f e c d4. c8 b2 a4 b2 r4
    e4. d8 c a b2 r4 a c d e2 r4 b c b a g c4. d8 e2 r4 g f e4. c8 d4 e b c4. b8 a4 g c8 d
    e2 d4 e1 r1 r1. 
    e1 e2 e1 e2 d4 c a1 b1
    r4 c2 e4 d f4. e8c4 e2
    f4 g4. \ficta fis16 e \ficta fis4 g c,d e4. d8 a'4 g c, d e4. c8 d4 e g4. f8 e4. d8 c4 b a c2 r4 d2. b4 g d'2
    g,4 c2 d4 e4. c8 c2 f4 d e4. c8 c a a4 d b c4. a8 a4 g c4. b8 a2 f g1 
    r1. r r2.
    g4 a c b8 a c4 b8 a b4 a2 r4 e'4 f d r d e c r c d b c2 \[ a1 g\breve \]
    
    d'1 f2 f e c d e f e4 d \[c2 d \] e2. c2 b8 a c4 b g2 c b b a r4 a4. b8 c d e4 f g2. f8 e d2. b2 a8 g g2 r1 r1 
    r1 r1 r1 e'\breve. d1 c2 a b\longa r4 e2 d4 c a b2 
    r1 r1 a4. b8 [c d] e4. d8 d2 \ficta cis4 d
    a'2 g4 f d e2 d4 f e g f e2 d4 e c b2 r2 r4 e d d e c b2 r \tuplet 3/2 {e4 e e}  \tuplet 3/2 {d2 d4}  \tuplet 3/2 {e4 c2} b2 r2 r4
    e4 d d e c b2 r r4 e d e2 d8 c b2 r4 e d e b g'2 g4 f e2 d4 
    b\breve r1 r1 r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 
    d4. c8 a4. b8 c d e4 a, r d e8 c
    e4. d8 b4 c8 a c2 b4 d2 \tuplet 3/2 {c2 a c} b\breve
	}
	\addlyrics {
    Et in ter -- ra pax __ _ _ ho -- mi -- ni -- bus, __ _ _
    bo -- ne vo -- lun -- ta -- _ _ _ tis, Lau -- da -- mus __ _ te,
    lau -- da -- mus  te, be -- ne -- di -- ci -- mus te, __ _ _ a -- do -- ra -- _ mus  te,
    glo -- ri -- fi -- ca -- _ _ _ _ mus te.
    prop -- ter mag -- nam glo -- _ ri -- am
    Do -- mi -- ne  De -- _ us  Rex  cae -- les -- _ _ _ tis  De -- us Pa -- _ _ ter
    om -- _ ni -- _ _ _ _ _ _ _ _ _ po -- tens.
    Do -- mi -- ne  Fi -- li  u -- ni -- ge -- ni -- _ _ _ _ _ _ _ te
    Je -- su  Chri -- _ _ _ _ _ _ _ te.
    Ag -- nus De -- _ _ _ _ _ _ i
    Fi -- li -- us Fi -- li -- us Fi -- li -- us  Pa -- _ tris.
   
    Qui tol -- lis pec -- _ ca -- ta  mun -- _ _ _ _ di,
    mi -- se -- _ re -- _ _ _ re  no -- bis,
    qui __ _ _ _ _ _ tol -- _ _ _ _ _ _ lis 
    su -- _ _ sci -- pe Qui __ _  se -- _ des
    ad __ _ _ _ _ _ dex -- te -- ram  Pa -- _ _ _ _ _ _ _ _ _ _ _ _ _ tris
    mi -- se -- re -- re  no -- bis.
    Quo -- ni -- am  tu  so -- lus  Sanc -- tus,
    tu so -- lus  Do -- mi -- nus,
    tu so -- _ _ _ lus  Al -- tis -- si -- mus
    Je -- su Chri -- _ _ 
    ste Cum __ _  Sanc -- _ to Spi -- _ _ ri -- tu in __ _ glo -- ri -- a
    A -- _ _ _ _ _ _ men a -- _ _ _ _ _ _ _ _ _ _ _ _ _ men.
	}
}

tenor = \new Voice {
	\relative c' {
    \clef "treble_8"
    e1 e2 d4 c a1 b1 e2. d4 c a b2 
    r1. r1. r1. e2 d4 c a2 
    b r4 e2 e4 d4 c a2 b r4 e d c a2 b e d4 d c2. a4 b2 r1. r1.
    r4 a2 a4 a g a g a g e c' b a8f'4 e8 e2 d4 e g4. f8 d4 
    r2 r1. r1. r1. r1. e1. d4 c a1 b1. r1. r1. r1. e1 d4 c
    a2 b1 
    r2 r4 g a c4 ~ \break c8 b8 g b a4. g8 e d e g f4. e8 c4 r2.
    e'\breve d1 c2. a4 b2 r4 e2 d4 c a b\breve
    
    r1 r1 r1 r1 r1 r1 r1 e\breve d c2 a 
    b\breve. r1 r1 r2 r4 c4 ~
    c d4 e f2 e8 d c4 a c2 b2. b4 b2 c4 c c c a b4. a8 g4 ~
    g \ficta fis8 e f g
    a8 f g1 r4 g f g4. a8 b c d4 e d g, f g2 f8 e e4 b' c d e2     
    r4 a,2 g4 f d e2 r4 a2 g4 f d e2
    r1 r1 r1 r1 r4 e'2 d4 c a b2 r2 r4 e ~
    e d4 c a b2 r2 r4 e2 d4 c a b2 r1  r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 e2 d4 c2 a2 
    e'2 r4 e,4 e4. f8g a b4. c8 d4. a8 c4 b2 a1 r2 r1 r4
    a4 c d e2 r4 e,4 f g a b c d e4.d8 b4 
    r4 r2 r2 r4 e ~ 
    e d4 c a b2 r4 a2 g4 f d e\breve.
	}
	\addlyrics {
    Et in ter -- _ ra pax ho -- _ mi -- ni -- bus.
    Lau -- da -- _ mus 
    te, be -- ne -- di -- ci -- mus te, a -- do -- ra -- mus  te, glo -- ri -- fi -- 
    ca -- mus te. Prop -- ter mag -- nam 
    
    glo -- ri -- am  tu -- _ _ _ _ _ _ _ _ _ am __ _ _
    om -- ni -- _ po -- tens.
    Je -- su __ _  Chri -- te.
    Do -- mi -- ne __ _ _ _  De -- _ _ _ _ _ _ _ us 
    Fi -- _ _ li -- us  Pa -- _ _ _ tris.
   
    mi -- se -- re -- _ re
    pec -- ca -- ta  mun -- _ _ _ _ di,
    su -- sci -- pe de -- pre -- ca -- ti -- o -- nem __ _  nos -- _ _ _ _ _ _ tram.
    Qui __ _   se -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ des
    ad __ _ dex -- te -- ram Pa -- _ _ _ tris
    mi -- se -- re -- _ re
    tu so -- lus sanc -- tus
    so -- lus Do -- mi -- nus, tu __ _ so -- _ lus Al -- _ tis -- si -- mus, Je -- us Chri -- _ 
    ste.
    Cum Sanc -- _ _ _ _ _ _ to Spi -- ri -- tu in glo -- ri -- a,
    in glo -- ri -- a De -- _ i Pa -- _ tris 
    De -- i Pa -- _ tris. A -- _ _ _ men.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
    e1 e2 f1 f2 e1 r2 e e e f e4 f4. d8 e4 f d e g f2 e1 r2 e f f e
    r4 e2 e4 f e f2 e r4 c d e f2 e r4 e f g a4. g8 e4 f e2 r e g4 g a g a2 b a4 a,2 a4 a
    e'4 r e a, e'4. c8 c4 g' a2 g4 f2 e r4 g b a c4. b8 g4 f a4. b8 c2 r r r1. r1. c,1 c'4. b8 g4 a4. g8 f e d2 b4 g g'2 g
    r1. r1. r1. c,1 d2 d g, r4 g'4 a c4. b8 g b a4. g8 e d e g f4. e8 c4 g'a c4. b8
    g8 b a4. g8 e1 r4 a g a f g f g e f e f d e  \[ c2 d \] a2 e'\breve
    
    d1 d2 d a' a g2. f8 e \[ d2 g \] \[ a b \] c1 r2 c, c c g'1 \[ d1 a' \] 
    g1 r2 g g2. f8 e e4 c g'2. a4 b c2 b8 a g4 a4 ~
    a g8 f e4 d
    f4 g a2 r e2. e4 e2 c4 c c c d2 b a1 g4 g'2 f8 e g4. f8 d4 g, r g'2 f8 e g4. f8 d4 g,
    c4. d8 [e f] g4 a f e2 a,4. b8 [c d] e4. d8 d2 \ficta cis4 d2 r r1 r4 d c c d \ficta bes a2 r1 r1 r4
    a'4 g g a f e2 r2 \tuplet 3/2 {a4 a a } \tuplet 3/2 {g2 g4 } \tuplet 3/2 {a4 f2 } e2 r r4 a g g a f e2 r e2 ~ 
    e g2 a r4 e e2 g a r4 e e2 g a f e1 r4 e e4. f8 g a b4. a8 a2 \ficta gis4 a4. a,8 a2 r2 r1 r4 a' a
    d,4 a'2 g4. f8 d4 e r g a f e g4. f8 d4. e8 f g a4. b8 c4. b8 g4 b a4. g8 e4 g f4. e8 c4 e d4. c8 a1 r2 e'2 e1
	}
	\addlyrics {
    Et in ter -- ra pax ho -- mi -- ni -- bus bo -- _ _ nae vo -- lun -- ta -- _ _ tis
    Lau -- da -- mus  te, be -- ne -- di -- ci -- mus te,
    a -- do -- ra -- mus te, glo -- ri -- fi -- ca -- _ _ mus te.
    Gra -- ti -- as a -- gi -- mus ti -- bi,
    prop -- ter mag -- nam
    glo -- ri -- am __ _ _ _ _ _  tu -- am Do -- mi -- ne  De -- _ _ _ _ _ us
    Do -- mi -- _ ne  Fi -- _ _ _ _ _ _ _ li
    Je -- su  Chri -- te.
    Do -- mi -- ne __ _ _ _  De -- _ _ _ _ _ _ _ us Ag -- nus De -- _ _ _ _ _ i
    Fi -- _ _ _ _ _ _ _ _ _ _ li -- us Pa -- _ _ tris.
    Qui  tol -- lis pec -- ca -- ta __ _ _ _ _  mun -- _ di,
    mi -- se -- re -- re  no -- _ bis,
    qui  tol -- _ _ _ lis pec -- ca -- ta  mun -- _ _ _ _ _ _ _ _  di, __ _ _
    su -- sci -- pe de -- pre -- ca -- ti -- o -- nem  nos -- tram.
    Qui __ _ _  se -- _ _ des, qui __ _ _  se -- _ _ _ _ _ _ _ _ _ _ des
    ad __ _ _ _ _ _ dex -- te -- ram
    mi -- se -- re -- re  no -- bis, mi -- se -- re -- re  no -- bis.
    Quo -- ni -- am  tu  so -- lus  Sanc -- tus,
    tu so -- lus  Do -- mi -- nus,
    tu so -- lus  Al -- tis -- si -- mus
    Je -- su __ _  Chri -- _ ste
    Cum Sanc -- _ _ _ _ to Spi -- _ _ ri -- tu, in glo -- ri -- a
    De -- i Pa -- tris.
    A -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ men, a -- men
	}
}


\score {
	\transpose c c {
		\new StaffGroup <<
 			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
	\layout { }
%	\midi {	}
}
