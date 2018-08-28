% CPDL #
% Copyright ©2018 Kees de With, Peter Hilton & Maarten Michielsen - https://github.com/hilton

\version "2.18.2"
revision = "13"
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
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Missa La sol fa re mi"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Josquin Des Prez (1455 - 1521)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Kees de With, Peter Hilton & Maarten Michielsen" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				revision \revision
			}
      \line {
				Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
			}
		}
	}
	tagline = ##f
}

\layout {
	indent = #0
	ragged-right = ##f
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


%{	██   ██     ██    ██     ██████      ██     ███████
		██  ██       ██  ██      ██   ██     ██     ██
		█████         ████       ██████      ██     █████
		██  ██         ██        ██   ██     ██     ██
		██   ██        ██        ██   ██     ██     ███████   %}

soprano = \new Voice	{
	\relative c'' {
  a1 g2 f1 d2 \[ e2 a \] g2 f1 d2	
	e4 g4. f8 g4 a b c4. b8 g4 a4. g8 f e d4 g4. c,8 c4 d f e4. a,8 a4 a'2 \ficta gis4 
	a1 r2 a1 a2 \[ g2 c \] b2 a1 a2 
	\set Timing.timing = ##f \ficta gis\breve.
  \showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #15 \time 2/2
  a1 g \[ f2 d \] e2 a2. g4 g2 f d e\breve r1 r1 
	r1 r1 r1 r2 b'2 c2. b8 a c2 b a1g2 c1 b2 a4 c b a2 \ficta gis8 \ficta fis \ficta gis2 a\breve
  \[ d,2 d' \] c2 a2. b4 c2 d1 \set Timing.timing = ##f	\ficta cis\breve
  \showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #44 \time 3/2
  a2 g4 f2 d4 e a g f2 d4 e a g f d2 e r a g4 c b a2 g8 f g4 e g a f2 e8 f g a
  b4 c a c b2 r c b4. a8 b4 c2 b8 a g4 c b a2 \ficta gis4 a c b a4. g8 f4 e2 r
  f e4. d8 e4 f2 e8 d c2 b4 a c4. d8 [ e f ] g2 e4 f e4. d8 g4. f8 e2 d4 
	\set Timing.timing = ##f	e\breve. \set Timing.timing = ##t	\showBarLine \bar "|." 
  }
	\addlyrics {
    Ký -- _ _ ri -- e_e -- _ _ lé -- i -- son, e -- _ _ _ _ lé -- _ _ _ _ i -- _ 
		son, Ký -- ri -- e  e -- _ lé -- _ _ _ i -- son, Ký -- ri -- e_e -- _ _ lé -- i -- 
		son. Chrí -- _ _ _ ste_e -- lé -- _ _ _ i -- son, 
		Chrí -- _ _ _ _ _ ste
		
    e -- lé -- _ _ _ _ _ _ _ i -- son, e -- _ _ lé -- _ _ 
		i -- son. Ký -- _ _ ri -- e_e -- lé -- _ _ i -- son, Ký -- _ _ ri -- e  e -- _ lé -- _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ i -- son, e -- _ _ _ lé -- _ _ _ _ _ _ i -- son, e -- _ lé -- _ i -- 
		son, e -- lé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son.
	}
}

alto = \new Voice	{
	\relative c' {
		r1. r1. r1. r1. e1 d2 c1 a2 
		\[ b e \] d c2. a4 b2 e4. d8 c4 a b2 r4 a2. d2 b4 e2 c4 d e f c d c f2 
		e\breve. \time 2/2 r1 e d c2 a \[b e2. \] d4 d2 c a b1 
		r1 r1 r1 r1 e d c \[ a2 b \] \[ c d \] 
		
		\[ b a \] e'1 f e1 c2 d a1 bes a2. g4 a1 
		\[ \ficta bes1 a\breve \] \time 3/2 r1. r1. r1. r1. r2  r4 a c d 
		b c b c d8 c b a g4. f8 g4 a c4. d8 [e f] g2 e4 f e4. d8 g4. f8 e2 d4 e2 r e c d1
    g,4 c2 a4 bes a4. g8 c4. \ficta bes8 a2 g4 a e' d c a2 b4 e d c a2 b4 e d c a2 b\breve.
  }
	\addlyrics {
		Ký -- _ _ ri -- e_e -- _ _ lé -- i -- son, 
		Ký -- _ _ ri -- e  Ký -- _ ri -- e e -- _ _ lé -- _ _ _ i -- son.
		Chrí -- _ _ _ ste_e -- lé -- _ _ _ i -- son,
		Chrí -- _ _ _ ste  e -- _ lé -- _ _ _ _ i -- son,
		e -- _ lé -- _ _ i -- son.
		Ký -- _ ri -- e  e -- lé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son
		Ký -- ri -- e e -- lé -- _ _ _ _ _ _ _ i -- son, 
		Ký -- _ _ ri -- e, Ký -- _ _ ri -- e e -- lé -- _ i -- son.
	}
}

tenor = \new Voice {
	\relative c' {
	  \clef "treble_8"
		a1 b4 c d2 r4 a b d c a2 g8 f e2 d4 d'4. e8 f2 e8 d 
		c2 r4 c, f g a4. g8 e4 f2 d4 g4. e8 e4 a d,2 a'2. f4 e2
		r4 a2 c4 d e f c d c f2 e4. d8 c4 a b e, r a d, a'4. d 
		b\breve. \time 2/2
    r1 r1 r1 r1 
		
		r1 r1 a1 g f2 \[ d e \] a2. g4 g2 f2. e8 d e4 f8 g a4 c b a2 \ficta gis4 \[ a1 e' \] f1 e \[ a,2 b \] \[ c2 d \] b2
    e,2 f2. e8 d \[ f2 e \] \[ f g \] \[ e d \] 
		f2 e \[ f g \] e\breve \time 3/2
    a2 b4 a d2 c4 f, e d d'2 c4 a b a b d c2 b4 a c d b a 		
		r1 r1. e'2 d4 c2 a4 b e d c2 a4 b e d c a2 b4 e4. d8 c a b2 r4
    a4 g f2 d4 e a g f2 d4 e a g f d2 e4
		e g a f2 e r1 r d2 g\breve.
  }
	\addlyrics {
		Ký -- _ ri -- e  e -- _ _ lé -- _ _ _ i -- son, e -- _ lé -- i -- _
		son, Ký -- ri -- e_e -- lé -- _ _ _ _ _ i -- son,  e -- _ lé -- i -- son,
		
    Ký -- _ _ ri -- e e -- lé -- i -- son
    Ký -- _ _ ri -- e __ _ e -- _ lé -- i -- son.
    Chrí -- _ _ _ ste_e -- lé -- _ _ _ _ _ _ _ _ _ _ _ _ i -- son, __ _ _ _
    Chrí -- _ ste __ _  e -- _ lé -- _ _ _ _ _ _ _ _ 
		_ _ i -- _ son.
		Ký -- _ _ ri -- e   e -- lé -- _ _ _ _ _ _ _ _ _ _ _ _ i -- son, __ _
    Ký -- _ _ ri -- e_e -- lé -- _ _ i -- son, Ký -- _ _ ri -- 
		e_e -- lé -- _ i -- _ son, Ký -- _ _ ri -- e_e -- lé -- _ _ i -- son,
    Ký -- _ _ ri -- e, 
		e -- lé -- _ i -- son, i -- son.
	}

}

bass = \new Voice {
	\relative c' {
		\clef bass
    r1. r1. r1. r1. 
		r1. r1. r1. r1. 
		a1 g2 f1 d2 \[ e2 a \] g2 f1 d2 
		e\breve. \time 2/2 r1 r1 r1 r1 
		
		r1 r1 r1 e1 d c2 a 
		b e1 d2 c a b1 r2 a'1 g2 \[ f d \] e2  a1 g2 \[ f d \] e1
    r2 d1 c2 \[ bes2 g \] a d1 c2 \[ \ficta bes g \] a\breve
    \time 3/2
    r1. r1. r1. a'2 g4 f2 d4 e a4 g f2 d4 e a g f \[ d2 e \] r2
    a2 g4 e g a f a g e g a f2 e4 c d f e2 a, r2 d c4 a c d bes d c a c d \ficta bes2 a r
    a'2 g4 e g a f a g e g a f2 e\breve.
  }
	\addlyrics {
    Ký -- _ _ ri -- e_e -- _ _ lé -- i -- son.
    Chrí -- _ _ _ ste_e -- lé -- _ _ i -- son,
    Chrí -- _ _ _ ste_e -- lé -- _ i -- _ son,
    Chrí -- _ _ _ ste_e -- lé -- _ i -- _ son. 
    Ký -- _ _ ri -- e, e -- _ lé -- i -- son,
		e -- lé -- _ i -- son,
    Ký -- _ _ _ _ _ _ _ _ _ _ ri -- e  e -- lé -- _ i -- son,
    Ký -- _ _ _ _ _ _ _ _ _ _ ri -- e  e -- lé -- _ _ _ _ _ _ _ _ _ i -- son.
	}
}

\score {
	\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
	>>
  \header {
		piece = \markup \larger \sans { Kyrie }
	}
	\layout {
		ragged-last = ##f	
	}
%	\midi {	}
}


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
		Lau -- dá -- _ mus te, be -- ne -- dí -- ci -- mus te, 
		a -- do -- rá -- mus te, glo -- ri -- fi -- cá -- mus te. 
		Prop -- ter mág -- nam gló -- ri -- am tú -- _ _ _ _ _ _ _ _ _ am. __ _ _
		
		Dó -- mi -- ne Fí -- li.
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


%{   ██████     ██████      ███████     ██████       ██████
    ██          ██   ██     ██          ██   ██     ██    ██
    ██          ██████      █████       ██   ██     ██    ██
    ██          ██   ██     ██          ██   ██     ██    ██
     ██████     ██   ██     ███████     ██████       ██████   %}

\score {
	\new Staff <<
		\new Voice = "tenor" {
			\relative c' {
				\clef "treble_8"
				\cadenzaOn
				a4 fis s  g s  e fis! s  a2 b
				\showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Cré -- do in ú -- num Dé -- um,
		}
	>>
	\header {
		piece = \markup \larger \sans { Credo }
	}
	\layout {
		ragged-right = ##t
		\context {
			\Staff
			\remove "Time_signature_engraver"
			\hide Stem
		}
		\context {
			\Voice
			\remove "Ambitus_engraver"
		}
	}
}

soprano = \new Voice	{
	\relative c'' {
		b1 c b g2 a4 b b c4. b8 a2 \ficta gis4 a2 f4 g a4 a a2 \break
		g4 a \ficta bes a2 g4 a2 c4. d8 e4 e e \ficta f!4. e8 d2 \ficta cis4 d1 d2 c b4 a2 g4 \break
		b a4. g8 f4 e2 d4 d'4. c8 c2 \ficta bes4 a \ficta bes4. g8 a c4 \ficta b!16 a b4 c2. b8 a g2 r c b4. a8 \break
		
		b4 c b c4. b8 g4 f d \[ a'2 \ficta bes \] a4. f8 f2 g e4 a2 g8 f e2 r4 d a'4 a c2
		b4 g2 f8 e d4 g f d2 g4 a b4. g8 c4 b c2 b8 a c4 b g c c b4 a g \[ f2 e \]
		r4 d2 c4 b2 a r r4 g' f a4. g8 g2 \ficta fis4 g1 r4 g g4. a8 b1
		c2 b4 g2 f8 e f4. d8 d4 d'2 b4 c a2 g8 f e2 r4 f4 d f e4. d8 d1.
		
		r1. r1. r1. r1. r1.
		r4 c'2 c4 b c a b4. a8 g2 \ficta fis4 g2 r4 g g g a2 g4 f e2 d4 g4 a b4. d4 c8 
		a4 c b8 a a2 g4 c4. b8 [a g] f4 g a d, g2 f8 e d2 c4 c' b c4. b8 g4 a \ficta bes a \ficta bes4. a8 f4 
		g a4. g8 g2 \ficta fis4 g\longa s2 \set Score.currentBarNumber = #55 \showBarLine \bar "||" \time 2/2 
		r1 r1 \[e2 f \] g2 g g g g1 f2 d e f g1 
		
		a r \[ a1 bes \] a2 f g a2. g4 g1 f2 g1 ~
		g f1 g f\breve e1 f1. d2 
		d\breve\fermata \showBarLine \bar "|" r1 r1 g2 a g2. f8 e e4 g f d e f g2 
		a1 r1 r1 r2 r4 b2 c4 b c4. b8 g4 a b4. a8 a2 \ficta gis4 a c b c ~
		
		c b8 a c4 b2 c4 a b4. a8 a2 g8 \ficta fis g4 a b2 e,4 c' b g a4. g8 e4 b' a c4. b8 g4 a2 g4 d' 
		c e4. d8 b4 c4. b8 g4 d' c e4. d8 b4 c4. b8 g4 b4. a8 a2 g8 \ficta fis g4 a d,2 r1 r1 
		e4 f g2 e8 f g a b4 c4. b8 a2 \ficta gis4 a1 r1 r1 r1 \[ b2 c \] 
		b4 g a b e, a2 g8 \ficta fis g2 r2 e4. f8 g4 g g g g g g2 r2 r4 a g f e4. d8 c4 b 
		
		a a'2 \ficta gis4 a2 r2 r1 r1 r1 r2 r4 b c b8 a c4 b4. a8 a2 \ficta gis4
		\showBarLine \bar "||" \time 3/2 a2 e f g1 g g f2 a2. g4 g2 c2. a4 b2 a2. g4 
		g1 \ficta fis2 \showBarLine \bar "||" \time 2/2 g\breve b,\breve \showBarLine \bar "||" \time 3/2 c1. 
		r2 e f g g g1 g a2. g4 a2 f e2 e \showBarLine \bar "||" \time 2/2
		
		d2 r4 d e d2 g f8 e d2 g, r4 d' e d2 g f8 e d2 
		\showBarLine \bar "||" \time 3/2
		c1 g'2 a1 a2 g2. a4 b2 c a c b g b c a1
		\showBarLine \bar "||" \time 2/2
		g1 r2 f e d c f e d
		\showBarLine \bar "||" \time 3/2
		c1 g'2 g1 g2 e \ficta fis1 g r2 g1 g2 g1 g2 g a1
		\showBarLine \bar "||" \time 2/2
		d,2 r g2. f4 e2 d c4 g'2 f4 e c d2 c r r1 r1 r1 r2 r4 g' g g
		e4. f8 g1 r4 g a b c2 r4 g g g a b c2 r r4 g a b c2 r4 g2. a4. g8 f e e2 d4 e1 r1 r1 
		a2 g4 g2 f8 e f4. g8 e4 c d e d e2 d4 e2 g a c b4 g2 f8 e f4
		e2 d4 e2 r r4 a g c b c2 b8 a g1 r2 g a g e r r1 
		
		r2 f4 d e f g2 a r4 c b d c4. b8 [a g] g2 \ficta fis4 g1 r4 g g4. f8 e2 r4 e4 ~
		e8 d8 d2 c4 d4. e8 [ f g ] a4. b8 c [b g a] b4. a8 a2 \ficta gis4 a2 c1 b2 \[ a g \] \[ f e \] d1 
		r2 c \[ d2 e \] f1 e2 g f4. e8 e1 d2 e\breve. \showBarLine \bar "|."
  }
	\addlyrics {
		Pá -- _ trem om -- _ ni -- po -- tén -- _ _ _ tem, fac -- _ tó -- rem caé -- 
		li et tér -- _ _ rae, vi -- si -- bí -- li -- um óm -- _ _ ni -- um et in -- vi -- si -- _ 
		_ bí -- _ _ li -- um. Et in ú -- _ num Dó -- _ _ _ _ _ mi -- num __ _ _ _  Jé -- sum __ _ 
		_ Chrís -- _ _ _ _ _ _ tum, __ _ Fí -- li -- um Dé -- _ _ _ _ i u -- _ ni -- gé -- 
		
		_ _ _ _ _ _ ni -- tum, et ex Pá -- tre ná -- tum an -- _ _ _ te óm -- _ ni -- a saé -- cu -- la, __ _ 
		saé -- _ cu -- la. Dé -- um de __ _  Dé -- _ o, Lú -- men de Lú -- 
		_ _ _ _ _ _ mi -- ne, Dé -- um vé -- _ _ _ rum,  de Dé -- o vé -- _ ro,

		per quem óm -- ni -- a fác -- _ _ ta sunt. Qui prop -- ter nos hó -- mi -- nes et prop -- ter nós -- _ _ 
		tram sa -- lú -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ tem dés -- _ cen -- _ _ dit de __ _  caé -- _ _ 
		_ _ _ _ _ lis.
		Et __ _  in -- cár -- na -- tus est de Spí -- ri -- tu Sánc -- to
		
		ex Ma -- rí -- _ a Vír -- _ _ gi -- ne, 
		et hó -- mo fác -- _ tus 
		est. Cru -- ci -- fí -- _ _ xus é -- _ ti -- am pro nó -- 
		bis sub Pón -- _ _ ti -- o Pi -- lá -- _ _ _ to, pás -- _ _ 
		
		sus __ _ _ et se -- _ púl -- _ _ _ _ _ tus est, et __ _ re -- sur -- réx -- _ it tér -- _ _ ti -- a dí -- e, se -- _ cún -- _ _ dum __ _ _ Scrip -- _ tú -- _ _ _ _ _ _ _ _ _ _ _ _ ras,
		et as -- cén -- dit __ _ _ _ _  in __ _  caé -- _ lum, sé -- _ 
		det ad déx -- te -- ram Pá -- _ _ tris. Et __ _  í -- te -- rum ven -- tú -- rus est cum gló -- ri -- a, __ _ _  ju -- 
		
		di -- cá -- _ re, et mór -- _ _ _ _ _ _ tu -- 
		os, cú -- ius rég -- ni non __ _ é -- _ rit fí -- _ _ _ _ 
		_ _ nis, fí -- nis.
		Et in Spí -- ri -- tum Sánc -- _ _ tum, __ _ Dó -- mi -- 
		
		num et vi -- vi -- fi -- cán -- _ _ tem, et vi -- vi -- fi -- cán -- _ _ tem, qui 
		ex Pá -- tre __ _ _ Fi -- li -- ó -- que __ _  pro -- cé -- _ 
		dit. Qui cum Pá -- tre et Fí -- li -- o si -- mul a -- 
		do -- rá -- tur et con -- glo -- ri -- fi -- cá -- tur:
		
		qui lo -- cú -- tus est per Pro -- phé -- _ _ tas.
		Et ú -- nam, sánc -- _ tam, ca -- thó -- li -- cam et a -- pos -- tó -- li -- cam Ec -- clé -- si -- 
		am, Ec -- clé -- _ _ _ _ si -- am. Con -- _ fí -- _ _ _ te -- 
		or ú -- num bap -- _ tís -- _ ma in re -- mis -- si -- ó -- _ _ _ _ _ nem pec -- ca -- tó -- 
		
		_ rum. __ _ _ _ Et ex -- péc -- to re -- sur -- rec -- ti -- ó -- 
		nem mor -- tu -- ó -- _ _ _ _ _ _ rum,
		et ví -- _ tam ven -- _ tú -- ri saé -- _ _ _ _ _ _ _ _ _ _ _ _ cu -- li.
		A -- _ _ _ _ _ men, a -- _ _ _ _ _ _ _ _ _ men.
	}
}

alto = \new Voice	{
	\relative c {
		e'\longa. d1. ~
		d r4 e2 f4 g g a4. g8 a4 f e e d2 g,4 g'4. f8 d4 f e2 a,4 b c 
		d f4. e8 d2 \ficta cis4 d4. e8 [f g] a2 g4 f4 g e f d2 e\breve. ~
		
		e1. d\breve. c1. \[ a 
		b1 \] b4 c d2 b d e \[ e f \] e r4 e c d2 e4 f d2 \ficta cis4 d2 r r4 d 
		c e4. d8 d2 \ficta cis4 d2 r1 e\breve. ~ e1. d1. 
		c \[ a b\breve. \] r1. 
		
		r1. r1. e\breve. d2. c4 a2 
		b2. d4 e g f4. d8 e f d2 \ficta cis4 d e f g4. f8 d4 
			\tuplet 3/2 { f4 e c } \tuplet 3/2 { d4. c8 a4 } \tuplet 3/2 { c4 b2 } a4. b8 c4 d g, c 
		b e4. d8 c4 c b4 c2 r4 c2 b4 a g a g \ficta bes a r a8 [\ficta b! c d] e4 d1 g,4 d' e2 
			\set Timing.timing = ##f d\breve. \set Timing.timing = ##t 
		c1 c2 b c d e1 e\breve d1 c2 a b1 
		
		r1 \[ e1 d\breve. \] c2 a b1 r1 e1 ~
		e d\breve. c\breve a1. b2 
		b\breve\fermata e2 d c4 a b2 r1 r2 e1 d2 c4 a b2 
		c2. b8 a c4 b a c d e4. c8 d4 e4. f8 g2. c,4 g' c, g'2 f e4 c d4. e8 f4 r4 e2 ~
		
		e1. d2 c4 a b2 e d c4 a b2 r1 r1 r1 
		r2. d4 c e4. d8 b4 c4. b8 g4 d' c g'4. f8 f4. e8 e2 d4 e r2. r4 e d c a2 b 
		r1 r4 e d c a2 b \[ e2 f \] e4 c d e a, d2 \ficta cis4 d f e c g'4. f8 [e d] e4 ~
		e b4 c d e1 e2 d c4 a b1 r2 e d c4 a b2 r4 e2 d4 
		
		c a b2 r1 r2 r4 e4 f e8 d f4 e2 d \ficta cis4 d a4. f8 g4 a2 r r1
		r1. e'\breve. d1 c a b2 e1 
		\[ d2 c \] a2 b\breve r2 r4 g4. a8 b c d4 b c2 e1 \[ d2 c \] a2 
		b1 b2 c2. d4 e2 f e2. d4 d1 \ficta cis2 d4 b d8 c b a g2 b4 b b1 ~ 
		
		b\breve. c1 d2 
		e c d e1 r2 e1 f2 g c, d e c d 
		e4. f8 g4 g, c2 r r4 c d b c2 r r4 c d b c1 c2 b1 g2 
		a2. b4 c2 d1 r2 c1. b1 g2 
		e'1 \ficta fis2 g1 r1 r1 r1 r1 g2. f4 e2 d 
		
		c4 g'2 f4 e c d2 c1 r4 b4 c2 d c g' r4 g e f g2 r4 g f g 
		e f d e2 c b4 a2 g r1 r2 a'2 g4 g2 f8 e f4. g8 e4 c d e d e ~
		e d4 e2 r1 r1 r2 a g4 g2 f8 e f4. g8 e2 r1 r2 a 
		g4 e f e4. c8 d4 e g f e4. c8 d4 e4. d8 c4 b e2. d4 c a b2 r d e d b4 c a b c4. d8 e2 
		
		a,4. b8 c4. b8 g4 b a c2 b4 a2 b\breve e4. d8 c4. b8 a4 g a2 r1
		r4 e'2 d4 c a b2 r a'2 g2. f4 e2. d4 c2. b4 a2 g a1.
		g2 a2. b4 c2 e d c a\breve \set Timing.timing = ##f b \set Timing.timing = ##t
	}
	\addlyrics {
		Pá -- trem, __
		vi -- si -- bí -- li -- um __ _ _ óm -- _ ni -- um, et in -- _ vi -- si -- bí -- _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ li -- um.
		Et in ú -- _ 
		
		num, et ex Pá -- tre ná -- tum an -- _ te óm -- ni -- a __ _ _  saé -- cu -- 
		la.	Dé -- um de __ _  Dé -- _ o, Dé -- 
		um vé -- _ rum,
		fác -- 
		
		_ _ ta sunt. Qui prop -- ter nos __ _ _ _ _ _ _ _ _ _ _ _
		hó -- _ _ _ _ _ _ mi -- nes, __ _ _  et prop -- ter nós -- _ tram sa -- lú -- _ tem des -- cén -- dit de caé -- _ _ lis, 
		de __ _ _ _ _  caé -- lis, de caé -- lis. Et in -- car -- 
		ná -- tus est de Spíri -- tu Sánc -- to
		
		Vír -- _ _ gi -- ne, et 
		hó -- mo  fác -- tus 
		est. Cru -- ci -- fí -- _ xus  é -- _ _ ti -- am,
		sub __ _ _ Pón -- ti -- o  Pi -- _ lá -- _ _ to, __ _ _ sub Pón -- ti -- o  Pi -- lá -- _ _ _ to, pás -- 
		
		_ _ _ sus, et se -- púl -- tus est
		se -- _ cún -- _ _ dum __ _ _ scrip -- _ tú -- _ _ _ _ _ ras, et as -- cén -- _ dit 
		in __ _ caé -- _ lum, sé -- _ det ad déx -- te -- ram Pá -- _ tris,  Pá -- _ _ _ _ _ _ _ 
		_ _ _ tris. et -- _ í -- te -- rum cum __ _ gló -- ri -- a, ju -- di -- 
		
		cá -- _ re ví -- vos __ _ _ _  et mór -- _ _ _ _ tu -- os,
		cú -- jus rég -- _ ni non 
		é -- rit fí -- nis, fí -- _ _ _ _ _ nis. Et 
		in Spí -- ri -- tum Sánc -- _ _ tum, Dó -- _ _ _ mi -- 
		
		num, __ _ _ _ _ _ _ Dó -- mi -- num, qui ex 
		Pá -- _ _ tre  Fi -- li -- ó -- _ que  pro -- _ _ 
		cé -- _ _ _ dit. Qui cum Pá -- tre et Fí -- li -- o si -- mul a -- 
		do -- _ rá -- tur, con -- glo -- ri -- fi -- cá -- tur:
		
		qui lo -- cú -- tus est per Pro -- phé -- _ _ 
		tas. Et ú -- nam sánc -- tam ca -- thó -- li -- cam et a -- pos -- tó -- li -- cam Ec -- clé -- _ 
		si -- am. Con -- _ fí -- _ _ _ te -- or ú -- num bap -- _ tís -- _ ma
		in re -- mis -- si -- _ ó -- _ nem, in re -- mis -- si -- ó -- _ _ _ _ 
		
		_ nem __ _ _  pec -- _ _ ca -- tó -- _ _ _ rum. Et ex -- péc -- to re -- sur -- rec -- ti -- _ ó -- 
		nem __ _ _ _ _  mor -- tu -- ó -- _ _ rum, ví -- _ tam ven -- tú -- _ ri
		ven -- _ tú -- _ ri A -- _ _ _ _ _ _ _ _ men,
		a -- _ _ men, a -- _ _ _ men.
	}
}

tenor = \new Voice {
	\relative c {
	  \clef "treble_8"
		e1 a g4. e8 e4 b'c b c b e, e' e c4 b2 a d,4. e8 f4 f f2 
		g4 f g d g2 c1. \[ a b \] r1. 
		r1. r1. r1. c1 b2 e, r e4. f8 
		g4 a g a e2 r4 f2 f4 g2 a \[ a bes \] a4 a a2 g f2. d4 e f 
		
		g1 r2 r1. r1. r1. r1. 
		r1. r1. r2 g a \[ g2 c2. \]  b4 b2 r4 g4 g2 
		a  g4. f8 e2 r4 f2 f4 g2 
		a1 g2 f2. d4 e4. f8 g1 r4 d'4. d8 d4 e d4. c8 b2 c4. a8 a2 b4 
		
		c d4. b8 b4. a8 g f e4 c'4. b8 a2 \ficta gis4 a2 \[ a b \] a r4 a g a f g d e d d'4 ~
		d8 g,8 g2 b2. r1. r1. r1. r1. 
		r1. e1. \[d2 c\] a \ficta b!\longa. 
		e1 e2 d2 c a b1 r2 b c1 a\breve e2 e' 
		
		d4 c2 b8 a c4 b a g f1 \[ g1 a \] \[ g2 c \] b2 g a2. b4 c1 ~
		c \[ a1 bes \] a\breve g1 f1. g2 
		g\breve\fermata r1 r2 d' e d b4. e,8 e4 b' c b r b c4. d8 e2 
		r2 e1. d4 c a2 b e\breve d2 c4 a b2 r4 
		e4. d8 c b 
		
		a4 c2 g' e4 f d e c d b2 a \ficta gis4 a2 e4 b' a c4. b8 g4 a2 e4 b' a c4. b8  g4 a2 g4
		r4 r1 r1 e'2. d4 c a b2 r4 a4 b g2 f8 e g4 a f2 e4 b' 
		c d4 b e4. d8 c4 b a4. g8 f4 e2 
		r2 a1 g2 f4 d e2 r r4 e'2 d4 c
		a4 b e2 d4 c a b2 r4 e, f g a4. g8 e2 r4 e'e e e e, f g a4. g8 e4 d a'2 r 
		
		r1 r4 a2 g4 f d e2 r4 a2 g4 f d e2 r1 r4 e'2 d4 c a b2
		c1 a2 b e,2. f4 g2 \[ c,2 c' \] a2 f'2. e4 e2 e, f g c1 
		b2 a1 g2. f8 e e2 r4 g4. f8 e4 d e2 g f4 g1 c2
		b c d e1 e\breve d2 c a\breve
		
		b1. r4 g e f g d'e d2 g f8 e d2 g, r e'1 d2 
		c1 a2 \[ b2 e2 \] d2 c1 a2 \[ b2 e2 \] d2 c1 a2
		b2 e1 d2 c4 a b2 e d c4 a b2 e\breve d1 
		c a2 b1 r2 e\breve d1 c a2 b1 
		
		r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 e2 d4 c a b2 r4 e2 d4 c a b2 
		e1 d2 c4 a b2 e1 d2 c4 a b2 e2 d c4 a b2 e2. d4 
		c a b2 e2. d4 c2 a b  e2 d c4 a b2 r2 r1 e2 d 
		c4 a b2 r2 r1 e2 d c4 a b2 e d4 c a2 b4 e4 d c a2 b4 e4 
		
		d c a2 b4 e2 d4 c a b2 r4 e2 d4 c4 a b2 r1 e2 d c4 a b e 
		d c a2 b r4 e2 d4 c a g2 r4 g g4. f8 e4 e'4 r4 a,2 g4 f d e2 d8 e f g a4. b8 
		c4. d8  [ e f ] g4 e d e2 c4 a e'1 d2 c4 a b2 r4 a2 g4 f2 d e a2 
		d, g2 f d e c d e f1 e\breve.
	}
	\addlyrics {
		Pá -- _ _ _ trem om -- ni -- po -- tén -- _ tem, om -- ni -- po -- tén -- tem, fac -- _ tó -- rem caé -- 
		li et tér -- _ rae, tér -- rae, __ _
		Dó -- mi -- num, Et in 
		ú -- num Dó -- mi -- num Jé -- sum Chrís -- tum, Fí -- _ li -- um Dé -- i  u -- ni -- gé -- ni -- 
		
		tum,
		de __ _  Dé -- _ _ o, Lú -- men 
		de Lú -- mi -- ne, Dé -- um vé -- rum, de Dé -- o vé -- _ ro. Gé -- 
		ni -- tum non fác -- _ tum, con -- sub -- stan -- ti -- _ á -- _ lem __ _ _ _ _ Pá -- _ _ _ tri, Pá -- _ 
		
		tri; per quem óm -- ni -- a fác -- _ _ _ ta sunt. __ _
		de __ _ caé -- _ 
		lis. Et in -- car -- 
		ná -- tus est de Spí -- ri -- tu Sánc -- _ _ _ _ 
		
		_ _ _ _ to ex Ma -- rí -- a Vír -- _ _ gi -- ne,
		et __ _  hó -- mo fác -- tus 
		est. Cru -- ci -- fí -- xus __ _ _ é -- ti -- am pro nó -- _ bis 
		pro __ _ nó -- _ bis, sub __ _ Pón -- ti -- o  pás -- _ _ _ 
		
		_ sus et  se -- púl -- _ _ _ _ _ _ tus est, et re -- sur -- réx -- _ _ _ it tér -- ti -- a __ _ _ 
		dí -- e, scrip -- _ tú -- _ ras, et as -- cén -- _ _ _ _ _ dit in
		caé -- _ _ _ _ _ _ _ _ _ lum, sé -- _ _ _ det Pá -- _ _ _ 
		tris, Pá -- _ _ _ tris. Et í -- te -- rum __ _ _  ven -- tú -- rus est cum gló -- ri -- a, __ _ _ _ _
		
		ví -- _ _ _ vos et __ _ _ _ _ mór -- _ _ tu -- os.
		cú -- ius rég -- _ _ ni non __ _ _ é -- _ rit fí -- _ _ _
		_ _ _ _ _ nis, fí -- _ _ _ _ _ _ nis. Et 
		in Spí -- ri -- tum sánc -- tum, Dó -- mi -- 
		
		num Dó -- _ mi -- num et vi -- vi -- fi -- cán -- _ _ tem, qui ex 
		Pá -- _ tre Fi -- li -- ó -- _ que pro -- _ cé -- _ 
		dit. Qui cum Pá -- _ tre et __ _  Fí -- li -- o a -- do -- 
		rá -- _ tur con -- glori -- fi -- cá -- tur.
		
		qui lo -- cú -- tus est per Pro -- phé -- _ tas, qui lo -- cú -- tus est per Pro -- phé -- _ tas.
		Et __ _  ú -- _ nam ca -- _ thó -- li -- cam a -- pos -- tó -- li -- cam Ec -- _ 
		clé -- si -- am,  Ec -- _ clé -- si -- am. Con -- _ fí -- te -- or ú -- _ 
		_ _ num bap -- _ tís -- _ ma in re -- mis -- si -- ó -- _ _ _ _ nem pec -- 
		
		ca -- tó -- _ rum,  pec -- ca -- tó -- _ rum. Et ex -- péc -- _ to re -- sur -- rec -- _ ti -- _ 
		ó -- _ _ nem mor -- tu -- ó -- _ rum, et ví -- _ _ tam, et __ _  ví -- _ tam saé -- _ _ _ _ _ 
		_ _ _ _ _ _ cu -- li, saé -- _ _ _ cu -- _ li. A -- _ _ _ men, a -- 
		_ _ _ _ men, a -- _ _ _ men.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		e1 a, e' r4e a g4. f8 e d c4. d8e2 r4 a, \ficta bes g d'1 
		r4 d g f \ficta bes2 a2. f4 c2 r4 d2. a2 r4 g'2 g4 g g a2 g4 f \[ e2 
		d \] r \[a' \ficta bes \] a f4 g a g2 f4 g2 c,1 e4. f8 g2 a g4. f8 
		e4 a, e'4 a, c2 d1 g,2 d'1 g,2 \[a f'\] c2 d1 a2 
		
		r4 e'2 f4 g e f g g e4 d g4. e8 a4 g a2 g8 f a4 g c4. b8 a4 g f e d2 r4 a'4
		g b4. a8 a2 \ficta gis4 a a, c d e2 \[ d e \] d e r4 c c4. d8 e1 e2 
		\[ a, e'\] c d1 b2 a r4 a4 c2 d1 c4. b8 g1. 
		g'4. g8 g4 g g4. e8 e2 f4. d8 d2 e4 f g4. e8 e4. d8 [c b] a4 c d b2 a4 c'4. b8 a2 \ficta gis4 
		
		a a,4. b8 c d e4 c d g, b c d2 \[ g, g'\] e d r r r r4 g g g 
		a2 g4 f e2 r4 f2 d4 e f4 g2 e4 f g2 r4 a g a4. g8 e4 f g f g4. f8 d4 
		e f4. e8 c4 d2 g r4 g e4. \ficta fis8 g\breve. c,1 c2 g'
		a f e\breve \[ c1 d\] \[ a e'\] f1 
		
		\[c d \] \[ g, d'\] \[ e2 f \] \[ g e \] \[ d1 c ~
		c \] d1 \[ g,1 d'\] f1 \[ c1 d1. \] g,2 
		g\breve\fermata r2 g'2 a g e f4 d e4. f8 g2 a4 e f g c, f e2 
		a,4 a'2 g8 f a4 g c2 b4 a2 g8 f e1 r1 r1 r1 r4 a g a ~
		
		a g8 f a4 g e a f g e f d e2 c4 b2 a r r1 r1 r1 r1 r1 r1 r1 r1e'4 f g2 e8 f g a b4 c4. b8 a2 \ficta gis4 a d, e4. c8 c2 r r1
		\[ a2 d \] c4 a b c d b a2 \[ d2 a' \] \[ g2 a \] e4. d8 c4 b \[ a2 e'\] r4 c d b a2 r4 e'e e e2 r4 c d b
		a2 r r1 r2 e' f4 e8 d f4 e4. d8 d2 \ficta cis4 d2 r1 r4  e f e8 d f4 e a,2 r r1
		a'1 f2 e2. f4 g2 c,1 c2 d1 a2 c2. b4 a2 g a1 \[ b2 c \] d2
		g,2 g'2. f8 e e2 r4 g f g2 e4 d2
		c1 c2 \[ g'2 a \] f2 e1. r1. r1. r1.
		r2 g2 e4 f g2 r2 r4 g e f g2 r r4 g e f g2
		\[ c,2 c' \] b2 a2. g4 f2 e1 g2 a1 a2\[ g2 c \] b a2. g4 f2
		c2 r2 r4 c d b c2 r r4 c d b c2 r
		c1 c2 g'2. a4 b2 \[ c2 a1 \] g1 r2 c,1 c2 g'2. a4 b2 \[ c2 a1 \] 
		g1 r1 r1 r1 r1 r1 r1 r1 r1 r2 r4 c, g'2 a g c,2 r r4 g'a2 g c, r4 g' a f g e c2 r4 g' a f g8 f e d c4 c'2 b4 a g f2 e1
		r2 a g4 g2 f8 e f4. g8 e1 r2 a g4 g2 f8 e f4. g8 e1 r r4 e2 c4 d e f2 e4 c d e f2 e4 c d e f2
		e\breve r2 g a g e f4 d e c d4. c8 a2 e' f2. e8 f g2 r r1 r4 g4 g4. f8 e2 r4 e c4. a8 a4 c d b a2
		r4 d4. e8 [f g] a4. b8 c4 g a f e2 a2. b4 c2 g \[ a2 e \] \[ f c \] \[ d b \] a2 f'1 e2 d1 c r2 c d1 \[ a1 e'\breve \]
  }
	\addlyrics {
		Pá -- _ trem  om -- _ ni -- _ po -- _ tén -- _ tem, fac -- tó -- _ rem
		caé -- li et tér -- _ _ rae, tér -- rae, vi -- si -- bí -- li -- um  óm -- ni -- um __ 
		_ et __ _  in -- vi -- si -- bí -- _ _ li -- um. Et in ú -- num Dó -- _ 
		_ mi -- num Jé -- sum Chrís -- tum, Fí -- li -- um __ _ _  Dé -- i
		
		et ex Pá -- tre ná -- _ tum an -- te óm -- _ _ ni -- a __ _ _ _ _  saé -- _ _ _ _ cu -- la. Dé -- 
		um de __ _  Dé -- _ o, Dé -- um de Dé -- _ _ _ o, Lú -- men de Lú -- mi -- 
		ne, __ _ Dé -- um vé -- rum, de Dé -- o vé -- _ ro.
		Gé -- ni -- tum non fác -- _ tum, con -- sub -- stan -- ti -- _ á -- _ lem __ _ _ _ _ Pá -- _ _ tri, Pá -- _ _ _ 
		
		tri; per __ _ _ _ _  quem óm -- ni -- a __ _ _  fác -- _ ta sunt. Qui prop -- ter 
		nos hó -- mi -- nes  et prop -- ter nós -- tram sa -- lú -- tem des -- _ cén -- _ _ dit de __ _   caé -- _ _ 
		_ _ _ _ _ lis, de caé -- _ lis. Et in -- car -- 
		ná -- tus est de Spí -- ri -- tu Sánc -- 
		
		to __ _ ex Ma -- rí -- a Vír -- _ gi -- ne,
		et  hó -- _ mo  fác -- _ tus
		est. Cru -- ci -- fí -- xus e -- tí -- am pro nó -- _ _ _ _ _ _ _ 
		bis sub __ _ _  Pón -- ti -- o  Pi -- lá -- _ _ to, pás -- _ sus __ 
		
		_ _ _ et se -- púl -- _ _ _ _ _ _ _ tus est,
		et as -- cén -- dit __ _ _ _ _  in __ _  caé -- _ 
		lum, in caé -- _ lum, sé -- _ det ad déx -- _ _ te -- ram Pá -- _ tris, __ _
		Pá -- _ _ _ tris. __ _ Et í -- te -- rum ven -- tú -- rus est cum gló -- ri -- a,
		
		ju -- di -- _ _ _ cá -- _ _ _ re et mór -- _ _ _ tu -- os,
		cú -- ius rég -- _ _ ni non é -- rit fí -- _ _ _ _ 
		_ _ _ nis, fi -- _ _ nis, fí -- _ _ _ _ nis. Et 
		in Spí -- ri -- tum
		
		Sánc -- _ _ tum,  Dó -- _ mi -- num  vi -- vi -- fi -- cán -- tem, qui ex
		Pá -- _ _ _ tre Fi -- li -- ó -- que pro -- cé -- _ _ 
		dit. Qui cum Pá -- tre et Fí -- li -- o si -- mul a -- _ do -- 
		rá -- _ tur et con -- glo -- ri -- fi -- cá -- _ tur:

		Et ú -- nam, sánc -- tam, ca -- thó -- li -- cam et a -- pos -- tó -- li -- cam Ec -- 
		clé -- si -- am,__ _ _ _ _  Ec -- _ clé -- _ si -- am. 
		Con -- _ fí -- _ _ _ te -- or
		ú -- num bap -- _ _ tís -- _ ma in re -- mis -- si -- ó -- nem,  re -- mis -- si -- ó -- nem pec -- 
		
		ca -- _ tó -- rum. Et ex -- péc -- to re -- sur -- rec -- ti -- ó -- nem mor -- tu -- 
		ó -- _ _ rum, et ví -- _ tam ven -- tú -- _ ri, ven -- tú -- _ ri saé -- _ _ _ 
		_ _ _ _ _ cu -- li. A -- _ _ _ _ _ _ _ _ _ men, a -- 
		_ _ men, a -- _ men. __ _
	}
}


\score {
	\new StaffGroup <<
		\set Score.proportionalNotationDuration = #(ly:make-moment 2 11)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
	>>
	\layout { }
%	\midi {	}
}


%{	 ██████      █████      ███    ██      ██████    ████████    ██    ██      ██████
		██          ██   ██     ████   ██     ██            ██       ██    ██     ██
		 █████      ███████     ██ ██  ██     ██            ██       ██    ██      █████ 
		     ██     ██   ██     ██  ██ ██     ██            ██       ██    ██          ██
		██████      ██   ██     ██   ████      ██████       ██        ██████      ██████   %}

soprano = \new Voice	{
	\relative c'' {
		a1 a2 g f2. d4 e\breve a1 g2 f d e a1 
		g4. e8 f4 e2 d4 e2 a1 g4. e8 f4 e2 d4 c b4. a8 a2 \ficta gis4 a1 c2. c4 c2 f 
		e r2 r4 b4 c1 f2 g4. a8 \ficta bes4 a2 f4 g e2 c4 b2 a4 c4. d8 e f g4. a8
		b4 a2 c b8 a g1 r4 g a b c c,4. d8 e c d2 c r4 g' a b c a2 c4 b g4. f8 e d c4 g'4. f8 f4. e8 e2 d4 
		\set Timing.timing = ##f e\breve.
		\showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #27
		a2. g4 f d e2 a1 g2 f4 e2 d8 c b4 e4. d8 d2 c4 g' f4. e8 a4. g8 g4 c
		b4. a8 a2 \ficta gis4 a1 r2 r1. r1. r1. r1. r1. r1. r1. r1. r1. r1. r2 r2 r4 a g c4. a8 b4 r a2 g4 f d e2 r4 d2 c4 f4. d8 e2 r4
		a g c4. a8 b4 r a g c4. a8 b4. a8 a2 \ficta gis4 a c2 b4 a2 \set Timing.timing = ##f \ficta gis\breve.
		\showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #54
		r1. r1. e1 d2 c2. a4 b2 r4 e2 f4 g2 c,8 d e f g4c d
		b4 c a2 c4 b g a f r f g e f d2 f4 e8 d c \ficta bes a4 a'2 f4 g e4. d8 f4. e8 d c b2 r1. r1. 
		r4 e4. f8 g a b4 g a c4. b8 a2 \ficta gis4 a2 e r r1. r4 a,4. b8 c d e4 c d f4. e8 d2 \ficta cis4 d f2 g4 a b \set Timing.timing = ##f c\breve.
		\showBarLine \bar "|." 
  }
	\addlyrics {
		Sánc -- tus, __ _ Sánc -- _ tus, Sánc -- _ _ _ tus, Sánc -- _ _ _ _ _ tus, Sánc -- _ _ _ _ _ _ _ _ _ _ tus
		Dó -- mi -- nus Dé -- us, Dé -- _ _ _ _ _ _ _ _ _ _ us Sá -- _ _ _ _ _ _ _ _ _ ba -- _ oth,
		Sá -- _ _ _ _ _ _ _ ba -- oth Sá -- _ ba -- oth, Sá -- _ _ _ _ _ _ _ _ _ _ _ _ ba -- oth.

		Plé -- _ _ ni sunt caé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ li,
		gló -- _ _ ri -- a  tú -- _ _ _ a, gló -- _ _ ri -- a, gló -- _ _ ri -- a, gló -- _ _ _ _ _ _ ri -- a tú -- _ _ a. 
		Ho -- _ sán -- _ na, ho -- _ _ sán -- _ _ _ _ _ _ _ _ na,
		ho -- _ sán -- _ na, ho -- _ _ sán -- na, ho -- _ _ _ _ _ sán -- _ _ na, __ _ _ _ _ _ _
		in __ _ _ _ _  ex -- cél -- _ _ _ _ sis, __ _
		in __ _ _ _ _  ex -- cél -- _ _ _ _ sis,  in ex -- cél -- _ sis.
	}
}

alto = \new Voice	{
	\relative c' {
		a1 a4. b8 c2 d1c\breve a2 d b4e4. d8 d2 a4 b c a f'4. e8 d c 
		b4 c f, c'2 a4 b c a f'4. e8 d c b4 c f, c'2 d4 e2 a, d c1 r2 a a a
		r a2. f4 g a4. f8 c'2 a4 b c4 d4. c8 a4. b8 c4. b8 g4 a2 \ficta gis4 a2 e'1 b8[ c8] d f4 e8 e2 d4 
		e2 r4 g2 e4 f g e2 r2 r2 r4 a g e f g e c4. b8 a4g1 c2 b4 a2 g4 a2 
		
		g1 g\breve r1. r1. r1. r1. r1. 
		r1. a1. g2 c2. a4 b2 e1 d2 f2. d4 e1. 
		d2 c4 a b2 r1. r1. r4 e d f4. d8 e4 r a, g c4. a8 b4 r a g c4. a8 b4 r d2 c4 f4. d8 e1.
		r1. r1. r2 r2 r4 a,2 g4 c4. a8 \tuplet 3/2 { b4 c a } 
		
		\tuplet 3/2 { c d b } \tuplet 3/2 { e f d } e\breve. s\breve r1. e1 d2 c2. a4 b2 
		r1. r4 a c d e4. f8 g2 c, r4 g'4 e f4. e8 c4 d e c d a d b c a bes4. a8 f4 g a4 
		a1 g2 a4 d2 f4 e2 r1. r1. c1 g4 d' e a, c4. d8 e2 
		c r r r1. a1 g2 f f4. g8 a2 r4 a2 g4 f4 g a\breve.
	}
	\addlyrics {
	  Sánc -- tus, __ _ _  sánc -- _ tus, __ _  sánc -- _ _ _ _ _ _ tus, sánc -- _ _ _ 
		_ _ tus, sánc -- _ _ _ tus, sánc -- _ _ _ _ _ tus, sánc -- _ _ _ _ tus Dó -- mi -- nus 
		Dé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ us
	  Sá -- _ _ _ _ _ _ ba -- oth, Sá -- _ _ ba -- oth,
	  Sá -- _ _ _ ba -- oth, Sá -- _ _ _ _ _ _ _ _ ba -- oth.
	  
	  Plé -- ni sunt __ _ _  caé -- _ _ _ _ _ _ _ li,
	  et __ _ tér -- _ ra, et __ _ tér -- _ ra, 
	  et __ _ tér -- _ ra, et __ _ tér -- _ ra, 
	  gló -- _ _ ri -- a __ _ _  
		
		tú -- _ _ _ _ _ a. Ho -- _ sán -- _ na, 
		ho -- _ _ _ _ sán -- na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ _ _ sán -- _ na, __ _ _
	  ho -- _ sán -- _ _ na in  ex -- cél -- _ _ _ _ _ 
		sis, in  ex -- cél -- _ _ sis,  in ex -- cél -- _ sis.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1. r1. a1. \[ g2 f \] d2 e a1 g2 f d 
		e a1 g2 f d e a1 g2 f d e2. c4 c2 f2. f4 f2
		\[ g2 f \] d2 e a1 g2 f d e1 r2 e' e,4 g4. a8 b4 \[ d2 c \] a2 
		b e1 d2 c a b e1 d2 c a b e1 d2 c a4 d, 
		
		b'\breve. r1. a2. g4 f d e2 a1 g2 f4 d e e'2 d4 c a b e ~ \break
		e d4 c a b2 r1. r1. r1. r1. r1. 
		r1. r4 a g f4. d8 e4 r a g c4. a8 b4 r1. r1. r1. 
		r1. r4 a2 g4 c4. a8 b2 r4 d2 c4 f4. d8 e2 r4 d2 c4 f4. d8 e1. r4 a, ~ 
		
		a g4 c a b2 r4 a2 g4 c a b\breve. r1. r1. r1. 
		e1 d2 \[ c2 a \] b2 e1 d2 \[ c2 a \] b2 a1 g2 \[ f2 d \] e2 
		a8 g8 f e d4 d'4 b c \[ f,2 d \] e2 e'1 d2 \[ c2 a \] b2 e1 d2 \[ c2 a \] b2 
		a1 g2 \[ f2 d \] e2 f1 c4 g' a d, d2 e d2. e4 f d e\breve.
	}
	\addlyrics {
		Sánc -- _ _ _ tus, sánc -- _ _ _ 
		tus, sánc -- _ _ _ tus, sánc -- _ _ _ _ _ tus, Dó -- mi -- nus 
		Dé -- _ _ us, Dé -- _ _ _ us,
		Sá -- _ _ _ _ _ _ ba -- oth, Sá -- _ _ ba -- oth, 
		Sá -- _ _ ba -- oth, Sá -- _ _ ba -- _ oth. 

		Plé -- _ _ ni sunt caé -- _ _ _ li, caé -- _ _ _ _ _ _ _ _ li,
		et __ _ tér -- _ ra, et __ _ tér -- _ ra, 
		gló -- _ _ ri -- a, gló -- _ _ ri -- a, gló -- _ _ ri -- a, gló -- _ _ ri -- a tú -- _ _ _ a.

		Ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, 
		ho -- _ _ _ _ _ _ _ sán -- _ na, in ex -- cél -- _ sis, in ex -- cél -- _ sis, 
		in ex -- cél -- _ sis, in ex -- _ cél -- _ sis, __ _ in ex -- cél -- _ sis.
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
	  a2. g4 f d \[ e2 d1 \] a1.c2 d4. e8 f2 r4 c4 d4. e8 f2 e4 c d4. e8 f2 r4 c d c f2 e4 c d4. e8 f2 
	  r4 c d c f2 e d4. c8 b2 a1 r2 f2. f4 f2 c' d1 c2 f1 e2 d1 c2. a4 e'2 r4
	  a,4 c4. d8 [e f] g2 d4 a'4. g8 f2 e2. c4 c2 r4 g' a4. b8 c2 r4 g a4. b8 c2 r4 g a4. b8 c4 f, g e4. c8 c4. d8 e f g4 d a' e f2 e\breve.
	  r1. r1. r1. r1. r1. r1. a,1 c4 d e1 a2 g c2. a4 b2 \[ a2 d, \] r4 a'2 g4 c4. a8 b2 r4
	  a2 g4 f4. d8 e4 a2 g4 f4. d8 e4 a,2 g4 c4. a8 b4 d2 c4 f4. d8 e4 a2 g4 c4. a8 b4 a2 g4 
		f d e2 r r1. r1. r1. r1. r2 a2 e4 f ~
		
		f g4 a f e2 a,2 r a e'\breve.
	  e1 d2 c2. a4 b2 r4 a2 a' g4 a a,2 a' g4 a a, a' f
	  e2 r4 c'2 a4 b g a f2 a4 g e f d r d e c d bes2 d4 c8 b a g f4 f'2 d4 e c d4. e8 [ f g ] a2 
	  \ficta gis4 a e4. f8 g a b4 g a c4. b8 a2 \ficta gis4 a2 c b a4. g8 f2 e r4 a,4. b8 c d e4 c d f4. e8
	  d2 c4 d2 f e d4. c8 \ficta bes2 a a'4. g8 f4 e d8 c b4 a\breve.
	}
	\addlyrics {
	  Sánc -- _ _ _ _ _ tus, sánc -- tus, __ _ _ sánc -- tus, __ _ _  sánc -- tus, __ _ _ _  
	  sánc -- _ _ _ _ _ tus, __ _ _ sánc -- _ _ _ _ _ _ _ tus.
	  Dó -- mi -- nus Dé -- _ _ _ _ _ _ _ us  Dó -- _ _ _ _ _ _ _ _ _ mi -- _ nus Dé -- _ _ us Dé -- _ _ us
	  Sá -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ba -- oth.
  
	  Plé -- ni __ _ sunt caé -- _ _ _ _ _ li,
	  et __ _ tér -- _ ra, et __ _ tér -- _ ra, et __ _ tér -- _ ra, et __ _ tér -- _ ra, 
	  et __ _ tér -- _ ra, et __ _ tér -- _ ra, et __ _ tér -- _ ra
	  gló -- _ _ _ _ _ ri -- a  tú -- a.
	  Ho -- _ sán -- _ na, ho -- _ sán -- na, ho -- _ sán -- na, ho -- _ sán -- na, 
	  ho -- _ _ _ sán -- na, ho -- _ sán -- _ na, ho -- _ sán -- _ na,
	  ho -- _ _ _ _ _ sán -- _ _ na, ho -- _ _ _ _ sán -- na,  
	  in __ _ _ _ _  ex -- cél -- _ _ _ _ sis, in ex -- cél -- _ _ sis,
	  in __ _ _ _ _  ex -- cél -- _ _ _ _ sis, __ _ 
	  ex -- cél -- _ _ sis, in __ _ _  ex -- cél -- _ _ sis.
	}
}

\score {
	\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 5)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
	>>
  \header {
		piece = \markup \larger \sans { Sanctus }
	}
	\layout { }
%	\midi {	}
}


%{ ██████   ███████  ███    ██  ███████  ██████   ██   ██████  ████████  ██    ██  ███████
   ██   ██  ██       ████   ██  ██       ██   ██  ██  ██          ██     ██    ██  ██
   ██████   █████    ██ ██  ██  █████    ██   ██  ██  ██          ██     ██    ██  ███████
   ██   ██  ██       ██  ██ ██  ██       ██   ██  ██  ██          ██     ██    ██       ██
   ██████   ███████  ██   ████  ███████  ██████   ██   ██████     ██      ██████   ███████ %}

soprano = \new Voice	{
	\relative c'' {
	\time 2/2
  r1 r1 g4. a8 b4 c2 b8 a b a g f e2 r r1 a1 ~ 
	a\breve g1 f2 d e  a,2. b4 c d e f4. g8 a4 ~
	a8 b8 c2 b8 a b4. a8 [b c]
  d4. c8 a2 b c b8 a g4 a2 \ficta gis4 a\breve 
  \showBarLine \bar "||" \break
  r1 r1 a1 b2 d c2. b8 a g2. a8 b c4 a2 g8 f e2
  g2 a2. b4 c2. b8 a g2 c, r4 e2 f4 g a2 g8 f e4 a2 b4 c d2 c8 b a4 d,2 e4 f g2 f8 e d4 g2 a4 b c2 b8 a g4
  c,2 d4 e f2 e8 d c4 a'2 g4 f d e a2 g4 f d e a2 g4 f d e2 r1 r2 r4 c f g a b
  c4. d8 f4 e4. d8 d4. c8 c4. b8 b4 a4. g8 g\breve
  \showBarLine \bar "||" \time 3/2 \break
  r1. r1. r1. r1. r1. r1. g2. a4 b2 c1 g2 \[ a2 g \] a2 \[ b2 g \] a2 g2. a4 b2 c1 b2 c b2. a4 a1 \ficta gis2 a1 r2
  a,2. b4 c2 d1 a2 d2. e4 f2 g1 d2 g2. a4 b2 e,2. f4 g2 \[ a2 e \] b'2 c2. b4 g2
  \[ a2 e \] r2 r1. \[ a,2 c \] d2 \[ e2 f \] g2 a a, b c2. d4 e2 \[ a,2 c \] d2 \[ e2 a, \] a'2 g c, d \[ e2 c \] d2 \set Timing.timing = ##f e\longa. \showBarLine \bar "|." 
  }
	\addlyrics {
	  Be -- _ ne -- díc -- _ _ _ _ _ _ tus,
	  be -- ne -- díc -- _ tus, __ _  be -- _ ne -- díc -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ tus
	  qui __ _ _  vé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ nit __ _ _ _ 
	  in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _
	  in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne
	  Dó -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ mi -- ni.
	  Ho -- _ _ sán -- na, ho -- _ _ sán -- _ na, ho -- _ _ sán -- na,
		
	  ho -- _ _ _ sán -- na, ho -- _ _ sán -- na, ho -- _ _ 
		sán -- na, in __ _ ex -- cél -- _ sis, in __ _ ex -- cél -- _ _ sis, __ _
	  in __ _ ex -- cél -- _ _ sis, in ex -- cél -- _ sis, in __ _ ex -- cél -- _ _ _ _ _ _ _ _ sis.
	}
}

alto = \new Voice	{
	\relative c' {
		\time 2/2
		r1 r1 r1 r1 r4 e4 f a2 g8 f g f e d c2 r2 
		r1 r4 c4 d f2 e8 d e d c b a4 a b d a2. b4 c2 f,
		r4 f a4. b8 c4. d8 e4 f g4. f8 d4. e8 f4 c f2 e1 r4 e1 c4 f2 e1
		a,1 b2 d c2. b8 a g2. r4 r1 r r2 r4 b4 c2 b4 c ~
		
		c b8 a c4 d e\breve r1 r r r r 
		r1 r r r r r r r c4. d8 f4 e4 ~
		e8 d8 d2 \ficta cis4 d a'2 g4 f d4 e a2 g4 f d e a2 g4 f d e a2 g4 f d e\breve
		r1. r1. r1. e2. f4 g2 a e f g2. f4 d2 
		c g'2. f4 e1 e2 c1 c2 \[ d2 e \] c2 r2 g'1 e2 f g 
		
		c,2 g'e f e1 c2. d4 e2 f1 e2 f2. e4 d c \[ b2 a \] d2 
		\[ b2 g2. \] a4 e'1 d2 \[ c a \] b2 e1 d2 \[ c a \] b2 e1 d2 
		\[ c a \] b2 r1. r1. \[ a2 c \] d2 \[ e2 f ]\] g2 \[ a2 e \] r2 
		\[ a,2 c \] d2 e2. f4 g2 \[ a2 e \] a2 g1 g, a g\breve.
	}
	\addlyrics {
		Be -- ne -- díc -- _ _ _ _ _ _ tus,  
		be -- ne -- díc -- _ _ _ _ _ _ tus, be -- ne -- díc -- _ _ _ tus, be -- _ ne -- díc -- _ _ _ _ _ _ _ _ _ _ tus, be -- ne -- díc -- tus
		qui __ _ _  vé -- _ _ nit, qui vé -- _ _ _ _ _ _ nit 
		in __ _  nó -- _ _ mi -- _ ne
		Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni.
		
		Ho -- _ _ sán -- _ _ _ _ _ na, __ _ _ _  ho -- sán -- na, ho -- sán -- na,
		ho -- sán -- _ na, ho -- _ sán -- _ na, ho -- _ _ sán -- na, ho -- _ _ _ sán -- _ _ na, __ _ _
		in ex -- cél -- _ sis, in ex -- cél -- _ sis, in ex -- cél -- _ sis, 
		in __ _ ex -- cél -- _ _ sis, __ _ in __ _ ex -- cél -- _ _ sis, __ _
		in ex -- cél -- _ sis.
	}
 
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\time 2/2
		e\breve. d1 c2 a b1 r1 
		r1 r1 r1 r4 f4 g d d' c8 b c b a g f4. g8 a4. b8 c2 f, 
		r c' d b a d b4 e2 d8 c b4 a b2 a\breve

		r1 r r r2 r4 a8 b c4 a2 g8 f e2 g a2. r4 r1
		r r r r r4 a2 b4 c d2 c8 b a4 d, r2 r1 
		r4 g2 a4 b c2 b8 a g4 c, r2 r1 r4 f2 g4 a f2 g4 a b c2 f,4 g a b c4 r r2 
		r1 r r r r r r r r
		e1 d2 c1 a2 b1. r2 e1 d2 c a b1 r2 
		
		e1 d2 \[ c2 a \] b2 r2 e1 d2 c a \[ b2 e2. \] d4 \[ c2 a2 \] b2 
		e2. d4 c2 \[ a2 b1 \] a1 g2 \[ f2 d \] e2 r2 a1 g2 f d 
		e1 r2 \[ b'2 e, \] g \[ a2 c \] b2 \[ a2 c \] b2 a e'1 c2. b4 a2 
		\[ g2 a \] e2 e'1 d2 \[ c2 a \] b2 e1 d2 \[ c2 a \]
		b2 e1 d2 c1 a2 \[ b2 e \] d2 c1 a2 b1 e2. d4 \[ c2 a \] b\breve. 
}
	\addlyrics {
		Be -- ne -- díc -- _ tus,  be -- ne -- díc -- _ _ _ _ _ _ _ _ _ _ _ _ tus,
		be -- _ ne -- díc -- _ _ _ _ _ _ _ _ tus
		qui __ _ _ vé -- _ _ _ _ nit,
		in nó -- mi -- ne, __ _ _ _ _ 
		in nó -- mi -- ne, __ _ _ _ _ 
		in nó -- mi -- ne, in nó -- mi -- ne, 
		in __ _  nó -- mi -- ne.
		
		Ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, 
		ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na
		in __ _ ex -- cél -- _ sis, in __ _ ex -- cél -- sis, in __ _ ex -- cél -- _ sis, 
		in ex -- cél -- _ sis, in ex -- cél -- _ sis, in ex -- cél -- sis, 
		in __ _ ex -- cél -- _ sis, in ex -- cél -- _ sis. 
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		\time 2/2
		e4. f8 g4 a2 g8 f g f e d c2 r r1 r1 r1 a'4. b8 c4 d ~
		d c8 b c b a g f2 r r1 r1 r1 a\breve ~
		a1 g1 f2 d e\breve a,

		r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 e'2.f4 g a2 g8 f e4 a, r2 r1 r2 d4 e f g2 f8 e d4 g, r2 r1 r2 c4 d e f2 e8 d c4 f, r2
		f'2. e4 f g c, f2 e4 f g e f2 g4 a \ficta bes a2 r4 f2 g4 a b c f,2 e4 f g e f2 g4 a b c f,2 g4 a b c\breve
		e,2. f4 g2 \[ a2 e \] f2 g2. f4 d2 c1. r1. g'2. a4 b2 
		
		c \[ c,2 g' \] a2. g4 e2 \[ f2 e \] c2 \[ g'2 e\] f2 \[ g2 c, \] g'2 a1 g2 
		a2 g a1 e a,2. b4 c2 d1 a2 d2. e4 f2 g d1 
		g2. a4 b2 e,2. f4 g2 a1 e2 c'2. b4 g2 a2. g4 e2 \[ a,2 c \] d2 
		\[ e2 f \] e2 a1 d,2 a'1g2 c1 b2 a1 e2 c'1 b2 a2. g4 f2 \[ e2 c' \] b2 a2. g4 f2 e2. d4
		c4 b c2 \[ a1 e'\breve. \]
	}
	\addlyrics {
		Be -- _ ne -- díc -- _ _ _ _ _ _ tus,  be -- _ ne -- díc -- _ _ _ _ _ _ tus,
		be -- ne -- díc -- _ tus. __ _ 

		in nó -- mi -- ne, __ _ _ _ _ in nó -- mi -- ne, __ _ _ _ _ in nó -- mi -- ne, __ _ _ _ _ 
		in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne, 
		Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni.

		Ho -- _ _ sán -- _ _ _ _ _ na, ho -- _ _ sán -- _ _ _ _ na, ho -- _ _ sán -- _ na,
		ho -- _ _ sán -- na, ho -- _ sán -- na, ho -- _ _ sán -- na,  ho -- _ _ sán -- na,
		ho -- _ _ _ _ _ sán -- na,
		in __ _  ex -- cél -- _ sis, in __ _  ex -- cél -- _ sis, in  ex -- cél -- sis, in  ex -- cél -- sis,
		in  ex -- cél -- _ _ sis, in  ex -- cél -- _ _ _ _ _ _ _ _ sis. 
	}
}


\score {
	\new StaffGroup <<
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 5)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
	>>
  \header {
		piece = \markup \larger \sans { Benedictus }
	}
	\layout { }
%	\midi {	}
}


%{	 █████       ██████      ███    ██     ██    ██      ██████             ██████      ███████     ██
		██   ██     ██           ████   ██     ██    ██     ██                  ██   ██     ██          ██
		███████     ██   ███     ██ ██  ██     ██    ██      █████              ██   ██     █████       ██
		██   ██     ██    ██     ██  ██ ██     ██    ██          ██             ██   ██     ██          ██
		██   ██      ██████      ██   ████      ██████      ██████              ██████      ███████     ██  %}

soprano = \new Voice	{
	\relative c'' {
%    \set Score.currentBarNumber = #105
	  r1. r1. a1. g2. f4 d2 e1 a2 g1 f2 \[ d e \] a g1 f2 d e1 r4 a a a e e g4. f8 d4 g f d4. e8 f g a4. g8 e4 a g e4. f8 g4 a2
	  g4 e4. d8 f4. e8 d c b4 e4. d8 c a b2 r4 a
	  c2 d4. e8 f4 c \[ f2 g \] a4. f8 \[ f2 g \] r4 c, f2 g a4. g8 [ f d ] f4 e b' c d4. c8 b a g4 a e b' c d4. c8 b a g1 r4 e g e g4. a8 b2 r4
	  e,4 g e g4. a8 [ b c ] b4. a8 a4 g c4. b8 b4. a8 a4. \ficta gis8 \ficta gis \ficta fis 
		\set Timing.timing = ##f a\breve.
	  \showBarLine \bar "||"
		\set Timing.timing = ##t
  }
	\addlyrics {
		Á -- _ _ _ gnus Dé -- _ _ _ i, á -- _ gnus Dé -- i,
		qui  tól -- lis __ _  pec -- cá -- _ ta __ _  mún -- _ _ _ _ _ _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ _ _ di,
		mún -- _ _ _ di mún -- _ _ _ _ _ _ _ _ _ di, __ _
		mún -- _ _ _ _ _ _ _ di, mún -- _ _ _ _ _ _ _ di, mún -- _ _ _ _ _ di,
		mi -- _ se -- ré -- _ re 
		mi -- _ se -- ré -- _ _ _ _ _ _ re  nó -- _ _ _ _ _ _ _ bis.
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _
		dó -- _ na  nó -- _ bis 
		dó -- _ na  nó -- _ _ _ _ _ _ bis  pá -- _ _ _ _ _ _ _ cem.
	}
}

alto = \new Voice	{
	\relative c' {
    e\breve d1 c1 a2 b1. r4 g c2. d4 e2 e d2 ~
		d \[ c2 a \] b \[ e d1 \] c1. a2 r4 e' 
		e e b b d4. c8 a4 d c a4. b8 c d e4 c4. a8 b4 c d b c4. b8 d4. c8
	  b a g4. f8  g4 a2 \ficta gis4 a e'2 f4 g2 \[ c, d \] b \[ c d \] b  \[ c d \] b \[ c d \] b4 e4. d8 f4. e8 d c b4 c4. d8 e4. d8 f4. e8 d c b2 
	  r4 b c8 [a] c [d] e1 r4 b c8 a c d e2 r4 g g g f d e g g g f d e2 e\breve.
  }
	\addlyrics {
		Á -- gnus Dé -- _ i, Dé -- _ _ 
		i, á -- gnus Dé -- _ i, á -- gnus Dé -- i,
		qui  tól -- lis __ _  pec -- cá -- _ ta _ mún -- _ _ _ _ di, 
		mún -- _ _ _ _ di, mún -- _ _ _ _ _ _ _ _ _ _ di,
		mún -- _ di, mún -- _ di, mún -- _ di, mún -- _ di, mún -- _ di, 
		mún -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ di, 
		mi -- se -- _ ré -- _ re, mi -- se -- _ ré -- _ re,  
		mi -- se -- ré -- re nó -- bis,  mi -- se -- ré -- re nó -- _ bis.
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		dó -- na _  nó -- _ bis, dó -- na _  nó -- _ bis, 
		dó -- na  nó -- bis pá -- cem, dó -- na  nó -- bis pá -- _ cem.
	}
}

tenor = \new Voice {
	\relative c' {
	  \clef "treble_8"
    a1. \[ g2 f \] d e1 e' d c2 a1 
		b2 r4 e,4 f d f4. g8 a4. b8 c4 d e2 r4 e,4 f d f4. g8 a4. b8 c d e4 a,4. b8 c2 a
		b1 r2 r1. r1. r1.
	  e1 d2 \[ c a \] b a1 g2 \[ f d \] e a1 g2 f d e r1. r1. r4 e'2 d4 c a b2
	  r4 e2 d4 c a b2 r4 e2 d4. c8 a4 b e2 d4 c a b2 a\breve.
  }
	\addlyrics {
		Á -- gnus Dé -- _ i á -- gnus Dé -- _ 
		i Dé -- _ _ _ _ _ _ _ _ i Dé -- _ _ _ _ _ _ _ _ _ _ _ _ _ 
		i, mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di,
		mi -- se -- ré -- _ re  mi -- se -- ré -- _ re nó -- _ _ _ bis, nó -- _ _ _ _ bis.
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ 
		dó -- na nó -- _ bis  dó -- na  nó -- _ bis pá -- _ _ _ cem, pá -- _ _ _ _ cem.
	}

}

bass = \new Voice {
	\relative c {
		\clef bass
    a1. \[ c2 d1 \] a1. e'4. f8 g2 g, c2. d4 f2 e c d2 ~
		d a2 f' e \[ c2 d \] b2 a1.
    r4 a' a a e e g4. f8 d4 g f d4. e8 f g a4. g8 e4 a2 g4 f d e a g f d2 e1
    r2 a1 g2 \[ f d \] e2 a1 g2 \[ f d \] e2 a1 g2 \[ f d \] e4 a2 g4 f2 d \[ e2 g \] a2 e
    r4 c g'2 a e r4 c g'4. f8 d4 f e c g'4. f8 d4 f e2 a,\breve.
  }
	\addlyrics {
		Á -- _ _ gnus Dé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i,
		qui  tól -- lis __ _  pec -- cá -- _ ta __ _  mún -- _ _ _ _ _ _ di,
		mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di, 
		mún -- _ _ _ _ _ _ di, 
		mi -- se -- ré -- re, mi -- _ se -- ré -- re nó -- bis, mi -- se -- ré -- re nó -- bis. 
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _  
		dó -- na nó -- bis, dó -- _ na nó -- bis pá -- cem, dó -- na nó -- bis pá -- cem.
	}
}


\score {
	\transpose c c {
		\new StaffGroup <<
 			\set Score.proportionalNotationDuration = #(ly:make-moment 1 5)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
  \header {
		piece = \markup \larger \sans { Agnus Dei I & III }
	}
	\layout { }
%	\midi {	}
}

soprano = \new Voice	{
	\relative c'' {
		\set Score.currentBarNumber = #30 \partial 1
	  b1 c2 b4 c4. b8 g4 a b e,2 r g a4 b2 c4 b c2 b8 a g4 c, d f e2 r
	  g2 a4 g a c2 b8 a g2 c, r4 g'a g2  e4 f g2 c4 b a4. g8 g2 f4 e c d2 r4
	  c4 d e 4. c8 d4 e c d e f g2 c,4 d e f g a c, d e f g a \ficta bes c b4 ~
		b8 a8 a2 g4 f2 e d4 c \ficta bes2 a4 d c f e a g c4. b8 a2 \ficta gis4 \set Timing.timing = ##f a\breve
	  \showBarLine \bar "||" \set Timing.timing = ##t
  }
	\addlyrics {
		Á -- gnus __ _ Dé -- _ _ _ _ i %Á -- gnus Dé -- _ _ _ _ _ _ _ _ _ i
		qui __ _ _ _ _ tól -- _ _ _ _ _ _ lis  pec -- cá -- _ ta  mún -- _ _ _ di
		mún -- _ _ _ _ _ _ _ _ _ _ _ _ _ di
		mi -- se -- ré -- _ _ _ _ _ _ _ re  
		nó -- _ _ _ bis, __ _  nó -- _ _ _ bis, __ _
		mi -- se -- ré -- _ _ _ _ re nó -- _ _ bis,
		mi -- _ se -- _ ré -- re nó -- _ _ _ bis.
	}
}

alto = \new Voice	{
	\relative c' {
	  e1 ~ e1. d2 c2. a4 b2 r2 e\breve d2 c2. a4 b2 r4 e d c a2 b4 e4. d8 c4 a b r
	  e4. d8 c4 a b e2 d4 c a b e d4. c8 a4 b2 e d4 c a b r e d c a b
	  e2 d4 c a b r e d c a b r e2 d4 c a b e2 d4 c a b e2 d4 c8 a b4 e d c a
	  \tuplet 3/2 { b4 e4. d8 } \tuplet 3/2 { d2 c4 } \tuplet 3/2 { a b2 } a\breve
  }
	\addlyrics {
		Á -- gnus Dé -- _ i
		qui __ _ tól -- _ lis  pec -- _ _ cá -- ta  mún -- _ _ _ di
		mún -- _ _ _ di, mún -- _ _ _ di, __ _  mún -- _ _ di, 
		mi -- _ se -- ré -- re  mi -- se -- ré -- _ re	mi -- se -- ré -- _ re
		nó -- _ _ _ bis nó -- _ _ _ bis  nó -- _ _ _ bis nó -- _ _ _ bis  nó -- _ _ _ bis
		nó -- _ _ _ _ _ bis.
	}
}

\score {
	\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 6)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
	>>
	\header {
		piece = \markup \larger \sans { \vspace #2 Agnus Dei II }
	}
	\layout {
		ragged-last = ##f
	}
%	\midi {	}
}
