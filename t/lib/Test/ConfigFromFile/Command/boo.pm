package Test::ConfigFromFile::Command::boo;
use Any::Moose;
use YAML();

extends any_moose('X::App::Cmd::Command');
with any_moose('X::ConfigFromFile');

=head1 NAME

Test::MyCmd::Command::boo - reads from config file

=cut

has 'moo' => (
    isa           => "ArrayRef",
    is            => "ro",
    required      => 1,
    auto_deref    => 1,
    documentation => "required option field",
);

sub _get_default_configfile {'t/lib/Test/ConfigFromFile/config.yaml'}

sub execute {
    my ( $self, $opt, $arg ) = @_;

    die( "ghosts go " . join( ' ', $self->moo ) );
}

sub get_config_from_file {
    my ( $self, $file ) = @_;

    return YAML::LoadFile($file);
}

1;
