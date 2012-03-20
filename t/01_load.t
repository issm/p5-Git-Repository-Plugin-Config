use strict;
use warnings;
use Test::More;
use Test::Git;
use Git::Repository 'Config';

my $r = test_repository();
ok $r->can('config'), 'can call method "config"';

my $c = $r->config();
isa_ok $c, 'Git::Repository::Plugin::Config::Object';
for my $meth (qw/
    get
    set
    append
    remove
    remove_section
    reread
    write
/) {
    ok $c->can($meth), qq{can call method "$meth"};
}

done_testing;
