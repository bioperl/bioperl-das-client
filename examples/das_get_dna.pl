#!/usr/local/bin/perl -w-   # -*-Perl-*- 
#
# 
# PROGRAM  : das_get_dna.pl
# 
# PURPOSE  : Simple driver for Bio::DAS - Retrieve DNA sequence(s) from DAS server
# AUTHOR   : Dave Hodgson  david@incyte.com 
# CREATED  : Wed Jul 19 09:04:59 2000
# REVISION : $Id$
#
# $Log$
#
#

my $prog='das_get_dna.pl';


require 5.000;
use strict;

use lib "/u/binf/dmh/pkg/bioperl-0.6.1";
use lib "/u/binf/dmh/devel/perl/DAS/";
use Bio::DAS;
use Bio::Seq;


# Construct DAS object.
my $das_server = Bio::DAS->new(-prefix => 'http://stein.cshl.org/perl/das/',
			       -dsn    => 'elegans');

# Fetch a subsequence of a C.elegan sequence. 
my $dna_seq = $das_server->fetchDNA(-id    => 'T19C11',
				    -start => 1,
				    -stop  => 100);

# See notes about errors below.
defined $dna_seq || die "DNA sequence T19C11 not retrieved: ",  $das_server->errstr, "\n";

# Returned is a reference to a populated Bio::Seq object. 
print     "SEQ: ", $dna_seq->id, 
      " LENGTH: ", $dna_seq->length,
         " SEQ: ", $dna_seq->seq, "\n";

