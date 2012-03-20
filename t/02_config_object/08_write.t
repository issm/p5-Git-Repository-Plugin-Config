use strict;
use warnings;
use Test::More;
use t::Util;

subtest 'write after set' => sub {
    my $config = new_config_object();

    $config->set('foo.bar', 'baz');
    $config->set('hoge.fuga', 'piyo');

    ok defined $config->write();

    $config->reread();

    is $config->get('foo.bar'), 'baz';
    is $config->get('hoge.fuga'), 'piyo';
};

subtest 'write after remove' => sub {
    my $config = new_config_object();

    ok defined $config->get('core.bare');
    ok defined $config->get('core.filemode');

    $config->remove('core.bare');
    $config->remove('core.filemode');

    ok ! defined $config->get('core.bare');
    ok ! defined $config->get('core.filemode');

    ok defined $config->write();

    $config->reread();

    ok ! defined $config->get('core.bare');
    ok ! defined $config->get('core.filemode');
};

done_testing;
__END__

[core]
bare=false
filemode=true
ignorecase=true
logallrefupdates=true
repositoryformatversion=0
