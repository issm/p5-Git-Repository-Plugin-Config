package t::Util;
use strict;
use warnings;
use Test::Git;
use Git::Repository::Plugin::Config::Object;

my @subs_imported = qw/
    new_config_object
/;

sub import {
    my ($class) = @_;
    my $caller = caller 0;

    no strict 'refs';
    for my $f ( @subs_imported ) {
        *{"$caller\::$f"} = \&$f;
    }
}

sub new_config_object {
    my $r = test_repository();
    my $config = Git::Repository::Plugin::Config::Object->new(
        file => $r->git_dir() . '/config',
    );
}


1;
