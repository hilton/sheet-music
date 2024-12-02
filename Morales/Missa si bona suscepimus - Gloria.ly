\version "2.24.2"
revision = "1"
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
mt=#(define-music-function (offset) (number?) ; move lyric text
      #{ \once \override LyricText.X-offset = -$offset #})


% GLORIA

\score {
  \header {
    piece = \markup \larger \sans { Gloria }
  }
	\new Staff <<
		\key f \major
		\new Voice {
			\relative c' {
				\cadenzaOn
				\override Stem #'transparent = ##t 
				f8 bes a g a bes s a g s f g a s g-- f-- s \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Glo -- _ ri -- _ a __ _ in __ _ ex -- cel -- sis De -- o.
		}
	>>
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}

cantus={
	r2 a'4. a'8 |
	a'4 a'4 g'4 e'4 |
	f'4 g'4 a'4 f'4. e'8 d'4 c'2 |
%5
	r1*4/4 |
	r4 d'4 f'2 |
	e'4 c'4 d'4 e'4 |
	f'2 r2 | \break
	f'2 a'2 |
%10
	g'4 a'4. bes'8 c''2 \ss b'4 c''1 r2 |
	f'2 f'2 |
	g'2 f'2 |
%15
	r1*4/4 |
	r2 r4 f'4 | \break
	g'2 a'2 |
	bes'4.  a'8[ f'8 g'8] a'4. g'8 g'2 \ss fis'4 |
%20
	g'2 r4 \ss f'!4 |
	g'2 a'2 |
	bes'2. a'8[ g'8 |
	a'8 bes'8] c''4. bes'16 a'16 g'4. f'8 d'4 e'2 | \break
%25
	r4 d'4. d'8 d'4 |
	f'4 f'4 e'4 a'4. g'8 f'8 e'8 d'4 e'4 |
	f'4 d'4 g'2 |
	r4 f'4 f'4 f'4 |
%30
	g'4 a'2 g'4 |
	f'4 e'8 d'8 e'2 |
	d'2 r2 | \break
	r2 r4 e'4 |
	 f'8[ e'8]  f'8[ g'8 a'8 bes'8] c''2 bes'8 a'8 g'4. a'8 |
	bes'4 a'4 g'4 bes'4. a'8 a'2 g'4 |
	a'2 r2 |
	r1*4/4 |
%40
	r1*4/4 | \break
	r2 r4 f'4 |
	g'4 a'4 bes'4 g'4 |
	bes'4 a'4. g'8 g'4 |
	a'2 r2 |
%45
	r1*4/4 |
	r2 a'2. a'4 a'2 |
	bes'2 a'2 | \break
	r2 r4 d'2 c'4 f'4. g'8 |
	a'8 bes'8 c''2 bes'8 a'8 |
	g'2 r4 a'4 |
	bes'2 bes'2 |
	a'4. g'8 a'4 bes'4. a'8 a'2 g'4 |
	a'1 | \break
	r1*4/4 |
	r1*4/4 |
	r4 a'4 a'4 a'4 |
%60
	bes'2 g'2 |
	a'2 bes'4 a'4. g'8 \ss fis'8 e'8 fis'2 |
	g'4 d'4 d'4 d'4 |
	e'4 \ss f'!2 e'4 | \break
%65
	d'2 d'2 |
	d'2 d''1 a'2 |
	c''2 g'2 |
	bes'4. a'8 g'2 |
%70
	f'4.  g'8[ a'8 bes'8] a'2 g'8 f'8 g'8 a'8 bes'8 g'8 |
	a'\breve*1/2 | \break
	r1*4/4 |
	r1*4/4 |
%75
	d'1 |
	f'2 e'4 c'4 |
	d'4 e'4 f'4 c'4 |
	f'4. e'8 d'2 |
	e'2 r2 |
%80
	r4 f'4 e'4 f'4 ~ | \break
	f'8 e'8 a'4 g'2 |
	f'1 |
	r1*4/4 |
	r2 r4 g'4 |
%85
	a'4 bes'4 c''4 a'4 |
	bes'4. a'8 g'4 f'4. e'8 c'4 d'4 e'4 |
	f'4 g'4. f'8 d'4 | \break
	e'4 f'4 e'2 |
%90
	d'2 r2 |
	r4 a'4 bes'4 g'2 f'8 e'8 f'1 r2 |
	r1*4/4 |
%95
	r4 a'4 a'4 a'4 | \break
	bes'4 d''4. c''8 bes'8 a'8 |
	g'4 f'4 g'4 a'4 |
	bes'4 a'4. g'8 g'2 \ss fis'4 g'2 |
%100
	r1*4/4 |
	r1*4/4 |
	r2 r4 e'4 |
	 f'8[ e'8]  f'8[ g'8 a'8 bes'8] c''4 | \break
	bes'4 a'4. g'8 g'4 |
%105
	a'4 d'4 g'2 |
	r2 r4 g'4 |
	f'4 d'4 f'2 |
	g'2 f'2 |
	r1*4/4 |
%110
	r1*4/4 |
	r4 d'4 f'2 ~ | \break
	f'4 e'4 f'4 d'4 |
	c'2 r2 |
	r2 r4 d'2 g'2 f'4 |
	g'4 e'4 d'2 |
	r1*4/4 |
	e'2 f'2 |
	g'2. d'4 | \break
%120
	f'1 ~ |
	f'2 r4 d'4 |
	f'2. e'4 |
	f'4 g'4 a'2 |
	r1*4/4 |
%125
	r1*4/4 |
	r4 e'4 f'8 e'8 f'8 g'8 |
	a'8 bes'8 c''2 bes'8 a'8 | \break
	g'4. a'8 bes'4 a'4. g'8 f'4 e'4 d'4. e'8 f'4 d'2 |
	r2 r4 d'4. e'8 f'2 e'4 |
	d'1 |
	e'\breve*1/2
	\showBarLine \bar "||"
}

cantusdos={
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	a'4. a'8 a'4 a'4 |
%5
	g'4 e'4 f'4 g'4 |
	a'1 |
	r1*4/4 |
	r4 c''4 c''4 c''4 |
	d''4 c''4 c''2 |
%10
	r1*4/4 |
	g'2 g'2 |
	a'2 g'4 bes'4. a'8 a'4 bes'2 |
	r2 r4 f'4 |
%15
	g'2 a'2 |
	bes'4.  a'8[ f'8 g'8] a'4 ~ |
	a'8 g'8 g'2 \ss fis'4 |
	g'2 r4 \ss f'!4 |
	g'2 a'2 |
%20
	bes'4.  a'8[ f'8 g'8] a'4. g'8 g'2 \ss fis'4 |
	g'2 r4 a'4. a'8 a'4 g'4 e'4 |
	g'4 f'8 g'8 a'8 bes'8 c''8 a'8 |
%25
	bes'4 a'4. g'8 g'4 |
	a'1 |
	r1*4/4 |
	r4 d'4 e'4 e'4 |
	f'4. e'8 c'4 d'2 c'4 d'4 e'4. d'8 d'2 \ss cis'4 |
	d'2 r4 e'4 |
	 f'8[ e'8]  f'8[ g'8 a'8 bes'8] c''4 |
	a'4 d''4 c''4. bes'8 |
%35
	a'8 g'8 f'2 e'4 |
	d'2 r2 |
	r1*4/4 |
	r4 a'2 g'4 |
	f'4. g'8 a'4 d'2 g'4. \ss fis'8 fis'4 |
	g'2 r2 |
	r1*4/4 |
	r1*4/4 |
	r4 f'4 g'4 a'4 |
%45
	bes'4 g'4 bes'4 a'2 g'2 f'8 e'8 |
	f'2 r4 f'4 |
	g'4 d'4 f'4. g'8 |
	a'4 bes'4. a'8 f'4 |
%50
	g'2 r4 f'2 e'4 f'4 d'4 |
	\ss ees'8 f'8 g'2 \ss fis'4 |
	g'1 |
	r1*4/4 |
%55
	r4 a'4 bes'4 d''2 c''8 bes'8 c''8 bes'8 a'8 g'8 |
	f'1 |
	r1*4/4 |
	r4 c''4 c''4 c''4 |
%60
	bes'4 g'4 d''2 |
	r1*4/4 |
	r4 a'4 a'4 a'4 |
	bes'2. g'4 |
	a'2 bes'4 a'4 ~ |
%65
	a'8 g'8 g'2 \ss fis'4 |
	g'1 |
	r2 f'2 |
	\ss ees'4 c'4 ees'2 |
	d'2 bes'2. f'2 a'4 |
	d'2 g'2. \ss fis'8 e'8 \mtempob fis'\breve*1/4 |
	\showBarLine
	\mtempo
	r1*4/4 |
	r1*4/4 |
%75
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%80
	a'1 |
	c''2 bes'4 g'4 |
	a'4. bes'8 c''4 a'4 |
	g'1 |
	r4 c'4 d'4 e'4 |
%85
	c'4 d'4 c'2 |
	r4 g'4 bes'2 |
	a'4 f'4 g'4 a'4 |
	bes'4. a'8 g'4 f'4 |
	a'2 bes'4 a'8 g'8 |
%90
	f'4 bes'4 a'1 r2 |
	a'1 |
	bes'1 |
	a'1 |
%95
	r1*4/4 |
	r2 r4 bes'4 |
	bes'4 bes'4 c''4 d''2 c''4 bes'4 a'8 g'8 |
	a'2 g'1 r2 |
	r1*4/4 |
	r1*4/4 |
	r4 a'2 a'4 |
	g'4 f'2 e'8[ d'8 |
%105
	e'8 f'8] g'4. d'8 g'2 \ss fis'4 g'2 |
	r4 a'4. a'8 a'4 |
	bes'2 bes'4 a'2 g'8 f'8 g'4 a'4 |
%110
	f'2 r2 |
	r1*4/4 |
	r4 g'4 a'2. g'4 a'4 f'2 e'8 d'8 e'4 d'2 \ss cis'4 d'2 |
	r1*4/4 |
	r1*4/4 |
	r2 a'2 |
	bes'2 bes'2 |
%120
	a'4. g'8 a'4 bes'4. a'8 a'2 g'4 |
	a'1 |
	r4 d'4 f'4 e'4 |
	f'4 g'4 a'2 |
%125
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r4 e'4  f'8 e'8  f'8 g'8 |
	a'8 bes'8 c''2 bes'4 |
%130
	a'8 g'8 a'4 g'4 bes'4. a'8 a'2 g'4 |
	a'\breve*3/2
}

altus={
	d'4. d'8 d'4 d'4 |
	c'4 a4 c'2 |
	bes2 a1 r2 |
%5
	r1*4/4 |
	a1 |
	c'2 bes4 g4 |
	a4. bes8 c'2 |
	r1*4/4 |
%10
	r4 c'4 c'2 |
	d'2 e'2 |
	f'2 d'2 |
	f'4.  e'8[ d'8 c'8] d'2 c'4 d'4 a4 |
%15
	bes4 g4. \ss fis8 fis4 |
	g4 d'2 d'4 |
	c'4 bes4 d'2. d'4 d'4 c'4 |
	d'4 \ss ees'4 d'4. c'8 |
%20
	bes4 d'2 c'4. bes8 g4 r4 a4 |
	g8 a8 bes8 c'8 d'8 e'8 f'4. e'8 c'4. d'8 e'4. d'8 d'2 c'4 |
%25
	d'2 r4 d'4. d'8 d'4 \ss cis'4 cis'4 |
	d'4. e'8 f'4 e'4. d'8 d'2 c'4 |
	d'2 r2 |
%30
	r1*4/4 |
	r4 a4 a4 a4 |
	a4. g8 f4 e4 |
	d2 r4 a4 |
	a4 a4. g8 f4 |
%35
	e4 d4 r2 |
	r4 d'4 d'4 d'4. c'8 a4 bes2 |
	a2 r4 d'2 d'4 c'4 bes2 a8 g8 a2 |
	g2 f4. \ss ees8 |
	d4 c4 g8 a8 bes8 c'8 |
	d'1 |
	r4 d'4 d'4 e'4 |
%45
	f'4 d'4 f'2 |
	e'2 d'1 r2 |
	r2 d'2 ~ |
	d'4 d'4 d'2 |
%50
	g2 d'2 |
	r4 c'4 a4 d'4. c'8 c'4 d'2 |
	d'2. d'4 |
	d'2 d'2 |
%55
	r2 d'2 |
	e'2. c'4 |
	d'2. d'4 |
	c'8 bes8 a8 g8 f8 e8 a4 |
	g4 \ss fis8 e8 fis2 |
%60
	g4 d'4 d'4 d'4 |
	e'4 f'2 e'4 |
	d'4 d'4 d'2 |
	r4 bes4 bes4 bes4 |
	c'4 d'2 c'4 |
%65
	bes4 a8 g8 a2 |
	g4 d'4 d'4 d'4 |
	f'4. e'8 d'2 |
	r4 g4 g4 g4. a8 bes4. c'8 d'4. e'8 f'4 r4 f'4 |
	d'4 bes4 d'2 |
	d'\breve*1/2 |
	r1*4/4 |
	r1*4/4 |
%75
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	a1 |
	c'2 bes4 g4 |
%80
	a4. bes8 c'4 d'4 |
	c'4 f'4 d'4 e'4 |
	f'2 r4 f'4 |
	e'4 d'4 e'2 |
	f'4 f8 g8 a8 bes8 c'8 bes8 |
%85
	a8 g8 g2 \ss fis4 |
	g2 r4 d'4 |
	c'4 a4 bes4 c'4 |
	d'4 e'4. d'8 d'4 |
	c'4 d'2 \ss cis'4 |
%90
	d'2 d'2. d'4 d'2 |
	r1*4/4 |
	r4 d'4 d'4 d'4 |
	c'8 bes8 a8 g8 f4 a4 |
%95
	g4 \ss fis8 e8 fis2 |
	g2 r4 d'4 |
	ees'4 d'4 ees'4 d'4 |
	bes4 c'4 d'2 ~ |
	d'1 |
%100
	r4 d'2 f'4 |
	e'4 d'4 f'4 e'4. d'8 d'2 \ss cis'4 |
	d'2 \ss c'!2 |
	r4 d'2 d'4 |
%105
	c'4 bes2 a8 g8 |
	a2 g2 |
	r2 r4 d'4. d'8 d'4 bes4 f'4. e'8 d'4.  c'8[ d'8 bes8] |
%110
	c'4 bes4 r4 c'4 |
	d'2. c'4 |
	d'4 bes4 a4. g8 |
	a8 bes8 c'2 \ss b4 |
	c'2 r2 |
%115
	r2 r4 a4 |
	bes4 c'4 d'4. c'8 |
	bes8 a8 a2 g4 |
	a1 |
	r4 g4 bes4. c'8 |
%120
	d'8 e'8 f'4. e'8 d'4 |
	c'4 a4 d'1 r4 a4 |
	d'2. \ss cis'4 |
	d'4 bes4 a2 |
%125
	r4 a2 d'2 c'4 d'4. e'8 |
	f'4 e'4 c'4 d'4 |
	e'4 c'4 d'2 |
	c'4 f4 g8 a8 bes8 c'8 |
%130
	d'2 bes4 d'4 ~ |
	d'8 e'8 f'4 d'4. e'8 |
	f'4  f8[ g8 a8 bes8] c'4 |
	a8 f8 f'4. e'8 d'2 \ss cis'8 \ss b8 \mtempob cis'\breve*1/4
}

tenor={
	d1 |
	f2 e4 c4 |
	d4 e4 f4 d4 |
	f4. g8 a8 g8 a8 bes8 |
%5
	c'2 bes2 |
	a4. g8 f4 d4 |
	e2 r4 c'4 |
	c'4 c'4 a2 |
	bes4 a4 a2 |
%10
	r1*4/4 |
	r4 g2 c'2 a4 bes2 |
	c'2 bes4. a8 |
	g4 c4 f2 |
%15
	r4 c'4 c'4 c'4 |
	bes2 a4 d4 |
	g2 r2 |
	r1*4/4 |
	r1*4/4 |
%20
	r4 bes4 bes4 a4 |
	c'4 bes4 d'2 |
	r4 d'4. d'8 d'4 |
	c'4 a4 c'2 |
	bes2 a2 |
%25
	g4 f4 bes2 |
	a\breve |
	r4 g4 g4 c4 |
	f4. g8 a4 bes2 a4 bes4 c'4 |
	a2 r4 e4 |
	 f8[ e8]  f8[ g8 a8 bes8] c'4 |
	a4 d'2 c'4 |
	d'4. c'8 a4. bes8 |
%35
	c'4 d'4. c'8 c'4 |
	r4 a4 bes4. c'8 |
	d'8 e'8 f'4 e'4 d'4. c'8 a4 bes2 |
	a2 r2 |
%40
	r4 d'2 d'4 |
	c'4 bes2 a4 |
	g4 \ss fis4 g2 |
	d2 r2 |
	r4 a4 bes4 c'4 |
%45
	d'4 bes4 d'2 |
	c'4. bes8 a1 d'2. d'4 d'4 d8 e8 |
	f8 d8 g4. f8 d4 |
%50
	e2 d4. e8 |
	f4 g4 a4 g8 f8 |
	g2 a2 |
	g4. a8 bes4 g4 |
	a2. g4 |
%55
	f4. e8 d2 |
	r4 a4 a4 a4 |
	bes1 |
	a1 |
	r1*4/4 |
%60
	r4 bes4 bes4 bes4 |
	c'4 d'2 c'4 |
	bes4 a8 g8 a2 |
	g1 |
	r1*4/4 |
%65
	r2 a2 |
	bes2 bes2 |
	a4. g8 f4 d4 |
	\ss ees2 r4 c'4 |
	bes4 g4 bes4. c'8 |
%70
	d'2 a2 |
	bes1 |
	a\breve*1/2 |
	r1*4/4 |
	r1*4/4 |
%75
	r1*4/4 |
	a2 c'2 |
	bes4 g4 a4. bes8 |
	c'4 d'4. d8 f4 |
	e4 c4 d4 e4 |
%80
	f4. g8 a4 d4 |
	a2 bes4 c'4 |
	a1 |
	r4 g4 g4 g4 |
	a4. g8 f4 e2 d4 e4 c4 |
	d2 r2 |
	r1*4/4 |
	r4 g4 bes2 |
	a4 f4 g4 a4 |
%90
	bes4 g2 \ss fis8 e8 |
	\ss fis2 r2 |
	d'2. d'4 |
	d'2 r2 |
	r4 a4 a4 a4 |
%95
	bes4 c'4. a8 c'4 |
	bes4. a8 g2 |
	r1*4/4 |
	r1*4/4 |
	a2 bes2 |
%100
	bes2 a4. g8 |
	a4 bes4. a8 a2 g4 a2 ~ |
	a1 |
	r1*4/4 |
%105
	r2 r4 d'2 d'4 c'4 2 a8 g8 a2 |
	g4. f8 d2 |
	r2 r4 d4 |
%110
	f2. e4 |
	f4 g4 f2 |
	r1*4/4 |
	r2 f2 |
	g2. f4 |
%115
	g4 e4 d2 |
	r4 e4 f2 |
	f4 e4 f4 d4 |
	e2 r2 |
	g2. g4 |
%120
	f4 d4 f2 |
	r1*4/4 |
	r4 a4 d'4 c'4 |
	d'4 bes4 a2 |
	r2 r4 a4 |
%125
	bes4 c'4 a4 bes4 |
	c'8 bes8 a8 g8 f4. e8 |
	d4 a2 d4 |
	g2 r4 f4. g8 a4 g2 |
%130
	a2 bes4. g8 |
	a2 bes2 |
	a\breve*3/2
}

bassus={
	r1*4/4 |
	r1*4/4 |
	r2 d1 f2 |
%5
	e4 c4 d4 e4 |
	f4. g8 a4 f4 |
	g4 a4 g2 |
	f1 |
	r2 c'2 |
%10
	bes4 a8 g8 a4 a4 |
	g2 c2 |
	r1*4/4 |
	r4 f2 bes2 g4 a4 d2 \ss ees4 c2 |
	d1 |
	r1*4/4 |
	r4 bes2 a4 |
	bes4 c'4 a2 |
%20
	r1*4/4 |
	r2 r4 d4 |
	d4 g4 f4 d4 |
	a4. g8 e2 |
	r1*4/4 |
%25
	r4 d2 g4 |
	f4 d4 e4 e4 |
	f8 e8 f8 g8 a8 bes8 c'2 bes8 a8 g2 |
	a2 r2 |
%30
	r2 r4 c4 |
	d4 d4 a,4 a4. g8 f8 e8 d4 g4 |
	f4 d4 e2 |
	d2 r2 |
%35
	r2 r4 g2 f4 g2 |
	d2 r4 g2 \ss fis4 g2 |
	d4. e8 \ss f!4 g4 |
%40
	d1 |
	r2 r4 a4 |
	bes4 c'4 bes4 d'4. c'8 a4 bes2 |
	a2 r2 |
%45
	r1*4/4 |
	r1*4/4 |
	r4 a4 a4 a4 |
	g4 g4 a2 ~ |
	a4  g8[ f8 g8 a8] bes2 a8 g8 a2 |
	r1*4/4 |
	r2 d1 g2. f8[ e8 f8 d8] d'2 c'4 bes2 |
	a2 r2 |
	r4 d4 d4 d4 |
	e4 f2 e4 |
	d4 c8 bes,8 c2 |
%60
	d1 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%65
	d1 ~ |
	d2 g2 |
	f1 |
	g2 c2 |
	d\breve*4/2 |
	r2 a1 c'2 |
%75
	bes4 g4 a4 bes4 |
	c'4 f4 g4 a4 |
	g2 f4. g8 |
	a4 d4 f2 |
	g1 |
%80
	r1*4/4 |
	r4 f4 g4 c4 |
	f4.  g8[ a8 bes8] c'2 \ss b4 c'1 r2 |
%85
	r4 g4 a4 c'4 |
	bes4 g4. a8 bes4 |
	f2 r2 |
	r1*4/4 |
	r1*4/4 |
%90
	r2 a1 g2 |
	a2 d2. d4 f4 f4 |
	e4 f2 e4 |
%95
	d4 c8 bes,8 c2 |
	d1 |
	r1*4/4 |
	r2 d1 g2 |
%100
	g4 g4 f4 d4 |
	e4 f4. e8 c4 |
	d2 e2 |
	d2 f4. f8 |
	g4 d4 bes2 |
%105
	a4 g8 f8 g2 |
	r1*4/4 |
	r1*4/4 |
	r4 d'4. d'8 d'4 |
	c'4 bes2 a8 g8 |
%110
	a4 bes4 c'4 g4 |
	bes2. a4 |
	bes4 g4 f2 |
	r1*4/4 |
	r4 g4 bes4 a4 |
%115
	bes4 g4 a4 d4 |
	g4 a4. g8 a4 |
	bes4 c'4 a4 d'4. \ss cis'8 cis'4 d'1 g2 |
%120
	a2 f4 d4 |
	a2 bes2 |
	a2 r2 |
	r1*4/4 |
	d2 f2. e4 f4 g4 |
	a4 a,4 d2. c4 f4 f4 |
	e4 e4 d2 |
	r2 r4 g2 f4 g2 |
	d2 r4 g4 |
	f4. e8 d4 e4 |
	f1 |
	e\breve*1/2 
}

bassusdos={
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%5
	r1*4/4 |
	d4. d8 d4 d4 |
	c4 a,4 bes,4 c4 |
	f,1 |
	r4 f4 f4 f4 |
%10
	g4 f4 f2 |
	r2 r4 c4 |
	f2 g2 |
	f2 bes,2 |
	\ss ees2 d4. c8 |
%15
	bes,4 c4 a,2 |
	g,8 a,8 bes,8 c8 d8 e8 f8 d8 |
	\ss ees2 d2 |
	g,2 r2 |
	r2 d2 |
%20
	g4. f8 d4 f4 |
	\ss ees2 d2 |
	g,4. a,8 bes,8 c8 d8 e8 |
	f4. e8 c2 |
	r1*4/4 |
%25
	r2 g,2 |
	d2 a,2 |
	d2. c4 |
	f4 g4 e2 |
	d2 r2 |
%30
	r1*4/4 |
	r2 r4 a,4 |
	d2. c4 |
	d4 bes,4 a,2 |
	d4. e8 f4 f,4 |
%35
	a,4 bes,4 c2 |
	d2 r4 g2 f4 g2 |
	d2 r2 |
	r2 r4 g,4 |
%40
	g,4 g,4 d2 |
	\ss ees2 d4. c8 |
	bes,4 a,4 g,4 g2 f4 g2 |
	d2 r2 |
%45
	r1*4/4 |
	r2 d2 ~ |
	d4 d4 d2 |
	g,2 d2 |
	r1*4/4 |
%50
	r2 d2. c4 f4 g4 |
	\ss ees2 d2 |
	g,1 |
	d2. g,4 |
%55
	bes,4 f,4 g,2 |
	r1*4/4 |
	r4 bes,4 bes,4 bes,4 |
	c4 d2 c4 |
	bes,4 a,8 g,8 a,2 |
%60
	g,1 |
	r1*4/4 |
	d2. d4 |
	g,1 |
	r1*4/4 |
%65
	r1*4/4 |
	g,1 |
	d2 d2 |
	c1 |
	g,1 |
%70
	bes,2 f,2 |
	g,1 |
	d\breve*1/2 |
	d1 |
	f2 e4 c4 |
%75
	g4. f8 d4 g4 |
	f4 d4 c4 a,4 |
	bes,4 c4 f,4 f4. e8 d8 c8 d2 |
	c4. bes,8 g,2 |
%80
	d2 r2 |
	r1*4/4 |
	r4 f4 f4 f4 |
	g2 c2 |
	f4. e8 d4 c2 bes,4 a,2 |
	g,2 r2 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%90
	r2 d1 g,2 |
	d1 |
	bes,2 bes,4 bes,4 |
	c4 d2 c4 |
%95
	bes,4 a,8 g,8 a,2 |
	g,1 |
	r1*4/4 |
	r1*4/4 |
	r2 g,2 |
%100
	g,4 g,4 d2 |
	c4 d4. c8 a,4 |
	bes,2 a,2 |
	r1*4/4 |
	r1*4/4 |
%105
	r4 g,4 g,4 g,4 |
	\ss d2 ees2 |
	d4 d4. d8 d4 |
	g,4. a,8 bes,8 c8 d8 e8 |
	f4 g4 e4 f4. e8 d4 c2 |
	bes,2 r2 |
	r2 r4 d4 |
	f4 e4 f4 d4 |
	c2 r2 |
%115
	r1*4/4 |
	r4 a,4 d2 |
	d4 c4 d4 bes,4 |
	a,2 d2 |
	g,1 |
%120
	d2. bes,4 |
	f2 g2 |
	d2 r2 |
	r1*4/4 |
	r4 g,4 d2. c4 d4 bes,4 |
	a,2 r2 |
	r4 a,4 a,4 bes,4 |
	c4 c4 bes,8 c8 d8 e8 |
	f4. e8 c4 g,4 |
%130
	d2 r4 g2 f4 g4 g,4 |
	d2. c4 |
	d1 |
	a,\breve*1/2
}

textocantus=\lyricmode{
Et in ter -- ra pax ho -- mi -- _ _ ni -- _ _ bus
bo -- næ vo -- lun -- ta -- _ tis
\italicas
bo -- næ vo -- lun -- _ ta -- _ tis.
\rectas
Lau -- da -- mus te.
Ad -- o -- _ ra -- _ _ _ _ _ _ mus te.
Glo -- ri -- fi -- ca -- _ _ _ _ _ _ _ _ _ mus te.
Gra -- ti -- as a -- gi -- mus ti -- _ _ _ _ _ _ _ bi
pro -- pter ma -- gnam glo -- ri -- am __ _ _ tu -- am.
Do -- mi -- _ ne __ _ _ _ _ _ _ De -- us,
Rex __ _ _ cæ -- _ le -- _ stis
De -- us Pa -- ter o -- mni -- po -- _ _ tens.
Do -- mi -- ne Fi -- li u -- ni -- ge -- _ _ _ _ ni -- _ te
Ie -- su Chri -- ste. __ _ _ _ _ _ _ _
Do -- mi -- ne De -- us A -- gnus De -- _ _ _ _ i,
\italicas
Do -- mi -- ne De -- us,
A -- gnus De -- i,
\rectas
Fi -- li -- us __ _ Pa -- _ _ _ _ _ _ _ _ _ _ _ _ _ tris.
Qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ di
mi -- se -- re -- _ _ re no -- bis.
Qui tol -- lis pec -- ca -- ta __ _ _ mun -- _ _ di,
\italicas
qui tol -- lis _ pec -- ca -- ta mun -- di
\rectas
su -- _ sci -- _ _ pe
de -- pre -- ca -- ti -- o -- _ _ _ _ _ _ _ nem no -- _ _ _ stram.
mi -- se -- _ re -- _ _ _ _ re no -- _ _ _ _ bis
mi -- se -- re -- re no -- bis.
Tu so -- _ lus Do -- mi -- nus
\italicas
tu so -- lus Do -- mi -- nus.
\rectas
Ie -- su Chri -- _ ste. _
Cum San -- cto Spi -- ri -- tu
in glo -- _ _ _ _ _ _ _ _ ri -- _ a De -- _ _ i Pa -- _ _ tris.
A -- _ _ _ _ men.
}

textocantusdos=\lyricmode{
Et in ter -- ra pax ho -- mi -- ni -- bus
bo -- næ vo -- lun -- ta -- tis.
Lau -- da -- _ _ _ _ mus te.
Be -- ne -- _ di -- _ _ _ ci -- _ _ _ mus te.
Glo -- ri -- fi -- ca -- _ _ _ _ _ _ mus te.
Gra -- ti -- as a -- gi -- mus ti -- _ _ _ _ _ _ _ _ _ bi
pro -- pter ma -- gnam __ _ _ glo -- ri -- am tu -- _ _ _ am.
Do -- mi -- _ ne __ _ _ _ _ De -- us Rex __ _ cæ -- _ le -- _ stis
De -- us Pa -- _ ter o -- mni -- _ po -- tens
\italicas
De -- us Pa -- ter o -- mni -- _ po -- _ _ tens.
\rectas
Do -- mi -- ne Fi -- _ _ _ _ _ li
u -- ni -- ge -- ni -- _ _ _ _ te
Ie -- su Chri -- _ _ _ _ _ _ ste
Do -- mi -- ne De -- _ us
Do -- mi -- ne De -- us,
A -- gnus De -- _ _ _ _ i
Fi -- li -- us Pa -- tris,
\italicas
Fi -- li -- us Pa -- _ _ _ tris.
\rectas
Qui tol -- lis pec -- ca -- _ ta mun -- di
mi -- se -- re -- re no -- bis.
Qui tol -- lis pec -- ca -- ta mun -- _ _ di,
\italicas
pec -- ca -- ta __ _ _ mun -- di
\rectas
su -- sci -- pe
de -- pre -- ca -- ti -- o -- nem no -- _ _ _ stram.
mi -- se -- re -- re __ _ _ _ _ _ _ no -- _ bis.
Quo -- ni -- am tu so -- lus __ _ _ san -- _ ctus.
Tu so -- lus Do -- mi -- _ _ _ _ _ nus.
Ie -- su Chri -- _ _ _ _ _ _ _ ste.
Cum San -- cto Spi -- ri -- tu
in glo -- _ ri -- _ _ _ a __ _ _ _ De -- i Pa -- tris. 
A -- _ men. _ _ 
}

textoaltus=\lyricmode{
Et in ter -- ra pax ho -- mi -- ni -- bus
bo -- næ vo -- lun -- ta -- _ tis.
Lau -- da -- mus __ _ te.
Be -- ne -- _ _ _ di -- _ _ ci -- _ _ _ mus te.
Ad -- o -- ra -- mus te.
Glo -- ri -- fi -- ca -- mus te __ _ _ _ _ _ _
\italicas
glo -- ri -- _ _ _ fi -- _ ca -- _ mus __ _ _ _ _ _ te.
\rectas
Gra -- ti -- as a -- gi -- mus __ _ _ _ _ ti -- _ bi
Do -- mi -- ne De -- _ _ _ us
Rex cæ -- le -- _ _ _ stis
Rex cæ -- le -- _ _ _ stis
De -- us Pa -- ter __ _ _ _
o -- mni -- _ _ _ po -- _ _ _ tens.
De -- us Pa -- ter o -- mni -- po -- tens.
Do -- _ mi -- ne Fi -- li 
u -- ni -- ge -- _ ni -- te,
Ie -- su Chri -- ste.
Do -- mi -- ne De -- us,
A -- _ _ _ _ _ gnus De -- _ _ _ i,
\italicas
Do -- mi -- ne De -- us,
A -- gnus De -- i
\rectas
Do -- mi -- ne De -- us,
A -- gnus __ _ _ De -- i,
Fi -- li -- us Pa -- _ tris
\italicas
Fi -- li -- us __ _ Pa -- _ tris __ _ _
\rectas
Fi -- li -- us Pa -- tris.
Qui tol -- lis pec -- ca -- _ ta mun -- di __ _ _ _ _ 
mi -- se -- re -- re no -- _ _ _ _ _ _ _ _ _ _ bis.
Qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ di,
su -- sci -- pe
de -- pre -- ca -- ti -- _ _ _ o -- nem no -- _ _ _ stram
de -- pre -- ca -- ti -- o -- nem no -- stram. _
Qui se -- des ad dex -- te -- _ ram __ _ Pa -- tris
mi -- se -- re -- re _ _ no -- bis.
Quo -- ni -- am tu so -- lus san -- _ _ _ _ ctus.
Tu so -- lus Do -- mi -- nus. __ _ _ _ _ _ _ 
Tu so -- lus Al -- _ _ _ tis -- si -- mus
Ie -- su __ _ _ _ Chri -- _ _ _ _ ste.
Cum San -- cto Spi -- ri -- tu
in glo -- ri -- a __ _ De -- i Pa -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ tris.
A -- _ _ men, __ _ _ _ _ _ _ 
a -- _ _ _ _ men.
}

textotenor=\lyricmode{
Et in ter -- ra pax ho -- mi -- _ _ _ _ _ _ _ _ _ _ _ _ ni -- bus
bo -- næ vo -- lun -- ta -- _ tis.
Lau -- da -- _ mus te. __ _ _ _ _ _ 
Be -- ne -- di -- ci -- mus __ _ te.
Glo -- ri -- fi -- ca -- mus te.
Gra -- ti -- as a -- gi -- mus ti -- _ _ _ _ bi
pro -- pter ma -- gnam __ _ glo -- ri -- am tu -- _ am.
Do -- mi -- _ ne __ _ _ _ _ De -- us,
Rex cæ -- _ le -- _ _ _ _ stis
Rex cæ -- _ _ _ _ _ le -- _ _ _ stis
De -- us Pa -- ter o -- mni -- _ po -- tens
\italicas
De -- us Pa -- ter o -- mni -- po -- _ tens.
\rectas
Do -- mi -- ne Fi -- _ _ _ _ _ li u -- ni -- _ ge -- ni -- te, __ _ _ _ _ _ _ _ _ 
Ie -- su Chri -- _ ste.
Do -- mi -- ne De -- us
Do -- mi -- ne De -- us,
A -- gnus __ _ _ De -- i
Fi -- li -- us Pa -- _ _ _ tris
Fi -- li -- us Pa -- _ _ _ _ tris.
Qui tol -- lis pec -- ca -- ta mun -- di,
\rectas
qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ _ di
\rectas
mi -- se -- re -- re __ _ _ no -- _ _ _ bis.
Qui tol -- lis pec -- ca -- ta mun -- _ _ _ di
su -- sci -- pe
de -- pre -- ca -- ti -- o -- _ nem no -- _ stram.
Qui se -- des ad dex -- te -- ram __ _ Pa -- _ tris _
mi -- se -- re -- re __ _ _ _ no -- _ bis.
Tu so -- lus Do -- mi -- nus
\italicas
tu so -- lus Do -- mi -- nus.
\rectas
Tu so -- lus Al -- tis -- si -- mus
Ie -- su Chri -- _ ste.
Cum San -- cto Spi -- ri -- tu
in glo -- ri -- a De -- i __ _ _ _ Pa -- _ _ _ _ tris.
A -- _ _ _ _ _ _ _ _ men.
}

textobassus=\lyricmode{
Et in ter -- ra pax ho -- mi -- _ _ _ _ _ ni -- bus
bo -- næ vo -- _ lun -- ta -- _ tis.
Be -- ne -- di -- ci -- mus __ _ _ te.
Ad -- o -- ra -- mus te.
Glo -- ri -- fi -- ca -- mus __ _ _ te.
Gra -- ti -- as a -- gi -- mus ti -- _ _ _ _ _ _ _ _ _ bi
Do -- mi -- ne De -- _ _ _ _ _ _ _ _ _ us
Rex cæ -- le -- stis
De -- us Pa -- ter o -- mni -- po -- tens
De -- us Pa -- ter o -- _ mni -- po -- tens.
Do -- mi -- ne Fi -- li u -- _ ni -- _ _ _ ge -- ni -- _ te
Ie -- su __ _ _ _ _ \mt #1 Chri -- _ _ ste.
Do -- mi -- ne De -- us,
A -- gnus De -- _ _ i
Fi -- _ li -- us Pa -- _ tris.
Qui tol -- lis pec -- ca -- ta mun -- di,
\italicas
qui tol -- lis pec -- _ ca -- ta mun -- di
\rectas
mi -- se -- re -- re __ _ _ _ no -- _ bis.
Qui tol -- lis pec -- ca -- ta mun -- di
su -- sci -- pe de -- pre -- ca -- ti -- o -- nem __ _ no -- _ _ _ stram.
Qui se -- des ad dex -- te -- ram 
\italicas
Pa -- _ _ _ _ tris,
\rectas
mi -- se -- re -- re no -- _ _ _ bis.
Quo -- ni -- \mt #-.5 am tu so -- lus _ san -- _ ctus.
Tu so -- lus Do -- mi -- nus 
tu so -- lus Do -- mi -- nus.
Tu so -- lus Al -- tis -- _ _ _ _ _ si -- mus,
Ie -- su Chri -- _ _ _ ste.
Cum San -- cto Spi -- ri -- tu in glo -- ri -- a De -- i Pa -- tris.
A -- _ _ men
\italicas
a -- _ _ _ _ _ men.
}

textobassusdos=\lyricmode{
Et in ter -- ra pax ho -- mi -- ni -- bus
bo -- næ vo -- lun -- ta -- tis.
Lau -- da -- mus te.
Be -- ne -- di -- _ _ ci -- mus te. __ _ _ _ _ _ _ _ _ _ _ 
Glo -- ri -- _ _ fi -- ca -- mus te. __ _ _ _ _ _ _ _ _ 
Gra -- ti -- as a -- gi -- mus __ _ ti -- bi
Do -- mi -- ne De -- _ us,
Rex __ _ _ cæ -- le -- _ _ stis
Rex cæ -- le -- stis
De -- us Pa -- ter o -- mni -- _ _ po -- tens. __ _ _ _ _ 
Do -- _ mi -- ne Fi -- li 
u -- ni -- ge -- ni -- te, __ _
Ie -- su Chri -- _ _ ste.
Do -- mi -- ne De -- us,
A -- gnus _ _ De -- i
Fi -- li -- us
Fi -- li -- us Pa -- _ _ _ _ tris.
Qui tol -- lis pec -- ca -- _ ta mun -- di, __ _
\italicas
qui tol -- lis pec -- ca -- ta __ _ _ _ _ mun -- _ _ di
\rectas
mi -- se -- re -- re no -- _ _ _ _ _ _ bis.
su -- sci -- pe de -- pre -- ca -- ti -- o -- nem no -- _ _ _ stram.
Qui se -- des ad dex -- te -- _ ram Pa -- tris
mi -- se -- re -- re no --  bis.
Quo -- ni -- am tu __ _ _ _ _ _ _ so -- lus san -- _ _ _ ctus.
Tu so -- lus Do -- mi -- nus.
Tu so -- lus Al -- tis -- si -- mus,
Ie -- su Chri -- _ _ _ ste.
Cum San -- cto Spi -- ri -- tu
in glo -- ri -- a De -- i __ _ _ _ _ _ _ Pa -- tris.
A -- _ _ _ _ _ _ men.
}


\score {  
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

