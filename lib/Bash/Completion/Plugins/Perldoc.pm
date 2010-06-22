package Bash::Completion::Plugins::Perldoc;
BEGIN {
  $Bash::Completion::Plugins::Perldoc::VERSION = '0.001';
}

# ABSTRACT: complete perldoc command line

use strict;
use warnings;
use parent 'Bash::Completion::Plugin';
use Bash::Completion::Utils
  qw( command_in_path match_perl_modules prefix_match );


sub should_activate {
  my @commands = ('perldoc');
  return [grep { command_in_path($_) } @commands];
}



sub generate_bash_setup { return [qw( nospace default )] }



sub complete {
  my ($class, $req) = @_;

  $req->candidates(match_perl_modules($req->word));
}

1;



=pod

=head1 NAME

Bash::Completion::Plugins::Perldoc - complete perldoc command line

=head1 VERSION

version 0.001

=head1 SYNOPSIS

    ## not to be used directly

=head1 DESCRIPTION

A plugin for the C<perldoc> command. Completes module names, for now.

A future version should use the work of Aristotle Pagaltzis at
L<http://github.com/ap/perldoc-complete>.

=head1 METHODS

=head2 should_activate

Activate this C<Bash::Completion::Plugins::Perldoc> plugin if we can
find the C<perldoc> command.

=head2 generate_bash_setup

Make sure we use bash C<complete> options C<nospace> and C<default>.

=head2 complete

Completion logic for C<perldoc>. Completes Perl modules only for now.

=head1 AUTHOR

Pedro Melo <melo@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Pedro Melo.

This is free software, licensed under:

  The Artistic License 2.0

=cut


__END__

