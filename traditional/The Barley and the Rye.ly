\version "2.18.2"

\paper {
	top-margin = 20\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 10) )
}

\header {
 	title = "The Barley and the Rye"
	tagline = ##f
	composer = "traditional"
	copyright = "As sung by Martin Carthy on his first album, transcribed by Peter Hilton"
}

\score {

	\new Voice	{
		\relative c'' {
			\key c \major
			\time 3/4
			\partial 4
			a8.( f16) | g8. f16 d4 c8. a'16 | a8.( b16) c4 b8. a16 | g8. f16 d4 c8.( d16) | d2 \bar "" \break
			d8. e16 | f8. g16 a4 d4 | c8. b16 a4 g8.( fis16) | g8. g16 c4 b | a2 \bar "" \break
			d,8. e16 | f4 d' d8. d16 | c8. b16 a4 a8. b16 | c8.( b16) g8. g16 fis8. g16 a8.( b16 c2 ~ c4) r4 \bar "" \break
			b8. a16 g8.( fis16) d8. d16 c8. a'16 a8.( b16) c8. c16 b8. a16 g8.( fis16) d4 c8. d16 d2
			\bar "||"
		}
		\addlyrics {
			It’s of an old coun -- try far -- mer who lived in the West Coun -- try,
			And he had the pret -- tiest lit -- tle wife that e -- ver you did see,
			And a young man came a -- cour -- ting her when the old man he was -- n't nigh, __
			And oft -- times they would take a tum -- ble a -- mongst the bar -- ley and the rye.
		}
	}

	\layout { }
	\midi { }
}

\markup { 
	\larger
	\fill-line {
		\hspace #0.1
		\column {
			\combine \null \vspace #1.0
			\line {
				\column {
					"Now when the old man woke in the morning, and he found himself all alone"
					"Well he look’d out of the window, and he spied his wife in the corn,"
					"And the young man lay beside her, and it caused the old man to cry"
					"He says, ‘Wife, wife, I wonder at you, for spoiling of my rye!’"
				}
			}
			\combine \null \vspace #1.0
			\line {
				\column {
					"‘Oh husband,’ she says, ‘Oh husband, it’s the like I’ve ne’er done before"
					"For if you have got one friend, I have another one in store"
					"He’s a friend, love, who’ll not deceive you, if you will him employ,"
					"He’s got money enough, love, to pay you for our barley and our rye.’"
				}
			}
		}
		\hspace #0.1
	}
}

