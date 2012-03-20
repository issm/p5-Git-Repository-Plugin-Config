use strict;
use warnings;
use Test::More;
use t::Util;

my $config = new_config_object();

is $config->get('bare'), undef;
is $config->get('core.bare'), 'false';

done_testing;
