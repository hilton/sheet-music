global = { 
	\tempo 2 = 50
	\time 2/2
%	\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
	\set Staff.midiInstrument = "choir aahs"
	\override Score.MetronomeMark #'transparent = ##t
	\override Score.BarLine #'transparent = ##t % no bar lines
%	\override Staff.BarLine #'transparent = ##t % mensurstriche
%	\override Score.SpacingSpanner #'strict-note-spacing = ##t
	#(set-global-staff-size 17)
	#(set-accidental-style 'forget)
	\override Score.GraceSpacing #'spacing-increment = #0.0
	#(define afterGraceFraction (cons 17 32))
}

lyricLeft = { \once \override LyricText #'self-alignment-X = #LEFT }
lyricRight = { \once \override LyricText #'self-alignment-X = #RIGHT }
