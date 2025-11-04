# Problem 2

Let's say we have a set of rules, and an incorrectly-ordered update.
How do we find which item in the update is out of order?

One way: generate all possible orderings; find one that passes.

Or: take the rules, and find which ones are violated.  There must be
one item that's common to them all, in either the low or high slot.

Find that item and then try all positions for it; see which one passes
all the rules.

