% Copyright ©2023 Peter Hilton - https://github.com/hilton
% Based on CPDL #55912 by Oscar Smith

\version "2.24.2"
revision = "1"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 7\mm
	inner-margin = 15\mm
	outer-margin = 10\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 12) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"Missa si bona suscepimus"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Cristóbal_de_Morales" "Cristóbal de Morales" (1500 - 1553) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
		\column \center-align {
			\line {
				This edition copyright \year \with-url #"https://www.cpdl.org/wiki/index.php/ChoralWiki:CPDL" CPDL - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
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
                \remove "Metronome_mark_engraver"
		\override BarNumber.self-alignment-X = #CENTER
		\override BarNumber.break-visibility = #'#(#f #t #t)
		\override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 6) (stretchability . 100))
		\override SpanBar.transparent = ##t
		\override BarLine.transparent = ##t
	}
	\context {
		\Staff
	}
	\context { 
		\Voice 
		\override NoteHead.style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\consists "Ambitus_engraver"
	}
	\context {
		\Score
		proportionalNotationDuration = #(ly:make-moment 2 13)
		\override SpacingSpanner.uniform-stretching = ##t
	}
}


global = {
	\key f \major
	\omit Staff.TimeSignature
	\time 4/4
	\set Staff.midiInstrument = "drawbar organ"
	\accidentalStyle "forget"
	\set melismaBusyProperties = #'()
}

showBarLine = {
	\once \override Score.BarLine.transparent = ##f
	\once \override Score.SpanBar.transparent = ##f 
}

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
mtempo={\tempo 4 = 100}
mtempob={\tempo 4 = 50}

cantus={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%5
	R1*4/4 |
	R1*4/4 |
	d'1 |
	f'2 e'4 c' |
	d' e' f'2 |
%10
	R1*4/4 |
	r2 r4 f' |
	a'2 g'4 a'4. bes'8 c''2 \ss b'4 |
	c''1 |
%15
	r2 g' |
	g' a' |
	g'4 bes' a'8 g'  f'[ e'] |
	d'2 r |
	r4 f' g'2 |
%20
	a' bes'4 a'4. g'8 g'2 \ss fis'4 |
	g'2 f'1 r4 a'4. g'8  f'[ e'] d'2 |
%25
	f'4. e'8 c'4 f'2 e'4 d'2 |
	e'\breve*1/2 | \showBarLine \bar "||"
	r4 a'2 a'4 |
	g' f'2 e'8 d' |
%30
	e'4 d' bes'2 |
	a'4 g' f'2. e'8 d' e'4. f'8 |
	g'4 a' d'2 |
	R1*4/4 |
%35
	R1*4/4 |
	R1*4/4 |
	r4 c' d' e' |
	f' d' f'2 |
	e' d' |
%40
	R1*4/4 |
	R1*4/4 |
	r2 a' |
	bes'4 bes' a' f'4. e'8 d'2 \ss cis'4 |
%45
	d'2 e'1 r2 |
	r4 a' a' a'4. g'8 g'2 \ss fis'4 |
	g'2 r |
%50
	r4 a' bes'2. bes'4 a'2 |
	r r4 d''2 c''4 bes' a' |
	bes'2 a' |
%55
	r e' |
	f'4 d' f'4. g'8 |
	a'\breve*1/2 | \showBarLine \bar "||"
	a'2. a'4 |
	a'2 bes' |
%60
	a'1 |
	r2 r4 g' |
	f' d' f'4. g'8 |
	a'4 f'2 d'4 |
	g'1
%65
	a'2 r |
	R1*4/4 |
	a'2 bes'4. a'8 |
	g'4 f' e' d' |
	e'2 d'1 r2 |
	R1*4/4 |
	R1*4/4 |
	r4 f' f' f' |
	g' a'2 g'4 |
%75
	f' e'8 d' e'2 |
	d' r |
	R1*4/4 |
	d'2 f' ~ |
	f'4 e' f' g' |
%80
	a'2 r |
	r f' |
	a'2. g'4 |
	a' bes' c''2 |
	R1*4/4 |
%85
	R1*4/4 |
	r2 r4 e' |
	 f'8[ e']  f'[ g' a' bes'] c''2 bes'8 a' g'4. a'8 |
	bes'4 a'2 g'4 |
%90
	a'\breve ~ |
	a'\breve*1/2
	\showBarLine \bar "||"
}

cantusdos={
	r2 a'2. a'4 g' e' |
	f' g' a' f'4. e'8 d' c' d'2 |
%5
	e' r4 c''4. bes'8 a'4 g'4. a'8 |
	bes'4 a'2 g'4 |
	a'1 |
	r2 d'1 f'2 |
	e'4 c' d'4. e'8 |
	f'2 r |
	r f' |
	a' g'4 a'4. bes'8 c''2 \ss b'4 |
	c''1 |
	r2 f' |
	f' g' |
	f' r |
%20
	r r4 f' |
	g'2 a' |
	bes'2. a'8 g' |
	a'4  f'8[ g' a' bes'] c''4. bes'8 a'2 g'4 |
%25
	a'\breve ~ |
	a'\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%30
	r4 d''2 d''4 |
	c'' bes'2 a'8 g' |
	a'1 |
	bes'4 a'8 g' a'2 |
	R1*4/4 |
%35
	R1*4/4 |
	r4 g' a' bes' |
	c'' a' bes'2 |
	a'1 |
	bes'4 a'8 g' f'4 g' |
%40
	d'2 r |
	R1*4/4 |
	R1*4/4 |
	r2 a'1 g'2 |
%45
	f'4.  g'8[ a' bes'] c''4. bes'8 a'2 g'4 |
	a'2 r |
	r r4 a' |
	bes'2. bes'4 |
%50
	a'2 r |
	r r4 a' |
	bes'2. bes'4 |
	a'2 r4 a'2 g'4 f' e'4. d'8 d'2 \ss cis'4 |
	d'1 ~ |
	d'\breve*1/2 |
	f'2. f'4 |
	f'2 g' |
%60
	f'4 a'4. g'8  f'[ e'] |
	d'1 ~ |
	d' |
	r2 r4 f' |
	e' c' d'4. e'8 |
%65
	f'2 \ss ees'4 d' |
	g'2. \ss fis'8 e' |
	\ss fis'2 r |
	R1*4/4 |
	R1*4/4 |
%70
	r4 f' f' f' |
	g' a'2 g'4 |
	f' e'8 d' e'2 |
	d' r |
	R1*4/4 |
%75
	a'1 |
	g'2 f'1 e'2 |
	R1*4/4 |
	r2 d' |
%80
	f'2. e'4 |
	f' g' a'2 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%85
	r2 r4 e' |
	 f'8[ e']  f'[ g' a' bes'] c''4 |
	a' d'' c''4. bes'8 |
	a'4 g'4. a'8 bes'4 |
	r f' d'4. e'8 |
%90
	f'4 d' f' e' |
	d'1 |
	e'\breve*1/2 
}

altus={
	d'2. d'4 |
	c' a c'2 |
	bes a |
	f2. f4 |
%5
	g a g2 |
	r4 f g8 a bes c' |
	d' e' f'4 d' bes |
	d'2 c'4 e' |
	d' c'2 bes8 a |
%10
	bes2 a4 c'4. bes8 g2 d'4 |
	c' f' e' f'2 e'4 d'8 e' f' d' |
	e'4 f' g' f'2 e'4
	\tupletUp
	\times 2/3{g'4. f'8 d'4}
	e'2 c' |
	r4 d' d' d' |
	a bes2 g4 |
	a2 c'1 bes4 d'4. c'8 c' bes d'2 |
	bes r4 a |
	a bes c' a |
	c'2 bes4 d' ~ |
%25
	d'8 e' f'4 f4. g8 |
	a bes c'4 a d'2 \ss cis'8 \ss b \mtempob cis'\breve*1/4 |
	\mtempo 
	d'2 d'4 c' |
	bes  a8[ g a bes] c'2 bes8 a g4 bes |
	f  g8[ a bes c'] d'2 c'8 bes c'2 |
	d'1 |
	g8 a bes c' d' e' f'4 |
%35
	r d' bes c' |
	d' g r g |
	a c' bes4. c'8 |
	d' e' f'4. e'8 d'2 c'4 d'4. c'8 |
%40
	bes a d'2 c'4 |
	bes c' bes d' |
	d' d' c'2 |
	bes4 g a2. f4 g2 |
%45
	r r4 c'4. d'8 e'4 f' e'8 d' |
	c'4 f'4. e'8 d'2 \ss cis'4 d'2 |
	r r4 d' |
%50
	d' d' bes2 |
	r4 d'2 d'4 |
	d' d' bes2 |
	R1*4/4 |
	d'2. c'4 |
%55
	bes8 a bes4 a2 ~ |
	a1 ~ |
	a\breve*1/2 |
	d'2. d'4 |
	d'2 g8 a bes c' |
%60
	d' e' f'4 d' f'4. e'8 d'4. c'8 bes4 |
	r f' d' f'4. e'8 c'4 d'2 |
	c' bes |
%65
	d' g4 d'4. c'8 c'4 d'2 |
	r r4 bes |
	bes bes c' d'2 c'4 bes a8 g |
%70
	a1 |
	r2 d' ~ |
	d' c' |
	bes4 a8 g a2 |
	R1*4/4 |
%75
	R1*4/4 |
	d'1 |
	c' |
	bes2 a4. g8 |
	f4 g d g |
%80
	 f8[ e]  f[ g] a2 |
	r r4 c'2 f'2 e'4 |
	f' d' c'4. bes8 |
	a2 r4 a2 d'2 \ss cis'4 |
	d'4. e'8 f'4 e' |
	a bes c'4. d'8 |
	e'4 d' e' d'8 c' |
	d'1 |
%90
	r4 d'4. a8 c'4 |
	a8 f f'4. e'8 d'2 \ss cis'8 \ss b \mtempob cis'\breve*1/4
}

tenor={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	a1 |
%5
	c'2 bes4 g |
	a4. bes8 c'4 bes |
	g a bes2 |
	a1 |
	g2 f |
%10
	r4 f a2 |
	g bes |
	a4. bes8 c'1 d'2 |
	c' r |
%15
	r r4 g2 c'4 a c' ~ |
	c'  bes8[ c' d' e'] f'4. e'8 d'2 c'4 |
	d' d \ss ees g4. \ss fis8 fis4 g d |
	r2 r4 d' |
	d' d' bes f'4. e'8 d'4 c'2 |
	a bes |
%25
	a\breve ~ |
	a\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%30
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	r4 d'2 d'4 |
%35
	c' bes2 a8 g |
	a bes c' bes a g g2 \ss fis4 g2 |
	d1 |
	R1*4/4 |
%40
	r4 f g a |
	bes a8 g f4 bes4. a8 g2 \ss fis4 |
	g2 d1 r4 g |
%45
	a bes c' a |
	c'2 bes |
	a1 |
	r2 r4 d' |
	d' d' bes2 |
%50
	r4 d'2 d'4 |
	d' d' f'4. e'8 |
	d'4 bes d'2 |
	r4 c' d' c' |
	bes g a2 |
%55
	d r4 a4. g8 f e d4. e8 |
	\ss fis\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%60
	a2. a4 |
	a2 bes |
	a4 d' d' d' |
	c' f2 bes4 |
	g4.  a8[ bes c'] d'4 ~ |
%65
	d'8 c' a bes c'4 f |
	g2 r4 a |
	a a g4. a8 |
	bes c' d'4 g bes |
	a g2 f8 e |
%70
	f4 d d'2 |
	c' bes |
	a1 |
	R1*4/4 |
	r2 d'1 c'2 |
	bes a4 f8 g |
	a bes c'4. bes8 g a |
	bes c' d'2 c'4 |
	c'2 bes |
%80
	a r |
	r4 g c'4. bes8 |
	a4 f c'2 |
	r r4 e |
	f2. e4 |
%85
	f d e a ~ |
	a8 g f e d4 e |
	d2 r |
	r4 g c' bes |
	g a bes2 |
%90
	a1 ~ |
	a\breve 
}

bassus={
	R1*4/4 |
	R1*4/4 |
	r2 d1 f2 |
%5
	e4 c d e |
	f4. e8 c4 g2 f4 g2 |
	d r |
	r r4 d |
%10
	g f4. e8 c d |
	e f g2 f4 |
	f4. e8 c4 f |
	a2 r |
	a c'2. c'4 d'2 |
	c'4 c f e8 d |
	e f g4 f4. g8 |
	a4 d g c |
	f2 \ss ees4. d8 |
%20
	c2 d |
	R1*4/4 |
	r4 d' d' d' |
	c' bes a4. g8 |
	f2 g |
%25
	d4 a4. g8 f e |
	d4 e f2 |
	e\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%30
	R1*4/4 |
	R1*4/4 |
	r4 a2 a4 |
	g f2 e8 d |
	e4 d f2. g4 g2 |
	f4 e2 d4 |
	c2 r |
	r r4 f |
	g a bes g4. f8 d4 e f |
	d c d1 r4 c |
	d e f d |
	f2 e |
%45
	d a,1 r2 |
	r d |
	g a |
	g1 |
%50
	f4 d g1 f2 |
	g1 |
	e2 r4 f |
	d4.  e8[ f g] a4 |
%55
	f g e2 |
	d1 ~ |
	d\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%60
	f2. f4 |
	f2 g |
	a4 bes a f4. g8  a[ f] bes2 |
	r r4 bes |
%65
	a f g bes2 a8 g a2 |
	d'1 |
	R1*4/4 |
	R1*4/4 |
%70
	r4 d d d |
	e f g2 |
	d r |
	d'1 |
	c'2 bes |
%75
	a1 |
	r2 a1 g2. f4 f2 |
	r r4 d' |
%80
	d' d' a c' |
	bes2 a1 r4 c |
	f g a2. f4 bes a2 g4 a a, |
	d2. c4 |
	d bes, a,2 |
	r r4 g2 f4 g d4. e8 f4 d e |
	f1 |
	e
}

bassusdos={
	d1 |
	f2 e4 c |
	d e f2 |
	r4 d2 d4 |
%5
	c a, bes, c |
	f,2 r |
	R1*4/4 |
	r2 a, |
	bes,4 c d2 |
%10
	g,4 bes, f,8 g, a, bes, |
	c4. bes,8 g,4 bes, |
	f,2 r |
	R1*4/4 |
	r4 f e f4. g8 a4 g g, |
	c2  f,8[ g,]  a,[ bes,] |
	c4 g, d2. bes,4 \ss ees2 |
	d c4. bes,8 |
%20
	a,2 g,4 d |
	\ss ees2 d |
	g,4. a,8 bes, c d e |
	f4 bes, f2 |
	f, r4 g, |
%25
	d4. e8 f4 d2 c4 d2 |
	a,\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%30
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	r4 d2 d4 |
	c bes,2 a,8 g, |
%35
	a,4 g, ees2 |
	d4 c2 bes,4 |
	a,2 g, |
	R1*4/4 |
	R1*4/4 |
%40
	r2 r4 f, |
	g, a, bes, g, |
	bes,2 a, |
	g, r |
	R1*4/4 |
%45
	R1*4/4 |
	r4 c d e |
	f d f2 |
	e d |
	g,1 |
%50
	d2 r4 g, |
	g, g, d2 |
	g,1 |
	a,2 bes,4 f, |
	g,2 d4 a, |
%55
	bes, g, a,2 |
	d1 ~ |
	d\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%60
	d2. d4 |
	d2 g, |
	d4 bes, d4. e8 |
	f2 bes, |
	c4. bes,8 g,2 |
%65
	d c4 bes, |
	\ss ees2 d1 g4. f8 |
	ees4 d c bes, |
	c2 d1 r2 |
	R1*4/4 |
	r2 a, |
	d2. d4 |
	e f g2 |
%75
	d r |
	g d4. e8 |
	f4 f, c4. bes,8 |
	g, a, bes, c d e f4 ~ |
	f8 e c4 d g, |
%80
	d2. c4 |
	d e f1 r2 |
	r a, |
	d2. c4 |
%85
	d bes, a,2 |
	R1*4/4 |
	r2 r4 a, |
	a, bes, c g,2 d4 r g, |
%90
	d2. c4 |
	d1 |
	a,
}

textocantus=\lyricmode{
Ky -- ri -- e
\italicas
e -- le -- i -- son
Ky -- ri -- e e -- _ le -- i -- son
Ky -- ri -- e e -- le -- _ _ i -- _ son
Ky -- ri -- e e -- lei -- _ _ _ _ son
Ky -- _ ri -- _ e __ _ _ _ 
\rectas
e -- le -- i -- son.
Chri -- ste __ _ _ _ _ _ _ _ _ _ 
\italicas
e -- _ _ le -- _ _ i -- son
Chri -- ste __ _ _ e -- le -- i -- son
Chri -- ste e -- le -- _ _ _ _ i -- son
Chri -- ste e -- _ le -- i -- son
e -- le -- i -- son
Chri -- ste e -- le -- i -- son
Chri -- ste 
\rectas
e -- le -- i -- son.
Ky -- ri -- e~e -- 
\italicas
lei -- son
Ky -- ri -- e e -- _ _ le -- _ i -- son
Ky -- ri -- _ e e -- le -- _ i -- son
Ky -- ri -- e e -- le -- _ _ _ _ i -- son
Ky -- ri -- _ e~e -- le -- i -- son
Ky -- ri -- e~e -- le -- i -- son
Ky -- ri -- _ e __ _ _ _ _ _ _ _ _ 
\rectas
e -- le -- i -- son. _
}

textocantusdos=\lyricmode{
Ky -- ri -- e 
\italicas
e -- le -- _ _ _ _ _ _ i -- son
Ky -- ri -- e e -- _ _ le -- i -- son
Ky -- ri -- e e -- le -- i -- son
Ky -- ri -- e e -- _ le -- i -- son
e -- le -- i -- son
Ky -- ri -- e __ _ _ _ _ 
\rectas
e -- _ _ _ le -- _ _ i -- son. _ 
Chri -- ste __ _ _ 
\italicas
e -- _ le -- _ i -- _ son
Chri -- ste __ _ _ e -- _ le -- _ _ _ _ i -- son
Chri -- _ ste __ _ _ _ _ e -- le -- i -- son
e -- le -- i -- son
e -- le -- i -- son
Chri -- ste 
\rectas
e -- le -- _ _ i -- son. _
Ky -- ri -- e
\italicas
e -- le -- _ _ i -- _ son _
Ky -- ri -- e e -- _ le -- _ _ _ i -- _ son
Ky -- ri -- e e -- le -- _ _ _ _ i -- son
Ky -- ri -- e __ _ 
Ky -- ri -- e~e -- le -- i -- son
Ky -- ri -- _ e __ _ _ _ _ _ e -- le -- _ _ _ i -- son
Ky -- ri -- e 
\rectas
e -- le -- _ _ i -- son.
}

textoaltus=\lyricmode{
Ky -- ri -- e
\italicas
e -- le -- _ _ _ _ _ i -- son
Ky -- ri -- _ _ _ _ _ _ e e -- le -- _ _ _ _ _ _ _ _ _ i -- son,
Ky -- ri -- e e -- _ _ le -- _ _ _ _ _ _ _ _ _ _ _ i -- son
Ky -- ri -- e e -- le -- _ _ _ _ _ _ _ _ i -- son
Ky -- ri -- e~e -- le -- i -- son,
Ky -- ri -- _ _ e
\rectas
e -- _ _ _ _ _ le -- i -- _ son.
Chri -- ste __ _ _ _ _ _ _ _ _ _ _ 
\italicas
e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ _ i -- _ son
Chri -- _ _ _ ste
Chri -- ste __ _ _ _ _ _ _ _ _ e -- le -- _ _ _ _ _ _ i -- son,
Chri -- ste e -- le -- _ _ _ i -- son
Chri -- _ _ ste __ _ _ _ e -- _ le -- i -- son
e -- le -- i -- son
Chri -- ste e -- lei -- son
\rectas
e -- le -- _ _ i -- son. _ _ 
Ky -- ri -- e
\italicas e -- _ _ _ _ _ _ _ le -- _ _ i -- son
Ky -- ri -- e __ _ _ e -- le -- _ _ _ _ _ i -- son
Ky -- ri -- e e -- le -- _ _ i -- _ son
Ky -- _ ri -- e __ _ _ _ 
Ky -- ri -- e e -- _ _ _ le -- _ _ _ i -- _ son
Ky -- ri -- e e -- le -- _ i -- son
Ky -- ri -- e e -- _ _ _ le -- _ _ _ _ _ _ i -- _ son
Ky -- ri -- e __ _ _ 
\rectas
e -- _ le -- i -- _ son.
}

textotenor=\lyricmode{
Ky -- ri -- e 
\italicas
e -- le -- _ _ _ _ _ _ _ i -- son
Ky -- ri -- e e -- le -- _ _ i -- son
Ky -- ri -- e e -- _ le -- _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son
Ky -- ri -- e
\rectas
e -- le -- _ _ _ i -- _ son. _ 
Chri -- ste __ _ _ 
\italicas
e -- _ le -- _ _ _ _ _ _ _ i -- son
Chri -- ste __ _ _ _ _ _ e -- _ le -- _ i -- son
Chri -- ste __ _ _ e -- le -- i -- son
e -- le -- i -- son
Chri -- ste e -- le -- _ _ _ i -- son
Chri -- ste e -- le -- _ i -- son
\rectas
e -- _ _ _ le -- i -- son.
Ky -- ri -- e __ _ _ 
\italicas
e -- le -- i -- son,
e -- _ le -- _ _ _ _ _ _ _ _ _ i -- son
Ky -- ri -- e e -- _ _ _ _ le -- _ _ _ _ _ i -- son,
e -- le -- i -- son
Ky -- ri -- e e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ i -- son
e -- le -- _ _ i -- son
Ky -- ri -- _ e e -- _ le -- _ _ _ _ _ i -- son
Ky -- ri -- e 
\rectas
e -- le -- i -- son. 
}

textobassus=\lyricmode{
Ky -- ri -- e e -- le -- _ _ _ _ _ _ i -- son
\italicas
Ky -- ri -- e __ _ _ _ _ _ _ e -- le -- _ _ i -- son
Ky -- ri -- e __ _ _ e -- le -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ i -- son
Ky -- ri -- e e -- le -- _ i -- son,
Ky -- ri -- e __ _ _ _ 
\rectas
e -- le -- i -- son.
Chri -- ste __ _ _ _ _ _ _ _
\italicas
e -- le -- _ _ i -- son
Chri -- ste __ _ _ e -- _ le -- _ _ _ i -- son
Chri -- ste __ _ _ e -- le -- _ i -- son
Chri -- ste __ _ _ e -- _ le -- _ i -- son
Chri -- ste __ _ _ _ _ 
\rectas
e -- le -- i -- son. _
Ky -- ri -- e __ _ _ 
\italicas
e -- le -- _ _ i -- _ son
Ky -- ri -- e e -- le -- _ _ i -- son
Ky -- ri -- e e -- le -- i -- son
Ky -- ri -- _ e
Ky -- ri -- _ e
Ky -- ri -- e e -- le -- i -- son
Ky -- ri -- _ e e -- _ le -- _ _ _ _ _ _ i -- son
Ky -- ri -- e 
\rectas 
e -- _ _ le -- _ i -- son.
}

textobassusdos=\lyricmode{
Ky -- ri -- e 
\italicas
e -- le -- i -- son
Ky -- ri -- e e -- le -- i -- son
Ky -- _ ri -- e e -- _ le -- _ _ _ _ _ _ i -- son
Ky -- ri -- e __ _ _ _ e -- le -- _ _ i -- _ son,
Ky -- ri -- e e -- le -- _ _ i -- son,
Ky -- ri -- e e -- _ _ _ _ _ _ le -- i -- son
Ky -- ri -- _ e 
\rectas
e -- le -- i -- son.
Chri -- ste __ _ _ 
\italicas
e -- _ lei -- son,
Chri -- ste e -- le -- i -- son
Chri -- ste __ _ _ e -- le -- i -- son
Chri -- ste __ _ _ e -- le -- _ _ i -- son
Chri -- ste e -- lei -- son,
Chri -- ste e -- lei -- son,
Chri -- ste 
\rectas
e -- lei -- son. _
Ky -- ri -- e
\italicas
e -- _ _ lei -- _ _ son,
Ky -- ri -- e e -- le -- _ i -- son,
Ky -- ri -- e e -- le -- _ i -- son
Ky -- ri -- e e -- le -- i -- son
Ky -- ri -- _ e e -- le -- _ _ _ _ _ _ _ _ _ _ i -- son,
e -- le -- _ _ i -- son
Ky -- ri -- e~e -- le -- i -- son
Ky -- ri -- e~e -- le -- i -- son
\rectas
e -- le -- _ i -- son.
}



\score {
  \header {
    piece = \markup \larger \sans { Kyrie }
  }
  
  \transpose f as {
  <<

    \new StaffGroup
    <<
      \new Staff
      <<
        \set Staff.instrumentName = "S1"
        \context Staff <<
          \context Voice = "sopranoA" {  \global \cantus }
          \new Lyrics \lyricsto "sopranoA" { \textocantus }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "S2"
        \context Staff <<
          \context Voice = "sopranoB" {  \global \cantusdos }
          \new Lyrics \lyricsto "sopranoB" { \textocantusdos }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "A"
        \context Staff <<
          \context Voice = "alto" { \global \altus }
          \new Lyrics \lyricsto "alto" { \textoaltus }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T"
        \context Staff <<
          \context Voice = "tenorA" { \global \clef "treble_8" \tenor }
          \new Lyrics \lyricsto "tenorA" { \textotenor }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "B1"
        \context Staff <<
          \context Voice = "tenorB" { \global \clef "treble_8" \bassus }
          \new Lyrics \lyricsto "tenorB" { \textobassus }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "B2"
        \context Staff <<
          \context Voice = "bass" { \global \clef "bass" \bassusdos }
          \new Lyrics \lyricsto "bass" { \textobassusdos }
        >>
      >>

    >>

  >>
  }
  \layout {}
%  \midi {\tempo 2 = 100 }
}

