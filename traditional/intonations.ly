% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
\pointAndClickOff

\header {
  tagline = ##f
}

\layout {
	indent = #0
	\context {
		\Score
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
  \context { \Staff
    \remove "Time_signature_engraver"
    \hide Stem
  }
}

global = {
	\key c \major
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }


%{   ██████      ██           ██████      ██████      ██      █████
    ██           ██          ██    ██     ██   ██     ██     ██   ██
    ██   ███     ██          ██    ██     ██████      ██     ███████
    ██    ██     ██          ██    ██     ██   ██     ██     ██   ██
     ██████      ███████      ██████      ██   ██     ██     ██   ██   %}

\score {
	\new Staff <<
		\new Voice = "tenor" {
			\relative c' {
				\clef "treble_8"
				\cadenzaOn
        c4 c s a s a s s  g s s  a s b c s a s s  a g s g2 a \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Gló -- _ ri -- a in ex -- cél -- _ sis Dé -- _ o, __ _
		}
	>>
	\layout {
	}
}


%{   ██████     ██████      ███████     ██████       ██████
    ██          ██   ██     ██          ██   ██     ██    ██
    ██          ██████      █████       ██   ██     ██    ██
    ██          ██   ██     ██          ██   ██     ██    ██
     ██████     ██   ██     ███████     ██████       ██████    %}

\score {
	\new Staff <<
		\new Voice = "tenor" {
			\relative c' {
				\clef "treble_8"
				\cadenzaOn
        g4 e s  f s  d e s  g2 a
        \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Cré -- do in ú -- num Dé -- um,
		}
	>>
	\layout {
	}
}
