#import "template.typ": *
#import "@preview/oasis-align:0.3.2": *
#show: template.with(
  title: "Prototype Testing Plan",  
)

#heading(numbering: none)[Test Plan Introduction]
#include "../0-introduction.typ"

#pagebreak()
= Cycle Time Testing
#include "../cycle-time.typ"
// ^^^ includes description of how to put the jig through the feed system that can be used for other testing procedures

#pagebreak()
= Jig Alignment Testing
#include "../jig-alignment.typ"

#pagebreak()
= Jig Bonding Testing
#include "../jig-bonding.typ"

// #pagebreak()
// = Jig Interference
// #include "../lamina-ridge-interference.typ"

#pagebreak()
= Pot Life Extension Testing
#include "../pot-life.typ"