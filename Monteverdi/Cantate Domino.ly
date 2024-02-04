% Copyright ©2023 Peter Hilton - https://github.com/hilton
% Based on CPDL #12928?

\version "2.24.2"
revision = "2"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 15\mm
	inner-margin = 15\mm
	outer-margin = 10\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"Cantate Domino"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Claudio_Monteverdi" "Claudio Monteverdi" (1567 – 1643) }
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
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override SpanBar #'transparent = ##t
		\override BarLine #'transparent = ##t
%		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context {
		\Staff
	}
	\context { 
		\Voice 
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\consists "Ambitus_engraver"
	}
	\context {
		\Score
		proportionalNotationDuration = #(ly:make-moment 1 8)
      \override SpacingSpanner #'uniform-stretching = ##t
	}
}


global= { 
	\key c \major
	\tempo 2 = 52
	\time 4/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = {
	\once \override Score.BarLine #'transparent = ##f
	\once \override Score.SpanBar #'transparent = ##f 
}
ficta = { \once \set suggestAccidentals = ##t }


sopranoA =  \relative a' {
  \clef "treble" \time 3/4 \key c \major | % 1
  a4 a4 a4 | % 2
  a4. a8 b4 | % 3
  c4. c8 d4 | % 4
  b2. | % 5
  b2 c4 | % 6
  c4 d4 e4 | % 7
  e4 f4 f4 | \break % 8
  f4. e8 d4 | % 9
  e2 e4 | \barNumberCheck #10
  d4. d8 d4 | % 11
  c2 c4 | % 12
  d4 cis2 | % 13
  d2. | % 14
  a4 a4 bes4 | \break % 15
  a4. a8 a4 | % 16
  bes4. bes8 bes4 | % 17
  a2. | % 18
  a2 a4 | % 19
  a4 c4 c4 | \barNumberCheck #20
  c4 e4 e4 | % 21
  e4. e8 f4 | \break % 22
  d2 e4 | % 23
  c4. c8 d4 | % 24
  b2 b4 | % 25
  d4 b2 \showBarLine | % 26
  \time 2/2  a1. d1 b2 | % 29
  c1 | \barNumberCheck #30
  a2 c1 bes2 | % 32
  a1 | % 33
  a2 g2 | % 34
  a1 | % 35
  a1 | \break % 36
  R1*2 | % 38
  R1 | % 39
  r2 r4 e'4 | \barNumberCheck #40
  e4. d8 c8 d8 e8
  c8 | % 41
  d4 d8 c8 d4 b4 | % 42
  c1 | % 43
  c1 | % 44
  R1*4 | % 48
  r2 r4 d4 | % 49
  d4. c8 bes8 c8 d8
  bes8 | \break \barNumberCheck #50
  c4 c8 bes8 c4 a4 | % 51
  bes4. a8 g8 a8 bes8 \stemUp
  g8 | % 52
  a4 c2 f,4 | % 53
  g2. g4 | % 54
  f1. c'4. c8 | % 56
  c4 b4 a4. a8 | % 57
  a2 c4. c8 | % 58
  c4 b4 a4. a8 | % 59
  a2. a4 | \barNumberCheck #60
  a4. g8 f4 f4 | % 61
  e2 d4 a'4 | % 62
  a4. a8 a2. e'4 e4. d8 | % 64
  c4 c4 b2 | % 65
  a4 e'4 e4. d8 | % 66
  c4 c4 b2 | % 67
  a2 e'2. d8 c8 b2 | % 69
  a1. d2 ~ | % 71
  d2 b2 | % 72
  c1 | % 73
  a2 c1 bes2 | % 75
  a1 | % 76
  a2 g2 | % 77
  a1 | % 78
  a1 \showBarLine \bar "|."
}

sopranoALyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Can -- ta -- te Do -- mi -- no can -- ti --
  cum no -- "vum:" can -- ta -- "te," can -- ta -- "te," can -- ta --
  te et be -- ne -- di -- ci -- te no -- mi -- ni e -- "ius." Can --
  ta -- te Do -- mi -- no can -- ti -- cum no -- "vum:" can -- ta --
  "te," can -- ta -- "te," can -- ta -- te et be -- ne -- di -- ci --
  te no -- mi -- ni e -- "ius. " __ Qui -- "a," qui -- a
  mi -- ra -- "- bi" -- li -- a fe -- "cit." Can -- ta --
  _ _ _ _ _ _ te et ex -- sul -- ta --
  "te," can -- ta -- _ _ _ _ _ _ te et
  ex -- sul -- ta -- _ _ _ _ _ _ te et
  psal -- li -- "te. " __ Psal -- li -- te in ci -- tha -- "ra,"
  psal -- li -- te in ci -- tha -- "ra," in ci -- tha -- ra et vo --
  "ce," in ci -- tha -- "ra, " __ in ci -- tha -- ra et vo --
  "ce," in ci -- tha -- ra et vo -- ce psal -- _ _
  _ "mi: " __ qui -- _ "a," qui -- a mi -- ra
  -- bi -- li -- a fe -- "cit."
}

sopranoB =  \relative e' {
  \clef "treble" \time 3/4 \key c \major | % 1
  e4 e4 f4 | % 2
  e4. fis8 g4 | % 3
  a4. a8 a4 | % 4
  gis2. | % 5
  gis2 a4 | % 6
  a4 b4 c4 | % 7
  c4 c4 d4 | % 8
  d4. d8 d4 | % 9
  c2 c4 | \barNumberCheck #10
  bes4. bes8 bes4 | % 11
  a2 a4 | % 12
  bes4 a2 | % 13
  a2. | % 14
  fis4 fis4 g4 | % 15
  d4. f8 e4 | % 16
  f4. f8 g4 | % 17
  e2. | % 18
  e2 f4 | % 19
  f4 g4 a4 | \barNumberCheck #20
  a4 b4 c4 | % 21
  c4. c8 c4 | % 22
  b2 b4 | % 23
  a4. a8 a4 | % 24
  gis2 gis4 | % 25
  a4 gis2 | % 26
  \tempo \markup {
    \rhythm { 2[s] } = \rhythm { 2[s] }
  }
  \time 2/2  a1 | % 27
  fis1 | % 28
  g1 | % 29
  g1 | \barNumberCheck #30
  f2 a1 g1 f2. e4 d2 | % 34
  e1 | % 35
  fis2 r2 | % 36
  R1*2 | % 38
  R1 | % 39
  r2 r4 c'4 | \barNumberCheck #40
  c4. b8 a8 b8 c8 a8
  | % 41
  b4 b8 a8 b4 g4 | % 42
  a1 | % 43
  a1 | % 44
  R1 | % 45
  r2 r4 a4 | % 46
  a4. g8 f8 g8 a8 f8 | % 47
  g4 g8 f8 g4 e4 | % 48
  f2 f2 | % 49
  R1 | \barNumberCheck #50
  a2 e4 e4 | % 51
  g2 d2 | % 52
  f2 f1 e2 | % 54
  f2 c'4. c8 | % 55
  c4 b4 a4. a8 | % 56
  a2 c4. c8 | % 57
  c4 b4 a4. a8 | % 58
  a2. a4 | % 59
  a4. g8 f4 f4 | \barNumberCheck #60
  e2 d4 a'4 | % 61
  a4. g8 f4 f4 | % 62
  e4 e4 f2 | % 63
  e2 r2 | % 64
  r4 e'4 e4. d8 | % 65
  c4 c4 b2 | % 66
  a4 e'4 e4. d8 | % 67
  c4 c4 b2 | % 68
  a4 a2 gis4 | % 69
  a1 | \barNumberCheck #70
  fis1 | % 71
  g1 | % 72
  g1 | % 73
  f2 a1 g1 f2. e4 d2 | % 77
  e1 | % 78
  fis1 \bar "|."
}

sopranoBLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Can -- ta -- te Do -- mi -- no can -- ti --
  cum no -- "vum:" can -- ta -- "te," can -- ta -- "te," can -- ta --
  te et be -- ne -- di -- ci -- te no -- mi -- ni e -- "ius." Can --
  ta -- te Do -- mi -- no can -- ti -- cum no -- "vum:" can -- ta --
  "te," can -- ta -- "te," can -- ta -- te et be -- ne -- di -- ci --
  te no -- mi -- ni e -- "ius." Qui -- "a," qui -- a mi -- ra
  -- bi -- li -- a fe -- "cit." Can -- ta -- _
  _ _ _ _ _ te et ex -- sul -- ta -- "te,"
  can -- ta -- _ _ _ _ _ _ te et ex --
  sul -- ta -- "te," et ex -- sul -- ta -- te et psal -- li --
  "te." Psal -- li -- te in ci -- tha -- ra psal -- li -- te in ci --
  tha -- "ra," in ci -- tha -- ra et vo -- "ce," in ci -- tha -- ra et
  vo -- ce psal -- "mi," in ci -- tha -- ra et vo -- "ce," in ci --
  tha -- ra et vo -- ce psal -- _ "mi:" qui -- "a," qui -- a mi
  -- ra -- bi -- li -- a fe -- "cit."
}

alto =  \relative cis' {
  \clef "treble" \time 3/4 \key c \major | % 1
  cis4 cis4 d4 | % 2
  cis4. cis8 d4 | % 3
  f4. f8 f4 | % 4
  e2. | % 5
  e2 e4 | % 6
  e4 g4 g4 | % 7
  g4 a4 a4 | % 8
  a4 f4 g4 | % 9
  g2 a4 | \barNumberCheck #10
  f4. f8 g4 | % 11
  e2 e4 | % 12
  g4 e2 | % 13
  f2. | % 14
  d4 d4 d4 | % 15
  d4. d8 e4 | % 16
  d4. d8 d4 | % 17
  cis2. | % 18
  cis2 d4 | % 19
  d4 e4 f4 | \barNumberCheck #20
  f4 g4 a4 | % 21
  a4. a8 a4 | % 22
  g2 g4 | % 23
  f4. f8 f4 | % 24
  e2 e4 | % 25
  f4 e2 | % 26
  \time 2/2  e1 | % 27
  d1 | % 28
  d1 | % 29
  e1 | \barNumberCheck #30
  f1 | % 31
  d2 d2 | % 32
  c2. c4 | % 33
  d2 d1 cis2 | % 35
  d2 r4 a'4 | % 36
  a4. g8 f8 g8 a8 f8 | % 37
  g4 g8 f8 g4 e4 | % 38
  f4. e8 d8 e8 f8 d8 | % 39
  e1 | \barNumberCheck #40
  e1 | % 41
  R1*3 | % 44
  R1 | % 45
  r2 r4 f4 | % 46
  f4. e8 d8 e8 f8 d8 | % 47
  e4 e8 d8 e4 c4 | % 48
  d2 d4 f4 | % 49
  f4. e8 d8 e8 f8 d8 |
  \barNumberCheck #50
  e4 e8 d8 e4 c4 | % 51
  d4. c8 bes8 c8 d8 \stemUp
  bes8 | % 52
  c2 c4 c4 | % 53
  c2. c4 | % 54
  c1. f4. f8 | % 56
  f4 f4 f4. f8 | % 57
  f2 f4. f8 | % 58
  f4 f4 e2. e4 d2 | \barNumberCheck #60
  R1 | % 61
  r4 a4 d4. d8 | % 62
  cis4 cis4 d4 d4 | % 63
  a2 b4 e4 | % 64
  e4. e8 e2. e4 e4. e8 | % 66
  e2. e4 | % 67
  e2. e4 | % 68
  e1 | % 69
  e1 | \barNumberCheck #70
  d1 | % 71
  d1 | % 72
  e1 | % 73
  f1 | % 74
  d2 d2 | % 75
  c2. c4 | % 76
  d2 d1 cis2 | % 78
  d1 \bar "|."
}

altoLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Can -- ta -- te Do -- mi -- no can -- ti --
  cum no -- "vum:" can -- ta -- "te," can -- ta -- "te," can -- ta --
  te et be -- ne -- di -- ci -- te no -- mi -- ni e -- "ius." Can --
  ta -- te Do -- mi -- no can -- ti -- cum no -- "vum:" can -- ta --
  "te," can -- ta -- "te," can -- ta -- te et be -- ne -- di -- ci --
  te no -- mi -- ni e -- "ius." Qui -- "a," qui -- a mi -- ra --
  "- bi" -- li -- a fe -- _ "cit." Can -- ta -- _
  _ _ _ _ _ te et ex -- sul -- "- ta" --
  _ _ _ _ _ _ "te," can -- ta -- _
  _ _ _ _ _ te et ex -- sul -- ta -- "te,"
  can -- ta -- _ _ _ _ _ _ te et ex --
  sul -- ta -- _ _ _ _ _ _ te et psal --
  li -- "te. " __ Psal -- li -- te in ci -- tha -- "ra," psa --
  lli -- te in ci -- tha -- "ra," in ci -- tha -- ra et vo --
  ce psal -- "mi," in ci -- tha -- "ra, " __ in ci -- tha -- ra
  et vo -- ce psal -- "mi:" qui -- "a," qui -- a mi -- ra -- bi -- li
  -- a fe -- _ "cit."
}

tenorA =  \relative a {
  \clef "treble_8" \time 3/4 \key c \major \transposition c | % 1
  a4 a4 d,4 | % 2
  a'4. a8 g4 | % 3
  f4. f8 d4 | % 4
  e2. | % 5
  e2 a4 | % 6
  a4 g4 c4 | % 7
  c4 a4 d4 | % 8
  d4. c8 b4 | % 9
  c2 a4 | \barNumberCheck #10
  bes4. a8 g4 | % 11
  a2 a4 | % 12
  g4 a2 | % 13
  d,2. | % 14
  d4 d4 d4 | % 15
  f4. f8 a4 | % 16
  d,4. d8 d4 | % 17
  a'2. | % 18
  a2 a4 | % 19
  f4 e4 a4 | \barNumberCheck #20
  a4 g4 c4 | % 21
  c4. b8 a4 | % 22
  b2 g4 | % 23
  a4. a8 a4 | % 24
  e2 e4 | % 25
  a4 e2 | % 26
  \time 2/2  e2 a1 d,1 g1 c,2 | \barNumberCheck #30
  c2 c2 | % 31
  g'1 | % 32
  e2 f2 | % 33
  d1 | % 34
  a'1. r4 f'4 | % 36
  f4. e8 d8 e8 f8
  d8 | % 37
  e4 e8 d8 e4 c4 | % 38
  d4. c8 bes8 c8 d8
  bes8 | % 39
  c1 | \barNumberCheck #40
  c1 | % 41
  R1 | % 42
  r2 r4 c4 | % 43
  c4. b8 a8 b8 c8 a8
  | % 44
  b4 b8 a8 b4 g4 | % 45
  a1 | % 46
  a1 | % 47
  c1 | % 48
  f,2. f4 | % 49
  f1 | \barNumberCheck #50
  a1 | % 51
  d,2 g2 | % 52
  c,2 c4 c4 | % 53
  c2. c4 | % 54
  c2 r2 | % 55
  r2 c'4. c8 | % 56
  c4 c4 c4. c8 | % 57
  c2 c4. c8 | % 58
  d4 d4 cis2. cis4 d2 | \barNumberCheck #60
  r4 a4 d4. d8 | % 61
  cis4 cis4 d2 | % 62
  e2 d2 | % 63
  e2 r2 | % 64
  r2 r4 e,4 | % 65
  a4. a8 gis4 gis4 | % 66
  a2 b2 | % 67
  c2 b4 e,4 | % 68
  a4 a4 e2 | % 69
  e2 a1 d,2 ~ | % 71
  d2 g1 c,2 | % 73
  c2 c2 | % 74
  g'1 | % 75
  e2 f2 | % 76
  d1 | % 77
  a'1 | % 78
  a1 \bar "|."
}

tenorALyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Can -- ta -- te Do -- mi -- no can -- ti --
  cum no -- "vum:" can -- ta -- "te," can -- ta -- "te," can -- ta --
  te et be -- ne -- di -- ci -- te no -- mi -- ni e -- "ius." Can --
  ta -- te Do -- mi -- no can -- ti -- cum no -- "vum:" can -- ta --
  "te," can -- ta -- "te," can -- ta -- te et be -- ne -- di -- ci --
  te no -- mi -- ni e -- "ius." Qui -- "a, " __ qui --
   a mi -- ra -- bi -- "- li" -- a fe -- "cit. " __ Can --
  ta -- _ _ _ _ _ _ te et ex -- sul --
  "- ta" -- _ _ _ _ _ _ "te," can -- ta
  -- _ _ _ _ _ _ te et ex -- sul -- ta
  -- te et psal -- li -- "te," et ex -- sul -- ta -- te et psal -- li
  -- "te." Psal -- li -- te in ci -- tha -- "ra," psal -- li -- te in
  ci -- tha -- "ra," in ci -- tha -- ra et vo -- ce psal --
  "mi," in ci -- tha -- ra et vo -- ve psal -- "mi," et vo -- ce psal
  -- "mi:" qui -- "a, " ___ qui -- a mi -- ra -- bi
  -- li -- a fe -- _ "cit."
}

tenorB =  \relative a {
  \clef "treble_8" \time 3/4 \key c \major | % 1
  R2.*6 | % 7
  R2.*7 | % 14
  a4 a4 g4 | % 15
  a4. a8 c4 | % 16
  f,4. d8 g4 | % 17
  cis,8 d8 e8 f8 e4 | % 18
  e2 d4 | % 19
  d4 g4 r4 | \barNumberCheck #20
  r4 r4 a4 | % 21
  c4 a4 a4 | % 22
  d4 g,4 g4 | % 23
  c4 a4 d4 | % 24
  gis,8. a16 b4 e4 | % 25
  a,4 e'4 b4 | % 26
  \time 2/2  cis1 | % 27
  a1 | % 28
  g1 | % 29
  g1 | \barNumberCheck #30
  f1 | % 31
  bes2 bes2 | % 32
  c4 bes4 a4 g4 | % 33
  f2 g4 g4 | % 34
  e1 | % 35
  d2 r4 d'4 | % 36
  d2 d4 d4 | % 37
  c2 c2 | % 38
  bes1 | % 39
  a1 ~ | \barNumberCheck #40
  a1 | % 41
  R1 | % 42
  r2 r4 a4 | % 43
  a4. g8 f8 g8 a8 f8 | % 44
  g4 g8 f8 g4 e4 | % 45
  f1 | % 46
  f2 d2 | % 47
  g2. g4 | % 48
  bes2. d4 | % 49
  d2 d4 d4 | \barNumberCheck #50
  c2 c2 | % 51
  bes1 | % 52
  a2 a2 | % 53
  g2. g4 | % 54
  a2 f4. f8 | % 55
  f4 g4 a4. a8 | % 56
  a2 f4. f8 | % 57
  f4 g4 a4. a8 | % 58
  a2 r2 | % 59
  r4 a4 d4. d8 | \barNumberCheck #60
  cis4 cis4 d4 d,4 | % 61
  a'2 d,4 d4 | % 62
  a'4. a8 d,2 | % 63
  r2 r4 e4 | % 64
  a4. a8 gis4 gis4 | % 65
  a2 b4 e,4 | % 66
  a4. a8 gis4 gis4 | % 67
  a2 b2 | % 68
  c4 b8 a8 b2 | % 69
  cis1 | \barNumberCheck #70
  a1 | % 71
  g1 | % 72
  g1 | % 73
  f1 | % 74
  bes2 bes2 | % 75
  c4 bes4 a4 g4 | % 76
  f2 g4 g4 | % 77
  e1 | % 78
  d1 \bar "|."
}

tenorBLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Can -- ta -- te Do -- mi -- no can -- ti --
  cum no -- _ _ _ _ "vum:" can -- ta -- "te," can
  -- ta -- te et be -- _ ne -- di -- ci -- te no -- _ _
  mi -- ni e -- _ "ius." Qui -- "a," qui -- a mi -- ra -- "- bi"
  -- _ _ _ _ li -- a fe -- "cit." Can -- ta -- te
  et ex -- sul -- "- ta" -- "te, " __ _ can -- ta -- _ _
  _ _ _ _ te et ex -- sul -- ta -- te et psal --
  li -- "te," can -- ta -- te et ex -- sul -- ta -- te et psal -- li
  -- "te." Psal -- li -- te in ci -- tha -- ra psal -- li -- te in ci
  -- tha -- "ra," in ci -- tha -- ra et vo -- ce psal -- "mi," in ci
  -- tha -- "ra," in ci -- tha -- ra et vo -- "ce," in ci -- tha -- ra
  et vo -- ce psal -- _ _ _ "mi:" qui -- "a," qui -- a
  mi -- ra -- bi -- _ _ _ _ li -- a fe -- "cit."
}

bass =  \relative d {
  \clef "bass" \time 3/4 \key c \major | % 1
  R2.*6 | % 7
  R2.*7 | % 14
  d4 d4 g,4 | % 15
  d'4. d8 c4 | % 16
  bes4. bes8 g4 | % 17
  a2. | % 18
  a2 d4 | % 19
  d4 c4 f4 | \barNumberCheck #20
  f4 e4 a4 | % 21
  a4. g8 f4 | % 22
  g2 e4 | % 23
  f4. e8 d4 | % 24
  e2 e4 | % 25
  d4 e2 | % 26
  \time 2/2  a,1 | % 27
  d1 | % 28
  g,1 | % 29
  c1 | \barNumberCheck #30
  f,1 | % 31
  g2 g2 | % 32
  a2. a4 | % 33
  bes1 | % 34
  a1 | % 35
  d1 | % 36
  R1*2 | % 38
  R1 | % 39
  r2 r4 a'4 | \barNumberCheck #40
  a2 a4 a4 | % 41
  g2 g2 | % 42
  f2 f4 f4 | % 43
  f2 f4 f4 | % 44
  e2 e2 | % 45
  d2 d4 d4 | % 46
  d1 | % 47
  c2. c4 | % 48
  bes1 | % 49
  bes2 bes2 | \barNumberCheck #50
  a2 a2 | % 51
  g1 | % 52
  f2 f2 | % 53
  c'2. c4 | % 54
  f,1 | % 55
  r2 f'4. f8 | % 56
  f4 g4 a4. a8 | % 57
  a2 f4. f8 | % 58
  f4 g4 a2. a4 d,2 | \barNumberCheck #60
  R1*2 | % 62
  r2 r4 d4 | % 63
  a'4. a8 gis4 gis4 | % 64
  a4 a,4 e'2 | % 65
  a,4 a4 e'4. e8 | % 66
  a,2 r4 e'4 | % 67
  a4. a8 gis4 gis4 | % 68
  a4 a,4 e'2 | % 69
  a,1 | \barNumberCheck #70
  d1 | % 71
  g,1 | % 72
  c1 | % 73
  f,1 | % 74
  g2 g2 | % 75
  a2. a4 | % 76
  bes1 | % 77
  a1 | % 78
  d1 \bar "|."
}

bassLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Can -- ta -- te Do -- mi -- no can -- ti --
  cum no -- "vum:" can -- ta -- "te," can -- ta -- "te," can -- ta --
  te et be -- ne -- di -- ci -- te no -- mi -- ni e -- "ius." Qui --
  "a," qui -- a mi -- ra -- "- bi" -- li -- a fe -- "cit." Can -- ta
  -- te et ex -- sul -- ta -- "te," can -- ta -- te et ex -- sul -- ta
  -- "te," can -- ta -- "te," can -- ta -- te et ex -- sul -- ta -- te
  et psal -- li -- "te." Psal -- li -- te in ci -- tha -- "ra," psal
  -- li -- te in ci -- tha -- "ra," in ci -- tha -- ra et vo --
  ce psal -- "mi," in ci -- tha -- "ra," in ci -- tha -- ra et vo --
  ce psal -- "mi:" qui -- "a," qui -- a mi -- ra -- bi -- li -- a fe
  -- "cit."
}


\score {

    \new StaffGroup
    <<
      \new Staff
      <<
        \set Staff.instrumentName = "S"
        \context Staff <<
          \context Voice = "sopranoA" {  \sopranoA }
          \new Lyrics \lyricsto "sopranoA" { \sopranoALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "S"
        \context Staff <<
          \context Voice = "sopranoB" {  \sopranoB }
          \new Lyrics \lyricsto "sopranoB" { \sopranoBLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "A"
        \context Staff <<
          \context Voice = "alto" {  \alto }
          \new Lyrics \lyricsto "alto" { \altoLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T"
        \context Staff <<
          \context Voice = "tenorA" {  \tenorA }
          \new Lyrics \lyricsto "tenorA" { \tenorALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T"
        \context Staff <<
          \context Voice = "tenorB" {  \tenorB }
          \new Lyrics \lyricsto "tenorB" { \tenorBLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "B"
        \context Staff <<
          \context Voice = "bass" {  \bass }
          \new Lyrics \lyricsto "bass" { \bassLyrics }
        >>
      >>

    >>

%  \midi {\tempo 4 = 100 }
}

