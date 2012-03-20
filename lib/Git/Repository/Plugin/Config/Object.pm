package Git::Repository::Plugin::Config::Object;
use strict;
use warnings;
use Config::Tiny;

sub new {
    my ($class, %params) = @_;
    my $self = bless +{
        __file => $params{file},
    }, $class;
    $self->_init(%params);
    return $self;
}

sub _init {
    my ($self, %params) = @_;

    my $c = Config::Tiny->read( $self->{__file} );
    $self->{__c} = $c;

    return $self;
}

sub _split_keyname {
    my ($self, $k) = @_;
    $k =~ s/(^\.+|\.+$)//;
    $k =~ s/\.+/./g;

    my ($section, $property) = split /\./, $k;
    if ( ! defined $property ) {
        $property = $section;
        $section  = '_';
    }

    return ($section, $property);
}

sub get {
    my ($self, $key) = @_;
    my $c = $self->{__c};
    my ($s, $p) = $self->_split_keyname($key);
    return  unless defined $c->{$s};
    return $c->{$s}{$p};
}

sub set {
    my ($self, $key, $value) = @_;
    return  unless defined $value;

    my $c = $self->{__c};
    my ($s, $p) = $self->_split_keyname($key);
    $c->{$s} = +{}  unless defined $c->{$s};
    return $c->{$s}{$p} = $value;
}

sub append {
    my ($self, $key, $value, $delimiter) = @_;
    return  unless defined $value;

    my $_v = $self->get($key);
    $_v = ''  unless defined $_v;
    if ( defined $delimiter ) {
        if ( $_v eq '' ) {
            return $self->set($key, $value);
        }
        else {
            return $self->set( $key, $_v . $delimiter . $value );
        }
    }
    else {
        return $self->set( $key, $_v . $value );
    }
}

sub remove {
    my ($self, $key) = @_;
    my $c = $self->{__c};
    my ($s, $p) = $self->_split_keyname($key);
    return  unless defined $c->{$s};
    return delete $c->{$s}{$p};
}

sub remove_section {
    my ($self, $section) = @_;
    my $c = $self->{__c};
    return delete $c->{$section};
}

sub reread {
    my ($self) = @_;
    return ( $self->{__c} = Config::Tiny->read( $self->{__file} ) )  or  die Config::Tiny->errstr;
}

sub write {
    my ($self) = @_;
    return $self->{__c}->write( $self->{__file} )  or  die Config::Tiny->errstr;;
}


1;
__END__

=head1 NAME

Git::Repository::Plugin::Config::Object

=head1 CONSTRUCTOR

=over 4

=item $c = Git::Repository::Plugin::Config::Object->new(%params)

file => $file: Str

=back

=head1 METHODS

=over 4

=item $val = $c->get($key)

$key must be conposed "<section>.<property>" or "<property>".

=item $c->set($key, $val)

=item $c->append($key, $val, $delimiter)

=item $c->remove($key)

=item $c->remove_section($section)

=item $c->reread()

=item $c->write()

=back
