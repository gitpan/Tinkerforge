
#############################################################
# This file was automatically generated on 2014-12-10.      #
#                                                           #
# Bindings Version 2.1.4                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickletSolidStateRelay - Device for controlling AC and DC Solid State Relays

=cut

package Tinkerforge::BrickletSolidStateRelay;

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

This constant is used to identify a Solid State Relay Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 244;

=item CALLBACK_MONOFLOP_DONE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MONOFLOP_DONE callback.

=cut

use constant CALLBACK_MONOFLOP_DONE => 5;

=item FUNCTION_SET_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STATE => 1;

=item FUNCTION_GET_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STATE => 2;

=item FUNCTION_SET_MONOFLOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MONOFLOP => 3;

=item FUNCTION_GET_MONOFLOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MONOFLOP => 4;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;


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

	$self->{response_expected}->{&FUNCTION_SET_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_MONOFLOP_DONE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_MONOFLOP_DONE} = 'C';

	bless($self, $class);

	return $self;
}


=item set_state()

Sets the state of the relays *true* means on and *false* means off. 

Running monoflop timers will be overwritten if this function is called.

The default value is *false*.

=cut

sub set_state
{
	my ($self, $state) = @_;

	$self->_send_request(&FUNCTION_SET_STATE, [$state], 'C', '');
}

=item get_state()

Returns the state of the relay, *true* means on and *false* means off.

=cut

sub get_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STATE, [], '', 'C');
}

=item set_monoflop()

The first parameter  is the desired state of the relay (*true* means on 
and *false* means off). The second parameter indicates the time (in ms) that 
the relay should hold the state.

If this function is called with the parameters (true, 1500):
The relay will turn on and in 1.5s it will turn off again.

A monoflop can be used as a failsafe mechanism. For example: Lets assume you 
have a RS485 bus and a Solid State Relay Bricklet connected to one of the slave 
stacks. You can now call this function every second, with a time parameter
of two seconds. The relay will be on all the time. If now the RS485 
connection is lost, the relay will turn off in at most two seconds.

=cut

sub set_monoflop
{
	my ($self, $state, $time) = @_;

	$self->_send_request(&FUNCTION_SET_MONOFLOP, [$state, $time], 'C L', '');
}

=item get_monoflop()

Returns the current state and the time as set by 
:func:`SetMonoflop` as well as the remaining time until the state flips.

If the timer is not running currently, the remaining time will be returned
as 0.

=cut

sub get_monoflop
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MONOFLOP, [], '', 'C L L');
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
