% Copyright ©2023 Peter Hilton - https://github.com/hilton
% Based on CPDL #55912 by Oscar Smith

\version "2.24.2"
revision = "3"
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
		"Missa In illo tempore"
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
				This edition copyright \year Peter Hilton - 
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
		\override BarNumber.self-alignment-X = #CENTER
		\override BarNumber.break-visibility = #'#(#f #t #t)
		\override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
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
		proportionalNotationDuration = #(ly:make-moment 1 7)
		\override SpacingSpanner.uniform-stretching = ##t
	}
}


global = {
	\key bes \major
	\omit Staff.TimeSignature
	\time 4/2
	\set Staff.midiInstrument = "drawbar organ"
	\accidentalStyle "forget"
}

showBarLine = {
	\once \override Score.BarLine.transparent = ##f
	\once \override Score.SpanBar.transparent = ##f 
}


sopranoA =  \relative bes' {
  \clef "treble" | % 1
  bes1 a | % 2
  g1  f2 bes | % 3
  c2 a bes g | % 4
  a2 f bes1 | % 5
  a1 g  | % 6
  f2 f' es1 | % 7 
  \break d1 c  | % 8
  bes1 r2 f'2. es4 es2. d4
  d2. c4 c2. bes4
  bes1 a2  bes f' | % 12
  g2 es f d | % 13
  es2 c d2. f4 | % 14
  es1  d2 bes2. a4 a2 bes d | % 16
  c2. c4 bes1 | % 17
  r2 c d bes | % 18
  c2  a r bes ~ \break | % 19
  bes4 a a2 bes1. d2 c2. c4 | % 21
  c2 f2. es4 d2. c4 bes1 a4 g | % 23
  a4 bes c a d2.
  es4 \break | % 24
  f1  f | % 25
  f2 f2. es4 d2. c4 bes1 a4 g | % 27
  a4 bes c a d1  | % 28
  d2 d c1 | % 29
  c2 f2.
  es4 d2. c4 bes2  f' c
  | % 31
  f2. es4 d c
  bes2. a4 g2  c c | % 33
  d2. c4 bes c d
  bes4 | % 34
  c1  a2 a | % 35
  bes2. a4 g a bes
  g4  | % 36
  a1 f2 f' | % 37
  g1  es2 es | % 38
  f1 d | % 39
  r1 r2 f | \barNumberCheck #40
  g4 f es d es2
   es2 | % 41
  f4 es d c d2
   d2 | % 42
  es4 d c bes c1  | % 43
  d4 c bes a bes2
   d2 | % 44
  c2 d1  c2 | % 45
  bes2 c1  bes2 | % 46
  a2 bes1 a2 | % 47
  g2 a2. bes4 c
  a4 | % 48
  d\breve | % 49
  c2 bes c1 | \barNumberCheck #50
  bes1. a4 g | % 51
  c2  f, f'1 | % 52
  es\breve | % 53
  d\breve | % 54
  c\breve | % 55
  bes\breve | % 56
  a2. g4 f2 f'2. es4 d2. c4
  bes2 | % 58
  c\breve  | % 59
  d\breve \showBarLine \bar "|."
}

sopranoALyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ tus Sanc -- _
  _ _ _ _ _ _ _ _ tus Sanc --
  _ _ _ tus Sanc -- _ _ _ _ _ _ _ _ _ tus
  Sanc -- _ _ _ _ _ _ _ _
  _ tus "Do" -- mi -- nus De -- us Sa -- ba -- oth Sanc --
  _ _ _ tus Do -- _ mi -- nus De -- us Sa
  -- ba -- oth Ple -- _ _ _ _ _ _ _
  _ _ _ _ _ _ ni sunt coe  -- _ _ _ _ _ _ _ 
  _ _ _ _ li et ter -- ra glo --
  _ _ _ _ ri -- a tu -- _ _ _
  _ _ _ a glo -- _ _ _ _
  _ _ _ ri -- a tu -- _ _ _ _
  _ _ a glo -- _ ri -- a tu -- a O -- san -- _
  _ _ _ na "in " __ _ _ _ _ ex --
  cel -- _ _ _ _ "sis " __ _ _ _
  _ O -- san -- _ na "in " __ _ ex -- cel --
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ sis O -- san -- na in ex
  -- cel -- _ _ _ _ _ _ _ _ "sis."
}


sopranoB =  \relative bes' {
  \clef "treble" | % 1
  r2 bes c a | % 2
  bes2 g a f | % 3
  g2 f4 es f es d
  es4 | % 4
  f1  d2 bes' | % 5
  c2 a bes g | % 6
  a2 f g es  | % 7
  f1. c'2 | % 8
  d2 bes c a | % 9
  bes2 g a4 f f'2 |
  \barNumberCheck #10
  g2 es f d | % 11
  es2 c d2. f4 | % 12
  es1 d4 c d bes | % 13
  c1  f,2 f' | % 14
  g2 es f d | % 15
  es2 c d2. es4 | % 16
  f1  d2 bes2. a4 a2 bes d | % 18
  c2. c4 d1 | % 19
  r2 f2. es4 d2. c4 bes1 a4 g | % 21
  a4 bes c a d2.
  es4 | % 22
  f1  f | % 23
  f2 f2. es4 d2
  ~ | % 24
  d4 c bes1 a4 g | % 25
  a4 bes c a d1  | % 26
  d2 d c1 | % 27
  c2 f2. es4 d2. c4 bes2  f' c
  | % 29
  f2. es4 d c
  bes2. a4 g2  c1 | % 31
  r2 f2. es4 d2. c4 bes2  f' c
  | % 33
  f2. es4 d c
  bes2  | % 34
  f'1 f | % 35
  g2. f4 es f g
  es4 | % 36
  f1  d2 d | % 37
  es2. d4 c d es
  c4 | % 38
  d2. c4 bes1  | % 39
  c2 d c d1 c2 bes c1 bes2 a bes1 a2 g\breve  f1 ~ | % 44
  f1 f' | % 45
  es\breve | % 46
  d\breve | % 47
  c\breve | % 48
  bes\breve | % 49
  f'1 f1. es2 d es1 d2 c d1 c2 bes c1 bes2 a bes ~ | % 54
  bes2 a g a1 g2 f g1 f2 f'2. es4 | % 57
  d2. c4 bes1. a4 g a1  | % 59
  bes\breve \bar "|."
}

sopranoBLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ _ _
  _ _ _ _ _ _ _ _ _ ctus
  Sanc -- _ _ _ _ _ _ _ _ tus
  Sanc -- _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ tus Sanc -- _ _
  _ _ _ _ _ _ _ tus Do -- mi -- nus De -- us Sa -- ba -- oth Ple -- _ _ _ _
  _ _ _ _ _ _ _ _ _ ni sunt coe -- _ _ _ _ _
  _ _ _ _ _ _ _ li et ter --
  ra glo -- _ _ _ _ ri -- a tu -- _ _ _ _ _ _ a glo _ _ _ _ ri -- a tu -- _ _ _
  _ a glo -- _ _ _ _ _ _ _ ri
  -- a tu -- _ _ _ _ _ _ _ _ a
  O -- san -- _ na "in " __ _ ex -- cel -- _ _ _ "sis " __ _ O -- san -- na in
  ex -- cel -- sis O -- san -- _ na in ex -- cel -- _ _ _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _
  "sis."
}


alto =  \relative f' {
  \clef "treble" \key bes \major | % 1
  r1 r2 f | % 2
  g2 es f d | % 3
  es2 c d g2. f4 f1 e2  | % 5
  f2 f g es ? | % 6
  f2 d es c | % 7
  d2. es4 f1 | % 8
  d2 es c d | % 9
  bes1 a | \barNumberCheck #10
  g1  f2 f' | % 11
  g2 es f d | % 12
  es2 c d2. f4 | % 13
  es1  d2 bes2. a4 a2 bes d | % 15
  c2. c4 bes1 | % 16
  f'\breve | % 17
  f1. f2 | % 18
  f\breve | % 19
  f\breve | \barNumberCheck #20
  f2. g4 a2. bes4 | % 21
  c1  bes2 bes, | % 22
  f'2. g4 a2. bes4 | % 23
  c1  bes2 bes, | % 24
  f'2. g4 a2. bes4 | % 25
  c1  bes2 f | % 26
  bes1 f\breve r1 | % 28
  d2. es4 f2. g4 | % 29
  a1  f2 f | \barNumberCheck #30
  g1 f  | % 31
  f1 r | % 32
  d2. es4 f2. g4 | % 33
  a1  d,2 d | % 34
  f\breve | % 35
  bes,\breve | % 36
  f'\breve | % 37
  es\breve | % 38
  d1 r2 bes' | % 39
  a2 bes1  a2 | \barNumberCheck #40
  g2 as1  g2 | % 41
  f2 g1 f2 | % 42
  es2 f1 es2 | % 43
  d2 es2. d4 d c8
  bes8 | % 44
  c4 f, bes c d es
  f2  | % 45
  bes2 as2. es4 g2 
  | % 46
  d2 g2. d4 f2  | % 47
  c2 f1 f2 | % 48
  f\breve | % 49
  f\breve | \barNumberCheck #50
  R1*2 | % 51
  r2 bes a bes1 as2 g as1 g2 f g ~ | % 54
  g2 f es f1 es2 d es1 d2 c1 | % 57
  f\longa  | % 59
  f\breve \bar "|."
}

altoLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ _ _
  _ _ _ _ _ _ tus Sanc -- _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ tus Sanc -- _ _
  _ _ _ _ _ _ _ tus Do -- mi
  -- nus De -- us Sa -- ba -- oth Ple -- ni sunt coe -- li Ple --
  _ _ _ _ ni sunt coe -- _ _ _
  _ li et ter -- _ _ _ _ ra et ter --
  ra glo -- _ _ _ _ ri -- a tu -- _ a
  glo -- _ _ _ _ ri -- a tu -- a O -- san -- na O
  -- san -- _ na "in " __ _ ex -- cel -- _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ sis "in " __
  _ _ ex -- cel -- _ _ sis in ex -- cel --
  sis O -- san -- _ na "in " __ _ ex -- cel --
  _ _ _ _ _ _ _
  _ _ _ _ "sis."
}

tenorA =  \relative f' {
  \clef "treble_8" \key bes \major
  \transposition c | % 1
  r1 f | % 2
  es1 d | % 3
  c1 bes2  bes | % 4
  c2 a bes g | % 5
  a2 f bes4 g c2  | % 6
  f,1 r | % 7
  bes1 a | % 8
  g1 f | % 9
  bes2  c1 a2 | \barNumberCheck #10
  bes2 g a f | % 11
  c'1  f,2 bes2. a4 a2 bes d | % 13
  c2. c4 bes1 | % 14
  r1 r2 f' | % 15
  g2 es f  d | % 16
  r2 c d2. bes4 | % 17
  c2  a r bes2. a4 a2 bes d | % 19
  c2. c4 bes2. c4 |
  \barNumberCheck #20
  d2. es4 f1  | % 21
  c1 d | % 22
  bes1 c1  | % 23
  a2 a bes2. c4 | % 24
  d1  f  | % 25
  c1 d2. c4 | % 26
  bes4 c d bes c1 | % 27
  a2  a bes2. a4 | % 28
  g4 a bes g a1  | % 29
  f2 c' bes\breve a g f2 f'2. f4 f2 bes,1 | % 34
  a\breve | % 35
  g\breve | % 36
  f\breve | % 37
  c'\breve | % 38
  f,\breve | % 39
  R1*10 | % 44
  r1 r2 f' | % 45
  g4 f es d es2
   es2 | % 46
  f4 es d c d2
   d2 | % 47
  es4 d c bes c1 | % 48
  d4 c bes a bes1 | % 49
  f\breve  | \barNumberCheck #50
  bes1 r | % 51
  r1 r2 f' | % 52
  g4 f es d es2
   es2 | % 53
  f4 es d c d2
   d2 | % 54
  es4 d c bes c1 | % 55
  d4 c bes a bes1  | % 56
  c2 f,2. g4 a2  | % 57
  f1 bes | % 58
  f4 g a bes c2
  f,2  | % 59
  f\breve \bar "|."
}

tenorALyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ _ tus Sanc
  -- _ _ _ _ _ _ _ _ tus Sanc
  -- _ _ _ _ tus Sanc -- _ _ _
  _ _ tus Do -- mi -- nus De -- us Sa -- ba -- oth
  San -- _ _ _ tus Sanc -- _ _ _ tus Do
  -- mi -- nus De -- us Sa -- ba -- "oth " __ _ _
  _ _ Ple -- ni sunt coe -- li et ter -- _
  _ "ra " glo -- _ _ _ _
  _ _ _ ri -- a tu -- _ _ _ _ _
  _ a O -- san -- "na " "in " ex -- cel -- sis O -- san -- na in ex -- cel -- sis O -- san -- _
  _ _ _ na "in " __ _ _ _ _ ex --
  cel -- _ _ _ _ _ _ _ _
  _ _ sis O -- san -- _ _ _ _ na "in "
  __ _ _ _ _ ex -- cel -- _ _ _
  _ _ _ _ _ _ sis "in " __ _
  _ ex -- cel -- _ _ _ _ _ _ "sis."
}


tenorB =  \relative f' {
  \clef "treble_8" \key bes \major
  \transposition c | % 1
  R1*2 | % 2
  r1 f | % 3
  es1 d | % 4
  c1  bes | % 5
  r2 d2. c4 c2. bes4 bes1 a2 | % 7
  bes1  f | % 8
  bes1 a | % 9
  g1  f | \barNumberCheck #10
  r1 f' | % 11
  es1 d | % 12
  c1  bes2 f' | % 13
  g2 es f d | % 14
  es2 c d2. f4 | % 15
  es1  d2 bes2. a4 a2 bes d | % 17
  c2. c4 bes1 | % 18
  R1*2 | % 19
  c1 d | \barNumberCheck #20
  bes1 c | % 21
  a2 a bes2. c4 | % 22
  d1  f | % 23
  c1 d2. c4 | % 24
  bes4 c d bes c1  | % 25
  a2 a bes2. a4 | % 26
  g4 a bes g a1  | % 27
  f2 c' d2. c4 | % 28
  bes4 c d bes c1  | % 29
  a2 a bes2. a4 | \barNumberCheck
  #30
  g4 a bes g a1  | % 31
  f2 c' bes\breve a g1 | % 34
  f1 c' | % 35
  es2 es1 bes2 | % 36
  d1 a | % 37
  r2 c1 g2 | % 38
  bes1 f' | % 39
  f\breve | \barNumberCheck #40
  es\breve | % 41
  d\breve | % 42
  c\breve | % 43
  bes\breve | % 44
  f'1 f | % 45
  R1*8 | % 49
  r1 f | \barNumberCheck #50
  g1. es2 | % 51
  f1. d2 | % 52
  es1. c2 | % 53
  d1. bes2 | % 54
  c1. a2 | % 55
  bes1. g2 | % 56
  a1. f1 f'2. es4 d2 | % 58
  c\breve  | % 59
  bes\breve \bar "|."
}

tenorBLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ tus Sanc --
  _ _ _ _ _ _ tus Sanc --
  _ _ tus Sanc -- _ _ _ tus Sanc -- _
  _ _ _ _ _ _ _ _ tus Do --
  mi -- nus De -- us Sa -- ba -- oth Ple -- ni sunt coe -- li
  et ter -- _ _ ra glo -- _ _ _ _ _
  _ _ ri -- a tu -- _ _ _ _ _
  _ a glo -- _ _ _ _ _ _ _ ri
  -- a tu -- _ _ _ _ _ _ a O -- san -- na in ex -- cel -- sis in ex -- cel -- sis in ex
  -- cel -- sis O -- san -- na in ex -- cel -- sis O -- san -- na in
  ex -- cel -- _ _ _ _ _ _
  _ _ _ _ _ _ _ "sis."
}


bass =  \relative bes {
  \clef "bass" \key bes \major | % 1
  R1*4 | % 3
  r1 bes | % 4
  a1 g | % 5
  f2  f es1 | % 6
  d1 c  | % 7
  bes2 bes' c a | % 8
  bes2 g a f | % 9
  g2 es  f f |
  \barNumberCheck #10
  es1 d | % 11
  c1  bes | % 12
  r1 r2 bes' ~ | % 13
  bes4 a a2 bes d
  | % 14
  c2. c4 bes1 | % 15
  R1*2 | % 16
  f1 bes, | % 17
  f'1 bes | % 18
  f1 bes, | % 19
  f'1 bes | \barNumberCheck #20
  r1 f\breve bes, f' bes1 ~ | % 24
  bes1 f\breve bes, f' bes\breve  f1  | % 29
  c'1 d2. c4 | \barNumberCheck #30
  bes4 c d bes c1  | % 31
  a2 a bes2. a4 | % 32
  g4 a bes g a2.
  g4 | % 33
  f4 g a f g1  | % 34
  c1 f, | % 35
  es\breve | % 36
  d\breve | % 37
  c\breve | % 38
  bes\breve | % 39
  f'1 f | \barNumberCheck #40
  R1*6 | % 43
  r1 r2 bes | % 44
  a2 bes1  a2 | % 45
  g2 as1  g2 | % 46
  f2 g1 f2 | % 47
  es2 f2. g4 a2
  | % 48
  bes1. a4 g | % 49
  a4 f bes1 a2 | \barNumberCheck #50
  g2. a4 bes2 c  | % 51
  a2 bes f bes  | % 52
  g2 as es as  | % 53
  f2 g d g  | % 54
  es2 f c f  | % 55
  d2 es bes es  | % 56
  c2 d a1 | % 57
  bes\breve | % 58
  f'\breve  | % 59
  bes,\breve \bar "|."
}

bassLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ tus Sanc --
  _ _ tus Sanc -- _ _ _ _ _ _
  _ _ tus Sanc -- _ _ _ tus Do -- _ mi
  -- nus De -- us Sa -- ba -- oth Ple -- ni sunt coe -- li et ter --
  ra Ple -- "ni " "sunt " coe -- _ li et ter -- _ ra glo --
  _ _ _ _ _ _ _ ri -- a tu --
  _ _ _ _ _ _ _ _ _
  _ _ _ a O -- san -- na -- in -- ex -- cel -- sis O --
  san -- _ na "in " __ _ ex -- cel -- _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ sis O -- _ _ san
  -- _ _ _ "na " __ _ _ _ "in " __ _
  _ _ ex -- _ _ _ cel -- _ _ _
  _ "sis."
}



\score {
  \header {
    piece = \markup \larger \sans { Sanctus }
  }
  
  \transpose bes g {
  <<

    \new StaffGroup
    <<
      \new Staff
      <<
        \set Staff.instrumentName = "S1"
        \context Staff <<
          \context Voice = "sopranoA" {  \global \sopranoA }
          \new Lyrics \lyricsto "sopranoA" { \sopranoALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "S2"
        \context Staff <<
          \context Voice = "sopranoB" {  \global \sopranoB }
          \new Lyrics \lyricsto "sopranoB" { \sopranoBLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "A"
        \context Staff <<
          \context Voice = "alto" { \global \alto }
          \new Lyrics \lyricsto "alto" { \altoLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T1"
        \context Staff <<
          \context Voice = "tenorA" { \global \tenorA }
          \new Lyrics \lyricsto "tenorA" { \tenorALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T2"
        \context Staff <<
          \context Voice = "tenorB" { \global \tenorB }
          \new Lyrics \lyricsto "tenorB" { \tenorBLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "B"
        \context Staff <<
          \context Voice = "bass" { \global \bass }
          \new Lyrics \lyricsto "bass" { \bassLyrics }
        >>
      >>

    >>

  >>
  }
  \layout {}
%  \midi {\tempo 2 = 100 }
}


% Benedictus

sopranoA =  \relative c'' {
  \clef "treble" 
  \set Score.currentBarNumber = #60
  b1. b2 | % 61
  c2. b4 a1 | % 62
  \time 6/2 gis2. a4 b2 cis1
  cis2 | % 63
  \time 4/2 d2. e4 f1 | % 64
  e1. g2 | % 65
  \break
  g1. g2.
  f4 e2. e4 e2 | % 67
  e2 d4 c4 d2. d4 | % 68
  e1. fis2 | % 69
  g1 g2 f2 | \barNumberCheck #70
  \break
  e2. e4 d1 | % 71
  c2. c4 g'\breve
  r2 g2 | % 73
  a4 g4 f4 e4 f2
  f2 | % 74
  g4 f4 e4 d4 e2 e2 | % 75
  \break
  f4 e4 d4 c4 d1 | % 76
  e4 d4 c4 b4 c2
  e2 | % 77
  d2 e1 d2 | % 78
  c2 d1 c2 | % 79
  b2 c1 b2 | \barNumberCheck #80
  a2 b2. c4 d4 b4 | % 81
  \break
  e\breve | % 82
  d2 c2 d1 | % 83
  c1. b4 a4  | % 84
  d2 g,2 g'1 | % 85
  f\breve | % 86
  e\breve | % 87
  \break
  d\breve c\breve b2. a4
  g2 g'2. f4 e2. d4
  c2 d\breve e \showBarLine \bar "|."
}


sopranoALyrics =  \lyricmode {
  Be -- ne -- di -- _ _ ctus,  ___ _  be -- ne -- di -- _ _  ctus qui ve -- nit in no -- mi -- ne_ Do --  _ _ _ mi -- ni,
  qui ve -- nit in no -- mi -- ne Do -- mi -- ni. __
  O -- san -- _ _ _  _  na in __ _ _ _ _  ex -- cel -- _ _ _ _ sis, __ _ _ _ _  
  o -- san -- _ na in __ _ ex -- cel -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  sis,
  o -- san -- na in ex -- cel -- _ _ _ _ _ _ _ _ sis.
}

sopranoB =  \relative c'' {
  \clef "treble"
  \set Score.currentBarNumber = #60
  gis1. gis2 | % 61
  a2. b4 c1 | % 62
  b1 e1. e2 | % 63
  f2. e4 d1 | % 64
  cis1. d2 | % 65
  e1. d1
  c2 b2. c4 | % 67
  c1 a2. a4 | % 68
  b1. d2 | % 69
  d1 d2 d2 | \barNumberCheck #70
  c2 b2 b1 | % 71
  e2. d4 c2 c2 | % 72
  d2 e2 d2 e1 % tie
  d2 c2 d1 % tie
  c2 b2 c1 % tie
  b2 a\breve % tie
  g\breve % tie
  g'1 % tie
  f\breve | % 79
  e\breve | \barNumberCheck #80
  d\breve | % 81
  c\breve | % 82
  g'1 g1.
  f2 e2 f1 % tie
  e2 d2 e1 % tie
  d2 c2 d1 % tie
  c2 b2 c1 % tie
  b2 a2 b1 % tie
  a2 g2 a1 g2 g'2.
  f4 e2. d4 c1. b4
  a4 b1 c\breve |
}

sopranoBLyrics =  \lyricmode {
  Be -- ne -- di -- _ _ ctus,
  be -- ne -- di -- _ _ ctus qui ve -- nit in no -- mi -- ne Do -- mi -- ni,
  qui ve -- nit in no -- mi -- ne Do -- _ _ mi -- ni.
  O -- san -- _ na in __ _ ex -- cel -- _ _ _ sis, __ 
  o -- san -- na in ex -- cel -- sis, o -- san -- _ na
  in __ _ ex -- cel -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ sis.
}

alto =  \relative g' {
  \clef "treble" 
  \set Score.currentBarNumber = #60
  e1. e2 | % 61
  e\breve | % 62
  e2. fis4 gis2
  a1 a2 | % 63
  a\breve | % 64
  a1. b2 | % 65
  c1. b2 | % 66
  a2 a1 g2 | % 67
  a1 f2 a2 | % 68
  gis1. a2 | % 69
  b2. b4 b2 a2.
  g4 g2 g2. g4 | % 71
  g1. c2 | % 72
  b2 c1 b2 | % 73
  a2 bes1 a2 | % 74
  g2 a1 g2 | % 75
  f2 g1 f2 | % 76
  e2 f2. e4 e4 d8 c8 | % 77
  d4 g,4
  c4 d4 e4 f4 g2 | % 78
  c2 bes2. f4 a2 | % 79
  e2 a2. e4 g2 | \barNumberCheck #80
  d2 g1 g2 | % 81
  g\breve | % 82
  g\breve  | % 84
  R
  r2 c2 b2 c1
  bes2 a2 bes1 
  a2 g2 a1 
  g2 f2 g1
  f2 e2 f1 e2 d1
  g\longa g\breve
}

altoLyrics =  \lyricmode {
  Be -- ne -- di -- ctus, ___ _ 
  be -- ne -- di -- ctus qui ve -- nit in no -- mi -- ne Do -- mi -- ni,
  qui ve -- nit in no -- mi -- ne_ Do -- mi -- ni.
  O sa -- _ na in __ _ ex -- cel -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ sis, 
  in __ _ _ ex -- cel -- _ _ sis, in ex -- cel -- sis, 
  o -- san -- _ na in __ _ ex -- cel -- _ _ _ _ _ _ _ _ _ _ sis.
}

tenorA =  \relative g {
  \clef "treble_8"
  \set Score.currentBarNumber = #60  
  b2. b4
  e2. d4 | % 61
  c4. b8 a2. b4 c4
  d4 | % 62
  e2 b1 a1 e'2 | % 63
  d4. e8 f2. e4 d2 | % 64
  e1 a,2 d2 | % 65
  c4. d8 e4. d8 c2
  d2 | % 66
  a1 b2 e2 | % 67
  a,1. d2 | % 68
  b1 r1 | % 69
  d2 g2. d4 a'2 |
  \barNumberCheck #70
  e1 g2 d2 | % 71
  e1. g2 | % 72
  g1 r r\breve r r r
  r1 r2 g2 | % 78
  a4 g4 f4 e4 f2
  f2 | % 79
  g4 f4 e4 d4 e2 e2 | 
  \barNumberCheck #80
  f4 e4 d4 c4 d1 | % 81
  e4 d4 c4 b4 c1 | % 82
  g\breve | % 83
  c1 r1 | % 84
  r1 r2 g'2 | % 85
  a4 g4 f4 e4 f2
  f2 | % 86
  g4 f4 e4 d4 e2
  e2 | % 87
  f4 e4 d4 c4
  d1 e4 d4 c4 b4
  c1 d2 g,2. a4 b2
  g1 c1 g4 a4 b4
  c4 d2 g,2 g\breve
}

tenorALyrics =  \lyricmode {
  Be -- ne -- di -- _ _ _ _ _ _ _ _ ctus,
  be -- ne -- di -- _ _ _ _ ctus
  qui ve -- nit __ _ _ _ _ in no -- mi -- ne Do -- mi -- ni,
  qui ve -- nit in no -- mi -- ne Do -- mi -- ni.
  O -- san -- _ _ _ _ na in __ _ _ _ _ ex -- cel -- _ _ _ _ _ _ _ _ _ _ sis,
  o -- san -- _ _ _ _ na in __ _ _ _ _ ex -- cel -- _ _ _ _ _ _ _ _ _ sis,
  in __ _ _ ex -- cel -- _ _ _ _ _ _ sis.
}


tenorB =  \relative g {
  \clef "treble_8" 
  \set Score.currentBarNumber = #60    
  r2 b1 b2 | % 61
  a4. b8 c2. b4 a2 | % 62
  b2 e1 e2 a2. g4
  | % 63
  f4. e8 d2. e4 f4
  g4 | % 64
  a2 e1 b2 | % 65
  e4. f8 g2 g2. d4 | % 66
  f2 c2 e1 | % 67
  c2 b4 a4 d2 a2 | % 68
  e'1. a,2 | % 69
  g4. a8 b2. g4 a2 |
  \barNumberCheck #70
  c2 g2 b1 | % 71
  g1. g2 | % 72
  g1 g'1 | % 73
  f\breve | % 74
  e\breve | % 75
  d\breve | % 76
  c\breve | % 77
  g'1 g1 | % 82
  r\breve r r r |
  r1 g1 | % 83
  a1. f2 | % 84
  g1. e2 | % 85
  f1. d2 | % 86
  e1. c2 | % 87
  d1. b2 c1.
  a2 b1. g1 g'2.
  f4 e2 d\breve c
}

tenorBLyrics =  \lyricmode {
  Be -- ne -- di -- _ _ _ _ ctus,
  be -- ne -- di -- _ _ _ _ _ _ _ _ ctus
  qui ve -- _ _ nit in no -- mi -- ne Do -- _ _ _ mi -- ni,
  qui ve -- _ _ nit in no -- mi -- ne Do -- mi -- ni.
  O -- san -- na in ex -- cel -- sis,
  o -- san -- na in ex -- cel -- _ _ _ _ _ _ _ _ _ _ _ _ _ sis.
}

bass =  \relative c {
  \clef "bass" 
  \set Score.currentBarNumber = #60    
  e1. e2 | % 61
  a\breve | % 62
  e1. a1 a2 | % 63
  d\breve | % 64
  a1. g2 | % 65
  c1 c2 g2 | % 66
  a2. a4
  e1 | % 67
  f1. f2 | % 68
  e1. d2 | % 69
  g1 g2 d2 | \barNumberCheck #70
  e2. e4 b1 | % 71
  c1. c2 | % 72
  g'\breve | % 76
  r r r
  r1 r2 c2 | % 77
  b2 c1 b2 | % 78
  a2 bes1 a2 | % 79
  g2 a1 g2 | \barNumberCheck #80
  f2 g2. a4 b2 | % 81
  c1. b4 a4 | % 82
  b g c1 b2 | % 83
  a2. b4 c2 d2 | % 84
  b2 c2 g2 c2 | % 85
  a2 bes2 f2 bes2 | % 86
  g2 a2 e2 a2 | % 87
  f2 g2 d2 g2
  e2 f2 c2 f2 d2 e2
  b1 c\breve g'\breve
  c,
}

bassLyrics =  \lyricmode {
  Be -- ne -- di -- ctus,
  be -- ne -- di -- ctus qui ve -- nit in no -- mi -- ne Do -- mi -- ni,
  qui ve -- nit in no -- mi -- ne Do -- mi -- ni.
  O -- san -- _ na in __ _ ex -- cel -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ sis,
  o -- _ _ san -- _ _ _ na -- _ _ _ in __ _ _ _ ex -- _ _ _ cel __ _ _ _ _ sis.
}


benedictus = {
	\key c \major
	\omit Staff.TimeSignature
	\time 4/2
	\set Staff.midiInstrument = "drawbar organ"
	\accidentalStyle "forget"
}

\score {
  \header {
    piece = \markup \larger \sans { Benedictus }
  }
  
\transpose c g, {

    \new StaffGroup
    <<

      \new Staff
      <<
        \set Staff.instrumentName = "S1"
        \context Staff <<
          \context Voice = "sopranoA" {  \benedictus \sopranoA }
          \new Lyrics \lyricsto "sopranoA" { \sopranoALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "S2"
        \context Staff <<
          \context Voice = "sopranoB" {  \benedictus \sopranoB }
          \new Lyrics \lyricsto "sopranoB" { \sopranoBLyrics }
        >>
      >>
    
    \new Staff
    <<
        \set Staff.instrumentName = "A"
      \context Staff <<
        \context Voice = "alto" {  \benedictus \alto }
        \new Lyrics \lyricsto "alto" { \altoLyrics }
      >>
    >>
    
    \new Staff
    <<
        \set Staff.instrumentName = "T1"
      \context Staff <<
        \context Voice = "tenorA" {  \benedictus \tenorA }
        \new Lyrics \lyricsto "tenorA" { \tenorALyrics }
      >>
    >>
    
    \new Staff
    <<
        \set Staff.instrumentName = "T2"
      \context Staff <<
        \context Voice = "tenorB" {  \benedictus \tenorB }
        \new Lyrics \lyricsto "tenorB" { \tenorBLyrics }
      >>
    >>
    
    \new Staff
    <<
        \set Staff.instrumentName = "B"
      \context Staff <<
        \context Voice = "bass" {  \benedictus \bass }
        \new Lyrics \lyricsto "bass" { \bassLyrics }
      >>
    >>

    >>
  }
  \layout {  }
%  \midi {\tempo 2 = 60 }
}

