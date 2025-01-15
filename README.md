# Periodic

Periodic table word thinger.

![Output from the periodic command showing the periodic table, in colour, in a terminal](https://github.com/user-attachments/assets/9ca57632-e070-4266-a0d7-03d2e6a48f98)


This is a command-line tool to help you make words out of element symbols. It has no real practical purpose.

## Usage

```
usage: periodic.pl [OPTIONS] [flags]

Where options are:
-s --symbol        display details for the element with the specified symbol
-a --atomicnumber  display details for the element with the specified atomic number
-w --word          try to spell a word with letters from the periodic table
-t --table         display the standard periodic table of the elements
-h --help          this help message

and where flags are:
-c --color         display colored and prettified elements
-v --verbose       don't stop at first (best) match, display all matches

Options and flags may not be combined.
```

## Examples

### Display every matching version of the word 'counterespionage'[^1] built from element symbols.

```sh
periodic.pl -w counterespionage -v
```

![counterespionage](https://github.com/user-attachments/assets/f82e6202-042e-4135-ae9f-38f5ab042a5a)

### Display the entire table, in color.

```sh
periodic.pl -t -c
```

[^1]: this is the longest word I could match in the standard dictionary that came with my distro. 
