global = { 
	\time 2/2
	\tempo 2 = 50
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

lyricLeft = { \once \override LyricText #'self-alignment-X = #LEFT }
lyricRight = { \once \override LyricText #'self-alignment-X = #RIGHT }
showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }

keyF = {
	\key f \major
}

keyA = {
	\key a \minor
}
