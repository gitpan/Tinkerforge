
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

Tinkerforge::BrickletRemoteSwitch - Device that controls mains switches remotely

=cut

package Tinkerforge::BrickletRemoteSwitch;

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

This constant is used to identify a Remote Switch Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 235;

=item CALLBACK_SWITCHING_DONE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_SWITCHING_DONE callback.

=cut

use constant CALLBACK_SWITCHING_DONE => 3;

=item FUNCTION_SWITCH_SOCKET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SWITCH_SOCKET => 1;

=item FUNCTION_GET_SWITCHING_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SWITCHING_STATE => 2;

=item FUNCTION_SET_REPEATS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_REPEATS => 4;

=item FUNCTION_GET_REPEATS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_REPEATS => 5;

=item FUNCTION_SWITCH_SOCKET_A

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SWITCH_SOCKET_A => 6;

=item FUNCTION_SWITCH_SOCKET_B

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SWITCH_SOCKET_B => 7;

=item FUNCTION_DIM_SOCKET_B

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DIM_SOCKET_B => 8;

=item FUNCTION_SWITCH_SOCKET_C

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SWITCH_SOCKET_C => 9;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant SWITCH_TO_OFF => 0;
use constant SWITCH_TO_ON => 1;
use constant SWITCHING_STATE_READY => 0;
use constant SWITCHING_STATE_BUSY => 1;


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

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 1]);

	$self->{response_expected}->{&FUNCTION_SWITCH_SOCKET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_SWITCHING_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_SWITCHING_DONE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_REPEATS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_REPEATS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SWITCH_SOCKET_A} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SWITCH_SOCKET_B} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DIM_SOCKET_B} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SWITCH_SOCKET_C} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_SWITCHING_DONE} = '';

	bless($self, $class);

	return $self;
}


=item switch_socket()

This function is deprecated, use :func:`SwitchSocketA` instead.

=cut

sub switch_socket
{
	my ($self, $house_code, $receiver_code, $switch_to) = @_;

	$self->_send_request(&FUNCTION_SWITCH_SOCKET, [$house_code, $receiver_code, $switch_to], 'C C C', '');
}

=item get_switching_state()

Returns the current switching state. If the current state is busy, the
Bricklet is currently sending a code to switch a socket. It will not
accept any calls of :func:`SwitchSocket` until the state changes to ready.

How long the switching takes is dependent on the number of repeats, see
:func:`SetRepeats`.

=cut

sub get_switching_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_SWITCHING_STATE, [], '', 'C');
}

=item set_repeats()

Sets the number of times the code is send when of the :func:`SwitchSocket`
functions is called. The repeats basically correspond to the amount of time
that a button of the remote is pressed.

Some dimmers are controlled by the length of a button pressed,
this can be simulated by increasing the repeats.

The default value is 5.

=cut

sub set_repeats
{
	my ($self, $repeats) = @_;

	$self->_send_request(&FUNCTION_SET_REPEATS, [$repeats], 'C', '');
}

=item get_repeats()

Returns the number of repeats as set by :func:`SetRepeats`.

=cut

sub get_repeats
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_REPEATS, [], '', 'C');
}

=item switch_socket_a()

To switch a type A socket you have to give the house code, receiver code and the
state (on or off) you want to switch to.

The house code and receiver code have a range of 0 to 31 (5bit).

A detailed description on how you can figure out the house and receiver code
can be found :ref:`here <remote_switch_bricklet_type_a_house_and_receiver_code>`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub switch_socket_a
{
	my ($self, $house_code, $receiver_code, $switch_to) = @_;

	$self->_send_request(&FUNCTION_SWITCH_SOCKET_A, [$house_code, $receiver_code, $switch_to], 'C C C', '');
}

=item switch_socket_b()

To switch a type B socket you have to give the address, unit and the state
(on or off) you want to switch to.

The address has a range of 0 to 67108863 (26bit) and the unit has a range
of 0 to 15 (4bit). To switch all devices with the same address use 255 for
the unit.

A detailed description on how you can teach a socket the address and unit can
be found :ref:`here <remote_switch_bricklet_type_b_address_and_unit>`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub switch_socket_b
{
	my ($self, $address, $unit, $switch_to) = @_;

	$self->_send_request(&FUNCTION_SWITCH_SOCKET_B, [$address, $unit, $switch_to], 'L C C', '');
}

=item dim_socket_b()

To control a type B dimmer you have to give the address, unit and the
dim value you want to set the dimmer to.

The address has a range of 0 to 67108863 (26bit), the unit and the dim value
has a range of 0 to 15 (4bit).

A detailed description on how you can teach a dimmer the address and unit can
be found :ref:`here <remote_switch_bricklet_type_b_address_and_unit>`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub dim_socket_b
{
	my ($self, $address, $unit, $dim_value) = @_;

	$self->_send_request(&FUNCTION_DIM_SOCKET_B, [$address, $unit, $dim_value], 'L C C', '');
}

=item switch_socket_c()

To switch a type C socket you have to give the system code, device code and the
state (on or off) you want to switch to.

The system code has a range of 'A' to 'P' (4bit) and the device code has a
range of 1 to 16 (4bit).

A detailed description on how you can figure out the system and device code
can be found :ref:`here <remote_switch_bricklet_type_c_system_and_device_code>`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub switch_socket_c
{
	my ($self, $system_code, $device_code, $switch_to) = @_;

	$self->_send_request(&FUNCTION_SWITCH_SOCKET_C, [$system_code, $device_code, $switch_to], 'a C C', '');
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
