# $Id: Rules.pm,v 1.1.2.1 2006/11/25 08:12:37 joern Exp $

#-----------------------------------------------------------------------
# Copyright (C) 2001-2006 J�rn Reder <joern AT zyn.de>.
# All Rights Reserved. See file COPYRIGHT for details.
#
# This module is part of Video::DVDRip, which is free software; you can
# redistribute it and/or modify it under the same terms as Perl itself.
#-----------------------------------------------------------------------

package Video::DVDRip::GUI::Rules;

use strict;

use base qw(Gtk2::Ex::FormFactory::Rules);

sub new {
    my $class = shift;
    
    my $self = $class->SUPER::new(@_);
    
    my $rules = $self->get_rules;
    my $msg   = $self->get_rules_messages;
    
    $rules->{"project-name"} = sub { $_[0] =~ m!^[-\w.]+$!i };
    $rules->{"project-path"} = sub { $_[0] =~ m!^[-\w./]+$!i };
    
    $msg->{"project-name"} = "Project name must contain no special characters";
    $msg->{"project-path"} = "Path must contain no special characters";

    return $self;
}

1;
