#!/usr/local/bin/perl -w-   # -*-Perl-*- 
#
# 
# PROGRAM  : das_get_dna_to_fasta.pl
# 
# PURPOSE  : Simple driver for Bio::DAS - Retrieve DNA sequences from DAS server
#          : write sequences to a FASTA file.
# AUTHOR   : Dave Hodgson  david@incyte.com 
# CREATED  : Sun Jul 23 11:37:41 PDT 2000
# REVISION : $Id$
#
# $Log$
#
#

my $prog='das_get_dna_to_fasta.pl';


require 5.000;
use strict;

use lib "/u/binf/dmh/pkg/bioperl-0.6.1";
use lib "/u/binf/dmh/devel/perl/DAS/";
use Bio::DAS;
use Bio::Seq;
use Bio::SeqIO;


my $das_server = Bio::DAS->new(-prefix => 'http://stein.cshl.org/perl/das/',
			       -dsn => 'elegans',
			       -verbose=> 1);

my $fasta_out  = Bio::SeqIO->new( -file => ">cosmids.fasta" ,
				 '-format' => 'FASTA');

foreach my $seq_id (qw( T19C11 AC7 ZK154 ))
{
    my $dna_seq = $das_server->fetchDNA(-id => $seq_id);
    defined $dna_seq || die "$prog: DNA sequence $seq_id not retrieved: ",  $das_server->errstr, "\n";

    $fasta_out->write_seq($dna_seq);
}

$fasta_out->close;






