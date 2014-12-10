
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

Tinkerforge::BrickletDistanceIR - Device for sensing distance via infrared

=cut

package Tinkerforge::BrickletDistanceIR;

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

This constant is used to identify a Distance IR Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 25;

=item CALLBACK_DISTANCE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_DISTANCE callback.

=cut

use constant CALLBACK_DISTANCE => 15;

=item CALLBACK_ANALOG_VALUE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE callback.

=cut

use constant CALLBACK_ANALOG_VALUE => 16;

=item CALLBACK_DISTANCE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_DISTANCE_REACHED callback.

=cut

use constant CALLBACK_DISTANCE_REACHED => 17;

=item CALLBACK_ANALOG_VALUE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE_REACHED callback.

=cut

use constant CALLBACK_ANALOG_VALUE_REACHED => 18;

=item FUNCTION_GET_DISTANCE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DISTANCE => 1;

=item FUNCTION_GET_ANALOG_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE => 2;

=item FUNCTION_SET_SAMPLING_POINT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SAMPLING_POINT => 3;

=item FUNCTION_GET_SAMPLING_POINT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SAMPLING_POINT => 4;

=item FUNCTION_SET_DISTANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DISTANCE_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_DISTANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DISTANCE_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD => 7;

=item FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD => 8;

=item FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD => 10;

=item FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD => 11;

=item FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD => 12;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 13;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 14;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant THRESHOLD_OPTION_OFF => 'x';
use constant THRESHOLD_OPTION_OUTSIDE => 'o';
use constant THRESHOLD_OPTION_INSIDE => 'i';
use constant THRESHOLD_OPTION_SMALLER => '<';
use constant THRESHOLD_OPTION_GREATER => '>';


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

	$self->{response_expected}->{&FUNCTION_GET_DISTANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_SAMPLING_POINT} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_SAMPLING_POINT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DISTANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DISTANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_DISTANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_DISTANCE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_DISTANCE} = 'S';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE} = 'S';
	$self->{callback_formats}->{&CALLBACK_DISTANCE_REACHED} = 'S';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE_REACHED} = 'S';

	bless($self, $class);

	return $self;
}


=item get_distance()

Returns the distance measured by the sensor. The value is in mm and possible
distance ranges are 40 to 300, 100 to 800 and 200 to 1500, depending on the
selected IR sensor.

If you want to get the distance periodically, it is recommended to use the
callback :func:`Distance` and set the period with 
:func:`SetDistanceCallbackPeriod`.

=cut

sub get_distance
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DISTANCE, [], '', 'S');
}

=item get_analog_value()

Returns the value as read by a 12-bit analog-to-digital converter.
The value is between 0 and 4095.

.. note::
 The value returned by :func:`GetDistance` is averaged over several samples
 to yield less noise, while :func:`GetAnalogValue` gives back raw
 unfiltered analog values. The only reason to use :func:`GetAnalogValue` is,
 if you need the full resolution of the analog-to-digital converter.

If you want the analog value periodically, it is recommended to use the 
callback :func:`AnalogValue` and set the period with 
:func:`SetAnalogValueCallbackPeriod`.

=cut

sub get_analog_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE, [], '', 'S');
}

=item set_sampling_point()

Sets a sampling point value to a specific position of the lookup table.
The lookup table comprises 128 equidistant analog values with
corresponding distances.

If you measure a distance of 50cm at the analog value 2048, you
should call this function with (64, 5000). The utilized analog-to-digital
converter has a resolution of 12 bit. With 128 sampling points on the
whole range, this means that every sampling point has a size of 32
analog values. Thus the analog value 2048 has the corresponding sampling
point 64 = 2048/32.

Sampling points are saved on the EEPROM of the Distance IR Bricklet and
loaded again on startup.

.. note::
 An easy way to calibrate the sampling points of the Distance IR Bricklet is
 implemented in the Brick Viewer. If you want to calibrate your Bricklet it is
 highly recommended to use this implementation.

=cut

sub set_sampling_point
{
	my ($self, $position, $distance) = @_;

	$self->_send_request(&FUNCTION_SET_SAMPLING_POINT, [$position, $distance], 'C S', '');
}

=item get_sampling_point()

Returns the distance to a sampling point position as set by
:func:`SetSamplingPoint`.

=cut

sub get_sampling_point
{
	my ($self, $position) = @_;

	return $self->_send_request(&FUNCTION_GET_SAMPLING_POINT, [$position], 'C', 'S');
}

=item set_distance_callback_period()

Sets the period in ms with which the :func:`Distance` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Distance` is only triggered if the distance has changed since the
last triggering.

The default value is 0.

=cut

sub set_distance_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_distance_callback_period()

Returns the period as set by :func:`SetDistanceCallbackPeriod`.

=cut

sub get_distance_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_analog_value_callback_period()

Sets the period in ms with which the :func:`AnalogValue` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`AnalogValue` is only triggered if the analog value has changed since the
last triggering.

The default value is 0.

=cut

sub set_analog_value_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_analog_value_callback_period()

Returns the period as set by :func:`SetAnalogValueCallbackPeriod`.

=cut

sub get_analog_value_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_distance_callback_threshold()

Sets the thresholds for the :func:`DistanceReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the distance is *outside* the min and max values"
 "'i'",    "Callback is triggered when the distance is *inside* the min and max values"
 "'<'",    "Callback is triggered when the distance is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the distance is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_distance_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_distance_callback_threshold()

Returns the threshold as set by :func:`SetDistanceCallbackThreshold`.

=cut

sub get_distance_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, [], '', 'a s s');
}

=item set_analog_value_callback_threshold()

Sets the thresholds for the :func:`AnalogValueReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
 "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
 "'<'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_analog_value_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_analog_value_callback_threshold()

Returns the threshold as set by :func:`SetAnalogValueCallbackThreshold`.

=cut

sub get_analog_value_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`DistanceReached`,
* :func:`AnalogValueReached`

are triggered, if the thresholds

* :func:`SetDistanceCallbackThreshold`,
* :func:`SetAnalogValueCallbackThreshold`

keep being reached.

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
