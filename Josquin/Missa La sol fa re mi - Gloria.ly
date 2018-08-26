% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "10"
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
		\remove "Forbid_line_break_engraver"
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

%{   ██████      ██         ██████      ██████      ██      █████
    ██           ██        ██    ██     ██   ██     ██     ██   ██
    ██   ███     ██        ██    ██     ██████      ██     ███████
    ██    ██     ██        ██    ██     ██   ██     ██     ██   ██
     ██████      ███████    ██████      ██   ██     ██     ██   ██  %}

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
        c4 d f s f s f s s  e s s  f s g s e s g f e s e2 s \showBarLine\bar "|"
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
		\context { \Voice \remove "Ambitus_engraver" }
		\context { \Staff
			\remove "Time_signature_engraver"
			\hide Stem
		}
	}
}

soprano = \new Voice	{
	\relative c' {
    e1 g2 a1 a2 g4. a8 b2. a8 b c4 b4. a8 a2 \ficta gis4 a2 r4 a a g 
		a f g e2 d4 e1 r2 g2 a1 g2 e r4 g f g a2 g 
		r4 e f g a a g2 e4 g a b4 c4. b8 g4 a2 g8 \ficta fis g4 e g4. a8 b c d4 c b4. a8 a2 \ficta gis4 
		a c2 c4 c b c b c b g2 r1. r1. r4 g b a c4. b8 
		
		g4. c b a g a g f e a g8 [ e g a ] f4 e4. c8 c4 g'2 a4 b c4. b8 a4. g8 f e 
		d1 r4 d g2 a4 b4. g8 g2 c4 a b4. g8 g e e4 a f g4. e8 e c c4 g'2 e4 f2 ~
		f4 e8 d d4 g4. f8 e d \[ c2 d \] c2 r4 g' a c4. b8 g b a4. g8 e4b' c4. b8 g4 a2 \ficta gis4 a c 
		b c2 b4 a b2 a4 g a2 \ficta gis4 a e f1 
    \set Timing.timing = ##f e\breve. \showBarLine \bar "||" \set Timing.timing = ##t
    
    \set Score.currentBarNumber = #41 \time 2/2
    r1 a1 c2 c b g a b c b4 a g1 r2 g1 g2 g1 
		f2. e8 d f4 e2 d8 c e4 d r d2 c8 b b4 a8 g g2 g'2 g2. f8 e e4 c g'2. a4 b c4 ~
		c b8 a g4 a2 g8 f e2 r g2. g4 g2 g4 g g e \ficta fis2 g2 a1 d,1 ~
		d r1 r2 d e4. f8 [g a] b4.
		a8 a2 \ficta gis4 a2 r r1 r 
		
		r a4. b8 [c d] e2 d2 \ficta cis4 d a c b a g f2 e r r4 a4 g g a f e2 
		r \tuplet 3/2 {a4 a a}  \tuplet 3/2 {g2 g4}  \tuplet 3/2 {a f2} e2 r r4 a g g a f e2 r b' c b4 g4 ~
		g8 f8 g a b4 b e,2 r4 g g4. a8 b c b4. a8 c2 b8 a g\breve r1 r2 r4 e 
		e4. f8 g a b4. a8 a2 \ficta gis4 a a a a c2 b4 g a g c b e, a g4. f8 d4. e8 f g a b c4. b8 g4 a 
		
		b2 c4. b8 g4 d a'4. g8 e4 g a b c2. b8 a g\breve \showBarLine \bar "|."
  }
	\addlyrics {
    Et in tér -- ra pax __ _ _ _ _ _ ho -- _ mí -- ni -- bus
    bó -- nae vo -- lun -- tá -- _ _ _ tis. Lau -- dá -- 
		mus te, a -- do -- rá -- mus te, glo -- ri -- fi -- cá -- mus te. Grá -- _ ti -- as 
		á -- gi -- mus tí -- _ _ bi, grá -- _ _ ti -- _ as á -- gi -- mus tí -- _ bi 
    prop -- ter mág -- nam gló -- ri -- am tú -- am.
    Dó -- mi -- ne Dé -- _ us,
    Rex cae -- lés -- tis, Dé -- us Pá -- ter
    om -- _ _ _ _ _ ní -- po -- tens, om -- _ _ ní -- _ _ _ po -- _ tens.
    Dó -- mi -- ne Fí -- _ li u -- ni -- gé -- _ _ ni -- te
    Jé -- su Chrí -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ te.
    Dó -- mi -- ne __ _ _ _ Dé -- _ us, Ag -- _ nus Dé -- _ _ i, Fí -- _ _ _  li -- us Pá -- _ _ _ _ _ _ tris.
    Qui tól -- lis pec -- _ cá -- ta mún -- _ _ di,
    mi -- se -- re -- re __ _ _ _  no -- _ _ _ bis,
    qui __ _ _ tól -- _ _ lis pec -- cá -- _ _ _ ta  mún -- _ _ _ _ _ _  di, __ _ _ _
    sú -- sci -- pe de -- pre -- ca -- ti -- ó -- nem nós -- tram.
    Qui sé -- _ _ _ _ _ _ _ des ad __ _ _ _ déx -- _ te -- ram __ _   Pá -- _ _ _ _ tris,
    mi -- se -- ré -- re nó -- bis.
    Quó -- ni -- am  tu só -- lus sánc -- tus,
    tu só -- lus Dó -- mi -- nus,
    tu só -- lus Al -- _ _ _ tís -- si -- mus,
    Jé -- su __ _ _ _  Chrí -- _ _ _ _ ste.
    Cum Sánc -- _ _ _ _ to Spí -- ri -- tu, in gló -- ri -- a
    Dé -- i Pá -- _ _ _ tris.
    A -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ men.
	}
}

alto = \new Voice	{
	\relative c' {
    b2 c b a c2. d4 e1 r2 e e e c4. d8 e4 c f e 
		c d4. c8 b2 a4 b2 r4 e4. d8 c a b2 r4 a c d e2 r4 b c b a g c4. d8 e2 
		r4 g f e4. c8 d4 e b c4. b8 a4 g c8 d e2 d4 e1 r1 r1. 
    e1 e2 e1 e2 d4 c a1 b1 r4 c2 e4 d f4. e8 c4 
		
		e2 f4 g4. \ficta fis16 e \ficta fis4 g c,d e4. d8 a'4 g c, d e4. c8 d4 e g4. f8 e4. d8 c4 b a c2 r4 d4 ~
		d2 b4 g d'2 g,4 c2 d4 e4. c8 c2 f4 d e4. c8 c a a4 d b c4. a8 a4 g c4. b8 a2 
		f g1 r1. r r2.
    g4 a c b8 a c4 b8 a b4 a2 r4 e'4 f d r d e c r c d b c2 \[ a1 g\breve. \]
    
    d'1 f2 f e c d e f e4 d \[c2 d \] e2. c2 b8 a c4 b g2 c b b a r4 
		a4. b8 c d e4 f g2. f8 e d2. b2 a8 g g2 r1 r1 r1 
		r1 r1 e'\breve. d1 c2 a b1 ~
		b\breve. r4 e2 d4 c a b2 r1 r1 a4. b8 [c d] e4 ~
		
		e8 d8 d2 \ficta cis4 d a'2 g4 f d e2 d4 f e g f e2 d4 e c b2 r2 r4 e d d e c 
		b2 r \tuplet 3/2 {e4 e e}  \tuplet 3/2 {d2 d4}  \tuplet 3/2 {e4 c2} b2 r2 r4 e4 d d e c b2 r r4 e d e ~
		e d8 c b2 r4 e d e b g'2 g4 f e2 d4 b\breve r1 r1 
		r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 d4. c8 a4. b8 c d e4 a, 
		
		r d e8 c e4. d8 b4 c8 a c2 b4 d2 \tuplet 3/2 {c2 a c} b\breve
	}
	\addlyrics {
    Et in tér -- ra pax __ _ _ ho -- mí -- ni -- bus __ _ _
    bó -- nae vo -- lun -- tá -- _ _ _ tis. Lau -- dá -- mus __ _ te,
    lau -- dá -- mus te, be -- ne -- dí -- ci -- mus te, __ _ _ a -- do -- rá -- _ mus te,
    glo -- ri -- fi -- cá -- _ _ _ _ mus te,
    prop -- ter mág -- nam gló -- _ ri -- am,
    Dó -- mi -- ne Dé -- _ us  Rex cae -- lés -- _ _ _ tis, Dé -- us Pá -- _ _ ter
    om -- _ ní -- _ _ _ _ _ _ _ _ _ po -- tens.
    Dó -- mi -- ne Fí -- li u -- ni -- gé -- ni -- te, u -- ni -- gé -- _ ni -- _ te
    Jé -- su  Chrí -- _ _ _ _ _ _ _ te.
    Ag -- nus Dé -- _ _ _ _ _ _ i,
    Fí -- li -- us, Fí -- li -- us, Fí -- li -- us Pá -- _ tris.
   
    Qui tól -- lis pec -- _ cá -- ta mún -- _ _ _ _ di,
    mi -- se -- _ ré -- _ _ _ re nó -- bis,
    qui __ _ _ _ _ _ tól -- _ _ _ _ _ _ lis 
    sú -- _ _ sci -- pe, Qui __ _ sé -- _ des
    ad __ _ _ _ _ _ déx -- te -- ram Pá -- _ _ _ _ _ _ _ _ _ _ _ _ _ tris,
    mi -- se -- re -- re  nó -- bis.
    Quó -- ni -- am tu só -- lus sánc -- tus,
    tu só -- lus Dó -- mi -- nus,
    tu só -- _ _ _ lus Al -- tís -- si -- mus,
    Jé -- su Chrí -- _ _ 
    ste. Cum __ _  Sánc -- _ to Spí -- _ _ ri -- tu in __ _ gló -- ri -- a,
    A -- _ _ _ _ _ _ men a -- _ _ _ _ _ _ _ _ _ _ _ _ _ men.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		e1 e2 d4 c a1 b1 e2. d4 c a b2 r1. 
		r1. r1. e2 d4 c a2 b r4 e2 e4 d4 c a2 b 
		r4 e d c a2 b e d4 d c2. a4 b2 r1. r1.
		r4 a2 a4 a g a g a g e c' b a8f'4 e8 e2 d4 e g4. f8 d4 r2 r1. 
		
		r1. r1. r1. e1. d4 c a1 
		b1. r1. r1. r1. e1 d4 c
		a2 b1 r2 r4 g a c4. b8 g b a4. g8 e d e g f4. e8 c4 r2. e'1. ~
		e2 d1 c2. a4 b2 r4 e2 d4 c a b\breve.

		r1 r1 r1 r1 r1 r1 r1 e\breve d1 ~
		d c2 a b\breve. r1 r1 r2 r4 c ~
		c d4 e f2 e8 d c4 a c2 b2. b4 b2 c4 c c c a b4. a8 g4 g
		\ficta fis8 e \ficta fis g a8 \ficta fis g1 
		r4 g f g4. a8 b c d4 e d g, f g2 f8 e e4 b' c d e2 r4 a,2 g4 f d e2 r4 a2 g4 
		
		f d e2 r1 r1 r1 r1 r4 e'2 d4 c a b2 r2 r4 e ~
		e d4 c a b2 r2 r4 e2 d4 c a b2 r1 r4 e2 d4 c a b2 
		r4 e2 d4 c a b2 r4 e2 d4 c2 a2 e'2 r4 e,4 e4. f8 g a b4. c8 d4. a8 c4 b2 a ~ 
		a r2 r1 r4 a4 c d e2 r4 e,4 f g a b c d e4. d8 b4 r4 r2 r2 r4 e ~
		
		e d4 c a b2 r4 a2 g4 f d e\breve.
	}
	\addlyrics {
		Et in tér -- _ ra pax ho -- _ mí -- ni -- bus.
		Lau -- dá -- _ mus 
		te, be -- ne -- dí -- ci -- mus te, a -- do -- rá -- mus te, glo -- ri -- fi -- 
		cá -- mus te. Prop -- ter mág -- nam 

		gló -- ri -- am tú -- _ _ _ _ _ _ _ _ _ am. __ _ _
		om -- ní -- _ po -- tens.
		Jé -- su __ _ Chrí -- ste.
		Dó -- mi -- ne __ _ _ _ Dé -- _ _ _ _ _ _ _ us 
		Fí -- _ _ li -- us Pá -- _ _ _ tris.

		mi -- se -- ré -- _ re,
		pec -- cá -- ta mún -- _ _ _ _ di,
		sú -- sci -- pe de -- pre -- ca -- ti -- _ ó -- _ nem nós -- _ _ _ _ _ _ tram.
		Qui __ _ sé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ des
		ad __ _ déx -- te -- ram Pá -- _ _ _ tris,
		mi -- se -- ré -- _ re,
		tu só -- lus sanc -- tus,
		só -- lus Dó -- mi -- nus, tu __ _ so -- _ lus Al -- _ tís -- si -- mus, Jé -- us Chrí -- _ 
		ste.
		Cum Sánc -- _ _ _ _ _ _ to Spí -- ri -- tu, in gló -- ri -- a,
		in gló -- ri -- a Dé -- _ i Pá -- _ tris,
		Dé -- i Pá -- _ tris. A -- _ _ _ men.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
    e1 e2 f1 f2 e1 r2 e e e f e4 f4. d8 e4 f d e g f2 e1 r2 e f f e
    r4 e2 e4 f e f2 e r4 c d e f2 e r4 e f g a4. g8 e4 f e2 r e g4 g a g a2 b a4 a,2 a4 a
    e'4 r e a, e'4. c8 c4 g' a2 g4 f2 e r4 g b a c4. b8 g4 f a4. b8 c2 r r r1. r1. c,1 c'4. b8 g4 a4. g8 f e d2 b4 g g'2 g
    r1. r1. r1. c,1 d2 d g, r4 g'4 a c4. b8 g b a4. g8 e d e g f4. e8 c4 g'a c4. b8
    g8 b a4. g8 e1 r4 a g a f g f g e f e f d e  \[ c2 d \] a2 e'\breve.
    
    d1 d2 d a' a g2. f8 e \[ d2 g \] \[ a b \] c1 r2 c, c c g'1 
		\[ d1 a' \] g1 r2 g g2. f8 e e4 c g'2. a4 b c2 b8 a g4 a ~ 
		a g8 f e4 d f4 g a2 r e2. e4 e2 c4 c c c d2 b a1 g4 g'2 f8 e 
		g4. f8 d4 g, r g'2 f8 e g4. f8 d4 g,
    c4. d8 [e f] g4 a f e2 a,4. b8 [c d] e4. d8 d2 \ficta cis4 d2 r r1 r4 d c c d \ficta bes a2 r1 r1 r4
    a'4 g g a f e2 r2 \tuplet 3/2 {a4 a a } \tuplet 3/2 {g2 g4 } \tuplet 3/2 {a4 f2 } e2 r r4 a g g a f e2 r e1 
		g2 a r4 e e2 g a r4 e e2 g a f e1 r4 e e4. f8 g a b4. a8 a2 \ficta gis4 a4. a,8 a2 r2 r1 r4 a' a
    d,4 a'2 g4. f8 d4 e r g a f e g4. f8 d4. e8 f g a4. b8 c4. b8 g4 b a4. g8 e4 g f4. e8 c4 e d4. c8 a1 r2 e'2 e1
	}
	\addlyrics {
		Et in tér -- ra pax ho -- mí -- ni -- bus bó -- _ _ nae vo -- lun -- tá -- _ _ tis.
		Lau -- dá -- mus te, be -- ne -- dí -- ci -- mus te,
		a -- do -- rá -- mus te, glo -- ri -- fi -- cá -- _ _ mus te.
		Grá -- ti -- as á -- gi -- mus tí -- bi,
		prop -- ter mág -- nam
		gló -- ri -- am __ _ _ _ _ _ tú -- am. Dó -- mi -- ne Dé -- _ _ _ _ _ us,
		Dó -- mi -- _ ne Fí -- _ _ _ _ _ _ _ li,
		Jé -- su Chrí -- ste.
		Dó -- mi -- ne __ _ _ _ Dé -- _ _ _ _ _ _ _ us, Ag -- nus Dé -- _ _ _ _ _ i,
		Fí -- _ li -- us, Fí -- _ li -- us, Fí -- _ li -- _ us Pá -- _ _ tris.
		
		Qui tól -- lis pec -- cá -- ta __ _ _ _ _ mún -- _ di,
		mi -- se -- ré -- re nó -- _ bis,
		qui tól -- _ _ lis __ _ pec -- cá -- ta mún -- _ _ _ _ _ _ _ _ di, __ _ _
		sú -- sci -- pe de -- pre -- ca -- ti -- ó -- nem nós -- tram.
		Qui __ _ _ sé -- _ _ des, qui __ _ _ sé -- _ _ _ _ _ _ _ _ _ _ des
		ad __ _ _ _ _ _ déx -- te -- ram,
		ad __ _ déx -- _ te -- ram, mi -- se -- ré -- _ _ re.
		Quó -- ni -- am tu só -- lus sánc -- tus,
		tu só -- lus Dó -- mi -- nus,
		tu só -- lus Al -- tís -- si -- mus
		Jé -- su __ _ Chrí -- _ ste
		Cum Sánc -- _ _ _ _ to Spí -- _ _ ri -- tu, in gló -- ri -- a
		Dé -- i Pá -- tris.
		A -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ men, a -- men.
	}
}


\score {
	\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 6)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
	>>
	\layout {
		ragged-last = ##t
	}
%	\midi {	}
}
