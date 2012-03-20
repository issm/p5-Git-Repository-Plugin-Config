use strict;
use warnings;
use Test::More;
use t::Util;

subtest 'reread after set (and not write)' => sub {
    my $config = new_config_object();

    $config->set('foo.bar', 'hoge');
    $config->set('foo.baz', 'fuga');

    ok defined $config->get('foo.bar');
    ok defined $config->get('foo.baz');

    ok defined $config->reread();

    ok ! defined $config->get('foo.bar');
    ok ! defined $config->get('foo.baz');
};

subtest 'reread after remove (and not write)' => sub {
    my $config = new_config_object();

    $config->remove_section('core');

    ok ! defined $config->get('core.bare');
    ok ! defined $config->get('core.filemode');

    ok defined $config->reread();

    ok defined $config->get('core.bare');
    ok defined $config->get('core.filemode');
};

done_testing;
__END__

[core]
bare=false
filemode=true
ignorecase=true
logallrefupdates=true
repositoryformatversion=0
