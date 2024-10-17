\version "2.24.2"
revision = "1"
\pointAndClickOff

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
	r1*4/4 |
	r1*4/4 |
	d'1 |
	f'2 e'4 c'4 |
%5
	d'4 e'4 f'2 |
	e'4 g'4. f'8 d'8 e'8 |
	f'4 g'4 c'4 c''4 ~ |\break
	c''8 bes'8 a'2 g'4 | 
	a'2 r2 |
%10
	r1*4/4 |
	f'2 f'2 |
	g'2 f'2 |
	r4 f'4 g'2 |
	a'2 bes'2 ~ |\break
%15
	bes'4 a'8 g'8 a'4 f'8 g'8 |
	a'8 bes'8 c''4. bes'8 a'2 g'4 a'1 r4 a'4 |
	a'4 a'4 bes'4 a'8 g'8 |
%20
	f'4 bes'4. a'8 g'2 \ss fis'4 g'2 |\break
	r1*4/4 |
	r1*4/4 |
	r4 f'4 g'4 a'4 | 
%25
	bes'4 g'4 bes'4 a'4. g'8 g'2 f'8 e'8 |
	f'4 d'4. e'8 f'2 e'4. d'8 d'4 ~ |
	d'4 \ss cis'4 d'1 r2 |
	r2 a'2 |
	bes'1 | 
	a'\breve |
%35
	r1*4/4 |
	r2 r4 f'4 |
	g'4 a'4 bes'4 g'4 |
	bes'4. bes'8 a'1 r4 f'4 |
%40
	g'4 a'4 bes'4 g'4 |
	bes'4 a'4. g'8 g'4 |
	a'\breve*1/2 |
	\showBarLine \bar "|"
	\break
	s4*0^\markup{"[Cantus I]"}
	a'2. a'4 |
	g'4 e'4 f'4. g'8 |
%45
	a'4 bes'4 a'4 bes'4. a'8 a'2 g'4 |
	bes'4 a'4. g'8 g'4 |
	a'4 a'2 c''4 |
	bes'4 g'4 a'2 |
%50
	d'4.  e'8 f'8 e'8 f'4 ~ | \break
	f'4 d'4 e'2 |
	r4 e'4 f'8 e'8 f'8 g'8 | 
	a'8 bes'8 c''2 bes'8 a'8 |
	%\break
	g'4. a'8 bes'4 a'4 |
%55
	g'4 bes'4. a'8 a'2 g'4 a'1 r4 a'2 a'4 g'4 f'4 ~ | \break
	f'4 e'8 d'8 e'2 |
%60
	d'4 g'4. f'8 f'4 |
	g'2 r4 a'2 a'4 g'4 f'2 e'8 d'8 e'4 d'4 |
	%\break
	bes'2 a'4 g'4 ~ | \break
%65
	g'4 \ss fis'8 e'8 fis'2 |
	r1*4/4 |
	r4 a'2 a'4 |
	g'4 f'2 e'4 |
	f'4 g'4 e'2 |
%70
	d'\breve*2/1 |
	\showBarLine \break
	a'2 bes'4 a'2 f'4 g'4 a'4 |
	f'4 c''2 bes'8 a'8 |
	bes'4 a'4 g'4 f'4 |
	a'2 r2 |
	r2 a'2 |
%80
	bes'4 a'4 g'4 a'2 d'4 g'4 f'4 ~ | \break
	f'4 e'4 d'2 |
	r4 d'4 f'2 |
	e'4 c'4 d'4 e'4 |
%85
	f'4 d'4. e'8 f'4 |
	d'8 e'8 f'8 g'8 a'4 d'4 |
	a'2 g'4 f'2 e'4 d'2 | \break
	e'2 c'2 |
%90
	r1*4/4 |
	r4 c''4 c''4 c''4 |
	bes'4 g'4 bes'4 a'4. g'8 g'2 \ss fis'4 |
	g'2 r2 |
%95
	r1*4/4 | \break
	r2 r4 f'4 |
	e'4 e'4 d'4 e'4 |
	f'8 g'8 a'4. g'8 g'4 |
	a'\breve*4/2
}

cantusdos={
	r2 a'1 g'1 f'4 g'4 |
	a'4 bes'4 g'4 a'4. bes'8 c''4 a'4 f'4 |
	g'2. bes'4 |
	a'4 g'4 a'2 ~ |
	a'2 r2 |
	r2 a'2 |
%10
	c''2 bes'4 g'4 |
	a'4. bes'8 c''4 d''2 c''8 bes'8 a'4. g'8 |
	f'4 d'4 e'4. d'8 |
	c'4 c''4 bes'4 g'4 ~ |
%15
	g'4 f'8 e'8 f'8 g'8 a'8 bes'8 |
	c''4 a'4. g'8 f'8 e'8 |
	d'2 r4 c'4 |
	d'4 e'4 f'4 d'4 |
	f'2 e'2 |
%20
	d'4 g'4 f'4 g'4 |
	a'2 r2 |
	r2 r4 a'4 |
	a'4 a'4 g'4 f'2 bes'4. a'8 f'4 |
%25
	g'2 r2 |
	r2 r4 a'4 |
	a'4 a'4 bes'4 a'8 g'8 |
	f'4 g'4 d'2 |
	r4 e'4 f'8 g'8 a'8 f'8 |
%30
	bes'4 a'4 g'8 f'8 g'4. f'8 d'4 e'4 f'4 |
	g'1 |
	r4 f'4 e'4 c'4 |
	d'8 c'8 d'8 e'8 f'2 |
%35
	e'4 d'4 g'2 ~ |
	g'4  f'8 e'8 f'8 d'8 f'2 e'4 f'4 e'4. d'8 d'2 \ss cis'4 |
	d'\breve*2/1 |
	s4*0^\markup{"[Cantus II]"}
	r1*4/4 |
	r1*4/4 |
%45
	r1*4/4 |
	r1*4/4 |
	d'1 |
	f'2 e'4 c'4 |
	d'4 e'4 f'4. g'8 |
%50
	a'4 bes'4. a'8 a'4 ~ |
	a'4 g'4 a'2 |
	g'4. a'8 bes'4 a'2 f'4 g'2 |
	r4 g'4 g'4 f'4 |
%55
	g'2 d'2 |
	r4 d'4 d'4 c'4 |
	d'4 e'4 f'2 |
	e'2 d'4 d''4 ~ |
	d''4 d''4 c''4 bes'2 a'8 g'8 a'2 |
	r4 g'2 f'8 e'8 |
	f'8 g'8 a'8 f'8 bes'4 a'2 g'4 a'4 f'4 |
	g'4 f'4. e'8 d'8 c'8 |
%65
	d'4 a'2 a'4 |
	g'4 f'2 e'8 d'8 |
	e'2 d'4 f'4 |
	g'4 a'4 bes'4 g'4 |
	bes'2 a'1 r4 f'4 |
	g'4 a'4 bes'4 g'4 |
	bes'4 a'4. g'8 g'2 \ss fis'8 e'8 \mtempob fis'\breve*1/4 |
	\mtempo
	r1*4/4 |
%75
	r1*4/4 |
	r1*4/4 |
	d'1 |
	f'2 e'4 c'4 |
	d'4 e'4 f'2 |
%80
	r1*4/4 |
	r1*4/4 |
	r2 a'2 |
	bes'4 a'2 f'4 |
	g'4 a'4 f'4 c''2 bes'8 a'8 bes'4 a'4 |
	g'4 f'8 e'8 f'2 |
	r2 r4 a'2 g'4 f'4 d'4 |
	g'2 a'2 |
%90
	bes'4. a'8 f'4 bes'2 a'4 g'4 f'4 |
	g'2 r2 |
	r2 a'2 |
	bes'2 a'4 bes'4 |
%95
	a'4 bes'4. a'8 a'4 ~ |
	a'4 g'4 a'4. f'8 |
	g'4 c'4 f'4 e'4 |
	d'4 d''4 d''1 c''2 |
%100
	r4 c'4 d'4. e'8 |
	f'4 e'4 d'2 |
	e'\breve*1/2
	\showBarLine \bar "||"
}

altus={
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%5
	r1*4/4 |
	r2 d'1 f'2 |
	e'4 c'4 d'4 e'4 |
	f'1 |
%10
	r4 c'4 d'4 c'4. bes8 a8 g8 f4 f'4 |
	d'4 e'4 f'4 c'4 |
	d'2 g2 |
	c'2 r4 bes4 ~ |
%15
	bes8 c'8 d'4. e'8 f'4. e'8 c'4 f'2 |
	r4 d'4 f'4. f'8 |
	f'4 e'4 d'4 f'4. e'8 d'2 \ss cis'4 |
%20
	d'2 r2 |
	r4 c'4 d'4 e'4 |
	f'4 e'8 d'8 c'4 f'4. e'8 d'2 c'4 |
	d'2. c'4 |
%25
	bes4 c'4 d'2. c'8 bes8 a1 r2 |
	r4 c'4 d'4 bes4 |
	c'8 bes8 a8 g8 f4 f'4 |
%30
	bes4 f'4 d'4 e'4. d'8 d'2 c'4 |
	d'1 ~ |
	d'2 c'2 |
	a2 a4. bes8 |
%35
	c'4 d'4 d'2 ~ |
	d'2 r2 |
	r4 c'4 d'4 e'4 |
	f'4 g'4 e'4. e'8 |
	d'2 r2 |
%40
	\set Staff.autoBeaming = ##f
	r4 f4 g8 a8 bes4 |
	\set Staff.autoBeaming = ##t
	g4 a4 bes2 |
	a\breve*1/2 |
	s4*0^\markup{"[Altus]"}	
	r1*4/4 |
	r2 d'1 f'2 |
	e'4 c'4 d'4 e'4 |
	f'2 r4 d'2 d'4 c'4 a4 |
	bes4 c'4 f4 f'4. e'8 d'4. c'8 bes8 a8 |
	bes2 a2 |
	r2 d'4. d'8 |
	c'4 a4 c'4 d'2 \ss cis'4 d'2 |
%55
	e'4 d'4. c'8 a4 |
	bes2 a4. g8 |
	a8 bes8 c'4 a4 d'2 \ss cis'4 d'2 ~ |
	d'2 r2 |
%60
	r4 d'2 d'4 |
	c'4 bes2 a8 g8 |
	a4 f4 g4 d4 |
	bes2 a4 d'2 d'4 c'4 bes4 ~ |
%65
	bes4 a8 g8 a4 d'4 |
	d'4 c'4 bes8 a8 d'2 \ss cis'4 d'2 |
	e'4 d'8 c'8 d'4 e'4. d'8 d'2 \ss cis'4 |
%70
	d'4 f4 g4 a4 |
	bes4 a4 g4 bes4.
	g8 a4 bes2 |
	a\breve*1/2 |
	d'1 |
%75
	f'2 e'4 c'4 |
	d'4 e'4 f'2 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%80
	d'1 |
	f'2 e'4 c'4 |
	d'4 e'4 f'2 |
	r1*4/4 |
	r1*4/4 |
%85
	r1*4/4 |
	d'1 |
	f'2 e'4 c'4 |
	d'4 e'4 f'2 |
	r1*4/4 |
%90
	d'1 |
	f'2 e'4 c'4 |
	d'4 e'4 f'2 |
	r1*4/4 |
	d'1 |
%95
	f'2 e'4 c'4 |
	d'4 e'4 f'2 |
	r1*4/4 |
	d'1 |
	f'2 e'4 c'4 |
%100
	d'4 e'4 f'4 f8 g8 |
	a8 bes8 c'4 a4 d'2 \ss cis'8 \ss b8 \mtempob cis'\breve*1/4
}

tenor={
	d'1 |
	c'1 |
	bes2 a4 bes4 |
	c'4 d'4 c'2 |
%5
	a2 f2 |
	r4  g8[ a8 bes8 c'8] d'4. c'8 bes4 a4 f4 |
	a2 bes2 |
	a2 d4 f4 |
%10
	e4 a4 g2 |
	f4. g8 a4 bes2 c'4 f1 c'2. a4 d'2 ~ |
%15
	d'2 r4 a4 |
	a4 a4 c'2 |
	bes4 d'4. c'8 a4. bes8 c'4 f2 |
	r4 f4 g4 a4 |
%20
	bes4 g4 bes2 |
	a2 g2 |
	f4 c'4. bes8 a8 g8 |
	a2 r2 |
	r2 r4 c'4 |
%25
	d'4 e'4 f'4 d'4 |
	f'4 e'4 d'2 ~ |
	d'1 |
	d4 e4 f4 g4 |
	e2 r4 f4 |
%30
	g4 a4 bes4 g4 |
	bes2 a2 |
	g2 r4 g4 |
	f4 d4 e2 |
	f2 d2 |
%35
	e4 f4 g2 |
	r4 d'4 d'4 d'4 |
	c'2 bes4 c'4 |
	bes4 g4 a2 |
	r4 a4 a4 a4 |
%40
	bes4 a4 g4. f8 |
	d8 e8 f4 d4 g2 \ss fis8 e8 \mtempob fis\breve*1/4 |
	\mtempo
	s4*0^\markup{"[Tenor]"}
	r1*4/4 |
	r1*4/4 |
%45
	d'2. d'4 |
	c'4 a4 bes4 c'4 |
	d'4 d4 f4 g4 |
	d8 e8 f8 g8 a2 |
	r1*4/4 |
%50
	r2 d'2 ~ |
	d'4 d'4 c'4 a4 |
	bes4 c'4 d'4 d4 |
	f2 e1 d2 |
%55
	r4 g4 g4 f4 |
	g2 d4 f4. e8 c4 d8 e8 f8 g8 |
	a2 bes2 ~ |
	bes2 a4 g2 f8 e8 d2 |
	\ss ees2 d1 r4 d'2 d'4 c'4 bes8 a8 |
	g4 bes4 f4 g4 |
%65
	d1 |
	g4 a4 bes2 |
	a2 d2 |
	r4 d'4 bes4 c'4 |
	bes4 g4 a2 |
%70
	d2 r4 d4 |
	g4 f4 g2. f4 g2 |
	d\breve*1/2 |
	d2 g4 f2 d4 e4 f2 e4 d2 |
	r4 a4 bes4 a2 f4 g4 a4 |
	g2 f2 |
%80
	r4 a4 bes4 a2 f4 g4 a4 |
	f4 c'4 a4 d'4. e'8 f'4 f8 g8 a8 f8 |
	c'4 f2 e4 |
%85
	a2 r4 a4 |
	bes4 a4. f8 bes4 |
	a4 f4 g4 a4. bes8 c'2 bes4 |
	c'2 r4 c'4 |
%90
	bes4 g4 a4 bes4 |
	c'2 c'2 |
	r4 c'4 d'4 f'2 e'4 d'2. g4 a4 g4 |
%95
	d'2 c'4 a4 |
	bes2 a2 |
	c'2 d'4 c'4 |
	bes4 a4 bes2 |
	a\breve*4/2 
}

bassus={
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%5
	a1 |
	c'2 bes4 g4 |
	a4 bes4 c'2 ~ |
	c'2 r4 g4 |
	f4 d8 e8 f8 g8 a8 f8 |
%10
	g4 f4. e8 e4 |
	f2 r2 |
	r2 f2 |
	d4 f4 e4 g4. \ss fis8 fis4 g2 |
%15
	r4 a4 a4 a4 |
	f4. g8 a2 |
	bes2 a\breve r2 |
%20
	r4 d'4 d'4 d'4 |
	c'2 bes4 c'4 |
	a4 g4 a2 |
	r4 f4 g4 a4 |
	bes2. a4 |
%25
	g8 f8 e4 d2 |
	r1*4/4 |
	r4 f4 g4 a4 |
	bes4 g4 bes2 |
	a1 |
%30
	g4 f4 g1 r4 c'4 |
	bes4  g8[ a8 bes8 c'8] d'4 |
	d8 e8 f8 g8 a1 r4 f4 |
%35
	g4 a4 bes4 g4 |
	bes4. bes8 a2 |
	r1*4/4 |
	r2 e2 |
	f1 |
%40
	d\breve*3/2 |
	r1*4/4 |
	r1*4/4 |
%45
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%50
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%55
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%60
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%65
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%70
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%75
	r2 r4 a4 |
	bes4 a2 f4 |
	g4 a4 d2 |
	r4 a4 c'2 |
	bes4 g4 a2 |
%80
	g4 f4 g4 f8 e8 |
	d2 r4 a4 |
	bes4 a2 f4 |
	g4 f8 e8 d2 |
	r4 a4 bes4 a2 f4 g4 a4 |
	d4 d'4 d'2. c'4 c'2 |
	r2 f2 |
	e4 g4. \ss fis8 fis4 |
%90
	g4. f8 d4 g4 |
	f8 g8 a8 bes8 c'4 a4 |
	g4. f8 d4 d'4 |
	c'4. bes8 a2 |
	g2 f4 g4 |
%95
	d2 a2 |
	r4 g4 f4 d4 |
	e4 a4. g8 g2 f4 g2 |
	f4 d4 e2 |
%100
	f4 e4 d4 f4 |
	d4 e4 f2 |
	e\breve*1/2
}

bassusdos={
	d1 |
	f2 e4 c4 |
	g4. f8 d4 g4 |
	f4 bes,4 c4 f4. e8 c4 d2 |
	c4. bes,8 g,4 g4 |
	d4 g4 f2 |
	r2 g2 |
	d4 f4. e8 d4 |
%10
	c4 a,4 bes,4 c4 |
	f,2 r2 |
	r4 c4 d4 f4 |
	bes,4 d4 c4. bes,8 |
	a,2 g,2 |
%15
	d1 |
	r4 f4 f4 f4 |
	g2 d4 f4 |
	d4 c4 d1 r2 |
%20
	r1*4/4 |
	r2 r4 c4 |
	d4 e4 f4 d4 |
	f2 e4 f4 |
	bes,2 r2 |
%25
	r2 r4 d4 |
	bes,4 c4 d1 g,4 d2 c4 bes,4 g,4 |
	a,2 d2 |
%30
	r1*4/4 |
	r1*4/4 |
	g,1 |
	d2 a,2 |
	d2. d4 |
%35
	c4 bes,8 a,8 g,2 |
	d1 |
	r1*4/4 |
	r2 a,2 |
	d2. d4 |
%40
	g,4 d4 g,2. f,4 g,2 |
	d\breve*1/2 |
	r1*4/4 |
	r1*4/4 |
%45
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%50
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%55
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%60
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%65
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%70
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r2 r4 d2 d4 c4 f,4 |
	bes,4 c4 d2 |
	g,4 f,4 g,4 d2 d4 c4 a,4 |
	bes,4 c4 f,2 |
%80
	r2 r4 d2 d4 c4 f4 |
	bes,4 c4 d2 |
	r2 r4 d4 |
	c4 f4 bes,4 c4 |
%85
	d2 g,4 f,4 |
	g,4 d2 bes,8 c8 |
	d8 e8 f4 c4 f4. e8 c4 d2 |
	c4. bes,8 a,2 |
%90
	g,2 r2 |
	r1*4/4 |
	r4 c4 bes,8 c8 d8 e8 |
	f4 c4 d2 |
	g,2 r2 |
%95
	r1*4/4 |
	g,2 d2 |
	c4 a,4 bes,4 c4 |
	d2 g,2 |
	d2 a,2 |
%100
	d4 a,4 d2. c4 d2 |
	a,\breve*1/2
}

textocantus=\lyricmode{
San -- _ _ _ _ _ _ _ _ _ _ _ _ _ ctus,
San -- _ _ _ _ ctus
\italicas
San -- ctus __ _ _
\rectas
San -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ctus
Do -- mi -- nus De -- _ _ us Sa -- _ ba -- _ oth
\italicas
Do -- mi -- nus De -- us Sa -- _ _ _ _ _ _ _ _ _ _ _ _ _ ba -- oth
Sa -- ba -- oth
Do -- mi -- nus De -- us Sa -- ba -- oth
\rectas
Do -- mi -- nus De -- us Sa -- ba -- _ _ oth.
Ple -- ni sunt _ cæ -- _ li et __ _ ter -- _ _ _ _ _ _ _ ra,
\italicas
ple -- ni sunt cæ -- li et __ _ _ _ ter -- _ _ ra
ple -- ni __ _ _ _ _ _ _ _ _ sunt
cæ -- li et ter -- _ _ _ _ ra
\rectas
glo -- ri -- a tu -- _ _ _ _ _ _ _ _ a
\italicas
glo -- ri -- a tu -- _ _ _ _ _ _ _ _ _ _ a
glo -- ri -- a
\rectas
tu -- _ _ _ _ a.
Ho -- san -- na in ex -- _ cel -- _ _ _ _ _ _ _ sis
\italicas
ho -- san -- na in ex -- _ cel -- _ _ _ sis
ho -- san -- na in ex -- cel -- sis,
ho -- _ _ san -- _ _ _ _ na in ex -- cel -- _ _ _ sis
ho -- san -- na in ex -- _ cel -- _ _ _ sis
\rectas
ho -- san -- na in ex -- cel -- _ _ _ _ sis. _ _ _ 
}

textocantusdos=\lyricmode{
San -- _ _ _ _ _ _ ctus, __ _ _
San -- _ _ _ _ _ ctus _
San -- _ _ _ _ _ _ _ _ _ _ _ _ _ ctus, __ _ _ _ _ 
San -- _ _ _ _ _ _ _ _ _ _ _ _ ctus
Do -- mi -- nus De -- us Sa -- ba -- oth __ _ _ _ _ 
\italicas
Do -- mi -- nus De -- us Sa -- _ ba -- oth
Do -- mi -- nus De -- us _ Sa -- ba -- oth
Do -- mi -- _ _ _ _ nus De -- _ us __ _ Sa -- _ ba -- oth
\rectas
Do -- mi -- nus De -- _ _ _ _ _ us Sa -- _ _ _ _ _ _ _ _ _ _ _ ba -- oth. 
Ple -- ni sunt cæ -- _ _ li __ _ et ter -- _ _ _ _ _ _ _ _ _ _ ra
\italicas
ple -- ni sunt cæ -- li
ple -- ni sunt cæ -- li et ter -- ra 
\rectas
glo -- _ ri -- a tu -- _ _ a
\italicas
glo -- ri -- _ a __ _ _ _ _ tu -- _ _ _ _ _ _ _ _ a,
glo -- ri -- a tu -- _ _ _ a,
glo -- ri -- a tu -- _ _ a
\rectas
glo -- ri -- a tu -- _ _ _ _ _ _ _ a.
Ho -- san -- na in ex -- cel -- sis
\italicas
ho -- san -- na in ex -- cel -- _ _ _ _ _ _ _ _ _ sis
ho -- san -- _ na in ex -- cel -- _ _ _ _ _ _ sis
ho -- san -- na in ex -- cel -- _ _ _ _ _ _ sis,
ho -- san -- na in ex -- cel -- sis
\rectas
ho -- san -- na in ex -- cel -- sis.
}

textoaltus=\lyricmode{
San -- _ _ _ _ _ _ ctus
San -- _ _ _ _ _ _ _ _ _ _ _ _ ctus
San -- _ _ _ _ _ _ _ ctus
Do -- mi -- nus De -- us Sa -- ba -- _ _ _ oth
\italicas
Do -- mi -- nus __ _ _ _ _ De -- _ _ _ us Sa -- ba -- _ oth __ _ _ _ 
Do -- mi -- nus De -- _ _ _ us,
Do -- mi -- nus De -- _ _ _ _ _ _ _ us Sa -- _ _ ba -- oth _
Do -- mi -- nus De -- us Sa -- ba -- oth
\italicas
Do -- mi -- nus De -- us Sa -- ba -- oth.
\rectas
Ple -- ni sunt cæ -- _ _ li
\italicas
ple -- ni sunt cæ -- _ li et ter -- _ _ _ _ _ _ ra
ple -- ni sunt cæ -- li et __ _ ter -- _ _ _ _ _ _ _ _ _ _ _ _ _ ra _
\rectas
glo -- ri -- a tu -- _ _ _ _ _ _ _ a,
\italicas
glo -- ri -- a tu -- _ _ _ a,
glo -- ri -- a __ _ _ tu -- _ _ _ _ _ _ _ _ _ _ a,
glo -- ri -- a tu -- _ a,
\rectas
glo -- ri -- a tu -- a.
Ho -- san -- na in ex -- cel -- sis
\italicas
ho -- san -- na in ex -- cel -- sis
ho -- san -- na in ex -- cel -- sis
ho -- san -- na in ex -- cel -- sis
ho -- san -- na in ex -- cel -- sis
\rectas
ho -- san -- na in ex -- cel -- sis,
\italicas
in __ _ _ _ _ ex -- cel -- _ _ sis.
}

textotenor=\lyricmode{
San -- _ _ _ _ _ _ _ _ ctus
San -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ctus,
San -- _ ctus _
Do -- mi -- nus De -- us Sa -- _ ba -- _ _ oth
\italicas
Do -- mi -- nus De -- us Sa -- ba -- oth __ _ _ _ _ _ _ 
Do -- mi -- nus De -- us Sa -- ba -- oth, _ 
Do -- mi -- nus De -- us
Do -- mi -- nus De -- us Sa -- ba -- oth
Do -- mi -- nus De -- us Sa -- _ ba -- oth
Do -- mi -- nus De -- us Sa -- _ ba -- oth
\rectas
Do -- mi -- nus De -- us Sa -- _ _ _ _ _ ba -- _ _ oth.
Ple -- ni sunt cæ -- li et ter -- _ _ _ ra __ _ _ _ _ 
\italicas
ple -- _ ni sunt cæ -- li __ _ _ et ter -- _ ra
ple -- ni sunt cæ -- li et __ _ _ ter -- _ _ _ ra glo -- _ ri -- a __ _ _ _ tu -- a
\rectas
glo -- ri -- a __ _ _ _ tu -- _ _ a,
\italicas
glo -- ri -- a tu -- a
glo -- ri -- a tu -- _ _ a
\rectas
glo -- ri -- a tu -- _ _ a.
Ho -- san -- na in ex -- cel -- _ sis
\italicas
ho -- san -- na in ex -- _ cel -- sis
ho -- san -- na in ex -- cel -- sis,
ho -- san -- na __ _ _ in __ _ _ _ _ ex -- cel -- sis
ho -- san -- na __ _ _ in ex -- cel -- _ _ _ _ sis
\rectas
ho -- san -- na in ex -- cel -- sis
\italicas
ho -- san -- na __ _ _ _ _ _ in ex -- _ cel -- sis,
ho -- san -- na in ex -- cel -- sis.
}

textobassus=\lyricmode{
San -- _ _ _ _ _ ctus _
San -- _ _ _ _ _ _ _ _ _ _ _ ctus
San -- _ _ _ _ _ _ ctus
Do -- mi -- nus De -- us Sa -- ba -- oth
\italicas
Do -- mi -- nus De -- us Sa -- ba -- _ oth
Do -- mi -- nus De -- us Sa -- _ ba -- oth
Do -- mi -- nus De -- us Sa -- ba -- _ _ oth
Do -- mi -- nus __ _ _ _ _ De -- _ _ _ us
\rectas
Do -- mi -- nus De -- us Sa -- ba -- oth
\italicas
Sa -- ba -- oth.
\rectas
Ho -- san -- na in ex -- cel -- sis
\italicas
ho -- san -- na in ex -- cel -- _ _ _ _ sis
ho -- san -- na in ex -- cel -- _ sis
ho -- san -- _ _ _ _ na in ex -- cel -- sis
ho -- san -- na __ _ _ in __ _ _ ex -- cel -- _ _ _ _ _ sis, __ _ _ 
ho -- san -- _ _ na in ex -- cel -- sis
ho -- san -- na in ex -- _ cel -- _ _ _ _ sis,
\rectas
ho -- san -- na in ex -- cel -- _ sis.
}

textobassusdos=\lyricmode{
San -- _ _ _ _ _ _ _ _ _ ctus,
San -- _ _ _ _ _ _ _ _ _ ctus
San -- _ _ _ _ _ _ _ _ ctus
Do -- mi -- nus De -- _ us __ _ Sa -- ba -- oth
\italicas
Do -- mi -- nus De -- us Sa -- ba -- _ oth
Do -- mi -- nus De -- us Sa -- ba -- _ oth
Do -- mi -- nus De -- us Sa -- _ _ _ ba -- oth
Do -- mi -- nus De -- us Sa -- _ _ ba -- oth
\rectas
Do -- mi -- nus De -- us Sa -- _ ba -- oth.
Ho -- san -- na in ex -- _ _ cel -- _ sis,
\italicas
ho -- san -- na in ex -- cel -- sis
ho -- san -- na in ex -- cel -- sis
ho -- san -- na in ex -- cel -- _ _ sis,
ho -- san -- _ _ _ _ na in __ _ _ ex -- cel -- _ _ sis
ho -- san -- _ _ _ _ _ _ na
ho -- san -- na in ex -- cel -- _ _ sis,
\rectas
ho -- san -- na in ex -- cel -- sis.
}



\score {
  \header {
    piece = \markup \larger \sans { Sanctus }
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

