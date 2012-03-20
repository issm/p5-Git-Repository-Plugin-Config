use strict;
use warnings;
use Test::More;
use t::Util;


subtest 'no value' => sub {
    my $config = new_config_object();
    is $config->append('foo.bar'), undef;
};

subtest 'without delimiter' => sub {
    my $config = new_config_object();

    is $config->append('foo.bar', 'baz'), 'baz';
    is $config->get('foo.bar'), 'baz';
    is $config->append('foo.bar', 'hoge'), 'bazhoge';
    is $config->get('foo.bar'), 'bazhoge';
};

subtest 'with delimiter' => sub {
    my $config = new_config_object();

    is $config->append('foo.bar', 'baz', ':'), 'baz';
    is $config->get('foo.bar'), 'baz';
    is $config->append('foo.bar', 'hoge', ':'), 'baz:hoge';
    is $config->get('foo.bar'), 'baz:hoge';
};

done_testing;
