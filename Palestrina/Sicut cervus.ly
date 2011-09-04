\version "2.12.2"

\header {
	title = "Sicut cervus"
	composer = "G P da Palestrina"
	poet = "PRIMA PARS"
	tagline = \markup \small { 
		\column \center-align {
			\line { Copyright ©2009 Cappella Gabrieli - \with-url #"http://cappellagabrieli.nl" http://cappellagabrieli.nl }
			\line { Licensed under the Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 License - \with-url #"http://creativecommons.org/licenses/by-nc-nd/3.0" http://creativecommons.org/licenses/by-nc-nd/3.0 }
		}
	}
}

global= { 
	\key f \major
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	\set Score.timing = ##f 
%	\override Score.LyricText #'font-size = #-1
	#(set-global-staff-size 15) 
	#(set-accidental-style 'forget)
}

\paper {
%	annotate-spacing = ##t
	left-margin = 15\mm
	line-width = 18\cm
}

ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

cantus = \new Voice	{
	\relative c' {
		\override NoteHead #'style = #'baroque
		r1 r r r2 f1 f2 \bar "" \break
		g f4 c f4. g8 a4 a bes2 a4 g a c4. bes8 a2 g4 a2 c4. bes8 a g a4~ \bar "" \break
		a8 g f2 e4 f2 r1 r f f2 g f4 c \bar "" \break
		f4. g8 a4 a bes2 a4 f8 g a bes c a bes2 a4 g4. f8 f2 e8 d e2 \bar "" \break
		f1 r r r2 f1 e2 d4. e8 f4 g ~ \bar "" \break
		g8 f f2 e4 d c d d c1 r r r2 g' ~ \bar "" \break
		g f e4. f8 g4 a2 g4 a2. g8 f g2( f4.) e8 d2 r \mark \default bes' ~  \bar "" \break
		bes4 a a2 g1 f r4 f g bes2 a4 g1 f4. g8 \bar "" \break
		a4 g8 f g2 r1 bes2. a4 a2 g1 f2 r4 f g bes ~ \bar "" \break
		bes a g4. f8 d e f2 e4 f1 ~ f ~ f ~ f\breve \bar "|."
	}
	\addlyrics {
		Sic -- ut
		cer -- vus de -- sí -- de -- rat ad fon -- tes a -- quá -- _ _ _ _ rum, a -- _ _ _ _
		_ _ quá -- rum, sic -- ut cer -- vus de -- 
		sí -- de -- rat ad fon -- tes a -- _ _ _ _ _ _ _ quá -- _ _ _ _ _ rum: i -- ta de -- _ _ sí -- 
		_ _ _ _ _ _ de -- rat, i -- 
		ta de -- _ _ sí -- de -- rat __ _ _ _ _ _ á -- 
		ni -- ma me -- a ad te, De -- _ _ us, __
		_ _ _ _ _ á -- ni -- ma me -- a ad te, De -- 
		_ _ _ _ _ _ _ us __
	}
}

altus = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		r1 r c' c2 d c4 a d4. c8
		d4 e f2 c c4 d4. c8 d e f4 e f2 e r1 f
		f2 g f4 f, a4. bes8 c4 d4. c8 bes4. a8 a4 d2 c4 c f,2 c'2. a4
		a4. bes8 c4 c d2 c f f2. e4 d2 c1
		a4. g8 a bes a2 g8 f g2 f1 r r bes
		a2 g4. a8 bes4 c4. bes8 bes2 a8 g a2. a4 g2 d'1 ~ d2 c2 ~
		c r c1 bes2 a4. bes8 c4 d2 \override AccidentalSuggestion #'parenthesized = ##t \ficta cis4 d2. c8 bes c2( bes)
		r f'2. e4 e2 d c1 bes4. c8 d4 c c2 c r4 f4~
		f e e2 d c bes4. c8 d4 c2 f e4 d1 ~ d2 bes4. c8
		d2 bes4 d2 c4 c2 r4 c d f4. e8 d c bes4 c d1 c\breve
	}
	\addlyrics {
		Sic -- ut cer -- vus de -- sí -- de -- 
		rat at fon -- tes a -- quá -- _ _ _ _ _ _ rum, sic -- 
		ut cer -- vus de -- sí -- de -- rat ad __ _ _ _ _ fon -- tes a -- quá -- rum, de -- 
		sí -- de -- rat at fon -- tes a -- quá -- _ _ _ _ _ _ _ _ _ _ _ rum: i -- 
		ta de -- _ _ sí -- _ _ _ _ _ de -- rat, i -- ta, __
		i -- ta de -- _ _ sí -- de -- rat __ _ _ _
		á -- ni -- ma me -- a __ ad -- _ _ te, De -- us, á -- 
		ni -- ma me -- a ad __ _ _ te, __ De -- _ us, __ ad __ _
		_ te, De --  _ us, "[ad" te, De -- _ _ _ _ _ _ us.]
	}
}

tenor = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		f1 f2 g f4 c f4. g8 a4 a bes2 a4 f bes4. a8
		bes4 c a1 r c c2 d c4 f, a4. bes8 c4 c
		d2 c a4. bes8 c4 f, a2( bes4.) c8 d4 c4. bes8 bes2 a8 g a4 f2 e4 f2~
		f r2. f4 a4. bes8 c4 c d2 c4. bes8 a4 bes g1
		f2 r c'1 bes2 a4. bes8 c4 d4. c8 c2 \ficta b4 c2( f,) r
		r2. g4 g a bes bes f2 r c'1 bes2 a4 bes4. a8 a4 g g
		c, g' a a g2 r1 f e2 d4. e8 f4 g4. f8 f2 e4
		f4. g8 a4. bes8 c2 r2. bes2 a4 a2 g( f) c2. g'4 a bes
		c c,8 d e f g e f4 g4. f8 f2 e4 f2 r1 r4 bes2 a4 a2 g
		f4 f g bes2 a4 g2 f r4 a bes d2 c4 bes1 a\breve
	}
	\addlyrics {
		Sic -- ut cer -- vus de -- sí -- de -- rat ad fon -- tes a -- qua -- _
		_ _ rum, __ sic -- ut cer -- vus de -- sí -- de -- rat ad
		fon -- tes a -- _ _ _ quá -- _ _ _ _ _ _ _ _ _ _ rum, __
		de -- sí -- de -- rat ad fon -- tes __ _ _ a -- quá -- 
		rum: i -- ta de -- _ _ sí -- _ _ de -- rat, __
		"[i" -- ta de -- sí -- de -- rat,] i -- ta de -- sí -- _ _ _ de -- 
		rat, "[de" -- sí -- de -- rat,] i -- ta de -- _ _ sí -- _ _ de -- 
		rat__ _ _ _ _ á -- ni -- ma me -- a __ ad te, __ _
		_ De -- _ _ _ _ _ _ _ _ _ _ us, á -- ni -- ma me -- 
		a ad te, De -- _ _ us, ad te, De -- _ _ us.
		
	}
}

bassus = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef bass
		r1 r r r r
		r2 f1 f2 g f4 c f4. g8 a4 a bes2 a4 a f2 f
		r1 f f2 g f bes, f'4. e8 d4 d c2 f,
		r4 f' f f bes,8 c d e f2 f bes, c4 c d bes c1
		r2 \mark \default f1 e2 d4. e8 f4 d e f4. e8 d c d2( c) bes4. c8 d4 e
		f2( c) r1. f1 e2 d4. e8 f4 g4. f8 f2 e8 d
		e2 f c1 r r bes a2 g
		d'4. e8 f4 f c2. c4 d bes f'1 r2. f2 e4 e2 d
		c c d4 bes2 a4 g2 f f' c4 c g'2 d d g,4. a8 
		bes c d4 g,4. a8 bes4 f c' c d f4. e8 d c bes2. a4 bes1 f\breve
	}
	\addlyrics {	
		Sic -- ut cer -- vus de -- sí -- de -- rat ad fon -- tes a -- quá -- rum,
		sic -- ut cer -- vus de -- sí -- de -- rat ad fon -- tes 
		de -- sí -- de -- rat __ _ _ _ _ ad fon -- tes a -- quá -- _ rum:
		i -- ta de -- _ _ _ _ sí -- _ _ _ _ _ _ _ de -- 
		rat, "[i" -- ta de -- _ _ sí -- _ _ _ _ 
		_ de -- rat,] i -- ta de -- 
		sí -- _ _ de -- rat, de -- sí -- de -- rat á -- ni -- ma me -- 
		a ad te,  De -- _ _ us,	á -- ni -- ma me -- a ad te, __ _
		_ _ _ De -- _ _ _ us, ad te,  De -- _ _ _ _ _ _ us.
	}
}

\score {
	\transpose c d {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff << \global \cantus >> 
			\new Staff << \global \altus >> 
			\new Staff << \global \tenor >> 
			\new Staff << \global \bassus >> 
		>> 
	}
	\layout {
		indent = #0
		\context { 
			\Voice 
			\consists "Ambitus_engraver" 
		} 
	}
	\midi {	}
}
