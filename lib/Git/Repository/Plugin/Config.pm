package Git::Repository::Plugin::Config;
use 5.008_009;
use strict;
use warnings;
use Git::Repository::Plugin;
use Git::Repository::Plugin::Config::Object;
our @ISA = qw/Git::Repository::Plugin/;
our $VERSION = '0.01';

sub _keywords {
    return qw/ config /;
}

sub config {
    my ($r) = @_;
    return Git::Repository::Plugin::Config::Object->new(
        file => $r->git_dir() . '/config',
    );
}

1;
__END__

=head1 NAME

Git::Repository::Plugin::Config -

=head1 SYNOPSIS

  use Git::Repository 'Config';

  my $r = Git::Repository->new(...);
  my $config = $r->config;

=head1 DESCRIPTION

Git::Repository::Plugin::Config is

=head1 METHOD

=over 4

=item config()

=back

=head1 AUTHOR

issm E<lt>issmxx@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
