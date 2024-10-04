Neovim

Navigation

Left: h
Right: l
Down: j
Up: k

Delete currently selected character: x

Insert text to left: i
Insert text to right: a
Insert text above: O

Append text to end of line: A
Append text to start of line: I

To normal mode: Esc
Cancel any command: Esc

Delete current word: d$
Delete full line: dd

Manipulating text consists of a "operator" and (optional number of times) and a "motion"

Common motions:
Until start of next word: w
Until end of current word: e
Until end of line: $

Move to start of line: 0

Undo: u
Undo all changes on line: U
Redo: Ctrl + r

Add register content under cursor: p
Add register content over cursor: P

Replace cursor: r

Change: c
Replace from cursor to end of word: ce
Replace from cursor to end of line: c$

Move to end of file: G
Move to start of file: gg
Move to line number: 200G

Search current file: /
Next occurence: Ctrl + n
Previous occurence: Ctrl + N
Search backwards: ?
Back to origin: Ctrl + o

Move to matching ({[]}): %

Substitute: :s/old/new
Substitute all on current line: :s/old/new/g
Substitute between lines: :#,#s/old/new/g
Substitute whole file: :%s/old/new/g
Substitute whole file with ask: :%s/old/new/gc

Save file: :w
Execute external command: :!ls

Visual mode: v
Read from external file: :r

Open line under: o
Open line above: O

Copy lines (yank): y
Yank 2 words: y2w

Ignore search casing: :set ic
Toggle search casing: :set invic
Remove search higlights: :nohlsearch

Jump to other window: Ctrl + w Ctrl + w

See auto completions: Ctrl + d
Select completion: Tab