
#############################################################
# This file was automatically generated on 2014-12-10.      #
#                                                           #
# Bindings Version 2.1.3                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickletHallEffect - Device that detects presence of magnetic field via hall effect

=cut

package Tinkerforge::BrickletHallEffect;

use strict;
use warnings;
use Carp;
use threads;
use threads::shared;
use parent 'Tinkerforge::Device';
use Tinkerforge::IPConnection;
use Tinkerforge::Error;

=head1 CONSTANTS

=over

=item DEVICE_IDENTIFIER

This constant is used to identify a Hall Effect Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 240;

=item CALLBACK_EDGE_COUNT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_EDGE_COUNT callback.

=cut

use constant CALLBACK_EDGE_COUNT => 10;

=item FUNCTION_GET_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VALUE => 1;

=item FUNCTION_GET_EDGE_COUNT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT => 2;

=item FUNCTION_SET_EDGE_COUNT_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EDGE_COUNT_CONFIG => 3;

=item FUNCTION_GET_EDGE_COUNT_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT_CONFIG => 4;

=item FUNCTION_SET_EDGE_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EDGE_INTERRUPT => 5;

=item FUNCTION_GET_EDGE_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_INTERRUPT => 6;

=item FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD => 7;

=item FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD => 8;

=item FUNCTION_EDGE_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_EDGE_INTERRUPT => 9;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant EDGE_TYPE_RISING => 0;
use constant EDGE_TYPE_FALLING => 1;
use constant EDGE_TYPE_BOTH => 2;


=back

=head1 FUNCTIONS

=over

=item new()

Creates an object with the unique device ID *uid* and adds it to
the IP Connection *ipcon*.

=cut

sub new
{
	my ($class, $uid, $ipcon) = @_;

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 0]);

	$self->{response_expected}->{&FUNCTION_GET_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EDGE_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_EDGE_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_EDGE_COUNT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_EDGE_COUNT} = 'L C';

	bless($self, $class);

	return $self;
}


=item get_value()

Returns *true* if a magnetic field of 35 Gauss (3.5mT) or greater is detected.

=cut

sub get_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VALUE, [], '', 'C');
}

=item get_edge_count()

Returns the current value of the edge counter. You can configure
edge type (rising, falling, both) that is counted with
:func:`SetEdgeCountConfig`.

If you set the reset counter to *true*, the count is set back to 0
directly after it is read.

=cut

sub get_edge_count
{
	my ($self, $reset_counter) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_COUNT, [$reset_counter], 'C', 'L');
}

=item set_edge_count_config()

The edge type parameter configures if rising edges, falling edges or 
both are counted. Possible edge types are:

* 0 = rising (default)
* 1 = falling
* 2 = both

A magnetic field of 35 Gauss (3.5mT) or greater causes a falling edge and a
magnetic field of 25 Gauss (2.5mT) or smaller causes a rising edge.

If a magnet comes near the Bricklet the signal goes low (falling edge), if
a magnet is removed from the vicinity the signal goes high (rising edge).

The debounce time is given in ms.

Configuring an edge counter resets its value to 0.

If you don't know what any of this means, just leave it at default. The
default configuration is very likely OK for you.

Default values: 0 (edge type) and 100ms (debounce time)

=cut

sub set_edge_count_config
{
	my ($self, $edge_type, $debounce) = @_;

	$self->_send_request(&FUNCTION_SET_EDGE_COUNT_CONFIG, [$edge_type, $debounce], 'C C', '');
}

=item get_edge_count_config()

Returns the edge type and debounce time as set by :func:`SetEdgeCountConfig`.

=cut

sub get_edge_count_config
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_COUNT_CONFIG, [], '', 'C C');
}

=item set_edge_interrupt()

Sets the number of edges until an interrupt is invoked.

If *edges* is set to n, an interrupt is invoked for every n-th detected edge.

If *edges* is set to 0, the interrupt is disabled.

Default value is 0.

=cut

sub set_edge_interrupt
{
	my ($self, $edges) = @_;

	$self->_send_request(&FUNCTION_SET_EDGE_INTERRUPT, [$edges], 'L', '');
}

=item get_edge_interrupt()

Returns the edges as set by :func:`SetEdgeInterrupt`.

=cut

sub get_edge_interrupt
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_INTERRUPT, [], '', 'L');
}

=item set_edge_count_callback_period()

Sets the period in ms with which the :func:`EdgeCount` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`EdgeCount` is only triggered if the edge count has changed since the
last triggering.

The default value is 0.

=cut

sub set_edge_count_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_edge_count_callback_period()

Returns the period as set by :func:`SetEdgeCountCallbackPeriod`.

=cut

sub get_edge_count_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD, [], '', 'L');
}

=item edge_interrupt()

This callback is triggered every n-th count, as configured with
:func:`SetEdgeInterrupt`. The parameters are the
current count and the current value (see :func:`GetValue` and :func:`GetEdgeCount`).

=cut

sub edge_interrupt
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_EDGE_INTERRUPT, [], '', 'L C');
}

=item get_identity()

Returns the UID, the UID where the Bricklet is connected to, 
the position, the hardware and firmware version as well as the
device identifier.

The position can be 'a', 'b', 'c' or 'd'.

The device identifier numbers can be found :ref:`here <device_identifier>`.
|device_identifier_constant|

=cut

sub get_identity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_IDENTITY, [], '', 'Z8 Z8 a C3 C3 S');
}
=back
=cut

1;
