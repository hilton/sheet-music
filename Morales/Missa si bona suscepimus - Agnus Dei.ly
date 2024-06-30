\version "2.24.2"
revision = "2"
% \pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 10\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 6) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
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
		\override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 0) (stretchability . 90))
		\override VerticalAxisGroup.remove-empty = ##t
		\override VerticalAxisGroup.remove-first = ##t		
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
		proportionalNotationDuration = #(ly:make-moment 1 8)
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
	r2 a'1 g'1 f'2 |
	d'4 a'4. g'8 e' f' |
%5
	g'2 c'4 d' |
	e'2 r |
	d'1 | \break
	f'2 e'4 c' |
	d' e' f' a'2 g'8 f' g'2 |
	a'1 |
	R1*4/4 |
	r2 d'1 f'2 | \break
%15
	e'4 c' d' e' |
	f'2 r |
	d'1 |
	f'2 e'4 c' |
	d' e' f'4. e'8 |
%20
	d'4 e'2 c'4 |
	d'  bes8[ c' d' e'] f'4 ~ | \break
	f'8 e' d'2 \ss cis'4 |
	d' a' a' a' |
	g' f'2 e'8 d' |
%25
	e'4 f' d'2 |
	R1*4/4 |
	R1*4/4 |
	r4 g' a' bes' | \break
	c'' a' bes'2 |
%30
	a'2. a'4 |
	bes' a'8 g' f'4 bes'4. a'8 g'2 f'4 |
	e'8 d' d'2 \ss cis'4 |
	d'1 |
%35
	r4 c' d' e' |
	f' d' f' e'4. d'8 d'2 \ss cis'4 | 
	d'2 r |
	r a'1 f'2 |
	g'4 a' bes'2 |
	a'\breve*1/2 | \showBarLine \bar "|" \break
	R1*4/4 |
	R1*4/4 |
%45
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%50
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 | 
	R1*4/4 |
%55
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%60
	R1*4/4 |
	R1*4/4 | 
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%65
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%70
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%75
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%80
	R1*4/4 |
	R1*4/4 | \showBarLine \bar "|" \break
	d'2 c'4 f'4. e'8 c'4 d' e' |
	f'2 e'4 a'4. g'8 e'4 f' g' |
	c' c''4. bes'8 a'4 |
	g' f'2 e'4 |
	f'2 r |
	R1*4/4 | \break
%90
	r2 d'1 f'2 |
	e'4 c' d' e' |
	f' a'2 g'8 f' |
	g'2 a' |
%95
	g'4 f'2 e'4 |
	d'2 r |
	R1*4/4 |
	f'2 a' |
	g'4 a'4. bes'8 c''4. \ss b'8 b'4 c''1 r2 |
	f' f' |
	g' f'4 a' ~ | \break
	a'8 g' g'2 \ss fis'4 |
%105
	g'2 r |
	r a' |
	bes' bes' |
	a'4. g'8 a'4 bes'4. a'8 a'2 g'4 |
%110
	a'2 f'4 g' ~ | \break
	g' a' f' g' |
	a'2 r4 f' |
	a' g' a' f' |
	e'2 r |
%115
	R1*4/4 |
	r4 a' c''2. bes'4 c'' c'' |
	a'2 r |
	r r4 e' |
%120
	f'8 e' f' g' a' bes' c''2 bes'8 a' g'4. a'8 |
	bes'4 a'4. g'8 g'4 |
	a' bes'4. a'8 g'4 |
	f' d' f' e' ~ |
%125
	\set Staff.autoBeaming = ##f
	e'8 d' d'2 \ss cis'4 |
	\set Staff.autoBeaming = ##t
	d'\breve |
	r4 d'4. c'8 d' e' |
	f'1 |
%130
	d'4 e' f' e' |
	f'8 e' d' c' d'2 |
	e'\breve*1/2
	\showBarLine \bar "|."
}

cantusdos={
	R1*4/4 |
	R1*4/4 |
	r2 d''1 c''2 |
%5
	bes' a' |
	g' e' |
	f'4 a'4. g'8 g'4 |
	a'1 |
	R1*4/4 |
%10
	r2 d'1 f'2 |
	e'4 c' d' e' |
	f'2 f' |
	r4 d' d' d' |
%15
	g' f'2 e'4 |
	d'2 e'4 g'4. f'8 d' e' f'4 g' |
	c' c''4. bes'8 a' g' |
	f'4 g' a'2 |
%20
	r4 g' c''2. bes'4 bes' a' ~ |
	a' g' g'2. f'8 e' f' g' a' f' |
	bes'4 a'2 g'4 |
%25
	a'2. d'4 |
	e' f' d'2 |
	R1*4/4 |
	R1*4/4 |
	r4 c' d' e' |
%30
	f' d' f'2 |
	e' d'4 g' |
	f' g' a'2 |
	R1*4/4 |
	d''1 |
%35
	c''2 bes' |
	a'4. g'8 f'4 g' |
	f' d' g'2 |
	r r4 c' |
	d'2 e' |
%40
	f'4. g'8 a'4 d'4. e'8 f'4 d' g'2 \ss fis'8 e' \mtempob fis'\breve*1/4 |
	\mtempo
	R1*4/4 |
	R1*4/4 |
%45
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%50
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%55
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%60
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%65
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%70
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%75
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%80
	R1*4/4 |
	R1*4/4 |
	a'1 |
	c''2 bes'4 g' |
	a'4. bes'8 c''2 |
%85
	R1*4/4 |
	r4 a'2 f'4 |
	g' a' bes'2 |
	a' r4 a'4. g'8 e'4 f' g' |
%90
	a'2 f'4 bes'4. g'8 bes'4 a'2. f'4 g'2 |
	a'4 d' d''2. bes'4 c''1 r2 |
	r4 f' a'2 |
	g'4 a'4. bes'8 c''2 bes'4 c''1 r2 |
%100
	r4 g' g'2 |
	a' g'4 bes' |
	a'8 g' f' e' d'2 |
	r r4 f' |
	g'2 a' |
%105
	bes'4 c'' bes' a'4. d'8 g'2 f'4 |
	g'2 r4 g'2 f'4 e' g'2 f'8 e' d'2 |
%110
	e' r4 d' ~ |
	d' f'2 e'4 |
	f' d' c'1 r2 |
	R1*4/4 |
%115
	r2 r4 g' |
	a'2. g'4 |
	a' g' e'2 |
	r r4 e' |
	f'8 e' f' g' a' bes' c''4 |
%120
	a'4. g'8 f'4 e'4. d'8 d'2 \ss cis'4 |
	d'2 r |
	r r4 e' |
	f'8 e' f' g' a' bes' c''4 ~ |
%125
	c'' bes'8 a' g'4. a'8 |
	bes'4 a' g' bes'4. a'8 a'4 g' bes'4. a'8 a'2 g'4 |
	a'1 ~ |
%130
	a'\breve ~ |
	a'\breve*1/2
}

altus={
	R1*4/4 |
	R1*4/4 |
	d'1 |
	f'2 e'4 c' |
%5
	d' e' f' d'2 c'8 bes c'2 |
	a bes |
	r4 a c'2 |
	bes4 g a8 bes c'4 |
%10
	bes d'4. c'8 d' e' |
	f'2 f8 g a bes |
	c' d' e' f' d'4 c'2 bes8 a bes4 a |
	bes2 a4 d' |
%15
	c'4. bes8 a4. g8 |
	f2 r4 g4. a8 bes4 a g |
	a1 |
	r4 g c' d'2 c'8 bes c'2 |
	r4 d' d' d' |
	c' bes2 a8 g |
	a1 |
	r2 r4 g |
%25
	c' f4. g8 a bes |
	c'4 f g4. d8 |
	f4 g4. a8 bes c' |
	d'4 g r g |
	a8 bes c'4 bes4. c'8 |
%30
	d' e' f'4. e'8 d'4 ~ |
	d' c' d'1 c'2 |
	bes4 a g8 f e4 |
	r g f g |
%35
	a2 bes4. c'8 |
	d'2 r4 c' |
	d'2 e' |
	f'4 d' f' e'4. d'8 d'2 \ss cis'4 |
%40
	d'\breve ~ |
	d'\breve*1/2 |
	s4*0^\markup{"[Altus]"}
	R1*4/4 |
	d'1 |
%45
	f'2 e'4 c' |
	d'4. e'8 f'2 |
	e'4 d'2 c'4 |
	d'1 |
	R1*4/4 |
%50
	r4 c' d' e' |
	f' d' f'2 |
	e' f'4 g' |
	c' f'4. e'8 d'4 |
	c' bes4. a8 a2 g4 a2 |
	r4 f g a |
	bes g bes2 |
	a g4 c' |
	d' e' f' d' |
%60
	f'2 e' |
	d'4 c' bes2 |
	a r4 c' |
	d' e' f' d' |
	f'2 e' |
%65
	d' r4 d'2 d'4 c' bes2 a8[ g a f] f'4 |
	e' c' d'2 |
	c'4 d'4. \ss cis'8 cis'4 |
%70
	d'1 |
	r4 d'2 d'4 |
	c' bes2 a8 g |
	a2 r4 a2 a4 g f2 e8[ d e f] g4 ~ |
	g f8 e f4 f'2 f'4 e' d'2 c'8 bes c'2 |
	bes4 d'2 d'4 |
%80
	c' bes2 a8 g |
	a\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
	a1 |
%85
	c'2 bes4 g |
	a4. bes8 c'2 |
	r r4 bes |
	c' d' e' f' |
	c' e' d' g |
%90
	c'2 r |
	r4 d' d'2 |
	c' r |
	r d'1 f'2 |
%95
	e'4 c' d' e' |
	f'1 |
	d'4 e' f' g' |
	d' f'4. e'8 c' d' |
	e'4 f'2 e'4 |
%100
	g'4. f'8 e'4. d'8 |
	c'2 r4 d' |
	d' d' a bes2 g4 a f' |
	\ss ees' d' d'2. \ss ees'4 d'2 |
	d4 e f d2 d'2 d'4 |
	d'2 c'4 d' |
	e' f'4. e'8 d'2 \ss cis'4 d'2 |
	R1*4/4 |
	r2 r4 a2 c'2 \ss b4 |
	c' g4. f8 d e |
%115
	f2 r4 c'2 f'2 e'4 |
	f' d' c'2 |
	f4.  g8[ a bes] c'4 |
	a bes c'2 |
%120
	d'2. e'4 |
	f' d' e'2 |
	r4 f'2 e'4 |
	f' d'4. \ss cis'8 cis'4 |
	d'2. e'4 |
%125
	f' d' e'2 |
	r4 a bes d'4. c'8 a4 bes g |
	a2 r4 d'2 c'4 d'4. e'8 |
%130
	f'4 e' r8 d'4 c'8 |
	d' e' f'4. e'8 d'2 \ss cis'8 \ss b \mtempob cis'\breve*1/4
}

tenor={
	d'1 |
	c' |
	bes |
	a2 r |
%5
	r r4 d |
	g2 a |
	f g |
	f4 d e2 |
	r4 c' c' a |
%10
	d'8 c' bes a bes2 |
	a4 f a1 g2 |
	f1 |
	R1*4/4 |
%15
	r2 a1 c'2 |
	bes4 g a bes |
	c'2 c' |
	r4 bes a f |
%20
	\[g2 a\] |
	d1 |
	r4 g g e |
	f4. g8 a4 f |
	g a bes2 |
%25
	a1 |
	r4 d' d' d' |
	c' bes2 a8 g |
	a bes c' bes a g g4 ~ |
	g \ss fis g2 |
%30
	r r4 f |
	g a bes g |
	bes2 a |
	g4 f e2 |
	d1 |
%35
	R1*4/4 |
	R1*4/4 |
	r4 g g g |
	a1 |
	bes4 a a4. g8 |
%40
	f4 d d'4. c'8 |
	bes4 a g2 |
	a\breve*1/2 |
	s4*0^\markup{"[Tenor]"}
	a2. a4 |
	g4. f8 d e f g |
%45
	a4 f g a |
	bes2 a4 d' |
	c' bes8 a g2 |
	r4 f g a |
	bes g bes2 |
%50
	a g |
	r4 g a bes |
	\tupletUp
	\times 2/3{c'4 a c'} bes2 |
	a1 |
	g4 f r c |
%55
	d e f d |
	f2 e |
	d4 e d2 |
	r4 f g a |
	bes g bes2 |
%60
	a4 d'4. c'8 c'4 |
	bes a2 g4 |
	a1 |
	r4 g a bes |
	c' a c'2 |
%65
	bes1 |
	a2. g8 f |
	g2 r4 a2 a4 g f2 e8 d e2 |
%70
	d r4 f |
	e d f2. g4 e2 |
	d1 |
	r2 r4 d'2 d'4 c' bes ~ |
	bes a8 g a4 bes |
	a f g2 |
	r4 a2 a4 |
	g f2 e8 d |
%80
	e f g2 \ss fis8 e |
	\ss fis\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%85
	R1*4/4 |
	a1 |
	c'2 bes4 g |
	a4. bes8 c'1 r2 |
%90
	r4 a a d |
	g2 f4. g8 |
	a bes c'2 bes4 |
	c' d'4. c'8 bes a |
	bes2 a |
%95
	c' f4 c'4. bes8 bes4 c'2 |
	bes4 c' d' e' |
	f' d' c'1 a2 |
%100
	r4 g2 c'4 |
	a c'2 bes8 c' |
	d' e' f'4. e'8 d'2 c'4 d'2 |
	c'4 bes a2 |
%105
	g4. a8 bes c' d' e' |
	f'4 e' d'1 r2 |
	r4 a2 g4 |
	c' d' bes2 |
%110
	a r4 g |
	d' c' d' bes |
	a2 a4. g8 |
	f4 g f2 |
	r4 c' d'2. c'4 d' e' |
	f'2 r |
	r r4 e' |
	f'2. e'4 |
	d' d' c'8 bes a g |
%120
	f2 r |
	r r4 e |
	f8 e f g a bes c'2 bes8 a g2 |
	a r |
%125
	r r4 g2 \ss fis4 g2 |
	d r4 d'4. c'8 a4 bes2 |
	a1 ~ |
%130
	a\breve ~ |
	a\breve*1/2 
}

bassus={
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	a1 |
%5
	g2 f |
	e1 |
	R1*4/4 |
	a1 |
	g2 f |
%10
	g2. g4 |
	d f2 d4 |
	e2 r |
	r r4 d |
	g f2 d4 |
%15
	e a4. bes8 c'4 |
	a f g e |
	g4. f8 d4 g |
	f2 r4 f |
	bes g f a4. g8 g2 \ss fis4 |
	g2 f4. g8 |
	a4 bes g2 |
	r r4 d' |
	d' c' d'2 |
%25
	c'4 a2 f4 |
	g d bes2 |
	a4 d g2 |
	f4 \ss ees2 d4 |
	c2 r |
%30
	R1*4/4 |
	R1*4/4 |
	r2 r4 f |
	g a bes a8 g |
	f4 bes4. a8 g2 \ss fis4 g4. f8 |
	d e f g a bes c'2 bes8 a g2 |
	f d4 e |
	f2 e |
%40
	d\breve ~ |
	d\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
%45
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%50
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%55
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%60
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%65
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%70
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%75
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%80
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	d2 c4 f4. e8 c4 d e |
	f2. f4 |
	e f g2 |
	f g4 a4. bes8 c'4 bes2 |
%90
	a r4 d' |
	d' g a1 g2 |
	f2. g4 |
	g2 r4 f |
%95
	g a4. g8 g4 |
	f2 r |
	r r4 c' |
	d'2 a4 a |
	c'2. c'4 |
%100
	d'2 c'4 c |
	f  e8[ d e f] g4 |
	f4. g8 a4 d |
	g c f2 |
	R1*4/4 |
%105
	r4 g2 f4 |
	bes c' a2 |
	g1 |
	a2 r |
	R1*4/4 |
%110
	r4 a bes2 ~ |
	bes4 a bes g |
	f2 r |
	R1*4/4 |
	g2 bes2. a4 bes g |
	f4.  g8[ a bes] c'4 |
	f g a2 |
	d4. e8 f4 g |
	f d e2 |
%120
	d4. e8 f4 g |
	a g g2 |
	r4 d2 c4 |
	f g e2 |
	d r4 g |
%125
	a g g2 |
	R1*4/4 |
	r2 r4 g2 \ss fis4 g2 |
	d4 f d8 e f g |
%130
	a bes c'4 f a4. g8 f e f2 |
	e\breve*1/2
}

bassusdos={
	d1 |
	f2 e4 c |
	g g, bes,4. c8 |
	d2 a, |
%5
	R1*4/4 |
	r2 a, |
	d g, |
	d c4 a, |
	bes, c f,2 |
%10
	R1*4/4 |
	r4 d d d |
	c a, bes, c |
	d1 |
	g,8 a, bes, c d4 bes, |
%15
	c f4. e8 c4 |
	d2 c4. bes,8 |
	g,2 r |
	R1*4/4 |
	r2 r4 d |
%20
	bes, c a,2 |
	g,4. a,8 bes, c d e |
	f4 g e2 |
	d1 |
	R1*4/4 |
%25
	r4 d d d |
	c bes,2 a,8 g, |
	a,4 g, \ss ees2 |
	d4 c2 bes,4 |
	a,2 g, |
%30
	d1 |
	R1*4/4 |
	R1*4/4 |
	r4 f, g, a, |
	bes, g, bes,2 |
%35
	a, g, |
	r4 d2 c4 |
	f g e2 |
	d2. c4 |
	bes, d a,2 |
%40
	r4 d4. c8 bes, a, |
	g,4 f, g,2 |
	d\breve*1/2 |
	s4*0^\markup{"[Bassus II]"}	
	R1*4/4 |
	r2 d2. d4 c4. bes,8 |
	g, a, bes, c d4 bes, |
	c d \ss ees2 |
	d r4 d4. bes,8 c4 bes, d ~ |
%50
	d8 c a,4 bes, c |
	d g, d2 |
	r4 c d e |
	f d f2 |
	e4 d4. c8 a,4 |
%55
	bes, c f, f4. e8 d2 c4 |
	bes, c g,8 a, bes, c |
	d e f d e4 f |
	bes, c d g, |
%60
	d2 a, |
	r4 c d e |
	f d f2. e4 d g |
	f4. e8 c d e f |
%65
	g4 g,4. a,8 bes, c |
	d c d e f4 g |
	\ss ees2 d |
	c4 a, bes,2 |
	a,1 |
%70
	r4 d2 d4 |
	c bes,2 a,8 g, |
	a,4 g, g2. f8 e f4. e8 |
	d4 c bes,2 |
%75
	a,2. g,4 |
	d2 r4 d |
	d d c bes, |
	f1 |
	r4 bes, bes, bes, |
%80
	a, g, d2 ~ |
	d\breve*1/2 |
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
%85
	R1*4/4 |
	R1*4/4 |
	R1*4/4 |
	r4 d c f4. e8 c4 d e |
%90
	f4. e8 d c bes, a, |
	g,2 d |
	R1*4/4 |
	r4 d d g,2 g4 f2 |
%95
	c4 f4. e8 c4 |
	d bes, f2 |
	R1*4/4 |
	r2 f |
	c4 f4. g8 a4 |
%100
	g g, c2 |
	f,8 g, a, bes, c4 g, |
	d2. bes,4 |
	\ss ees2 d |
	r d |
%105
	g,4 c g, d2 c4 d2 |
	g,1 |
	d2 r |
	R1*4/4 |
%110
	R1*4/4 |
	R1*4/4 |
	d2 f2. e4 f d |
	c4. bes,8 g, a, bes, c |
%115
	d e f4 bes, c |
	f,2 r |
	r a, |
	d2. c4 |
	d bes, a,2 |
%120
	r4 d2 c4 |
	f g e2 |
	d r |
	R1*4/4 |
	r4 d2 c4 |
%125
	f g e2 |
	d r4 g2 \ss fis4 g2 |
	d r |
	r r4 d2 c4 d a, |
	d1 |
	a,\breve*1/2
}

textocantus=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta __ _ mun -- _ _ _ di
\italicas
pec -- ca -- ta mun -- _ _ di
qui tol -- lis pec -- ca -- ta mun -- _ _ di,
pec -- ca -- ta __ _ _ _ _ _ _ _ mun -- di:
\rectas
mi -- se -- re -- re no -- _ _ _ _ bis
\italicas
mi -- se -- re -- re no -- _ bis,
mi -- se -- _ _ _ re -- _ _ re no -- _ _ _ bis
\rectas
mi -- se -- re -- re no -- _ _ _ _ _ bis
\italicas
mi -- se -- re -- re no -- bis.
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta __ _ mun -- _ _ _ _ _ _ _ di
\italicas
pec -- ca -- ta mun -- _ _ _ _ di:
\rectas
do -- na no -- bis pa -- _ _ _ _ cem
\italicas
do -- na no -- bis __ _ _ pa -- _ _ _ cem,
do -- na _ no -- bis pa -- cem
\rectas
do -- na no -- bis pa -- cem
\italicas
do -- na no -- bis pa -- cem
do -- na __ _ _ _ _ _ _ _ _ _ _ _ no -- _ _ bis pa -- _ _ cem,
do -- na no -- _ bis pa -- _ cem
\rectas
do -- _ _ _ _ na __ _ no -- bis pa -- _ _ _ _ cem.
}

textocantusdos=\lyricmode{
A -- gnus De -- _ _ _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta mun -- di
\italicas
qui tol -- lis pec -- ca -- ta mun -- di,
pec -- _ _ _ _ ca -- ta mun -- _ _ _ _ _ di
\rectas
qui tol -- lis pec -- ca -- _ ta mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ di
mi -- se -- re -- re no -- _ _ _ _ _ _ bis
\italicas
mi -- se -- re -- re __ _ _ _ no -- _ bis
\rectas
mi -- se -- re -- re __ _ _ no -- _ _ _ _ _ _ bis.
A -- gnus De -- _ _ _ i
\italicas
a -- gnus De -- _ _ i
\rectas
qui __ _ _ tol -- lis pec -- ca -- ta __ _ _ mun -- _ _ _ _ _ _ di
\italicas
qui tol -- lis pec -- ca -- ta mun -- di:
do -- na no -- bis pa -- _ _ _ _ cem
\rectas
do -- na no -- bis pa -- _ _ _ _ _ cem
\italicas
do -- na no -- bis __ _ _ pa -- cem
do -- _ na no -- bis pa -- cem
\rectas
do -- na no -- bis pa -- cem
\italicas
do -- na __ _ _ _ _ _ _ no -- _ _ bis __ _ pa -- _ cem
do -- na __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
\rectas
no -- _ bis __ _ pa -- _ _ _ cem. _ _ _ 
}

textoaltus=\lyricmode{
A -- gnus __ _ De -- _ _ _ _ _ _ _ _ i 
qui tol -- lis pec -- ca -- _ ta __ _ _ _ _ _ _ mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ di
\italicas
pec -- _ ca -- ta mun -- di
mun -- _ _ _ _ di:
\rectas
mi -- se -- re -- re no -- _ _ bis
\italicas
mi -- se -- re -- _ _ _ _ re no -- _ _ _ _ _ _ _ bis
\rectas
mi -- se -- _ re -- re __ _ _ _ no -- _ _ _ _ _ _ _ _ _ _ bis
\italicas
mi -- se -- re -- re no -- _ bis
\rectas
mi -- se -- re -- re __ _ no -- _ _ _ _ bis. _ 
A -- gnus __ _ De -- _ _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ _ _ _ _ _ _ di
qui tol -- lis pec -- ca -- ta mun -- di,
\italicas
qui tol -- lis pec -- ca -- ta mun -- _ _ _ di
qui tol -- lis pec -- ca -- ta mun -- di:
\rectas
mi -- se -- re -- re __ _ _ _ _ no -- _ _ _ _ _ _ _ bis
\italicas
mi -- se -- re -- re no -- _ bis
mi -- se -- re -- re __ _ _ _ _ no -- _ _ _ bis,
mi -- se -- re -- re __ _ _ no -- bis,
\rectas
mi -- se -- re -- re no -- _ bis.
A -- gnus De -- _ _ _ i
\italicas
a -- gnus De -- _ _ _ _ _ _ i
\rectas
qui tol -- lis pec -- ca -- ta mun -- _ _ di,
\italicas
pec -- ca -- _ _ ta mun -- _ _ _ _ _ _ _ _ _ _ di:
\rectas
do -- na no -- bis pa -- _ cem,
\italicas
do -- na __ _ no -- _ bis pa -- _ _ cem, 
do -- na no -- bis __ _ _ pa -- _ _ _ cem
\rectas
do -- na no -- bis pa -- _ _ _ cem
\italicas
do -- na no -- _ _ bis pa -- _ _ _ cem,
do -- na no -- bis pa -- _ _ cem
do -- na no -- bis __ _ _ pa -- _ _ _ cem
do -- na no -- _ bis pa -- _ cem
\rectas
do -- na no -- bis pa -- cem
\italicas
do -- na no -- bis pa -- _ _ _ _ cem.
}

textotenor=\lyricmode{
A -- gnus De -- i
\italicas
a -- gnus De -- _ _ _ _ i
qui tol -- lis pec -- _ _ _ _ ca -- ta mun -- _ di
\rectas
qui tol -- lis pec -- ca -- ta mun -- di 
\italicas
pec -- ca -- ta mun -- _ di:
\rectas
mi -- se -- re -- re __ _ _ no -- _ _ _ bis
mi -- se -- re -- re no -- _ _ _ _ _ _ _ _ _ _ _ bis
\italicas
mi -- se -- re -- re no -- _ _ _ _ _ bis
\rectas
mi -- se -- re -- re no -- _ _ _ _ _ _ _ _ _ _ bis.
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta mun -- di
\italicas
qui tol -- lis pec -- _ _ ca -- ta mun -- di
qui tol -- lis pec -- ca -- ta mun -- _ _ di
qui tol -- lis pec -- ca -- ta __ _ mun -- _ _ _ _ _ di
qui tol -- lis pec -- ca -- ta mun -- _ _ _ di:
\rectas
mi -- se -- re -- re __ _ _ no -- bis
\italicas
mi -- se -- re -- re __ _ no -- bis
mi -- se -- re -- re __ _ _ _ _ no -- _ _ bis
\rectas
mi -- se -- re -- re no -- _ _ _ _ _ _ bis.
A -- gnus De -- _ _ _ i
qui tol -- lis pec -- ca -- _ _ _ _ ta __ _ mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ di:
do -- na no -- _ _ _ _ _ _ _ _ _ bis pa -- _ _ _ _ _ _ _ _ _ _ cem
\italicas
do -- na no -- bis pa -- cem
do -- na no -- bis pa -- cem __ _ _ _ _ _ 
\rectas
do -- na no -- bis pa -- cem
\italicas
do -- na no -- bis pa -- cem __ _ _ _ _ 
do -- na __ _ _ _ _ _ _ _ _ no -- bis
\rectas
do -- na no -- bis pa -- _ _ _ cem. _ 
}

textobassus=\lyricmode{
A -- gnus De -- i 
\italicas
qui tol -- lis pec -- ca -- ta mun -- _ di
\rectas
qui tol -- lis pec -- ca -- ta __ _ _ _ _ _ _ mun -- _ _ _ di
\italicas
qui tol -- lis pec -- ca -- _ _ _ ta mun -- _ _ _ di:
\rectas
mi -- se -- re -- re,
mi -- se -- re -- re __ _ no -- _ _ _ _ _ _ bis
\italicas
mi -- se -- re -- re __ _ _ _ no -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ bis,
\rectas
mi -- se -- re -- re no -- bis. _ 
A -- gnus De -- _ _ _ _ i,
\italicas
a -- gnus __ _ De -- _ _ _ _ _ _ i
\rectas
qui tol -- lis pec -- ca -- ta mun -- di
\italicas
qui tol -- lis pec -- ca -- ta 
qui tol -- lis pec -- ca -- ta mun -- di,
qui tol -- lis __ _ _ _ _ pec -- _ _ ca -- ta mun -- di:
\rectas
do -- na no -- _ bis pa -- cem
\italicas
do -- na _ no -- bis pa -- cem
\rectas
do -- na no -- bis pa -- cem, __ _ _ _ _ _ _ _ 
\italicas
do -- na no -- bis pa -- _ _ _ _ _ _ _ _ cem
do -- na no -- bis pa -- cem
do -- na no -- bis
\rectas
do -- na no -- bis pa -- _ _ _ _ _ _ _ _ _ _ _ _ _ cem.
}

textobassusdos=\lyricmode{
A -- gnus __ _ De -- _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta mun -- _ di
\italicas
qui tol -- lis pec -- ca -- ta __ _ mun -- _ _ _ _ _ _ _ _ _ _ _ _ _ di
qui tol -- lis pec -- ca -- _ _ _ _ _ _ ta mun -- di:
\rectas
mi -- se -- re -- re no -- _ _ _ _ _ _ _ _ _ _ bis
\italicas
mi -- se -- re -- re __ _ no -- _ bis
\rectas
mi -- se -- re -- _ re no -- _ _ _ bis
\italicas
no -- _ _ _ _ _ _ bis.
\rectas
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ i
\italicas
qui __ _ tol -- lis pec -- _ _ ca -- ta __ _ _ mun -- di
\rectas
qui tol -- lis pec -- ca -- ta __ _ mun -- _ _ _ _ di,
\italicas
qui __ _ _ tol -- lis pec -- ca -- _ _ _ _ _ _ _ _ _ ta __ _ _ mun -- _ di
qui tol -- lis pec -- ca -- ta mun -- di,
qui tol -- _ _ _ _ _ _ lis __ _ _ _ _ _ _ _ _ pec -- ca -- ta mun -- _ _ di:
\rectas
mi -- se -- re -- re __ _ _ _ _ no -- _ _ _ _ _ _ _ _ _ bis
mi -- se -- re -- re no -- bis
\italicas
mi -- se -- re -- re no -- bis. _
\rectas
A -- gnus De -- _ _ _ _ _ _ _ _ _ _ _ i
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ di
\italicas
qui tol -- lis pec -- ca -- ta,
qui tol -- lis __ _ _ _ _ pec -- ca -- ta mun -- di
\rectas
qui tol -- lis pec -- ca -- ta mun -- _ di:
do -- na __ _ no -- bis pa -- _ _ _ _ _ _ _ _ _ _ cem
\italicas
do -- na no -- bis pa -- cem
do -- na no -- bis pa -- cem
do -- na no -- bis pa -- cem
do -- na no -- bis
\rectas
do -- na no -- bis pa -- cem.
}


\score {
  \header {
    piece = \markup \larger \sans { Agnus Dei }
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

