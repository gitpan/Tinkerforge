
#############################################################
# This file was automatically generated on 2014-08-11.      #
#                                                           #
# Bindings Version 2.1.2                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickletIndustrialQuadRelay - Device for controlling up to 4 Solid State Relays

=cut

package Tinkerforge::BrickletIndustrialQuadRelay;

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

This constant is used to identify a Industrial Quad Relay Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 225;

=item CALLBACK_MONOFLOP_DONE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MONOFLOP_DONE callback.

=cut

use constant CALLBACK_MONOFLOP_DONE => 8;

=item FUNCTION_SET_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VALUE => 1;

=item FUNCTION_GET_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VALUE => 2;

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

=item FUNCTION_SET_GROUP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_GROUP => 5;

=item FUNCTION_GET_GROUP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_GROUP => 6;

=item FUNCTION_GET_AVAILABLE_FOR_GROUP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AVAILABLE_FOR_GROUP => 7;

=item FUNCTION_SET_SELECTED_VALUES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SELECTED_VALUES => 9;

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

	$self->{response_expected}->{&FUNCTION_SET_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_GROUP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_GROUP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_AVAILABLE_FOR_GROUP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_MONOFLOP_DONE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_SELECTED_VALUES} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_MONOFLOP_DONE} = 'S S';

	bless($self, $class);

	return $self;
}


=item set_value()

Sets the output value with a bitmask (16bit). A 1 in the bitmask means relay
closed and a 0 means relay open.

For example: The value 3 or 0b0011 will close the relay of pins 0-1 and open
the other pins.

If no groups are used (see :func:`SetGroup`), the pins correspond to the
markings on the Quad Relay Bricklet.

If groups are used, the pins correspond to the element in the group.
Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
pins 8-11 and element 4 pins 12-15.

=cut

sub set_value
{
	my ($self, $value_mask) = @_;

	$self->_send_request(&FUNCTION_SET_VALUE, [$value_mask], 'S', '');
}

=item get_value()

Returns the bitmask as set by :func:`SetValue`.

=cut

sub get_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VALUE, [], '', 'S');
}

=item set_monoflop()

Configures a monoflop of the pins specified by the first parameter
bitmask.

The second parameter is a bitmask with the desired value of the specified
pins. A 1 in the bitmask means relay closed and a 0 means relay open.

The third parameter indicates the time (in ms) that the pins should hold
the value.

If this function is called with the parameters (9, 1, 1500) or
(0b1001, 0b0001, 1500): Pin 0 will close and pin 3 will open. In 1.5s pin 0
will open and pin 3 will close again.

A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
have a RS485 bus and a Quad Relay Bricklet connected to one of the slave
stacks. You can now call this function every second, with a time parameter
of two seconds and pin 0 closed. Pin 0 will be closed all the time. If now
the RS485 connection is lost, then pin 0 will be opened in at most two seconds.

=cut

sub set_monoflop
{
	my ($self, $selection_mask, $value_mask, $time) = @_;

	$self->_send_request(&FUNCTION_SET_MONOFLOP, [$selection_mask, $value_mask, $time], 'S S L', '');
}

=item get_monoflop()

Returns (for the given pin) the current value and the time as set by
:func:`SetMonoflop` as well as the remaining time until the value flips.

If the timer is not running currently, the remaining time will be returned
as 0.

=cut

sub get_monoflop
{
	my ($self, $pin) = @_;

	return $self->_send_request(&FUNCTION_GET_MONOFLOP, [$pin], 'C', 'S L L');
}

=item set_group()

Sets a group of Quad Relay Bricklets that should work together. You can
find Bricklets that can be grouped together with :func:`GetAvailableForGroup`.

The group consists of 4 elements. Element 1 in the group will get pins 0-3,
element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.

Each element can either be one of the ports ('a' to 'd') or 'n' if it should
not be used.

For example: If you have two Quad Relay Bricklets connected to port A and
port B respectively, you could call with ``['a', 'b', 'n', 'n']``.

Now the pins on the Quad Relay on port A are assigned to 0-3 and the
pins on the Quad Relay on port B are assigned to 4-7. It is now possible
to call :func:`SetValue` and control two Bricklets at the same time.

=cut

sub set_group
{
	my ($self, $group) = @_;

	$self->_send_request(&FUNCTION_SET_GROUP, [$group], 'a4', '');
}

=item get_group()

Returns the group as set by :func:`SetGroup`

=cut

sub get_group
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_GROUP, [], '', 'a4');
}

=item get_available_for_group()

Returns a bitmask of ports that are available for grouping. For example the
value 5 or 0b0101 means: Port A and port C are connected to Bricklets that
can be grouped together.

=cut

sub get_available_for_group
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AVAILABLE_FOR_GROUP, [], '', 'C');
}

=item set_selected_values()

Sets the output value with a bitmask, according to the selection mask. 
The bitmask is 16 bit long, *true* refers to a closed relay and 
*false* refers to an open relay.

For example: The values (3, 1) or (0b0011, 0b0001) will close the relay of
pin 0, open the relay of pin 1 and leave the others untouched.

If no groups are used (see :func:`SetGroup`), the pins correspond to the
markings on the Quad Relay Bricklet.

If groups are used, the pins correspond to the element in the group.
Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
pins 8-11 and element 4 pins 12-15.

=cut

sub set_selected_values
{
	my ($self, $selection_mask, $value_mask) = @_;

	$self->_send_request(&FUNCTION_SET_SELECTED_VALUES, [$selection_mask, $value_mask], 'S S', '');
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
