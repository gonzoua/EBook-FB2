# Copyright (c) 2009, 2010 Oleksandr Tymoshenko <gonzo@bluezbox.com>
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

package EBook::FB2::Description::Sequence;
use Moose;

has [qw/name number/] => ( isa => 'Str', is => 'rw' );

sub load 
{
    my ($self, $node) = @_;
    my $namenode = $node->getAttribute("name");
    $self->name($namenode);

    my $numnode = $node->getAttribute("number");
    if ($numnode) {
        $self->number($numnode);
    }
}

1;

__END__
=head1 NAME

EBook::FB2::Description::Sequence

=head1 SYNOPSIS

EBook::FB2::Description::Sequence - sequence of books

=head1 SUBROUTINES/METHODS

=over 4

=item name()

Returns sequence name

=item number()

Returns number in sequence

=back

=head1 AUTHOR

Oleksandr Tymoshenko, E<lt>gonzo@bluezbox.comE<gt>

=head1 BUGS

Please report any bugs or feature requests to  E<lt>gonzo@bluezbox.comE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright 2009, 2010 Oleksandr Tymoshenko.

L<http://bluezbox.com>

This module is free software; you can redistribute it and/or
modify it under the terms of the BSD license. See the F<LICENSE> file
included with this distribution.
