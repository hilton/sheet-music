\version "2.14.2"

\header {
	title = "O Magnum Mysterium"
	composer = \markup { "Giovanni Gabrieli (c. 1553 - 1612)" }
	copyright = \markup {
		\column \center-align {
			\line { This edition copyright ©2012 Peter Hilton - Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - Licensed under the }
			\line { Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/ }
		}
	}
	tagline = ##f 
}

global = { 
	\key f \major
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 15) 
	#(set-accidental-style 'forget)
}

\paper {
	annotate-spacing = ##f
	ragged-last-bottom = ##f
%	between-system-spacing = #'((space . 0) (padding . 10))
	system-system-spacing #'padding = #2
	top-margin = 15\mm
	bottom-margin = 10\mm
	left-margin = 15\mm
	right-margin = 15\mm
	last-bottom-spacing = #'(
		(padding . 8)
	)
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }

% CHOIR 1

cantus = \new Voice	{
	\relative c'' {
		\override NoteHead #'style = #'baroque
		g1 d' b2. b4 c2. c4 b2 r
		R1 R R R g d'
		b2. b4 c2. c4 b2 r4 b c c d2. d4 c2 c2. bes4
		a1 a2 r1 r r r4 \mark \default d d d bes4. bes8
		bes4 bes es2. bes4 bes8 c d bes c4. c8 c2 d1 d4 \mark \default g, g g
		a4. g8 g4 fis g2 r1 r r4 c c c d4. c8 \break c4 b c2
		R1 r4 a bes a g2 fis4 g2 a4 bes4. bes8 a2 r R1
		r4 \mark \default d2 d4 d2 c4 c c2 bes4 bes2 g4 a bes2 a4 bes2 R1
		r2 d2. d4 c2 \partial 2 a \showBarLine \bar "|" \time 3/4
			b^\markup { \halign #1
			    \concat { ( \smaller \general-align #Y #DOWN \note #"2" #1 " = " \smaller \general-align #Y #DOWN \note #"2." #1 ) }
			}
			r4 R2.
		R2. R2. \mark \default d4 d c b8 c4 bes8 a4 a2. \mark \default b4. c8 a4
		g8 c4 bes8 a4 a8 d4 d8 d4 d2 r4 R2. R2. R2.
		\mark \default d4 d c b8 c4 bes8 a4 a2. \mark \default b4. c8 a4 g8 c4 bes8 a4 a8 d4 d8 d4 
			\showBarLine \bar "|" \time 2/2
		d4^\markup { \halign #1
		    \concat { ( \smaller \general-align #Y #DOWN \note #"2." #1 " = " \smaller \general-align #Y #DOWN \note #"2" #1 ) }
		}
		 d2 d4 es4. d8 c bes c2 bes4 c es2 c4 es2 d1\fermata \showBarLine \bar "|."
	}
	\addlyrics {
		O ma -- gnum my -- ste -- ri -- um,
		o ma --
		gnum my -- ste -- ri -- um et ad -- mi -- ra -- bi -- le sa -- cra -- 
		men -- tum, ut a -- ni -- ma -- li -- 
		a vi -- de -- rent Do -- _ _ _ _ mi -- num na -- tum ja -- cen -- tem
		in præ -- se -- pi -- o, ja -- cen -- tem in præ -- se -- pi -- o.
		Be -- a -- ta Vir -- go, cu -- jus vi -- sce -- ra
		me -- ru -- e -- runt por -- ta -- re Do -- mi -- num Chri -- _ stum,
		Do -- mi -- num Chri -- stum:
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- _ _ _ _ _ ja, al -- le -- lu -- ja.
	}
}

altus = \new Voice {
	\relative c'' {
		\override NoteHead #'style = #'baroque
		r2 bes1 a2 g d e8 f g2 fis4 g2 r
		R1 R R R d1 g2 a4 f
		g2.g4 g2 r r4 \mark \default d g2. a4 bes2. bes4 a4. g16 f g2 g ~
		g4 f e2 fis r1 r r r r4 g
		g4 g bes4. bes8 bes4 g f4. g8 a4 a g4. g8 g4 d8 e fis g a4 g4 d e e
		f4. es8 es4 d d2 r1 r2 r4 g g g a4. g16 a bes4. a8 a4 g g2
		R1 r4 e f f es4 d8 c d4 d2 e4 f g e2 r R1
		r4 bes'2 bes4 bes2 a4 a g2 g4 g2 d4 f2 f f R1
		r2 r4 bes2 bes4 g2 f4 d d2 r4 R2.
		R2. R2. a'4. d,8 g4 g8 g4 g8 e4 fis2. g4. c,8 f4
		g8 e4 d8 cis4 d8 d4 bes'8 a4 b2 r4 R2. R2. R2. 
		a4. d,8 g4 g8 g4 g8 e4 fis2. g4. c,8 f4 g8 e4 d8 cis4 d8 d4 bes'8 a4
		b4 b2 b4 c2 g r4 g2 g4 g4. f8 es c c'2 b8 a b2\fermata
	}
	\addlyrics {
		O ma -- gnum my -- ste -- _ _ ri -- um,
		o ma -- gnum my --
		ste -- ri -- um et ad -- mi -- ra -- bi -- le __ _ _ _ sa -- 
		cra -- men -- tum, ut
		a -- ni -- ma -- li -- a vi -- de -- _ _ rent Do -- mi -- num na -- _ _ _ _ tum ja -- cen -- tem
		in præ -- se -- pi -- o, ja -- cen -- tem in __ _ _ _ præ -- se -- pi -- o.
		Be -- a -- ta Vir -- _ _ go, cu -- jus vi -- sce -- ra
		me -- ru -- e -- runt por -- ta -- re Do -- mi -- num Chri -- stum,
		Do -- mi -- num Chri -- _ stum:
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- _ _ _ _ _ _ ja.
	}
}

tenor = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		r2 d1 f2 d4 d g2 g4 e2 c4 d2 r
		R1 R R R bes d
		d2. d4 c2. c4 g'2 r4 d e e f2. f4 f f2 e4 d2
		cis4 d2 cis4 d2 r1 r r r2 r4 d d d
		bes4. bes8 bes4 es bes4. c8 d es f2 c4 c4. c8 g'2 r r4 b, c c
		c4. c8 a4 a g2 r r4 \mark \default a a a b4. a16 b c2. c4 bes4. a8 d4 d g,2
		R1 r4 des' d! d bes a8 g a4 b2 c4 d4. d8 cis2 r R1
		r4 f2 f4 d2 f4 c c2 d4 d2 bes4 d2 c bes R1
		r2 r4 d2 f4 e2 d b r4 R2.
		R2. R2. fis'4. g8 e4 d8 e4 d8 cis4 d2. d4. c8 c4
		c8 g'4 g8 e4 fis8 fis4 g8 a4 g2 r4 R2. R2. R2. 
		fis4. g8 e4 d8 e4 d8 cis4 d2. d4. c8 c4 c8 g'4 g8 e4 fis8 fis4 g8 a4
		g4 g2 g4 g2 es4 es d2 c4. d8 es4. d8 c2 d1\fermata
	}
	\addlyrics {
		O ma -- gnum my -- ste -- _ _ ri -- um,
		o ma --
		gnum my -- ste -- ri -- um et ad -- mi -- ra -- bi -- le sa -- cra -- men --
		_ _ _ tum, ut a -- ni -- 
		ma -- li -- a vi -- de -- _ _ _ _ rent Do -- mi -- num ja -- cen -- tem
		in præ -- se -- pi -- o, ja -- cen -- tem in __ _ _ _ præ -- se -- _ _ pi -- o.
		Be -- a -- ta Vir -- _ _ go, cu -- jus vi -- sce -- ra
		me -- ru -- e -- runt por -- ta -- re Do -- mi -- num Chri -- stum,
		Do -- mi -- num Chri -- stum:
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- _ _ _ _ ja.
	}
}

bassus = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef bass
		r2 g1 d'2 g,2. g4 c4. bes8 a4 a g2 r
		R1 R R R g bes2 a
		g2. d4 e8 f g2 fis4 g2 r4 g c c bes2. bes4 f2 c' g
		a1 d,2 r R1 R R R
		r4 g g g es4. es8 bes'4 f f f g4. g8 g2 d g4 g c, c
		f4. c8 c4 d g2 r1 r2 g2 c,4 c f2. f4 d4. g8 e2
		R1 a2 d,4 d es2 d4 g2 c4 bes g a2 r R1
		r4 bes2 bes4 bes f2 f4 g2 g4 g2 g4 d2 f bes R1
		r4 f2 f4 d2 r d d r4 R2.
		R2. R2. d'4. b8 c4 g8 c4 g8 a4 d,2. g4. e8 f4
		c8 c'4 g8 a4 d,2. R2. R2. R2. R2. 
		d'4. b8 c4 g8 c4 g8 a4 d,2. g4. e8 f4 c8 c'4 g8 a4 d,2.
		r4 g2 g4 c,2 g' r4 g2 c,4 g'1 g\fermata
	}
	\addlyrics {	
		O ma -- gnum my -- ste -- _ _ ri -- um,
		o ma -- _
		gnum my -- ste -- _ _ ri -- um et ad -- mi -- ra -- bi -- le sa -- cra --
		men -- tum,
		ut a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- tum ja -- cen -- tem
		in præ -- se -- pi -- o, ja -- cen -- tem in præ -- se -- pi -- o.
		Be -- a -- ta Vir -- go, cu -- jus vi -- sce -- ra
		me -- ru -- e -- runt por -- ta -- re Do -- mi -- num Chri -- stum,
		Do -- mi -- num Chri -- stum:
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja, 
		al -- le -- lu -- ja, al -- le -- lu -- ja.
	}
}


% CHOIR 2

cantusB = \new Voice	{
	\relative c' {
		\override NoteHead #'style = #'baroque
		R1*4 r2 d2 ~
		d2 f d4 d g1 g2 fis r1 d f2
		d4 d g4. f8 e2. a4 d,1 R R R
		r1 r4 fis g g a2. a4 f2 f2. es4 d2 d r4 d
		d4 d g4. g8 g4 es d2 c4 f2 es4 d g2 fis4 g2 r
		r2 r4 d d d e4. d8 d4 cis d d d d e4. d16 e f2. f4 f d c \mark \default e
		f4 e d2 cis r R1 R r4 \mark \default cis2 d4 d4. d8 d4 f ~
		f4 f f1 f4 f e2 d1 r1 r4 \mark \default f2 e4 f2
		f2 f4 f2 d4 e g2 fis4 g2 r4 \mark \default e4. f8 d4
		c8 f4 es8 d4 d2. R2. R2. R2. g4 g f
		e4 r2 a4. g8 fis4 g2 r4 \mark \default e4. f8 d4 c8 f4 es8 d4 d2.
		R2. R2. R2. g4 g f e r2 a4. g8 ges4
		g1 r4 g2 g4 g2 es4 c2 g'4 g2 g1\fermata
	}
	\addlyrics {
		O ma -- gnum my -- ster -- ri -- um, o ma
		gnum my -- ste -- _ _ ri -- um
		et ad -- mi -- ra -- bi -- le sa -- cra -- men -- tum, ut
		a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- _ tum
		ja -- cen -- tem in præ -- se -- pi -- o, ja -- cen -- tem in __ _ _ _ præ -- se -- pi -- o. Be --
		a -- ta Vir -- go, cu -- jus vi -- sce -- ra me --
		ru -- e -- runt por -- ta -- re Do -- mi -- num 
		Chri -- stum, Do -- mi -- num Chri -- _ stum: al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- 
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja.
	}
}

altusB = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		R1*4 r2 bes ~
		bes2 a g d'2. bes2 g4 a2 r1 g f4 d ~
		d4 d2 g4. f8 e2 c4 d1 R R R
		r2 r4 \mark \default a'2 d e4 f2. f4 d4. c16 bes c2 c2. bes4 a2 g
		r4 bes bes bes g4. g8 d4 d f2 c4 c'4. bes8 bes4 a2 b r
		r2 r4 a b b c4. bes8 bes4 a fis2 r4 g g e a8 g f e d4. a'8 a4 d, e g
		a4 a f e8 d e2 r R1 R r4 a2 a4 bes4. bes8 a4 d ~
		d4 d d2 bes r r4 c,4 g'2 d r1 r4 bes'2 g4 a bes ~
		bes4 a bes d2 d,4 g f8 e a2 g r4 c4 c bes
		a8 c4 c8 a4 b2. R2. R2. R2. g4 g a
		e4 r2 a4. d8 d4 d2 r4 c4. c8 bes4 a8 c4 c8 a4 b2.
		R2. R2. R2. g4 g a e r2 a4. d8 d4
		d1 r4 c2 c4 d2 g, r4 g2 c,4 g'2 g\fermata 
	}
	\addlyrics {
		O ma -- gnum my -- ster -- ri -- um, o ma -- gnum
		my -- ste -- _ _ ri -- um
		et ad -- mi -- ra -- bi -- le __ _ _ _ sa -- cra -- men -- tum,
		ut a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- tum
		ja -- cen -- tem in præ -- se -- pi -- o, ja -- cen -- tem in __ _ _ _ _ præ -- se -- pi -- o. Be --
		a -- ta Vir -- _ _ go, cu -- jus vi -- sce -- ra me --
		ru -- e -- runt por -- ta -- re Do -- mi -- num Chri --
		_ stum, Do -- mi -- num __ _ _ Chri -- stum: al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- 
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja.
	}
}

tenorB = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		R1*4 g1
		d'1 b2. b4 b8 c d2 c4 d2 r1 d,2 ~ d1
		g2 d4 d' g,2 a b1 R R R
		r1 r4 a b b c2. c4 bes bes2 a4 g2 fis4 g2 fis4 g2
		r2 r4 bes bes bes bes4. bes8 a4 a c g g4. g8 a4 d,2 d4 r2
		r2 r4 d d g g4. g8 e4 e d2 r r4 c' c a bes4. c8 d4 g, g c
		c4 c bes a8 g a2 r R1 R r4 e e f2 g4 f bes ~
		bes4 bes bes2 f4 f c'2. g4 r1 r r4 d'2 c d4
		c2 bes4 bes4. bes8 f4 c' g r2 R2. g4. a8 f4
		f8 a4 g8 fis4 g2. R2. R2. R2. d'4. g,8 d'4 
		c4 r2 a4. d,8 d4 g2 r4 g4. a8 f4 f8 a4 g8 fis4 g2.
		R2. R2. R2. d'4. g,8 c4 c r2 a4 d, d
		g1 r4 g2 g4 g d r g2 c,4 g'1 d2\fermata 
	}
	\addlyrics {
		O ma -- gnum my -- ster -- _ _ ri -- um, o
		ma -- gnum my -- ster -- ri -- um
		et ad -- mi -- ra -- bi -- le sa -- cra -- men -- _ _ _ tum,
		ut a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- tum
		ja -- cen -- tem in præ -- se -- pi -- o, ja -- cen -- tem in præ -- se -- pi -- o. Be --
		a -- ta Vir -- _ _ go, cu -- jus vi -- sce -- ra me --
		ru -- e -- runt por -- ta -- re Do -- mi -- num
		Chri -- stum, Do -- mi -- num Chri -- stum: al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- 
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja.
	}
}

bassusB = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef bass
		R1*4 r2 g2 ~
		g2 d' g,2. g4 g'4. f8 es4 es d2 r1 g,1 d'2
		g,2. g4 c4. bes8 a4 a g1 R R R
		r1 r4 d' g g f2. f4 bes,2 f' c d1 g,4 g'
		g4 g es4. es8 es4 es bes2 f c'4. c8 g2 d' g, r
		r2 r4 d' g, g c4. g8 g4 a d2 r r4 c4 f, f bes4. f8 f4 g c c
		a4 a bes2 a r R1 R r4 a2 d4 bes g d' bes ~
		bes4 bes bes1 f4 f c'2 g1 r r4 bes2 c4 f2
		f2 bes,4 bes2 bes4 c2 d g, r4 c4. a8 bes4
		f8 f'4 c8 d4 g,2. R2. R2. R2. g4. c8 f,4 
		c'4 r2 d4. g,8 d'4 g,2 r4 c4. a8 bes4 f8 f'4 c8 d4 g,2.
		R2. R2. R2. g4. c8 f,4 c' r2 d4. g,8 d'4
		g,1 r4 c2 c4 g2 c4 c2 c4 c2 g1\fermata 
	}
	\addlyrics {
		O -- ma -- gnum my -- ster -- _ _ ri -- um, o ma
		gnum my -- ster -- _ _ ri -- um
		et ad -- mi -- ra -- bi -- le sa -- cra -- men -- tum, ut
		a -- ni -- ma -- li -- a vi -- de -- rent Do -- mi -- num na -- tum
		ja -- cen -- tem in præ -- se -- pi -- o, ja -- cen -- tem in præ -- se -- pi -- o. Be --
		a -- ta Vir -- go, cu -- jus vi -- sce -- ra me --
		ru -- e -- runt por -- ta -- re Do -- mi -- num
		Chri -- stum, Do -- mi -- num Chri -- stum: al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu --
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja, al -- le -- lu -- ja,
		al -- le -- lu -- ja, al -- le -- lu -- 
		ja, al -- le -- lu -- ja, al -- le -- lu -- ja.
	}
}


\score {
	<<
		\new ChoirStaff \with {
    		\override StaffGrouper #'staffgroup-staff-spacing #'padding = #10
	} << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff \with { instrumentName = #"CANTUS" shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"ALTUS"  shortInstrumentName = #"A " } << \global \altus >> 
			\new Staff \with { instrumentName = #"TENOR"  shortInstrumentName = #"T " } << \global \tenor >> 
			\new Staff \with { instrumentName = #"BASSUS" shortInstrumentName = #"B " } << \global \bassus >> 
		>> 
		\new ChoirStaff << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff \with { instrumentName = #"ALTUS"  shortInstrumentName = #"A " } << \global \cantusB >> 
			\new Staff \with {
				instrumentName = #"TENOR"
				shortInstrumentName = \markup { \concat { T \smaller \lower #0.6 "1 " } }
			} << \global \altusB >> 
			\new Staff \with {
				instrumentName = #"TENOR"
				shortInstrumentName = \markup { \concat { T \smaller \lower #0.6 "2 " } }
			} << \global \tenorB >> 
			\new Staff \with { instrumentName = #"BASSUS" shortInstrumentName = #"B " } << \global \bassusB >> 
		>>
	>>
	\layout {
		\context { 
			\Score
			\override BarLine #'transparent = ##t
		}
		\context { 
			\Voice 
			\consists "Ambitus_engraver" 
		}
	}
	\midi { }
}
