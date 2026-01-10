#import "../lib.typ": timeline

#set page(margin: 2cm)
#set text(font: "New Computer Modern")

= Timeline Spine Connectivity Test

This document tests if the vertical spine connects correctly even when event descriptions are very long.

#let events = (
  (date: "Event 1", desc: "Short description"),
  (
    date: "Event 2",
    desc: "This is a very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 3", desc: "Short description again to check connectivity."),
)

#timeline(events)
