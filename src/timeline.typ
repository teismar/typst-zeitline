#let default-theme = (
  colors: (
    text: black,
    muted: rgb("#333333"),
    accent: rgb("#c0392b"),
    line: rgb("#aaaaaa"),
  ),
  sizes: (
    date: 11pt,
    body: 10pt,
    dot: 4pt,
    line-width: 2pt,
  ),
  spacing: (
    row: 1em,
    arm: 3em,
  ),
)

/// Merge user theme overrides with defaults
#let merge-theme(overrides) = {
  let theme = default-theme
  if overrides != none {
    if "colors" in overrides {
      for (k, v) in overrides.colors { theme.colors.insert(k, v) }
    }
    if "sizes" in overrides {
      for (k, v) in overrides.sizes { theme.sizes.insert(k, v) }
    }
    if "spacing" in overrides {
      for (k, v) in overrides.spacing { theme.spacing.insert(k, v) }
    }
  }
  theme
}

/// Render a vertical timeline from a list of events.
///
/// - data: Array of event dictionaries with `date`, `desc`, and optional `side`.
/// - theme: Optional dictionary to override default styling.
/// - justify: Whether to justify the description text.
/// - side: Placement mode for the timeline. Options:
///   - `"both"` or `"center"`: Centered spine with alternating events (default).
///   - `"left"`: Spine on the left, events on the right.
///   - `"right"`: Spine on the right, events on the left.
#let timeline(data, theme: none, justify: false, side: "both") = {
  let t = merge-theme(theme)
  let c = t.colors
  let s = t.sizes
  let sp = t.spacing
  let n = data.len()

  let mode = if side in ("left", "right") { side } else { "both" }

  // Use layout to determine available width for columns
  layout(size => context {
    let col-gutter = 0.5em

    // Calculate column width
    let (columns, col-width) = if mode == "both" {
      let w = (size.width - sp.arm - 2 * col-gutter) / 2
      ((w, sp.arm, w), w)
    } else if mode == "left" {
      let w = size.width - sp.arm - col-gutter
      ((sp.arm, w), w)
    } else {
      // mode == "right"
      let w = size.width - sp.arm - col-gutter
      ((w, sp.arm), w)
    }

    let cells = ()

    for (i, event) in data.enumerate() {
      let is-left = if mode == "left" {
        false
      } else if mode == "right" {
        true
      } else {
        event.at("side", default: if calc.even(i) { "left" } else { "right" }) == "left"
      }
      let is-first = i == 0
      let is-last = i == n - 1

      // Generate Text Content
      let content = align(if is-left { right } else { left })[
        #set par(justify: justify)
        #text(weight: "bold", size: s.date, fill: c.accent)[#event.date] \
        #text(size: s.body, fill: c.muted)[#event.desc]
      ]

      let content-box = box(width: col-width, inset: (y: sp.row / 2), content)
      let empty-box = box(width: col-width, inset: (y: sp.row / 2), none)

      let row-height = measure(content-box).height

      // Spine Cell
      // Measure title for vertical centering
      let title-content = text(weight: "bold", size: s.date)[#event.date]
      let title-h = measure(title-content).height
      let dot-y = sp.row / 1.4 + title-h / 1.4

      let spine-cell = align(center + top, box(width: 100%, height: row-height)[
        // Vertical lines (Top/Bottom segments)
        #if not is-first and not is-last {
          place(center, rect(width: s.line-width, height: 100%, fill: c.line))
        } else {
          if not is-first {
            place(top + center, rect(width: s.line-width, height: dot-y, fill: c.line))
          }
          if not is-last {
            place(top + center, dy: dot-y, rect(width: s.line-width, height: 100% - dot-y, fill: c.line))
          }
        }

        // Dot and Arm
        #place(top + center, dy: dot-y - s.dot)[
          #block(height: 0pt)[
            #if not is-left {
              place(left + horizon, box(width: 50%, height: s.line-width, fill: c.accent))
            } else {
              place(right + horizon, box(width: 50%, height: s.line-width, fill: c.accent))
            }
            #place(center + horizon, circle(radius: s.dot, fill: c.accent))
          ]
        ]
      ])

      // Push cells according to mode
      if mode == "both" {
        if is-left {
          cells.push(content-box)
          cells.push(spine-cell)
          cells.push(empty-box)
        } else {
          cells.push(empty-box)
          cells.push(spine-cell)
          cells.push(content-box)
        }
      } else if mode == "left" {
        cells.push(spine-cell)
        cells.push(content-box)
      } else {
        // mode == "right"
        cells.push(content-box)
        cells.push(spine-cell)
      }
    }

    // Render Grid
    grid(
      columns: columns,
      column-gutter: col-gutter,
      row-gutter: 0pt,
      ..cells
    )
  })
}
