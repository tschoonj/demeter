package Demeter::Atoms::Absorption;

=for Copyright
 .
 Copyright (c) 2006-2008 Bruce Ravel (bravel AT bnl DOT gov).
 All rights reserved.
 .
 This file is free software; you can redistribute it and/or
 modify it under the same terms as Perl itself. See The Perl
 Artistic License.
 .
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut

use Moose::Role;

use Carp;
use Readonly;
use Xray::Absorption;
use Xray::Fluorescence;
Readonly my $ETOK    => 0.262468292;



sub _absorption {
  my ($self) = @_;
  $self->populate if (not $self->is_populated);
  my $cell = $self->cell;
  my $absorber = scalar $cell->central($self->core);

  my $energy   = Xray::Absorption -> get_energy($absorber->element, $self->edge);
  my $contents = $cell->contents;

  my $bravais  = $cell->bravais;
  my $brav     = ($#{$bravais}+4) / 3;
  my $volume   = $cell->volume;
  my ($mass, $xsec, $delta_mu) = (0,0,0);
  my %cache = ();		# memoize and call cross_section less often
  foreach my $position (@{$contents}) {
    my $site    = $position->[0];
    my $element = $site->element;
    my $factor  = 1; #$this_occ; # $occ ? $this_occ : 1; # consider site occupancy??
    my $weight  = Xray::Absorption -> get_atomic_weight($element);
    $mass      += $weight*$factor;
    $cache{lc($element)} ||=
      scalar Xray::Absorption -> cross_section($element, $energy+50);
    $xsec += $cache{lc($element)} * $factor;
    if ($absorber->element eq $element) {
      $delta_mu += ($factor/$brav) *
	( $cache{lc($element)} -
	  scalar Xray::Absorption -> cross_section($element, $energy-50) );
    };
  };
  $mass     *= 1.66053/$volume; ## atomic mass unit = 1.66053e-24 gram
  $xsec     /= $volume;
  $delta_mu /= $volume;
  $self->set(xsec		=> sprintf("%.3f", 10000/$xsec),
	     deltamu		=> sprintf("%.3f", 10000/$delta_mu),
	     density		=> sprintf("%.3f", $mass),
	     absorption_done	=> 1
	    );
};

sub _mcmaster {
  my ($self)   = @_;
  return $self->mcmaster if $self->mcmaster_done;
  my $cell     = $self->cell;
  my $absorber = scalar $cell->central($self->core);
  my $central  = $absorber->element;
  my $edge     = $self->edge;
  my $mcmsig   = Xray::Fluorescence->mcmaster($central, $edge);
  $self->set(mcmaster => sprintf("%8.5f", $mcmsig),
	     mcmaster_done => 1);
  return $self->mcmaster;
};


sub _i0 {
  my ($self) = @_;
  return $self->i0 if $self->i0_done;

  my $cell = $self->cell;
  my $absorber = scalar $cell->central($self->core);
  my $central  = $absorber->element;
  my $edge     = $self->edge;

  my %gases = ();
  map {$gases{$_} = $self->$_ } qw(nitrogen argon krypton);
  my $i0sig   = Xray::Fluorescence->i0($central, $edge, \%gases);
  $self->set(i0 => sprintf("%8.5f", $i0sig),
	     i0_done => 1);

  return $self->i0;
};


sub _self {
  my ($self) = @_;
  my $cell     = $self->cell;
  my $absorber = scalar $cell->central($self->core);
  my $central  = $absorber->element;
  my $edge     = $self->edge;
  my $contents = $cell -> contents;
  my %count    = ();
  foreach my $position (@{$contents}) {
    my $site = $position->[0];
    ++$count{$site -> element};
  };
  my @answer = Xray::Fluorescence->self($central, $edge, \%count);

  $self->set(selfamp   => sprintf("%6.3f", $answer[0]),
	     selfsig   => sprintf("%8.5f", $answer[1]),
	     self_done => 1
	    );
};

1;

=head1 NAME

Demeter::Atoms::Absorption - Interaction with tables of absorption coefficients

=head1 VERSION

This documentation refers to Demeter version 0.2.

=head1 DESCRIPTION

This role of L<Demeter::Atoms> provides all of the methods involved in
calculations using tables of X-ray absorption coefficients provided by
the L<Xray::Absorption> package and the methods of the
L<Xray::Fluorescence> package.

=head1 METHODS

There are no outward-looking methods in this Moose role.  The methods
here are for computing the various Atoms attributes based on tables
of absorption coefficients.

=head1 BUGS AND LIMITATIONS

Fourth cumulant corrections are not calculated.

Please report problems to Bruce Ravel (bravel AT bnl DOT gov)

Patches are welcome.

=head1 AUTHOR

Bruce Ravel (bravel AT bnl DOT gov)

L<http://cars9.uchicago.edu/~ravel/software/>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2006-2008 Bruce Ravel (bravel AT bnl DOT gov). All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlgpl>.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
