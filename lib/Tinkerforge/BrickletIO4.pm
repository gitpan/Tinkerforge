
#############################################################
# This file was automatically generated on 2014-05-21.      #
#                                                           #
# Bindings Version 2.1.0                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickletIO4 - Device for controlling up to 4 general purpose input/output pins

=cut

package Tinkerforge::BrickletIO4;

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

This constant is used to identify a IO-4 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 29;

=item CALLBACK_INTERRUPT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_INTERRUPT callback.

=cut

use constant CALLBACK_INTERRUPT => 9;

=item CALLBACK_MONOFLOP_DONE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MONOFLOP_DONE callback.

=cut

use constant CALLBACK_MONOFLOP_DONE => 12;

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

=item FUNCTION_SET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIGURATION => 3;

=item FUNCTION_GET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIGURATION => 4;

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

=item FUNCTION_SET_MONOFLOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MONOFLOP => 10;

=item FUNCTION_GET_MONOFLOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MONOFLOP => 11;

=item FUNCTION_SET_SELECTED_VALUES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SELECTED_VALUES => 13;

=item FUNCTION_GET_EDGE_COUNT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT => 14;

=item FUNCTION_SET_EDGE_COUNT_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EDGE_COUNT_CONFIG => 15;

=item FUNCTION_GET_EDGE_COUNT_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EDGE_COUNT_CONFIG => 16;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant DIRECTION_IN => 'i';
use constant DIRECTION_OUT => 'o';
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

	$self->{response_expected}->{&FUNCTION_SET_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_MONOFLOP_DONE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_SELECTED_VALUES} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_INTERRUPT} = 'C C';
	$self->{callback_formats}->{&CALLBACK_MONOFLOP_DONE} = 'C C';

	bless($self, $class);

	return $self;
}


=item set_value()

Sets the output value (high or low) with a bitmask (4bit). A 1 in the bitmask
means high and a 0 in the bitmask means low.

For example: The value 3 or 0b0011 will turn the pins 0-1 high and the
pins 2-3 low.

.. note::
 This function does nothing for pins that are configured as input.
 Pull-up resistors can be switched on with :func:`SetConfiguration`.

=cut

sub set_value
{
	my ($self, $value_mask) = @_;

	$self->_send_request(&FUNCTION_SET_VALUE, [$value_mask], 'C', '');
}

=item get_value()

Returns a bitmask of the values that are currently measured.
This function works if the pin is configured to input
as well as if it is configured to output.

=cut

sub get_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VALUE, [], '', 'C');
}

=item set_configuration()

Configures the value and direction of the specified pins. Possible directions
are 'i' and 'o' for input and output.

If the direction is configured as output, the value is either high or low
(set as *true* or *false*).

If the direction is configured as input, the value is either pull-up or
default (set as *true* or *false*).

For example:

* (15, 'i', true) or (0b1111, 'i', true) will set all pins of as input pull-up.
* (8, 'i', false) or (0b1000, 'i', false) will set pin 3 of as input default (floating if nothing is connected).
* (3, 'o', false) or (0b0011, 'o', false) will set pins 0 and 1 as output low.
* (4, 'o', true) or (0b0100, 'o', true) will set pin 2 of as output high.

=cut

sub set_configuration
{
	my ($self, $selection_mask, $direction, $value) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIGURATION, [$selection_mask, $direction, $value], 'C a C', '');
}

=item get_configuration()

Returns a value bitmask and a direction bitmask. A 1 in the direction bitmask
means input and a 0 in the bitmask means output.

For example: A return value of (3, 5) or (0b0011, 0b0101) for direction and
value means that:

* pin 0 is configured as input pull-up,
* pin 1 is configured as input default,
* pin 2 is configured as output high and
* pin 3 is are configured as output low.

=cut

sub get_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIGURATION, [], '', 'C C');
}

=item set_debounce_period()

Sets the debounce period of the :func:`Interrupt` callback in ms.

For example: If you set this value to 100, you will get the interrupt
maximal every 100ms. This is necessary if something that bounces is
connected to the IO-4 Bricklet, such as a button.

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

For example: An interrupt bitmask of 10 or 0b1010 will enable the interrupt for
pins 1 and 3.

The interrupt is delivered with the callback :func:`Interrupt`.

=cut

sub set_interrupt
{
	my ($self, $interrupt_mask) = @_;

	$self->_send_request(&FUNCTION_SET_INTERRUPT, [$interrupt_mask], 'C', '');
}

=item get_interrupt()

Returns the interrupt bitmask as set by :func:`SetInterrupt`.

=cut

sub get_interrupt
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_INTERRUPT, [], '', 'C');
}

=item set_monoflop()

Configures a monoflop of the pins specified by the first parameter as 4 bit
long bitmask. The specified pins must be configured for output. Non-output
pins will be ignored.

The second parameter is a bitmask with the desired value of the specified
output pins. A 1 in the bitmask means high and a 0 in the bitmask means low.

The third parameter indicates the time (in ms) that the pins should hold
the value.

If this function is called with the parameters (9, 1, 1500) or
(0b1001, 0b0001, 1500): Pin 0 will get high and pin 3 will get low. In 1.5s pin
0 will get low and pin 3 will get high again.

A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
have a RS485 bus and an IO-4 Bricklet connected to one of the slave
stacks. You can now call this function every second, with a time parameter
of two seconds and pin 0 set to high. Pin 0 will be high all the time. If now
the RS485 connection is lost, then pin 0 will get low in at most two seconds.

=cut

sub set_monoflop
{
	my ($self, $selection_mask, $value_mask, $time) = @_;

	$self->_send_request(&FUNCTION_SET_MONOFLOP, [$selection_mask, $value_mask, $time], 'C C L', '');
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

	return $self->_send_request(&FUNCTION_GET_MONOFLOP, [$pin], 'C', 'C L L');
}

=item set_selected_values()

Sets the output value (high or low) with a bitmask, according to
the selection mask. The bitmask is 4 bit long, *true* refers to high 
and *false* refers to low.

For example: The parameters (9, 4) or (0b0110, 0b0100) will turn
pin 1 low and pin 2 high, pin 0 and 3 will remain untouched.

.. note::
 This function does nothing for pins that are configured as input.
 Pull-up resistors can be switched on with :func:`SetConfiguration`.

=cut

sub set_selected_values
{
	my ($self, $selection_mask, $value_mask) = @_;

	$self->_send_request(&FUNCTION_SET_SELECTED_VALUES, [$selection_mask, $value_mask], 'C C', '');
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

Configures the edge counter for the selected pins.

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

	$self->_send_request(&FUNCTION_SET_EDGE_COUNT_CONFIG, [$selection_mask, $edge_type, $debounce], 'C C C', '');
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
