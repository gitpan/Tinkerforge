
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

Tinkerforge::BrickletIndustrialDigitalIn4 - Device for controlling up to 4 optically coupled digital inputs

=cut

package Tinkerforge::BrickletIndustrialDigitalIn4;

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

This constant is used to identify a Industrial Digital In 4 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 223;

=item CALLBACK_INTERRUPT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_INTERRUPT callback.

=cut

use constant CALLBACK_INTERRUPT => 9;

=item FUNCTION_GET_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VALUE => 1;

=item FUNCTION_SET_GROUP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_GROUP => 2;

=item FUNCTION_GET_GROUP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_GROUP => 3;

=item FUNCTION_GET_AVAILABLE_FOR_GROUP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AVAILABLE_FOR_GROUP => 4;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 5;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 6;

=item FUNCTION_SET_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_INTERRUPT => 7;

=item FUNCTION_GET_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_INTERRUPT => 8;

=item FUNCTION_GET_EDGE_COUNT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT => 10;

=item FUNCTION_SET_EDGE_COUNT_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EDGE_COUNT_CONFIG => 11;

=item FUNCTION_GET_EDGE_COUNT_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT_CONFIG => 12;

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

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 1]);

	$self->{response_expected}->{&FUNCTION_GET_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_GROUP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_GROUP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_AVAILABLE_FOR_GROUP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_INTERRUPT} = 'S S';

	bless($self, $class);

	return $self;
}


=item get_value()

Returns the input value with a bitmask. The bitmask is 16bit long, *true*
refers to high and *false* refers to low.

For example: The value 3 or 0b0011 means that pins 0-1 are high and the other
pins are low.

If no groups are used (see :func:`SetGroup`), the pins correspond to the
markings on the Digital In 4 Bricklet.

If groups are used, the pins correspond to the element in the group.
Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
pins 8-11 and element 4 pins 12-15.

=cut

sub get_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VALUE, [], '', 'S');
}

=item set_group()

Sets a group of Digital In 4 Bricklets that should work together. You can
find Bricklets that can be grouped together with :func:`GetAvailableForGroup`.

The group consists of 4 elements. Element 1 in the group will get pins 0-3,
element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.

Each element can either be one of the ports ('a' to 'd') or 'n' if it should
not be used.

For example: If you have two Digital In 4 Bricklets connected to port A and
port B respectively, you could call with ``['a', 'b', 'n', 'n']``.

Now the pins on the Digital In 4 on port A are assigned to 0-3 and the
pins on the Digital In 4 on port B are assigned to 4-7. It is now possible
to call :func:`GetValue` and read out two Bricklets at the same time.

Changing the group configuration resets all edge counter configurations
and values.

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

=item set_debounce_period()

Sets the debounce period of the :func:`Interrupt` callback in ms.

For example: If you set this value to 100, you will get the interrupt
maximal every 100ms. This is necessary if something that bounces is
connected to the Digital In 4 Bricklet, such as a button.

The default value is 100.

=cut

sub set_debounce_period
{
	my ($self, $debounce) = @_;

	$self->_send_request(&FUNCTION_SET_DEBOUNCE_PERIOD, [$debounce], 'L', '');
}

=item get_debounce_period()

Returns the debounce period as set by :func:`SetDebouncePeriod`.

=cut

sub get_debounce_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DEBOUNCE_PERIOD, [], '', 'L');
}

=item set_interrupt()

Sets the pins on which an interrupt is activated with a bitmask.
Interrupts are triggered on changes of the voltage level of the pin,
i.e. changes from high to low and low to high.

For example: An interrupt bitmask of 9 or 0b1001 will enable the interrupt for
pins 0 and 3.

The interrupts use the grouping as set by :func:`SetGroup`.

The interrupt is delivered with the callback :func:`Interrupt`.

=cut

sub set_interrupt
{
	my ($self, $interrupt_mask) = @_;

	$self->_send_request(&FUNCTION_SET_INTERRUPT, [$interrupt_mask], 'S', '');
}

=item get_interrupt()

Returns the interrupt bitmask as set by :func:`SetInterrupt`.

=cut

sub get_interrupt
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_INTERRUPT, [], '', 'S');
}

=item get_edge_count()

Returns the current value of the edge counter for the selected pin. You can
configure the edges that are counted with :func:`SetEdgeCountConfig`.

If you set the reset counter to *true*, the count is set back to 0
directly after it is read.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub get_edge_count
{
	my ($self, $pin, $reset_counter) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_COUNT, [$pin, $reset_counter], 'C C', 'L');
}

=item set_edge_count_config()

Configures the edge counter for the selected pins. A bitmask of 9 or 0b1001 will
enable the edge counter for pins 0 and 3.

The edge type parameter configures if rising edges, falling edges or
both are counted if the pin is configured for input. Possible edge types are:

* 0 = rising (default)
* 1 = falling
* 2 = both

The debounce time is given in ms.

Configuring an edge counter resets its value to 0.

If you don't know what any of this means, just leave it at default. The
default configuration is very likely OK for you.

Default values: 0 (edge type) and 100ms (debounce time)

.. versionadded:: 2.0.1~(Plugin)

=cut

sub set_edge_count_config
{
	my ($self, $selection_mask, $edge_type, $debounce) = @_;

	$self->_send_request(&FUNCTION_SET_EDGE_COUNT_CONFIG, [$selection_mask, $edge_type, $debounce], 'S C C', '');
}

=item get_edge_count_config()

Returns the edge type and debounce time for the selected pin as set by
:func:`SetEdgeCountConfig`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub get_edge_count_config
{
	my ($self, $pin) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_COUNT_CONFIG, [$pin], 'C', 'C C');
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
