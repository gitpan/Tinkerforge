
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

Tinkerforge::BrickletBarometer - Device for sensing air pressure and altitude changes

=cut

package Tinkerforge::BrickletBarometer;

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

This constant is used to identify a Barometer Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 221;

=item CALLBACK_AIR_PRESSURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_AIR_PRESSURE callback.

=cut

use constant CALLBACK_AIR_PRESSURE => 15;

=item CALLBACK_ALTITUDE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ALTITUDE callback.

=cut

use constant CALLBACK_ALTITUDE => 16;

=item CALLBACK_AIR_PRESSURE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_AIR_PRESSURE_REACHED callback.

=cut

use constant CALLBACK_AIR_PRESSURE_REACHED => 17;

=item CALLBACK_ALTITUDE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ALTITUDE_REACHED callback.

=cut

use constant CALLBACK_ALTITUDE_REACHED => 18;

=item FUNCTION_GET_AIR_PRESSURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AIR_PRESSURE => 1;

=item FUNCTION_GET_ALTITUDE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALTITUDE => 2;

=item FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD => 3;

=item FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD => 4;

=item FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD => 7;

=item FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD => 8;

=item FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD => 10;

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

=item FUNCTION_SET_REFERENCE_AIR_PRESSURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_REFERENCE_AIR_PRESSURE => 13;

=item FUNCTION_GET_CHIP_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIP_TEMPERATURE => 14;

=item FUNCTION_GET_REFERENCE_AIR_PRESSURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_REFERENCE_AIR_PRESSURE => 19;

=item FUNCTION_SET_AVERAGING

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_AVERAGING => 20;

=item FUNCTION_GET_AVERAGING

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AVERAGING => 21;

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

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 1]);

	$self->{response_expected}->{&FUNCTION_GET_AIR_PRESSURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALTITUDE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_REFERENCE_AIR_PRESSURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_AIR_PRESSURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ALTITUDE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_AIR_PRESSURE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ALTITUDE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_REFERENCE_AIR_PRESSURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_AVERAGING} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_AVERAGING} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_AIR_PRESSURE} = 'l';
	$self->{callback_formats}->{&CALLBACK_ALTITUDE} = 'l';
	$self->{callback_formats}->{&CALLBACK_AIR_PRESSURE_REACHED} = 'l';
	$self->{callback_formats}->{&CALLBACK_ALTITUDE_REACHED} = 'l';

	bless($self, $class);

	return $self;
}


=item get_air_pressure()

Returns the air pressure of the air pressure sensor. The value
has a range of 10000 to 1200000 and is given in mbar/1000, i.e. a value
of 1001092 means that an air pressure of 1001.092 mbar is measured.

If you want to get the air pressure periodically, it is recommended to use the
callback :func:`AirPressure` and set the period with
:func:`SetAirPressureCallbackPeriod`.

=cut

sub get_air_pressure
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AIR_PRESSURE, [], '', 'l');
}

=item get_altitude()

Returns the relative altitude of the air pressure sensor. The value is given in
cm and is calculated based on the difference between the current air pressure
and the reference air pressure that can be set with :func:`SetReferenceAirPressure`.

If you want to get the altitude periodically, it is recommended to use the
callback :func:`Altitude` and set the period with
:func:`SetAltitudeCallbackPeriod`.

=cut

sub get_altitude
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALTITUDE, [], '', 'l');
}

=item set_air_pressure_callback_period()

Sets the period in ms with which the :func:`AirPressure` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`AirPressure` is only triggered if the air pressure has changed since the
last triggering.

The default value is 0.

=cut

sub set_air_pressure_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_air_pressure_callback_period()

Returns the period as set by :func:`SetAirPressureCallbackPeriod`.

=cut

sub get_air_pressure_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_altitude_callback_period()

Sets the period in ms with which the :func:`Altitude` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Altitude` is only triggered if the altitude has changed since the
last triggering.

The default value is 0.

=cut

sub set_altitude_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_altitude_callback_period()

Returns the period as set by :func:`SetAltitudeCallbackPeriod`.

=cut

sub get_altitude_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_air_pressure_callback_threshold()

Sets the thresholds for the :func:`AirPressureReached` callback.

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the air pressure is *outside* the min and max values"
 "'i'",    "Callback is triggered when the air pressure is *inside* the min and max values"
 "'<'",    "Callback is triggered when the air pressure is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the air pressure is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_air_pressure_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_air_pressure_callback_threshold()

Returns the threshold as set by :func:`SetAirPressureCallbackThreshold`.

=cut

sub get_air_pressure_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_altitude_callback_threshold()

Sets the thresholds for the :func:`AltitudeReached` callback.

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the altitude is *outside* the min and max values"
 "'i'",    "Callback is triggered when the altitude is *inside* the min and max values"
 "'<'",    "Callback is triggered when the altitude is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the altitude is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_altitude_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_altitude_callback_threshold()

Returns the threshold as set by :func:`SetAltitudeCallbackThreshold`.

=cut

sub get_altitude_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`AirPressureReached`,
* :func:`AltitudeReached`

are triggered, if the thresholds

* :func:`SetAirPressureCallbackThreshold`,
* :func:`SetAltitudeCallbackThreshold`

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

=item set_reference_air_pressure()

Sets the reference air pressure in mbar/1000 for the altitude calculation.
Setting the reference to the current air pressure results in a calculated
altitude of 0cm. Passing 0 is a shortcut for passing the current air pressure as
reference.

Well known reference values are the Q codes
`QNH <http://en.wikipedia.org/wiki/QNH>`__ and
`QFE <http://en.wikipedia.org/wiki/Mean_sea_level_pressure#Mean_sea_level_pressure>`__
used in aviation.

The default value is 1013.25mbar.

=cut

sub set_reference_air_pressure
{
	my ($self, $air_pressure) = @_;

	$self->_send_request(&FUNCTION_SET_REFERENCE_AIR_PRESSURE, [$air_pressure], 'l', '');
}

=item get_chip_temperature()

Returns the temperature of the air pressure sensor. The value
has a range of -4000 to 8500 and is given in °C/100, i.e. a value
of 2007 means that a temperature of 20.07 °C is measured.

This temperature is used internally for temperature compensation of the air
pressure measurement. It is not as accurate as the temperature measured by the
:ref:`temperature_bricklet` or the :ref:`temperature_ir_bricklet`.

=cut

sub get_chip_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIP_TEMPERATURE, [], '', 's');
}

=item get_reference_air_pressure()

Returns the reference air pressure as set by :func:`SetReferenceAirPressure`.

=cut

sub get_reference_air_pressure
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_REFERENCE_AIR_PRESSURE, [], '', 'l');
}

=item set_averaging()

Sets the different averaging parameters. It is possible to set
the length of a normal averaging for the temperature and pressure,
as well as an additional length of a 
`moving average <http://en.wikipedia.org/wiki/Moving_average>`__ 
for the pressure. The moving average is calculated from the normal 
averages.  There is no moving average for the temperature.

The maximum length for the pressure average is 10, for the
temperature average is 255 and for the moving average is 25.

Setting the all three parameters to 0 will turn the averaging
completely off. If the averaging is off, there is lots of noise
on the data, but the data is without delay. Thus we recommend
to turn the averaging off if the Barometer Bricklet data is
to be used for sensor fusion with other sensors.

The default values are 10 for the normal averages and 25 for the
moving average.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub set_averaging
{
	my ($self, $moving_average_pressure, $average_pressure, $average_temperature) = @_;

	$self->_send_request(&FUNCTION_SET_AVERAGING, [$moving_average_pressure, $average_pressure, $average_temperature], 'C C C', '');
}

=item get_averaging()

Returns the averaging configuration as set by :func:`SetAveraging`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub get_averaging
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AVERAGING, [], '', 'C C C');
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
