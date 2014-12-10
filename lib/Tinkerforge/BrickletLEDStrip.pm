
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

Tinkerforge::BrickletLEDStrip - Device to control up to 320 RGB LEDs

=cut

package Tinkerforge::BrickletLEDStrip;

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

This constant is used to identify a LED Strip Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 231;

=item CALLBACK_FRAME_RENDERED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_FRAME_RENDERED callback.

=cut

use constant CALLBACK_FRAME_RENDERED => 6;

=item FUNCTION_SET_RGB_VALUES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_RGB_VALUES => 1;

=item FUNCTION_GET_RGB_VALUES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RGB_VALUES => 2;

=item FUNCTION_SET_FRAME_DURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_FRAME_DURATION => 3;

=item FUNCTION_GET_FRAME_DURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_FRAME_DURATION => 4;

=item FUNCTION_GET_SUPPLY_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SUPPLY_VOLTAGE => 5;

=item FUNCTION_SET_CLOCK_FREQUENCY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CLOCK_FREQUENCY => 7;

=item FUNCTION_GET_CLOCK_FREQUENCY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CLOCK_FREQUENCY => 8;

=item FUNCTION_SET_CHIP_TYPE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CHIP_TYPE => 9;

=item FUNCTION_GET_CHIP_TYPE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIP_TYPE => 10;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant CHIP_TYPE_WS2801 => 2801;
use constant CHIP_TYPE_WS2811 => 2811;
use constant CHIP_TYPE_WS2812 => 2812;


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

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 2]);

	$self->{response_expected}->{&FUNCTION_SET_RGB_VALUES} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_RGB_VALUES} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_FRAME_DURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_FRAME_DURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_SUPPLY_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_FRAME_RENDERED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_CLOCK_FREQUENCY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CLOCK_FREQUENCY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CHIP_TYPE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TYPE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_FRAME_RENDERED} = 'S';

	bless($self, $class);

	return $self;
}


=item set_rgb_values()

Sets the *rgb* values for the LEDs with the given *length* starting 
from *index*.

The maximum length is 16, the index goes from 0 to 319 and the rgb values
have 8 bits each.

Example: If you set

* index to 5,
* length to 3,
* r to [255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
* g to [0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] and
* b to [0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

the LED with index 5 will be red, 6 will be green and 7 will be blue.

.. note:: Depending on the LED circuitry colors can be permuted.

The colors will be transfered to actual LEDs when the next
frame duration ends, see :func:`SetFrameDuration`.

Generic approach: 

* Set the frame duration to a value that represents
  the number of frames per second you want to achieve. 
* Set all of the LED colors for one frame.
* Wait for the :func:`FrameRendered` callback.
* Set all of the LED colors for next frame.
* Wait for the :func:`FrameRendered` callback.
* and so on.

This approach ensures that you can change the LED colors with
a fixed frame rate.

The actual number of controllable LEDs depends on the number of free
Bricklet ports. See :ref:`here <led_strip_bricklet_ram_constraints>` for more
information. A call of :func:`SetRGBValues` with index + length above the
bounds is ignored completely.

=cut

sub set_rgb_values
{
	my ($self, $index, $length, $r, $g, $b) = @_;

	$self->_send_request(&FUNCTION_SET_RGB_VALUES, [$index, $length, $r, $g, $b], 'S C C16 C16 C16', '');
}

=item get_rgb_values()

Returns the rgb with the given *length* starting from the
given *index*.

The values are the last values that were set by :func:`SetRGBValues`.

=cut

sub get_rgb_values
{
	my ($self, $index, $length) = @_;

	return $self->_send_request(&FUNCTION_GET_RGB_VALUES, [$index, $length], 'S C', 'C16 C16 C16');
}

=item set_frame_duration()

Sets the frame duration in ms.

Example: If you want to achieve 20 frames per second, you should
set the frame duration to 50ms (50ms * 20 = 1 second). 

For an explanation of the general approach see :func:`SetRGBValues`.

Default value: 100ms (10 frames per second).

=cut

sub set_frame_duration
{
	my ($self, $duration) = @_;

	$self->_send_request(&FUNCTION_SET_FRAME_DURATION, [$duration], 'S', '');
}

=item get_frame_duration()

Returns the frame duration as set by :func:`SetFrameDuration`.

=cut

sub get_frame_duration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_FRAME_DURATION, [], '', 'S');
}

=item get_supply_voltage()

Returns the current supply voltage of the LEDs. The voltage is given in mV.

=cut

sub get_supply_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_SUPPLY_VOLTAGE, [], '', 'S');
}

=item set_clock_frequency()

Sets the frequency of the clock in Hz. The range is 10000Hz (10kHz) up to
2000000Hz (2MHz).

The Bricklet will choose the nearest achievable frequency, which may
be off by a few Hz. You can get the exact frequency that is used by
calling :func:`GetClockFrequency`.

If you have problems with flickering LEDs, they may be bits flipping. You
can fix this by either making the connection between the LEDs and the
Bricklet shorter or by reducing the frequency.

With a decreasing frequency your maximum frames per second will decrease
too.

The default value is 1.66MHz.

.. note::
 The frequency in firmware version 2.0.0 is fixed at 2MHz.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub set_clock_frequency
{
	my ($self, $frequency) = @_;

	$self->_send_request(&FUNCTION_SET_CLOCK_FREQUENCY, [$frequency], 'L', '');
}

=item get_clock_frequency()

Returns the currently used clock frequency as set by :func:`SetClockFrequency`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub get_clock_frequency
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CLOCK_FREQUENCY, [], '', 'L');
}

=item set_chip_type()

Sets the type of the led driver chip. We currently support
the chips

* WS2801 (``chip`` = 2801),
* WS2811 (``chip`` = 2811) and
* WS2812 (``chip`` = 2812).

The WS2812 is sometimes also called "NeoPixel", a name coined by
Adafruit.

The default value is WS2801 (``chip`` = 2801).

.. versionadded:: 2.0.2~(Plugin)

=cut

sub set_chip_type
{
	my ($self, $chip) = @_;

	$self->_send_request(&FUNCTION_SET_CHIP_TYPE, [$chip], 'S', '');
}

=item get_chip_type()

Returns the currently used chip type as set by :func:`SetChipType`.

.. versionadded:: 2.0.2~(Plugin)

=cut

sub get_chip_type
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIP_TYPE, [], '', 'S');
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
