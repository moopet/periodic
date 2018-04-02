#!/usr/bin/perl -w

use strict;
use Getopt::Long;
use Term::ANSIColor;

my $version = 0.1;

my %table = (
    'H'   => { 'number' => 1,    'name' => 'Hydrogen',       'color' => 'on_green',   'series' => 'othernonmetals'      },
    'He'  => { 'number' => 2,    'name' => 'Helium',         'color' => 'on_cyan',    'series' => 'noblegases'          },
    'Li'  => { 'number' => 3,    'name' => 'Lithium',        'color' => 'on_red',     'series' => 'alkalimetals'        },
    'Be'  => { 'number' => 4,    'name' => 'Beryllium',      'color' => 'on_yellow',  'series' => 'alkalineearthmetals' },
    'B'   => { 'number' => 5,    'name' => 'Boron',          'color' => 'on_yellow',  'series' => 'metalloids'},
    'C'   => { 'number' => 6,    'name' => 'Carbon',         'color' => 'on_green',   'series' => 'othernonmetals'},
    'N'   => { 'number' => 7,    'name' => 'Nitrogen',       'color' => 'on_green',   'series' => 'othernonmetals'},
    'O'   => { 'number' => 8,    'name' => 'Oxygen',         'color' => 'on_green',   'series' => 'othernonmetals'},
    'F'   => { 'number' => 9,    'name' => 'Fluorine',       'color' => 'on_yellow',  'series' => 'halogens'},
    'Ne'  => { 'number' => 10,   'name' => 'Neon',           'color' => 'on_cyan',    'series' => 'noblegases'},
    'Na'  => { 'number' => 11,   'name' => 'Sodium',         'color' => 'on_red',     'series' => 'alkalimetals'},
    'Mg'  => { 'number' => 12,   'name' => 'Magnesium',      'color' => 'on_yellow',  'series' => 'alkalineearthmetals'},
    'Al'  => { 'number' => 13,   'name' => 'Aluminium',      'color' => 'on_blue',    'series' => 'othermetals'},
    'Si'  => { 'number' => 14,   'name' => 'Silicon',        'color' => 'on_yellow',  'series' => 'metalloids'},
    'P'   => { 'number' => 15,   'name' => 'Phosphorus',     'color' => 'on_green',   'series' => 'othernonmetals'},
    'S'   => { 'number' => 16,   'name' => 'Sulphur',        'color' => 'on_green',   'series' => 'othernonmetals'},
    'Cl'  => { 'number' => 17,   'name' => 'Chlorine',       'color' => 'on_yellow',  'series' => 'halogens'},
    'Ar'  => { 'number' => 18,   'name' => 'Argon',          'color' => 'on_cyan',    'series' => 'noblegases'},
    'K'   => { 'number' => 19,   'name' => 'Potassium',      'color' => 'on_red',     'series' => 'alkalimetals'},
    'Ca'  => { 'number' => 20,   'name' => 'Calcium',        'color' => 'on_yellow',  'series' => 'alkalineearthmetals'},
    'Sc'  => { 'number' => 21,   'name' => 'Scandium',       'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Ti'  => { 'number' => 22,   'name' => 'Titanium',       'color' => 'on_magenta', 'series' => 'transitionelements'},
    'V'   => { 'number' => 23,   'name' => 'Vanadium',       'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Cr'  => { 'number' => 24,   'name' => 'Chromium',       'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Mn'  => { 'number' => 25,   'name' => 'Manganese',      'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Fe'  => { 'number' => 26,   'name' => 'Iron',           'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Co'  => { 'number' => 27,   'name' => 'Cobalt',         'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Ni'  => { 'number' => 28,   'name' => 'Nickel',         'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Cu'  => { 'number' => 29,   'name' => 'Copper',         'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Zn'  => { 'number' => 30,   'name' => 'Zinc',           'color' => 'on_magenta', 'series' => 'transitionelements'},
    'Ga'  => { 'number' => 31,   'name' => 'Gallium',        'color' => 'on_blue',    'series' => 'othermetals'},
    'Ge'  => { 'number' => 32,   'name' => 'Germanium',      'color' => 'on_yellow',  'series' => 'metalloids'},
    'As'  => { 'number' => 33,   'name' => 'Arsenic',        'color' => 'on_yellow',  'series' => 'metalloids'},
    'Se'  => { 'number' => 34,   'name' => 'Selenium',       'color' => 'on_green',   'series' => 'othernonmetals'},
    'Br'  => { 'number' => 35,   'name' => 'Bromine',        'color' => 'on_yellow',  'series' => 'halogens'},
    'Kr'  => { 'number' => 36,   'name' => 'Krypton',        'color' => 'on_cyan',    'series' => 'noblegases'},
    'Rb'  => { 'number' => 37,   'name' => 'Rubidium',       'color' => 'on_red',     'series' => 'alkalimetals'},
    'Sr'  => { 'number' => 38,   'name' => 'Strontium',      'color' => 'on_yellow',  'series' => 'alkalineearthmetals'},
    'Y'   => { 'number' => 39,   'name' => 'Yttrium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Zr'  => { 'number' => 40,   'name' => 'Zirconium',      'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Nb'  => { 'number' => 41,   'name' => 'Niobium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Mo'  => { 'number' => 42,   'name' => 'Molybdenum',     'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Tc'  => { 'number' => 43,   'name' => 'Technetium',     'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Ru'  => { 'number' => 44,   'name' => 'Ruthenium',      'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Rh'  => { 'number' => 45,   'name' => 'Rhodium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Pd'  => { 'number' => 46,   'name' => 'Palladium',      'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Ag'  => { 'number' => 47,   'name' => 'Silver',         'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Cd'  => { 'number' => 48,   'name' => 'Cadmium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'In'  => { 'number' => 49,   'name' => 'Indium',         'color' => 'on_blue',    'series' => 'othermetals'},
    'Sn'  => { 'number' => 50,   'name' => 'Tin',            'color' => 'on_blue',    'series' => 'othermetals'},
    'Sb'  => { 'number' => 51,   'name' => 'Antimony',       'color' => 'on_yellow',  'series' => 'metalloids'},
    'Te'  => { 'number' => 52,   'name' => 'Tellurium',      'color' => 'on_yellow',  'series' => 'metalloids'},
    'I'   => { 'number' => 53,   'name' => 'Iodine',         'color' => 'on_yellow',  'series' => 'halogens'},
    'Xe'  => { 'number' => 54,   'name' => 'Xenon',          'color' => 'on_cyan',    'series' => 'noblegases'},
    'Cs'  => { 'number' => 55,   'name' => 'Caesium',        'color' => 'on_red',     'series' => 'alkalimetals'},
    'Ba'  => { 'number' => 56,   'name' => 'Barium',         'color' => 'on_yellow',  'series' => 'alkalineearthmetals'},
    'La'  => { 'number' => 57,   'name' => 'Lanthanum',      'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Ce'  => { 'number' => 58,   'name' => 'Cerium',         'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Pr'  => { 'number' => 59,   'name' => 'Praseodymium',   'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Nd'  => { 'number' => 60,   'name' => 'Neodymium',      'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Pm'  => { 'number' => 61,   'name' => 'Promethium',     'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Sm'  => { 'number' => 62,   'name' => 'Samarium',       'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Eu'  => { 'number' => 63,   'name' => 'Europium',       'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Gd'  => { 'number' => 64,   'name' => 'Gadolinium',     'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Tb'  => { 'number' => 65,   'name' => 'Terbium',        'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Dy'  => { 'number' => 66,   'name' => 'Dysprosium',     'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Ho'  => { 'number' => 67,   'name' => 'Holmium',        'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Er'  => { 'number' => 68,   'name' => 'Erbium',         'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Tm'  => { 'number' => 69,   'name' => 'Thulium',        'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Yb'  => { 'number' => 70,   'name' => 'Ytterbium',      'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Lu'  => { 'number' => 71,   'name' => 'Lutetium',       'color' => 'on_yellow',  'series' => 'lanthanides'},
    'Hf'  => { 'number' => 72,   'name' => 'Hafnium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Ta'  => { 'number' => 73,   'name' => 'Tantalum',       'color' => 'on_magenta',  'series' => 'transitionelements'},
    'W'   => { 'number' => 74,   'name' => 'Tungsten',       'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Re'  => { 'number' => 75,   'name' => 'Rhenium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Os'  => { 'number' => 76,   'name' => 'Osmium',         'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Ir'  => { 'number' => 77,   'name' => 'Iridium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Pt'  => { 'number' => 78,   'name' => 'Planinum',       'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Au'  => { 'number' => 79,   'name' => 'Gold',           'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Hg'  => { 'number' => 80,   'name' => 'Mercury',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Tl'  => { 'number' => 81,   'name' => 'Thallium',       'color' => 'on_blue',    'series' => 'othermetals'},
    'Pb'  => { 'number' => 82,   'name' => 'Lead',           'color' => 'on_blue',    'series' => 'othermetals'},
    'Bi'  => { 'number' => 83,   'name' => 'Bismuth',        'color' => 'on_blue',    'series' => 'othermetals'},
    'Po'  => { 'number' => 84,   'name' => 'Polonium',       'color' => 'on_yellow',  'series' => 'metalloids'},
    'At'  => { 'number' => 85,   'name' => 'Astatine',       'color' => 'on_yellow',  'series' => 'halogens'},
    'Rn'  => { 'number' => 86,   'name' => 'Radon',          'color' => 'on_cyan',    'series' => 'noblegases'},
    'Fr'  => { 'number' => 87,   'name' => 'Francium',       'color' => 'on_red',     'series' => 'alkalimetals'},
    'Ra'  => { 'number' => 88,   'name' => 'Radium',         'color' => 'on_yellow',  'series' => 'alkalineearthmetals'},
    'Ac'  => { 'number' => 89,   'name' => 'Actinium',       'color' => 'on_magenta',  'series' => 'actinides'},
    'Th'  => { 'number' => 90,   'name' => 'Thorium',        'color' => 'on_magenta',  'series' => 'actinides'},
    'Pa'  => { 'number' => 91,   'name' => 'Protactinium',   'color' => 'on_magenta',  'series' => 'actinides'},
    'U'   => { 'number' => 92,   'name' => 'Uranium',        'color' => 'on_magenta',  'series' => 'actinides'},
    'Np'  => { 'number' => 93,   'name' => 'Neptunium',      'color' => 'on_magenta',  'series' => 'actinides'},
    'Pu'  => { 'number' => 94,   'name' => 'Plutonium',      'color' => 'on_magenta',  'series' => 'actinides'},
    'Am'  => { 'number' => 95,   'name' => 'Americium',      'color' => 'on_magenta',  'series' => 'actinides'},
    'Cm'  => { 'number' => 96,   'name' => 'Curium',         'color' => 'on_magenta',  'series' => 'actinides'},
    'Bk'  => { 'number' => 97,   'name' => 'Berkelium',      'color' => 'on_magenta',  'series' => 'actinides'},
    'Cf'  => { 'number' => 98,   'name' => 'Californium',    'color' => 'on_magenta',  'series' => 'actinides'},
    'Es'  => { 'number' => 99,   'name' => 'Einsteinium',    'color' => 'on_magenta',  'series' => 'actinides'},
    'Fm'  => { 'number' => 100,  'name' => 'Fermium',        'color' => 'on_magenta',  'series' => 'actinides'},
    'Md'  => { 'number' => 101,  'name' => 'Mendelevium',    'color' => 'on_magenta',  'series' => 'actinides'},
    'No'  => { 'number' => 102,  'name' => 'Nobelium',       'color' => 'on_magenta',  'series' => 'actinides'},
    'Lr'  => { 'number' => 103,  'name' => 'Lawrencium',     'color' => 'on_magenta',  'series' => 'actinides'},
    'Rf'  => { 'number' => 104,  'name' => 'Rutherfordium',  'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Db'  => { 'number' => 105,  'name' => 'Dubnium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Sg'  => { 'number' => 106,  'name' => 'Seaborgium',     'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Bh'  => { 'number' => 107,  'name' => 'Bohrium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Hs'  => { 'number' => 108,  'name' => 'Hassium',        'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Mt'  => { 'number' => 109,  'name' => 'Meitnerium',     'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Ds'  => { 'number' => 110,  'name' => 'Darmstadtium',   'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Rg'  => { 'number' => 111,  'name' => 'Roentgenium',    'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Uub' => { 'number' => 112,  'name' => 'Ununbium',       'color' => 'on_magenta',  'series' => 'transitionelements'},
    'Uut' => { 'number' => 113,  'name' => 'Ununtrium',      'color' => 'on_blue',  'series' => 'othermetals'},
    'UUq' => { 'number' => 114,  'name' => 'Ununquadrium',   'color' => 'on_blue',  'series' => 'othermetals'},
    'UUp' => { 'number' => 115,  'name' => 'Ununpentium',    'color' => 'on_blue',  'series' => 'othermetals'},
    'UUh' => { 'number' => 116,  'name' => 'Ununhexium',     'color' => 'on_blue',  'series' => 'othermetals'},
    'UUs' => { 'number' => 117,  'name' => 'Ununseptium',    'color' => 'on_yellow',  'series' => 'innertransitionelements'},
            
    'UUo' => { 'number' => 118,  'name' => 'Ununoctium',     'color' => 'on_cyan',    'series' => 'noblegases'          }
            );

my $schematic=
"                     Periodic Table of the Elements
 H                                                                   He  
 H                                                                   He  
 Li  Be                                          B   C   N   O   F   Ne  
 Li  Be                                          B   C   N   O   F   Ne  
 Na  Mg                                          Al  Si  P   S   Cl  Ar  
 Na  Mg                                          Al  Si  P   S   Cl  Ar  
 K   Ca  Sc  Ti  V   Cr  Mn  Fe  Co  Ni  Cu  Zn  Ga  Ge  As  Se  Br  Kr  
 K   Ca  Sc  Ti  V   Cr  Mn  Fe  Co  Ni  Cu  Zn  Ga  Ge  As  Se  Br  Kr  
 Rb  Sr  Y   Zr  Nb  Mo  Tc  Ru  Rh  Pd  Ag  Cd  In  Sn  Sb  Te  I   Xe  
 Rb  Sr  Y   Zr  Nb  Mo  Tc  Ru  Rh  Pd  Ag  Cd  In  Sn  Sb  Te  I   Xe  
 Cs  Ba  *   Hf  Ta  W   Re  Os  Ir  Pt  Au  Hg  Tl  Pb  Bi  Po  At  Rn  
 Cs  Ba      Hf  Ta  W   Re  Os  Ir  Pt  Au  Hg  Tl  Pb  Bi  Po  At  Rn  
 Fr  Ra  **  Rf  Db  Sg  Bh  Hs  Mt  Ds  Rg  Uub Uut Uuq Uup Uuh Uus Uuo 
 Fr  Ra      Rf  Db  Sg  Bh  Hs  Mt  Ds  Rg  Uub Uut Uuq Uup Uuh Uus Uuo 

     *   La  Ce  Pr  Nd  Pm  Sm  Eu  Gd  Tb  Dy  Ho  Er  Tm  Yb  Lu  
         La  Ce  Pr  Nd  Pm  Sm  Eu  Gd  Tb  Dy  Ho  Er  Tm  Yb  Lu  
     **  Ac  Th  Pa  U   Np  Pu  Am  Cm  Bk  Cf  Es  Fm  Md  No  Lr  
         Ac  Th  Pa  U   Np  Pu  Am  Cm  Bk  Cf  Es  Fm  Md  No  Lr  
 ";

# global flags and options
my ($word, $number, $symbol, $verbose, $colorize, $drawtable, $help);
# results
our @stack;
our @results;

sub drawTable
{
    my ($colored, $tmp, $tmp2);
 
    if ($colorize)
    {
        foreach $symbol (keys %table)
        {
            $tmp = " " . $symbol;
            while (length($tmp) < 4)
            {
                $tmp = $tmp . " ";
            }
            
            $colored = colored ($tmp, $table{$symbol}->{'color'});
            $schematic =~ s/$tmp/$colored/g;

            $tmp2 = " $table{$symbol}->{'number'}";
            while (length($tmp2) < 4)
            {
                $tmp2 = $tmp2 . " ";
            }
            
            $colored = colored ($tmp2, "black $table{$symbol}->{'color'}");
            $schematic =~ s/$tmp/$colored/;
        }
    }
    
    print $schematic;
    exit;
}

sub drawElement
{
    my $symbol = shift;
    my $whichLine = shift;
    if (!defined $table{$symbol})
    {
        if (defined $whichLine)
	{
            print "    ";
	    print
	}
	return;
    }
    my $line1 = " " . $symbol;
    my $line2 = " " . $table{$symbol}->{'number'};
    while (length($line1) < 4)
    {
        $line1 = $line1 . " ";
    }
    while (length($line2) < 4)
    {
        $line2 = $line2 . " ";
    }
    if (!defined $whichLine)
    {
        print colored ($line1, $table{$symbol}->{'color'}) . "\n";
        print colored ($line2, "black " . $table{$symbol}->{'color'}) . " ";
        print $table{$symbol}->{'name'} . "\n";
    }
    elsif ($whichLine == 1)
    {
        print colored ($line1, $table{$symbol}->{'color'});
    }
    else
    {
        print colored ($line2, "black " . $table{$symbol}->{'color'});
    }
}


sub drawWord
{
    my $length = @_;
    my $i;
    
    for ($i = 0; $i < $length; $i++) 
    {
        drawElement($_[$i], 1);
    }
    print "\n";
    for ($i = 0; $i < $length; $i++) 
    {
        drawElement($_[$i], 2);
    }
    print "\n";
}


sub elemental
{
    my $word = shift;
	
    foreach $symbol (keys %table)
    {
           # throw out if it overruns
        if (length($symbol) <= length($word))
	{
	    if ($word =~ /^$symbol/i)
	    {
		push(@stack, $symbol);
		if ($word =~ /^$symbol$/i)	# word complete
		{
		    push(@results, @stack);
		    drawWord(@stack);	
		    pop(@stack);
		    pop(@stack);
		    return;
		}
		
		# recurse
		elemental(substr $word, length($symbol));
	    }
	}
    }
    pop(@stack);         # failed to make a match
}

sub usage
{
    print "periodic version $version, by Ben Sinclair.

usage: periodic [OPTIONS] [flags]

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

Example:           periodic -w chocolate -v
Displays every matching version of the word 'chocolate' built from element symbols.

Example:           periodic -t -c
Displays the entire table, in color.
";
    exit;
}

GetOptions("symbol=s"=>\$symbol,
           "word=s",\$word,
           "table!",\$drawtable,
           "color!",\$colorize,
	   "help!",\$help,
           "verbose!",\$verbose,
           "atomicnumber=i"=> \$number);

if ($help)
{
    usage();
}

if ($drawtable)
{
    drawTable();
    exit;
}

if ($symbol)
{
    $symbol = ucfirst(lc($symbol));
    if (defined $table{$symbol})
    {
        if ($colorize)
	{
	    drawElement($symbol);
	}
	else
	{
            print $table{$symbol}->{'number'} . " " . $symbol . " " . $table{$symbol}->{'name'} . "\n";
	}
    }
    else
    {
        print "no such element\n";
    }
    exit;
}

if ($number)
{
    foreach $symbol (keys %table)
    {
        if ($table{$symbol}->{'number'} == $number)
        {
	    if ($colorize)
	    {
		drawElement($symbol);
	    }
	    else
	    {
                print $table{$symbol}->{'number'} . " " . $symbol . " " . $table{$symbol}->{'name'} . "\n";
	    }
            exit;
        }
    }
    print "no such element\n";
    exit;
}

if ($word)
{
    elemental($word);
    exit;
}
