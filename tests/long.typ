#import "../lib.typ": timeline

#set page(margin: 2cm)
#set text(font: "New Computer Modern")

= Timeline Multi Page Test

This document tests if the timeline spans multiple pages correctly.

#let events = (
  (date: "Event 1", desc: "Short description"),
  (
    date: "Event 2",
    desc: "This is a very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 3", desc: "Short description again to check connectivity."),
  (
    date: "Event 4",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 5", desc: "Short description again to check connectivity."),
  (
    date: "Event 6",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 7", desc: "Short description again to check connectivity."),
  (
    date: "Event 8",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 9", desc: "Short description again to check connectivity."),
  (
    date: "Event 10",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
  (date: "Event 11", desc: "Short description again to check connectivity."),
  (
    date: "Event 12",
    desc: "Very long description that should wrap to multiple lines to test if the vertical spine stretches correctly to fill the entire height of the row. It needs to be significantly longer than the default 1.5em height of the spine segment.",
  ),
)

#timeline(events)
