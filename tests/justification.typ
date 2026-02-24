#import "../lib.typ": timeline

#set page(margin: 2cm)
#set text(font: "New Computer Modern")

= Justification adjustment

This is a demonstration of how the justification option changes the layout of the timeline.

#v(1em)

#let events = (
  (date: "Event 1", desc: "Short description"),
  (
    date: "Event 2",
    desc: "This is a very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (
    date: "Event 3",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 4", desc: "Short description again to check connectivity."),
  (
    date: "Event 5",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
)

== With ragged edge

#timeline(events)

== With full justification

#timeline(events, justify: true)
