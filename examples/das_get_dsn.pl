#!/usr/local/bin/perl -w-   # -*-Perl-*- 
#
# 
# PROGRAM  : das_get_dsn.pl
# 
# PURPOSE  : Simple driver for Bio::DAS - Get list of DSNs
# AUTHOR   : Dave Hodgson  david@incyte.com 
# CREATED  : Wed Jul 19 09:04:59 2000
# REVISION : $Id$
#
# $Log$
#
#

my $prog='das_get_dsn.pl';


require 5.000;
use strict;

use lib "/u/binf/dmh/pkg/bioperl-0.6.1";
use lib "/u/binf/dmh/devel/perl/DAS/";
use Bio::DAS;
use Bio::Seq;



my $das_server = Bio::DAS->new(-prefix => 'http://stein.cshl.org/perl/das/',
			       -dsn => 'elegans',
			       -verbose=> 1);

my $dsn_list_ref = $das_server->getDSNinfo();

foreach my $dsn_struct_ref (@$dsn_list_ref)
{

    print "\n";
    print "DSN ID: ",        $dsn_struct_ref->{'SOURCE'}->{'id'}, "\n";
    print "DSN SRC DESC: ",  $dsn_struct_ref->{'SOURCE'}->{'content'}, "\n";
    print "DSN MASTER: ",    $dsn_struct_ref->{'MAPMASTER'}, "\n";
    print "DSN FULL DESC: ", $dsn_struct_ref->{'DESCRIPTION'}, "\n";

}

