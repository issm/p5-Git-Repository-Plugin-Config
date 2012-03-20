use strict;
use warnings;
use Test::More;
use t::Util;

my $config = new_config_object();

isa_ok $config, 'Git::Repository::Plugin::Config::Object';
isa_ok $config->{__c}, 'Config::Tiny';

done_testing;
