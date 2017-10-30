% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "3"
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
	ragged-last-bottom = ##f
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Missa Ave Regina Caelorum"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Jakob Arcadelt (c. 1507 – 1568)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
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
	\key f \major
	\time 2/2
	\tempo 2 = 56
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c' {
    \set Score.currentBarNumber = #105
    r1 r f2. e4 d2 e c2. c4 d4 f2 e4 f4. e16 d \[ e2 f \] r2 r1 |
    r2 r4 f g a bes g a4. g8 a bes c2 bes4 a a g4 g g g a a f2 r1 a g2 a |
    bes2 bes a2 a g4. f8 g4 a4 ~ \break a8 g8 f2 e4 f\breve r1 r2 f4. f8 | f4 g a bes2
    
    a g4 a1 a r r2 r4 c2 a4 bes g a a g f4. g8 a f g4 e f2 g4 a |
    d,2 r r4 a'2 c4 bes a4. g8 a f g e f2 e4 d d c4 f e c f4. g8 | a4 g r2 r r4 c2
    bes8 a bes4 g a c2 \ficta b4 c1 r r4 f,2 e8 d e4 c d8 e f d e4 f2 e4 f1 r4 f g a |
    
    bes a g8 f f4 f e4 f2 r1 r2 r4 c d e f2 e4 a2 g4 a2 r r r4 f g a bes2 |
    a4 f g a ~ a g8 f e f g4. f8 f2 e4 f1 \fermata \showBarLine \bar "||" | r1 f2 f4 f | a bes c4. bes8 | a g c2 \ficta b4 | c1 |
    r1 r r | r4 c, d e f2. e4 | d4. e8 f4 g ~ g f2 e4 | f1 r |
    
    r r g2. g4 g2 a2 ~ a4 a4 a f bes1 g4 c4. bes8 a4 g f2 e4 f1 r4 f2 g4 |
    a2 a4 a4 g a bes g a a bes c a bes c2 r4 f, g a f g a a2. r2 r1 | r2 r4 a2
    g4 a c bes a4. g8 e4 f2 r4 a2 g4 a a f g d2 | r r4 g | a c4. bes8 g4 |
    
    a8 g f g a4 bes2 a g4 \showBarLine \bar "|" | \time 3/2 a1. ~ a1 r2 | r1. a1 g2 a bes1 |
    a2 g1 f r2 r1. f1 d2 c f g |
    a bes1 a2 f2. g4 a2 g1 f e2 f1 r2 |
    
    r1. f1 d2 c f g a bes1 a2 f2. g4 |
    a2 g1 f e2 f1. ~ f ~ f \fermata \showBarLine \bar "|."
  }
	\addlyrics {
		et in ter -- ra pax ho -- mi -- _ ni -- bus __ _ _ _ _
		bo -- nae vo -- _ lun -- ta -- tis. Lau -- _ da -- _ _ mus te. Be -- ne -- di -- ci -- mus te. 
		A -- do -- _
		ra -- mus te. Glo -- ri -- _ fi -- ca -- _ _ mus te. Gra -- ti -- as a -- _ _

		gi -- mus ti -- bi, Do -- mi -- ne De -- us, rex cae -- le -- _ _ _ _ _ _ _ _ 
		stis, De -- us pa -- _ _ _ _ ter __ _ om -- _ ni -- po -- tens, Do -- mi -- ne fi -- _ _ li u -- 
		_ _ _ ni -- ge -- _ ni -- te, Je -- _ _ _ su Chri -- _ _ _ _ _ _ ste. Do -- mi -- ne

		De -- us, A -- _ gnus De -- _ i, Fi -- li -- us Pa -- _ _ _ tris, Fi -- li -- us Pa -- 
		tris, Pa -- _ _ _ _ _ _ _ _ _ _ tris. Qui tol -- lis pec -- _ ca -- _ _ _ _ _ ta
		mi -- _ se -- re -- re no -- _ _ _ _ _ bis 

		su -- sci -- pe de -- pre -- ca -- ti -- o -- nem no -- _ _ _ _ _ stram. Qui _
		se -- des ad dex -- te -- ram __ _ Pa -- tris, mi -- se -- re -- _ re, mi -- se -- re -- re no -- _ bis. Tu
		so -- lus Do -- _ mi -- _ _ nus, Tu so -- lus Al -- tis -- si -- mus, Je -- su Chri -- _ _

		_ _ _ _ _ _ _ _ ste. Cum san -- cto spi -- 
		_ ri -- tu, in __ _ _ glo -- ri -- 
		a De -- i Pa -- _ tris. A -- _ _ men.
		in __ _ _ glo -- ri -- a De -- i Pa -- _ tris. A -- _ _ men.
	}
}

alto = \new Voice	{
	\relative c' {
    r2 c c4 bes a g f2 bes2. a4 g2 a4 f c'2 bes4. a8 g4 g f2 c'4. bes8 a4. g16 f g4 g f4 c' d e |
		f4. e16 d c4 d bes c d c8 bes a4. bes8 c4 f d g e f | d2 e r4 c d d e e f f2 f4 f2 | e f1
		f2 f2. f4 e2. c4 d bes c2 a4. bes8 c2 | r a2. bes4 c d bes2 c4 d bes2 c4 bes |
		
		d2 r4 d d d f2. e8 d c4. d8 e4 d c d2 c4 d c | r f d e c d2 c4 d d g,2 d' r |
		r4 d f e2 d c4 d8 c d e f2 r a,4 c | bes a a d2 c \ficta b4 c c c c bes2 a |
		c d4 bes c c d2 r r4 c2 bes8 a bes4 g a4. g8 a4 bes g c d a | c d c2 a a bes4 c d e |
		
		f4. e8 d4 c d bes c4. a8 bes4 a2 g4 a2 r4 a4. bes8 c2 \ficta b4 c2 r | c d e4 f4. e8 d c d e f2 e4 |
		f4. e8 d4 c ~ c bes4 c g a c4. bes8 g4 a1 \fermata | c2 c4 c d4. c8 d e f2 d4 e f4. e8 d c d2 \[ c a \] |
		r r4 c d e f2. e4 \[ d2 c \] bes4 c d bes c2 r4 d d d | c2 c4 c a4 d d c f2 e4 c |
		
		d e f2. e8 d e2 e2. e4 e2 e2 ~ e4 e4 d d f2 g | e2. c4 \[ d2 c \] a4. bes8 c4 f, r d' d2 |
		c4 a d4. d8 e4 f d e f c d e f d e2 r1 | r4 d2 c4 d f2 e4 d c4. d8 e4 f e r2 |
		r4 d2 c4 d f2 e4 d c r d c d f e | d2 r4 d d f2 e4 c4. bes8 a4 g |
		
		f c' d2 d1 d r2 | c1 bes2 c d2. e4 f1 e2 f1 r2 |
		f d c a1 bes2 c \[ d bes \] c1 r2 c d2. e4 |
		f2. e4 \[ d2 c \] d1 c2. d4 e2 d r c a2. a4 bes2 |
		
		c d bes c1 r2 c d2. e4 | f2. e4 \[ d2 c \] d1 |
		c2. bes4 g2 d'1 c2 a1 d2 c bes1 a1. \fermata |
  }
	\addlyrics {
		Et in ter -- _ ra pax, et in ter -- _ ra pax ho -- mi -- _ _ ni -- bus, ho -- _ mi -- _ _ ni -- bus, bo -- _ nae 
	  vo -- _ _ _ lun -- ta -- _ _ _ _ _ _ tis. Lau -- da -- _ _ _ mus te. Be -- ne -- di -- ci -- mus te. A -- do -- ra -- mus te. 
	  Glo -- ri -- fi -- ca -- _ _ _ mus te. __ _ _ Gra -- _ ti -- _ as a -- gi -- mus ti -- _ 

	  bi pro -- pter ma -- _ _ _ _ _ gnam glo -- ri -- am __ _ tu -- am. Do -- _ mi -- ne De -- us, Rex cae -- le -- stis, 
	  De -- us Pa -- ter om -- ni -- _ po -- _ tens, De -- us Pa -- _ ter om -- ni -- po -- tens. Do -- mi -- ne Fi -- li 
	  u -- _ ni -- ge -- ni -- te, u -- _ _ _ ni -- ge -- _ _ ni -- te, Je -- _ su Chri -- _ _ ste. Do -- mi -- ne De -- us, 

	  A -- _ _ gnus De -- _ _ _ _ _ _ _ _ _ _ _ i, Fi -- li -- us Pa -- _ _ _ _ _ _ tris,
	  Fi -- li -- us Pa -- _ _ _ _ _ _ _ tris. Qui tol -- lis pec -- _ _ _ ca -- ta mun -- _ _ _ _ _ _ di, 
	  mi -- _ se -- re -- re no -- _ _ _ _ _ bis, mi -- se -- re -- _ re no -- bis. Qui tol -- lis pec -- ca -- ta 

	  mun -- _ _ _ _ di, su -- sci -- pe de -- pre -- ca -- ti -- o -- nem no -- _ stram. __ _ _ _ _ _ Qui se -- 
	  des ad dex -- te -- ram __ _ Pa -- _ tris, __ _ mi -- se -- re -- _ re. Quo -- ni -- _ am tu __ _ so -- lus San -- _ ctus. 
	  Tu so -- lus Do -- mi -- _ nus, Tu so -- lus Do -- mi -- nus. Je -- su Chri -- ste, Je -- su Chri -- ste.

	  Je -- _ su Chri -- ste. Cum San -- cto Spi -- _ _ ri -- tu, 
	  in glo -- ri -- a De -- i Pa -- _ tris, in glo -- ri -- 
	  a __ _ De -- _ i Pa -- _ _ tris, in glo -- ri -- a 

	  De -- i Pa -- tris, in glo -- ri -- a __ _ De -- _
	  i Pa -- _ tris. A -- _ men, A -- _ _ men.
	}
}

tenor = \new Voice {
	\relative c' {
	  \clef "treble_8"
    c2. bes4 a g f2. e4 d2 f c4 c'2 bes4 a g | f2 c'4. bes8 a4. g16 f g4 g f c' bes c a4. g8 a bes c4 |
		bes a4. g8 f e d c f2 e4 f2 a bes4 d4. c8 c2 \ficta b4 c c | c f, a bes? c c2 a4 d d c2 r4 c c a |
		d2 d c1 c2 c4 c a4. g16 f g4 g f4. g8 a1 r2 r f4. f8 f4 g4 a bes2 a8 g f4 g |
		
		\[ a2 bes \] a r4 a2 a4 a c2 bes8 a g4 a | bes a g2 a r4 c2 a4 bes a2 f4 r c' a bes2 a2 
		g4 a c4. bes8 a4. g8 a4 | f2 a c4 bes a a f4. g8 a4 bes c2 r r4 g2 a4 | f g c,2 c
		r2 r4 a'2 g8 f g4. f8 g4 a2 g8 f g4 g | f4 c' d4 d c4. bes8 a4 g8 f g1 f2 r4 f g a bes a |
		
		d4. c8 bes4 a g2 f r4 c d4. e8 f4 e e2 | r r4 f g a bes2 a4 c2 bes4 c2 d2. c4 bes2 |
		c4 d bes c r f, g c4. bes8 a4 g2 f1\fermata r r r r f2 f4 f |
		a bes c4. bes8 a g c2 \ficta b4 c2 r r1 r4 f, g a | bes1 \[ a2 g \] f4 a f4. g8 a4 bes c4. bes8 |
		
		a g c2 \ficta b4 c1 c2. c4 c2 c2 ~ c4 c4 a a | d1 c4. bes16 a g4 a \[ bes2 g \] f r a bes |
		a4 f a4. bes8 c4 c bes c a2 r f g4 a | f bes2 a4 d2 r4 a2 f4 a c bes a c2 f,4 g r2 |
		r a g4 a4. bes8 c4 f,8 g a bes c4 f, r d'2 c4 d bes2 a8 g | a4 a g c ~ c a4. bes8 c4. 
		
		bes8 a g f2 g4 a bes2 a1 r2 a1 g2 | a bes2. a4 f2 g g f2 f g |
		a \[ bes g \] r f d c f g a1 bes2 a \[ d, g \] 
		c, r f1 bes2 bes a c2. bes4 | a2 g1 r2 f d |
		
		c f g a1 bes2 a \[ d, g \] c, r f1 bes2 bes |
		a c2. bes4 a2 \[ bes g \] f d4 e f g a2 f1 f1.\fermata |
  }
	\addlyrics {
		Et in ter -- ra pax ho -- mi -- ni -- bus, et in ter -- ra pax ho -- _ mi -- _ _ _ ni -- bus bo -- nae __ _ vo -- _ _ _ lun -- 
		ta -- _ _ _ _ _ _ _ _ tis. Lau -- _ da -- _ _ mus te. Be -- ne -- di -- ci -- mus te. A -- do -- ra -- mus te. Glo -- ri -- fi -- 
		ca -- mus te, glo -- ri -- fi -- ca -- _ _ _ mus te. __ _ _ Gra -- ti -- as a -- _ _ gi -- _ mus __ _

		ti -- _ bi pro -- pter ma -- _ _ _ gnam glo -- ri -- am tu -- am. Do -- mi -- ne De -- us, Rex cae -- le -- _ 
		_ _ _ _ _ _ _ stis, De -- us Pa -- _ ter om -- _ ni -- po -- tens. Do -- mi -- ne __ _ Fi -- 
		li u -- _ _ _ _ ni -- ge -- _ _ _ ni -- te, Je -- _ su Chri -- _ _ _ _ _ ste. Do -- mi -- ne De -- us, 

		A -- _ _ gnus De -- i, Do -- mi -- ne De -- _ us, Fi -- li -- us Pa -- _ _ _ tris, Fi -- li -- us 
		Pa -- _ tris, __ _ Pa -- _ _ _ _ _ tris. Qui tol -- lis 
		pec -- _ ca -- _ ta __ _ mun -- _ di, mi -- _ se -- re -- re no -- bis. Qui tol -- lis pec -- _ ca -- _

		ta __ _ mun -- _ di, su -- sci -- pe de -- pre -- ca -- ti -- o -- nem __ _ _ _ _ no -- _ stram. Qui se -- 
		des ad dex -- te -- ram Pa -- _ _ tris, mi -- se -- re -- re no -- _ bis. Quo -- ni -- am tu so -- lus San -- ctus. __ _
		Tu __ _ so -- _ lus Do -- _ _ _ mi -- nus. Tu so -- lus Al -- _ _ tis -- si -- mus, Je -- su __ _ Chri -- 

		_ _ _ _ _ _ _ ste. Cum San -- cto Spi -- _ _ _ ri -- tu, in glo -- 
		ri -- a, __ _ in __ _ _ glo -- ri -- a De -- i Pa -- _ 
		tris, in glo -- ri -- a De -- _ _ i, in __ _

		_ glo -- ri -- a De -- i Pa -- _ tris, in glo -- ri -- 
		a De -- _ i Pa -- _ tris. A -- _ _ _ men, A -- men.
	}
}

baritone = \new Voice {
	\relative c {
		\clef bass
    r1 r r r f2. e4 d2 e c2. c4 d f2 e4 f4. e8 d4 c |
		f2 e4 d2 c4 bes2 c f g a4 f | g2 c, r r4 f g g a a f2 r r1 |
		r4 f2 d4 f f c4. d8 e4 e e e f d e2 | c r4 f4. e8 d2 f4. e8 f g a4 d,4. c8 d e f2. e8 d c4 d4. 
		
		e8 f4 d2 ~ \break d2 r2 r1 r2 r4 f2 f4 d e | f f g c, f2 g4 a d,2 r f4. d8 e4 c |
		d2 c4. d8 e4 f e2 d r4 d c f4. g8 a4 d,2 r4 f g a f f4 ~ \break f4 e8 d e4 c | d4. e8 f g a4.
		g8 f2 e4 f4. e8 d2 c c f4 f bes, c | r f2 g4 \[ e2 f \] e4 d e2 c1 r |
		
		r4 f g a bes g a2 g4 f2 e8 d c4 c4. d8 e4 f g f2 | r1 r2 r4 f g a bes2. a4 g2 |
		f4 d2 e4 f d e2 c\breve\fermata r1 r r f2 f4 g | a4. bes8 c2. 
		f,4 g a2 g4 f f g a bes2. a4 g2 | f4 d e c f4. e8 d4 bes c2 r r4 f4 a4. bes8 | c4 f, g a2
		
		g4 f2 g g2. g4 g2 e2. e4 a a f2 | d2. g2 c,4 e f d2 r r4 c2 d4 e f d4. e8 |
		f4 c f f c f g g d f2 e4 r2 r4 c d2 e4 f2 d4 e2 d r2 r4 a'2 g4 a c bes a |
		d,2 e r1 a2 g4 a c bes \[ a2 d, \] r4 f2 c4 d e f f c2 |
		
		r4 f2 d4. e8 f4 d e f1 r2 e1 d2 | e f2. e4 \[ c2 d \] e c d1 |
		f e2 f1 g2 a f d | c f g a bes1 |
		a2 f2. g4 \[ a2 d, \] f1 e2 r f d c f1 g2 |
		
		a f d c f g a bes1 | a2 f2. g4 \[ a2 d,2. \] e4 |
		f1 d2 f g1 r2 f2. e4 c2 d1 c1.\fermata
  }
	\addlyrics {
		Et in ter -- ra pax ho -- _ mi -- ni -- bus __ _ _ _
		bo -- nae vo -- lun -- ta -- tis. Lau -- da -- mus __ _ te. __ _ Be -- ne -- di -- ci -- mus te.
		A -- do -- ra -- mus te. __ _ _ Glo -- ri -- fi -- ca -- mus te. __ _ Gra -- ti -- as a -- _ _ _ _ gi -- _ _ _ _ _ _ mus ti -- 

		_ _ bi. Do -- mi -- ne __ _ De -- us, Rex cae -- le -- _ _ stis, Rex __ _ _ cae -- 
		le -- _ _ _ _ _ stis, De -- us Pa -- _ _ ter om -- ni -- po -- tens. Do -- _ _ _ mi -- ne __ _ _ _ _
		_ Fi -- _ _ _ li u -- ni -- ge -- ni -- te, __ _ Je -- _ su __ _ Chri -- _ _ ste.

		Do -- mi -- ne De -- us, A -- gnus De -- _ _ i, Fi -- li -- us Pa -- _ tris, Fi -- li -- us Pa -- _ _
		tris, Pa -- _ _ _ _ tris. Qui tol -- lis pec -- _ ca -- 
		ta mun -- _ _ di, mi -- _ se -- re -- re no -- bis. __ _ _ _ _ _ _ _ _ Qui tol -- _ lis pec -- _ ca -- 

		ta mun -- di, su -- sci -- pe de -- pre -- ca -- ti -- o -- nem no -- _ _ _ stram. Qui se -- des ad dex -- te -- 
		ram __ _ Pa -- tris, mi -- _ se -- re -- re no -- bis, mi -- _ se -- re -- re no -- bis. Quo -- ni -- am tu so -- lus 
		San -- ctus. Tu so -- lus Do -- _ mi -- nus. Tu so -- lus Al -- tis -- si -- mus, 

		Je -- su __ _ Chri -- _ _ ste. Cum San -- cto Spi -- ri -- tu, __ _ in __ _ glo -- 
		ri -- a De -- i Pa -- _ tris, in glo -- ri -- a De --
		i Pa -- _ _ _ _ tris, in __ _ _

		glo -- ri -- a, __ _ De -- i Pa -- _ tris, De -- i Pa -- _ tris. __ _ _
		A -- _ _ men, A -- _ _ _ men.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
    r1 f2. e4 d c bes2 bes c4 c f,2 f bes c f, r | r r4 c' d f2 e4 |
		d4. c8 a4 bes2 a4 g2 f1 r r2 r4 c' f4. e8 d4 d c2 f2. d4 f f c2 f |
		bes,2. bes4 f f f2 c'2 c4 a4 d2 c f,1 | r4 f'4. e8 d4. c8 bes4 a bes4. a8 g4 f d'2 c8 bes a4 g2 
		
		f4 g2 r4 d' d d f2. e8 d c4 d e d4. c8 a4 bes c f,2 r r r4 f'2 d4 e c d d c4 a |
		bes2 a4. bes8 c4 d a2 r4 d2 f4 e d4. c8 a4 bes8 c d e f4 d e f d2 | c4 c2 bes8 a | bes4 g a f4. 
		g8 a4 g2 f f'2. e8 d e4 c d f4. e16 d e4 | f4. e8 d4 bes c a d2 c4 bes c2 f,1 r |
		
		r r2 r4 f g a bes2 a1 d4 c d2 | c4 c d e f4. e8 d2 c4 f, bes2 r1 |
		r4 bes2 a4 d2 c4. bes8 a4 f c'2 f,1\fermata | r r r r r2 r4 f' |
		f d e f2 e4 d2 c4 c d e f2. e4 \[ d2 c \] bes1 r4 c c c | d4. c8 d e f2 d4 e f2 
		
		e4 d2 c1 c2. c4 c2 a2 ~ a4 a4 d d bes2 g c2. f,4 \[ bes2 c \] f,4. g8 a4 bes c d bes4. a8 |
		f1 r2 r4 c' f4. e8 d4 c d d c a bes4. a8 g4 f | bes2 a2 r4 d2 c4 d4 f2 e4 d c d4. c8 |
		bes2 a r4 d2 c4 d f e d r2 r4 a | bes g8 a bes c d4. c8 a4 bes c f, f'2 e4 |
		
		f4. e8 d c bes a g4 f g2 d'1 r2 a1 bes2 | a d2. c4 a2 \[ bes c \] f, bes g |
		f bes c d2. c4 bes2 | a bes1 f r2 r bes g |
		f bes4 c d e f2 bes,1 f2 c'1 \[ d2 bes \] c d2. c4 bes2 |
		
		a bes1 f r2 r bes g f bes4 c d e f2 bes,1 |
		f2 c'1 d2 \[ bes c \] d2. c4 \[ bes2 a \] bes1 f1.\fermata |
  }
	\addlyrics {
		Et in ter -- ra pax ho -- mi -- ni -- bus, ho -- mi -- ni -- bus bo -- nae vo -- lun -- 
		ta -- _ _ _ _ _ tis. Lau -- da -- _ _ mus te. Be -- ne -- di -- ci -- mus te.
		A -- do -- ra -- mus te. Glo -- ri -- fi -- ca -- mus te. Gra -- _ _ ti -- as __ _ a -- _ _ gi -- mus __ _ _ _ ti -- 

		_ bi pro -- pter ma -- _ _ _ gnam glo -- ri -- am __ _ _ tu -- _ am. Do -- mi -- ne De -- _ us, Rex cae -- 
		le -- _ _ _ _ stis, De -- us __ _ Pa -- _ ter om -- _ _ _ _ _ ni -- _ po -- tens. Do -- _ _ _ mi -- ne Fi -- 
		_ _ _ li u -- _ _ _ ni -- ge -- _ _ _ ni -- te, __ _ _ Je -- _ su Chri -- _ _ _ ste.

		Do -- mi -- ne De -- us, A -- gnus De -- i, Fi -- li -- us Pa -- _ _ _ _ tris,
		Pa -- _ _ _ _ _ _ _ tris. Qui 
		tol -- lis pec -- ca -- ta mun -- di, mi -- _ se -- re -- re no -- _ bis. Qui tol -- lis pec -- _ _ _ ca -- ta mun -- _ 

		_ _ di, su -- sci -- pe de -- pre -- ca -- ti -- o -- nem no -- _ stram. __ _ Qui __ _ _ _ se -- _ _ _ 
		des ad dex -- te -- ram __ _ Pa -- tris, mi -- se -- re -- _ re __ _ no -- bis. Quo -- ni -- am __ _ tu so -- lus San -- _ 
		_ ctus. Tu so -- lus Do -- mi -- nus. Tu __ _ so -- _ _ _ _ lus Al -- tis -- si -- mus, Je -- su 

		Chri -- _ _ _ _ _ _ _ _ ste. Cum San -- cto Spi -- _ _ ri -- _ tu, in glo -- 
		ri -- a __ _ De -- _ _ i Pa -- tris, in glo -- 
		ri -- a __ _ _ _ _ De -- i Pa -- _ _ tris. A -- _ _ 

		_ _ men, in glo -- ri -- a __ _ _ _ _ De -- 
		i Pa -- _ tris. __ _ A -- _ _ _ _ men.
	}
}


\score {
	\transpose c es {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \baritone \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
  \header {
		piece = \markup \larger \sans { Gloria }
	}
	\layout { }
	\midi {	}
}
