use strict;
use warnings;
use Test::More;
use t::Util;

subtest 'existing section' => sub {
    my $config = new_config_object();

    ok defined $config->get('core.bare');
    ok defined $config->get('core.filemode');
    ok defined $config->get('core.ignorecase');
    ok defined $config->get('core.logallrefupdates');
    ok defined $config->get('core.repositoryformatversion');

    ok defined $config->remove_section('core');

    ok ! defined $config->get('core.bare');
    ok ! defined $config->get('core.filemode');
    ok ! defined $config->get('core.ignorecase');
    ok ! defined $config->get('core.logallrefupdates');
    ok ! defined $config->get('core.repositoryformatversion');
};

subtest 'section does not exist' => sub {
    my $config = new_config_object();

    ok ! defined $config->remove_section('foobar');
};

done_testing;
__END__

[core]
bare=false
filemode=true
ignorecase=true
logallrefupdates=true
repositoryformatversion=0
