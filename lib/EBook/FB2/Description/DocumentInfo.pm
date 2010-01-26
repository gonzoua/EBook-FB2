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

package EBook::FB2::Description::DocumentInfo;
use Moose;
use Carp;

use EBook::FB2::Description::Author;

has [qw/program_used date src_ocr id version history/] => (isa => 'Str', is => 'rw');

has author => ( 
    isa     => 'ArrayRef',
    is => 'ro',
    traits  => ['Array'],
    default => sub { [] },
    handles => {
        authors     => 'elements',
        add_author  => 'push',
    },
);

has src_url => ( 
    isa     => 'ArrayRef',
    is => 'ro',
    traits  => ['Array'],
    default => sub { [] },
    handles => {
        src_urls    => 'elements',
        add_src_url => 'push',
    },
);

has publisher => ( 
    isa     => 'ArrayRef',
    is => 'ro',
    traits  => ['Array'],
    default => sub { [] },
    handles => {
        publishers      => 'elements',
        add_publisher   => 'push',
    },
);


sub load
{
    my ($self, $node) = @_;

    my @nodes = $node->findnodes('author');
    foreach my $author_node (@nodes) {
        my $author = EBook::FB2::Description::Author->new;
        $author->load($author_node);
        $self->add_author($author);
    }

    @nodes = $node->findnodes('program-used');
    if (@nodes) {
        $self->program_used($nodes[0]->string_value());
    }

    @nodes = $node->findnodes('date');
    if (@nodes == 0) {
        croak "Wrong number of <date> elements in <document-info>";
    }
    if (@nodes) {
        $self->date($nodes[0]->string_value());
    }

    @nodes = $node->findnodes('id');
    if (@nodes == 0) {
        croak "Wrong number of <id> elements in <document-info>";
    }
    if (@nodes) {
        $self->id($nodes[0]->string_value());
    }

    @nodes = $node->findnodes('src_url');
    foreach my $src_url_node (@nodes) {
        $self->add_src_url($src_url_node->string_value());
    }

    @nodes = $node->findnodes('src_ocr');
    if (@nodes) {
        $self->src_ocr($nodes[0]->string_value());
    }

    @nodes = $node->findnodes('history');
    if (@nodes) {
        $self->history($nodes[0]->string_value());
    }

    @nodes = $node->findnodes('publisher');
    foreach my $publisher_node (@nodes) {
        $self->add_publisher($publisher_node->string_value());
    }
}

sub add_sequence
{
    my ($self, $seq) = @_;
    push @{$self->sequnces()}, $seq;
}

1;
