# ASCII/Unicode box diagrams: generate, don't hand-type

Hand-typed box-drawing diagrams (`┌─┐│└┘`, arrows `►◄▲▼`) reliably go jagged.
Unicode box-drawing/arrow characters are single-column in monospace fonts,
so column counts *can* be gotten right by eye, but in practice never are
past a handful of lines, especially once side labels or multi-column
layouts enter the picture. The fix isn't more care, it's not doing it by
hand at all.

## The technique

Write a one-off script (Python, in `/tmp`, throwaway) with a `box()` helper:

```python
def box(lines, pad=1):
    w = max(len(l) for l in lines)
    lines = [l.ljust(w) for l in lines]
    top = "┌" + "─" * (w + 2*pad) + "┐"
    bot = "└" + "─" * (w + 2*pad) + "┘"
    mid = ["│" + " "*pad + l + " "*pad + "│" for l in lines]
    return [top] + mid + [bot], w + 2*pad + 2
```

- Content lines go in unpadded; the helper pads every line to the box's
  max width before adding borders. This is what actually guarantees
  alignment, not hand-counting spaces.
- Side-by-side boxes: `zip()` two box() outputs row-by-row with a fixed
  gap string between them.
- Side labels outside the box (port names, signal arrows): fix a `LEFT_W`
  column width and `.rjust(LEFT_W)`/`.ljust(LEFT_W)` every label into it,
  even the blank rows. Don't try to hand-pad labels of different lengths
  to "look" aligned; different string lengths need different padding, and
  eyeballing that is exactly how jaggedness creeps back in.
- Nested/stacked content (multiple boxes inside an outer box): build each
  inner piece fully, then `.center(main_w)` or `.ljust(main_w)` every row
  into the outer box's content width, then wrap once in an outer `box()`
  call.

## The verification step (don't skip this)

After generating, check that every line of the diagram (or every line
within one box, if boxes have different widths) has the same `len()`.
This is the actual test that would have caught every jagged diagram before
it shipped, not a re-read, not eyeballing the terminal render:

```python
lens = set(len(l) for l in outer_box)
print(lens)   # must be a single value
```

## Check arrow direction against real semantics

A generated diagram can still be *wrong*, not just misaligned. Before
finalizing, walk every arrow and confirm its glyph matches the actual
data-flow direction being depicted:

- `►` / `→`: rightward, out of a box on its right edge.
- `◄` / `←`: leftward, out of a box on its left edge (or into it from the
  left; direction is about dataflow, not box side, so check which port is
  the input and which is the output before picking the glyph).
- `▼` / `▲`: down/up between vertically stacked boxes.

Getting the box columns perfectly aligned says nothing about whether an
output port's arrow is pointing the wrong way. Check both, separately.

## When to reach for this

Any multi-line box/arrow diagram bound for a doc (architecture diagrams,
testbench structure diagrams, block diagrams in mas-digest/VAD-style docs).
Skip it for a diagram that's genuinely one box with no nesting and no side
labels; those are safe to hand-type and check by eye.
