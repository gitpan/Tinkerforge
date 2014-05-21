
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

Tinkerforge::BrickletPTC - Device for reading temperatures from Pt100 or Pt1000 sensors

=cut

package Tinkerforge::BrickletPTC;

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

This constant is used to identify a PTC Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 226;

=item CALLBACK_TEMPERATURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TEMPERATURE callback.

=cut

use constant CALLBACK_TEMPERATURE => 13;

=item CALLBACK_TEMPERATURE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TEMPERATURE_REACHED callback.

=cut

use constant CALLBACK_TEMPERATURE_REACHED => 14;

=item CALLBACK_RESISTANCE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_RESISTANCE callback.

=cut

use constant CALLBACK_RESISTANCE => 15;

=item CALLBACK_RESISTANCE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_RESISTANCE_REACHED callback.

=cut

use constant CALLBACK_RESISTANCE_REACHED => 16;

=item FUNCTION_GET_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE => 1;

=item FUNCTION_GET_RESISTANCE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RESISTANCE => 2;

=item FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD => 3;

=item FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD => 4;

=item FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD => 7;

=item FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD => 8;

=item FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD => 10;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 11;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 12;

=item FUNCTION_SET_NOISE_REJECTION_FILTER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_NOISE_REJECTION_FILTER => 17;

=item FUNCTION_GET_NOISE_REJECTION_FILTER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_NOISE_REJECTION_FILTER => 18;

=item FUNCTION_IS_SENSOR_CONNECTED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_SENSOR_CONNECTED => 19;

=item FUNCTION_SET_WIRE_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIRE_MODE => 20;

=item FUNCTION_GET_WIRE_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIRE_MODE => 21;

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
use constant FILTER_OPTION_50HZ => 0;
use constant FILTER_OPTION_60HZ => 1;
use constant WIRE_MODE_2 => 2;
use constant WIRE_MODE_3 => 3;
use constant WIRE_MODE_4 => 4;


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

	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_RESISTANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_TEMPERATURE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_RESISTANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_RESISTANCE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_NOISE_REJECTION_FILTER} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_NOISE_REJECTION_FILTER} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_SENSOR_CONNECTED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIRE_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIRE_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_TEMPERATURE} = 'l';
	$self->{callback_formats}->{&CALLBACK_TEMPERATURE_REACHED} = 'l';
	$self->{callback_formats}->{&CALLBACK_RESISTANCE} = 'S';
	$self->{callback_formats}->{&CALLBACK_RESISTANCE_REACHED} = 'S';

	bless($self, $class);

	return $self;
}


=item get_temperature()

Returns the temperature of connected sensor. The value
has a range of -246 to 849 °C and is given in °C/100,
e.g. a value of 4223 means that a temperature of 42.23 °C is measured.

If you want to get the temperature periodically, it is recommended 
to use the callback :func:`Temperature` and set the period with 
:func:`SetTemperatureCallbackPeriod`.

=cut

sub get_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE, [], '', 'l');
}

=item get_resistance()

Returns the value as measured by the MAX31865 precision delta-sigma ADC.

The value can be converted with the following formulas:

* Pt100:  resistance = (value * 390) / 32768
* Pt1000: resistance = (value * 3900) / 32768

If you want to get the resistance periodically, it is recommended 
to use the callback :func:`Resistance` and set the period with 
:func:`SetResistanceCallbackPeriod`.

=cut

sub get_resistance
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_RESISTANCE, [], '', 'S');
}

=item set_temperature_callback_period()

Sets the period in ms with which the :func:`Temperature` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Temperature` is only triggered if the temperature has changed since the
last triggering.

The default value is 0.

=cut

sub set_temperature_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_temperature_callback_period()

Returns the period as set by :func:`SetTemperatureCallbackPeriod`.

=cut

sub get_temperature_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_resistance_callback_period()

Sets the period in ms with which the :func:`Resistance` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Resistance` is only triggered if the resistance has changed since the
last triggering.

The default value is 0.

=cut

sub set_resistance_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_resistance_callback_period()

Returns the period as set by :func:`SetResistanceCallbackPeriod`.

=cut

sub get_resistance_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_temperature_callback_threshold()

Sets the thresholds for the :func:`TemperatureReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
 "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
 "'<'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_temperature_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_temperature_callback_threshold()

Returns the threshold as set by :func:`SetTemperatureCallbackThreshold`.

=cut

sub get_temperature_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_resistance_callback_threshold()

Sets the thresholds for the :func:`ResistanceReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
 "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
 "'<'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_resistance_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_resistance_callback_threshold()

Returns the threshold as set by :func:`SetResistanceCallbackThreshold`.

=cut

sub get_resistance_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`TemperatureReached`,
* :func:`ResistanceReached`

is triggered, if the threshold

* :func:`SetTemperatureCallbackThreshold`,
* :func:`SetResistanceCallbackThreshold`

keeps being reached.

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

=item set_noise_rejection_filter()

Sets the noise rejection filter to either 50Hz (0) or 60Hz (1).
Noise from 50Hz or 60Hz power sources (including
harmonics of the AC power's fundamental frequency) is
attenuated by 82dB.

Default value is 0 = 50Hz.

=cut

sub set_noise_rejection_filter
{
	my ($self, $filter) = @_;

	$self->_send_request(&FUNCTION_SET_NOISE_REJECTION_FILTER, [$filter], 'C', '');
}

=item get_noise_rejection_filter()

Returns the noise rejection filter option as set by 
:func:`SetNoiseRejectionFilter`

=cut

sub get_noise_rejection_filter
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_NOISE_REJECTION_FILTER, [], '', 'C');
}

=item is_sensor_connected()

Returns *true* if the sensor is connected correctly. 

If this function
returns *false*, there is either no Pt100 or Pt1000 sensor connected,
the sensor is connected incorrectly or the sensor itself is faulty.

=cut

sub is_sensor_connected
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_SENSOR_CONNECTED, [], '', 'C');
}

=item set_wire_mode()

Sets the wire mode of the sensor. Possible values are 2, 3 and 4 which
correspond to 2-, 3- and 4-wire sensors. The value has to match the jumper
configuration on the Bricklet.

The default value is 2 = 2-wire.

=cut

sub set_wire_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_WIRE_MODE, [$mode], 'C', '');
}

=item get_wire_mode()

Returns the wire mode as set by :func:`SetWireMode`

=cut

sub get_wire_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIRE_MODE, [], '', 'C');
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
