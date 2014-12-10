
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

Tinkerforge::BrickletIO16 - Device for controlling up to 16 general purpose input/output pins

=cut

package Tinkerforge::BrickletIO16;

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

This constant is used to identify a IO-16 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 28;

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

=item FUNCTION_SET_PORT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PORT => 1;

=item FUNCTION_GET_PORT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PORT => 2;

=item FUNCTION_SET_PORT_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PORT_CONFIGURATION => 3;

=item FUNCTION_GET_PORT_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PORT_CONFIGURATION => 4;

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

=item FUNCTION_SET_PORT_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PORT_INTERRUPT => 7;

=item FUNCTION_GET_PORT_INTERRUPT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PORT_INTERRUPT => 8;

=item FUNCTION_SET_PORT_MONOFLOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PORT_MONOFLOP => 10;

=item FUNCTION_GET_PORT_MONOFLOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PORT_MONOFLOP => 11;

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

	$self->{response_expected}->{&FUNCTION_SET_PORT} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PORT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PORT_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PORT_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PORT_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PORT_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_INTERRUPT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_PORT_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PORT_MONOFLOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_MONOFLOP_DONE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_SELECTED_VALUES} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EDGE_COUNT_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_INTERRUPT} = 'a C C';
	$self->{callback_formats}->{&CALLBACK_MONOFLOP_DONE} = 'a C C';

	bless($self, $class);

	return $self;
}


=item set_port()

Sets the output value (high or low) for a port ("a" or "b") with a bitmask
(8bit). A 1 in the bitmask means high and a 0 in the bitmask means low.

For example: The value 15 or 0b00001111 will turn the pins 0-3 high and the
pins 4-7 low for the specified port.

.. note::
 This function does nothing for pins that are configured as input.
 Pull-up resistors can be switched on with :func:`SetPortConfiguration`.

=cut

sub set_port
{
	my ($self, $port, $value_mask) = @_;

	$self->_send_request(&FUNCTION_SET_PORT, [$port, $value_mask], 'a C', '');
}

=item get_port()

Returns a bitmask of the values that are currently measured on the
specified port. This function works if the pin is configured to input
as well as if it is configured to output.

=cut

sub get_port
{
	my ($self, $port) = @_;

	return $self->_send_request(&FUNCTION_GET_PORT, [$port], 'a', 'C');
}

=item set_port_configuration()

Configures the value and direction of a specified port. Possible directions
are 'i' and 'o' for input and output.

If the direction is configured as output, the value is either high or low
(set as *true* or *false*).

If the direction is configured as input, the value is either pull-up or
default (set as *true* or *false*).

For example:

* ('a', 255, 'i', true) or ('a', 0b11111111, 'i', true) will set all pins of port A as input pull-up.
* ('a', 128, 'i', false) or ('a', 0b10000000, 'i', false) will set pin 7 of port A as input default (floating if nothing is connected).
* ('b', 3, 'o', false) or ('b', 0b00000011, 'o', false) will set pins 0 and 1 of port B as output low.
* ('b', 4, 'o', true) or ('b', 0b00000100, 'o', true) will set pin 2 of port B as output high.

The default configuration is input with pull-up.

=cut

sub set_port_configuration
{
	my ($self, $port, $selection_mask, $direction, $value) = @_;

	$self->_send_request(&FUNCTION_SET_PORT_CONFIGURATION, [$port, $selection_mask, $direction, $value], 'a C a C', '');
}

=item get_port_configuration()

Returns a direction bitmask and a value bitmask for the specified port. A 1 in
the direction bitmask means input and a 0 in the bitmask means output.

For example: A return value of (15, 51) or (0b00001111, 0b00110011) for
direction and value means that:

* pins 0 and 1 are configured as input pull-up,
* pins 2 and 3 are configured as input default,
* pins 4 and 5 are configured as output high
* and pins 6 and 7 are configured as output low.

=cut

sub get_port_configuration
{
	my ($self, $port) = @_;

	return $self->_send_request(&FUNCTION_GET_PORT_CONFIGURATION, [$port], 'a', 'C C');
}

=item set_debounce_period()

Sets the debounce period of the :func:`Interrupt` callback in ms.

For example: If you set this value to 100, you will get the interrupt
maximal every 100ms. This is necessary if something that bounces is
connected to the IO-16 Bricklet, such as a button.

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

=item set_port_interrupt()

Sets the pins on which an interrupt is activated with a bitmask.
Interrupts are triggered on changes of the voltage level of the pin,
i.e. changes from high to low and low to high.

For example: ('a', 129) or ('a', 0b10000001) will enable the interrupt for
pins 0 and 7 of port a.

The interrupt is delivered with the callback :func:`Interrupt`.

=cut

sub set_port_interrupt
{
	my ($self, $port, $interrupt_mask) = @_;

	$self->_send_request(&FUNCTION_SET_PORT_INTERRUPT, [$port, $interrupt_mask], 'a C', '');
}

=item get_port_interrupt()

Returns the interrupt bitmask for the specified port as set by
:func:`SetPortInterrupt`.

=cut

sub get_port_interrupt
{
	my ($self, $port) = @_;

	return $self->_send_request(&FUNCTION_GET_PORT_INTERRUPT, [$port], 'a', 'C');
}

=item set_port_monoflop()

Configures a monoflop of the pins specified by the second parameter as 8 bit
long bitmask. The specified pins must be configured for output. Non-output
pins will be ignored.

The third parameter is a bitmask with the desired value of the specified
output pins. A 1 in the bitmask means high and a 0 in the bitmask means low.

The forth parameter indicates the time (in ms) that the pins should hold
the value.

If this function is called with the parameters ('a', 9, 1, 1500) or
('a', 0b00001001, 0b00000001, 1500): Pin 0 will get high and pin 3 will get
low on port 'a'. In 1.5s pin 0 will get low and pin 3 will get high again.

A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
have a RS485 bus and an IO-16 Bricklet connected to one of the slave
stacks. You can now call this function every second, with a time parameter
of two seconds and pin 0 set to high. Pin 0 will be high all the time. If now
the RS485 connection is lost, then pin 0 will get low in at most two seconds.

=cut

sub set_port_monoflop
{
	my ($self, $port, $selection_mask, $value_mask, $time) = @_;

	$self->_send_request(&FUNCTION_SET_PORT_MONOFLOP, [$port, $selection_mask, $value_mask, $time], 'a C C L', '');
}

=item get_port_monoflop()

Returns (for the given pin) the current value and the time as set by
:func:`SetPortMonoflop` as well as the remaining time until the value flips.

If the timer is not running currently, the remaining time will be returned
as 0.

=cut

sub get_port_monoflop
{
	my ($self, $port, $pin) = @_;

	return $self->_send_request(&FUNCTION_GET_PORT_MONOFLOP, [$port, $pin], 'a C', 'C L L');
}

=item set_selected_values()

Sets the output value (high or low) for a port ("a" or "b" with a bitmask, 
according to the selection mask. The bitmask is 8 bit long and a 1 in the
bitmask means high and a 0 in the bitmask means low.

For example: The parameters ('a', 192, 128) or ('a', 0b11000000, 0b10000000)
will turn pin 7 high and pin 6 low on port A, pins 0-6 will remain untouched.

.. note::
 This function does nothing for pins that are configured as input.
 Pull-up resistors can be switched on with :func:`SetConfiguration`.

=cut

sub set_selected_values
{
	my ($self, $port, $selection_mask, $value_mask) = @_;

	$self->_send_request(&FUNCTION_SET_SELECTED_VALUES, [$port, $selection_mask, $value_mask], 'a C C', '');
}

=item get_edge_count()

Returns the current value of the edge counter for the selected pin on port A.
You can configure the edges that are counted with :func:`SetEdgeCountConfig`.

If you set the reset counter to *true*, the count is set back to 0
directly after it is read.

.. versionadded:: 2.0.3~(Plugin)

=cut

sub get_edge_count
{
	my ($self, $pin, $reset_counter) = @_;

	return $self->_send_request(&FUNCTION_GET_EDGE_COUNT, [$pin, $reset_counter], 'C C', 'L');
}

=item set_edge_count_config()

Configures the edge counter for the selected pin of port A. Pins 0 and 1
are available for edge counting.

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

.. versionadded:: 2.0.3~(Plugin)

=cut

sub set_edge_count_config
{
	my ($self, $pin, $edge_type, $debounce) = @_;

	$self->_send_request(&FUNCTION_SET_EDGE_COUNT_CONFIG, [$pin, $edge_type, $debounce], 'C C C', '');
}

=item get_edge_count_config()

Returns the edge type and debounce time for the selected pin of port A as set by
:func:`SetEdgeCountConfig`.

.. versionadded:: 2.0.3~(Plugin)

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
