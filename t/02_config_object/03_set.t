use strict;
use warnings;
use Test::More;
use t::Util;

my $config = new_config_object();

is $config->set('foo'), undef;

is $config->get('foo.bar'), undef;
is $config->set('foo.bar', 'baz'), 'baz';
is $config->get('foo.bar'), 'baz';

done_testing;
