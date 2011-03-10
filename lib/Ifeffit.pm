# This file was automatically generated by SWIG (http://www.swig.org).
# Version 2.0.2
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

package Ifeffit;
use base qw(Exporter);
use base qw(DynaLoader);
package Ifeffitc;
bootstrap Ifeffit;
package Ifeffit;
@EXPORT = qw();

# ---------- BASE METHODS -------------

package Ifeffit;

sub TIEHASH {
    my ($classname,$obj) = @_;
    return bless $obj, $classname;
}

sub CLEAR { }

sub FIRSTKEY { }

sub NEXTKEY { }

sub FETCH {
    my ($self,$field) = @_;
    my $member_func = "swig_${field}_get";
    $self->$member_func();
}

sub STORE {
    my ($self,$field,$newval) = @_;
    my $member_func = "swig_${field}_set";
    $self->$member_func($newval);
}

sub this {
    my $ptr = shift;
    return tied(%$ptr);
}


# ------- FUNCTION WRAPPERS --------

package Ifeffit;

*iff_exec = *Ifeffitc::iff_exec;
*ifeffit = *Ifeffitc::ifeffit;
*iff_get_string = *Ifeffitc::iff_get_string;
*iff_put_string = *Ifeffitc::iff_put_string;
*iff_get_scalar = *Ifeffitc::iff_get_scalar;
*iff_put_scalar = *Ifeffitc::iff_put_scalar;
*iff_get_array = *Ifeffitc::iff_get_array;
*iff_put_array = *Ifeffitc::iff_put_array;
*iff_get_echo = *Ifeffitc::iff_get_echo;
*iff_strval = *Ifeffitc::iff_strval;
*iff_scaval = *Ifeffitc::iff_scaval;
*ifeffit_ = *Ifeffitc::ifeffit_;
*iffgetstr_ = *Ifeffitc::iffgetstr_;
*iffgetsca_ = *Ifeffitc::iffgetsca_;
*iffgetarr_ = *Ifeffitc::iffgetarr_;
*iffputarr_ = *Ifeffitc::iffputarr_;
*iffgetecho_ = *Ifeffitc::iffgetecho_;
*new_Pint = *Ifeffitc::new_Pint;
*copy_Pint = *Ifeffitc::copy_Pint;
*delete_Pint = *Ifeffitc::delete_Pint;
*Pint_assign = *Ifeffitc::Pint_assign;
*Pint_value = *Ifeffitc::Pint_value;
*new_Pdbl = *Ifeffitc::new_Pdbl;
*copy_Pdbl = *Ifeffitc::copy_Pdbl;
*delete_Pdbl = *Ifeffitc::delete_Pdbl;
*Pdbl_assign = *Ifeffitc::Pdbl_assign;
*Pdbl_value = *Ifeffitc::Pdbl_value;
*new_Parr = *Ifeffitc::new_Parr;
*delete_Parr = *Ifeffitc::delete_Parr;
*Parr_getitem = *Ifeffitc::Parr_getitem;
*Parr_setitem = *Ifeffitc::Parr_setitem;

# ------- VARIABLE STUBS --------

package Ifeffit;

use version;
require Exporter;
require DynaLoader;
@ISA = qw(Exporter DynaLoader);
@EXPORT = qw(ifeffit);
@EXPORT_OK = qw(get_scalar put_scalar get_string put_string
		get_array  put_array get_echo);

$VERSION   = version->new('3.0.1');
bootstrap Ifeffit $VERSION;
my $MAX_ARRAY_PTS = 16384;

sub ifeffit ($) {
    my @com = split(/\n/, $_[0]);
    my ($c, $ret) ;
    foreach $c (@com) {$ret = Ifeffit::iff_exec($c); };
    return $ret;
}

sub get_scalar ($) {
    my $ptr = new_Pdbl();
    my $val = undef;
    if (Ifeffit::iff_get_scalar($_[0],$ptr) == 0) {
	$val = Pdbl_value($ptr);
    }
    delete_Pdbl($ptr);
    return $val;
}

sub put_scalar ($$) {
    return (ifeffit("set $_[0] = $_[1]")) ? undef: $_[1];
}

sub get_string ($) {
    my $str = " "x512;
    my $len = Ifeffit::iff_get_string($_[0],$str);
    return ($len) ?  substr($str,0,$len) : " ";
}

sub put_string ($$) {
    my $inp = $_[0];
    $inp = "\$".$inp unless ($inp =~ /^(\$)/o);
    my $str = $_[1];
    $str = "\"" . $str . "\"" unless ($str =~ /^\".*\"$/);
    return ifeffit("set $inp =  $str");
}

sub get_array ($) {  # note the use of MAX_ARRAY_PTS !!!
    my ($ptr,$npts,$i);
    my @arr  = ();
    $ptr  = new_Parr($MAX_ARRAY_PTS);
    $npts = Ifeffit::iff_get_array($_[0],$ptr);
    if ($npts) {
	for ($i = 0; $i < $npts; $i++) { $arr[$i] = Parr_getitem($ptr,$i);}
    }
    delete_Parr($ptr);
    return @arr;
}

sub put_array ($$) {
    my $npts   = $#{$_[1]} + 1;
    my ($i,$x,$p_n,$ret,$ptr);
    if ($npts > $MAX_ARRAY_PTS) { $npts = $MAX_ARRAY_PTS;}
    $ptr    = new_Parr($npts);
    for ($i = 0; $i < $npts; $i++) { Parr_setitem($ptr, $i, ${$_[1]}[$i]); }
    $p_n    = new_Pint();
    Pint_assign($p_n, $npts);
    $ret = Ifeffit::iff_put_array($_[0], $p_n, $ptr);
    delete_Pint($p_n);
    delete_Parr($ptr);
    return $ret;
}

sub get_echo () {
    my $str = " "x512;
    my $len = Ifeffit::iff_get_echo($str);
    return ($len) ?  substr($str,0,$len) : " ";
}


# INITIALIZATION Code
# and get compiled-in parameters for max array size.
&ifeffit(" \n");
$MAX_ARRAY_PTS = get_scalar("&maxpts");

1;
