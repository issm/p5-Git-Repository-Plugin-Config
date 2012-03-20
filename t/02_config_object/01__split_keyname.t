use strict;
use warnings;
use Test::More;
use t::Util;

my $config = new_config_object();

# 'foobar'  -> section => '_', property => 'foobar'
# '.foobar' -> section => '_', property => 'foobar'
# 'foo.bar' -> section => 'foo', property => 'bar'

subtest 'only property' => sub {
    my ($s, $p);

    ($s, $p) = $config->_split_keyname('foobar');
    is $s, '_';
    is $p, 'foobar';

    ($s, $p) = $config->_split_keyname('.barbaz');
    is $s, '_';
    is $p, 'barbaz';
};

subtest 'section and property' => sub {
    my ($s, $p);

    ($s, $p) = $config->_split_keyname('foo.bar');
    is $s, 'foo';
    is $p, 'bar';
};

done_testing;
