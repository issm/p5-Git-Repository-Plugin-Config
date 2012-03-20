use strict;
use warnings;
use Test::More;
use t::Util;


subtest 'existing data' => sub {
    my $config = new_config_object();

    ok defined $config->get('core.bare');
    is $config->remove('core.bare'), 'false';
    ok ! defined $config->get('core.bare');
};

subtest 'data does not exist' => sub {
    my $config = new_config_object();

    ok ! defined $config->get('foo.bar');
    ok ! defined $config->remove('foo.bar');
};


done_testing;
