
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

Tinkerforge::BrickletVoltageCurrent - Device for high precision sensing of voltage and current

=cut

package Tinkerforge::BrickletVoltageCurrent;

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

This constant is used to identify a Voltage/Current Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 227;

=item CALLBACK_CURRENT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT callback.

=cut

use constant CALLBACK_CURRENT => 22;

=item CALLBACK_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VOLTAGE callback.

=cut

use constant CALLBACK_VOLTAGE => 23;

=item CALLBACK_POWER

This constant is used with the register_callback() subroutine to specify
the CALLBACK_POWER callback.

=cut

use constant CALLBACK_POWER => 24;

=item CALLBACK_CURRENT_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT_REACHED callback.

=cut

use constant CALLBACK_CURRENT_REACHED => 25;

=item CALLBACK_VOLTAGE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VOLTAGE_REACHED callback.

=cut

use constant CALLBACK_VOLTAGE_REACHED => 26;

=item CALLBACK_POWER_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_POWER_REACHED callback.

=cut

use constant CALLBACK_POWER_REACHED => 27;

=item FUNCTION_GET_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT => 1;

=item FUNCTION_GET_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE => 2;

=item FUNCTION_GET_POWER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POWER => 3;

=item FUNCTION_SET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIGURATION => 4;

=item FUNCTION_GET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIGURATION => 5;

=item FUNCTION_SET_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CALIBRATION => 6;

=item FUNCTION_GET_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CALIBRATION => 7;

=item FUNCTION_SET_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_CALLBACK_PERIOD => 8;

=item FUNCTION_GET_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CALLBACK_PERIOD => 9;

=item FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD => 10;

=item FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD => 11;

=item FUNCTION_SET_POWER_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_POWER_CALLBACK_PERIOD => 12;

=item FUNCTION_GET_POWER_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POWER_CALLBACK_PERIOD => 13;

=item FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => 14;

=item FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => 15;

=item FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD => 16;

=item FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD => 17;

=item FUNCTION_SET_POWER_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_POWER_CALLBACK_THRESHOLD => 18;

=item FUNCTION_GET_POWER_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POWER_CALLBACK_THRESHOLD => 19;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 20;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 21;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant AVERAGING_1 => 0;
use constant AVERAGING_4 => 1;
use constant AVERAGING_16 => 2;
use constant AVERAGING_64 => 3;
use constant AVERAGING_128 => 4;
use constant AVERAGING_256 => 5;
use constant AVERAGING_512 => 6;
use constant AVERAGING_1024 => 7;
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

	$self->{response_expected}->{&FUNCTION_GET_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_POWER} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_POWER_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_POWER_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_POWER_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_POWER_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_POWER} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_CURRENT_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VOLTAGE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_POWER_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_CURRENT} = 'l';
	$self->{callback_formats}->{&CALLBACK_VOLTAGE} = 'l';
	$self->{callback_formats}->{&CALLBACK_POWER} = 'l';
	$self->{callback_formats}->{&CALLBACK_CURRENT_REACHED} = 'l';
	$self->{callback_formats}->{&CALLBACK_VOLTAGE_REACHED} = 'l';
	$self->{callback_formats}->{&CALLBACK_POWER_REACHED} = 'l';

	bless($self, $class);

	return $self;
}


=item get_current()

Returns the current. The value is in mA
and between -20000mA and 20000mA.

If you want to get the current periodically, it is recommended to use the
callback :func:`Current` and set the period with 
:func:`SetCurrentCallbackPeriod`.

=cut

sub get_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT, [], '', 'l');
}

=item get_voltage()

Returns the voltage. The value is in mV
and between 0mV and 36000mV.

If you want to get the voltage periodically, it is recommended to use the
callback :func:`Voltage` and set the period with 
:func:`SetVoltageCallbackPeriod`.

=cut

sub get_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE, [], '', 'l');
}

=item get_power()

Returns the power. The value is in mW
and between 0mV and 720000mW.

If you want to get the power periodically, it is recommended to use the
callback :func:`Power` and set the period with 
:func:`SetPowerCallbackPeriod`.

=cut

sub get_power
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_POWER, [], '', 'l');
}

=item set_configuration()

Sets the configuration of the Voltage/Current Bricklet. It is
possible to configure number of averages as well as
voltage and current conversion time.

Averaging:

.. csv-table::
 :header: "Value", "Number of Averages"
 :widths: 20, 20

 "0",    "1"
 "1",    "4"
 "2",    "16"
 "3",    "64"
 "4",    "128"
 "5",    "256"
 "6",    "512"
 ">=7",  "1024"

Voltage/Current conversion:

.. csv-table::
 :header: "Value", "Conversion time"
 :widths: 20, 20

 "0",    "140µs"
 "1",    "204µs"
 "2",    "332µs"
 "3",    "588µs"
 "4",    "1.1ms"
 "5",    "2.116ms"
 "6",    "4.156ms"
 ">=7",  "8.244ms"

The default values are 3, 4 and 4 (64, 1.1ms, 1.1ms) for averaging, voltage 
conversion and current conversion.

=cut

sub set_configuration
{
	my ($self, $averaging, $voltage_conversion_time, $current_conversion_time) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIGURATION, [$averaging, $voltage_conversion_time, $current_conversion_time], 'C C C', '');
}

=item get_configuration()

Returns the configuration as set by :func:`SetConfiguration`.

=cut

sub get_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIGURATION, [], '', 'C C C');
}

=item set_calibration()

Since the shunt resistor that is used to measure the current is not
perfectly precise, it needs to be calibrated by a multiplier and
divisor if a very precise reading is needed.

For example, if you are expecting a measurement of 1000mA and you
are measuring 1023mA, you can calibrate the Voltage/Current Bricklet 
by setting the multiplier to 1000 and the divisor to 1023.

=cut

sub set_calibration
{
	my ($self, $gain_multiplier, $gain_divisor) = @_;

	$self->_send_request(&FUNCTION_SET_CALIBRATION, [$gain_multiplier, $gain_divisor], 'S S', '');
}

=item get_calibration()

Returns the calibration as set by :func:`SetCalibration`.

=cut

sub get_calibration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CALIBRATION, [], '', 'S S');
}

=item set_current_callback_period()

Sets the period in ms with which the :func:`Current` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Current` is only triggered if the current has changed since the
last triggering.

The default value is 0.

=cut

sub set_current_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_current_callback_period()

Returns the period as set by :func:`SetCurrentCallbackPeriod`.

=cut

sub get_current_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_CALLBACK_PERIOD, [], '', 'L');
}

=item set_voltage_callback_period()

Sets the period in ms with which the :func:`Voltage` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Voltage` is only triggered if the voltage has changed since the
last triggering.

The default value is 0.

=cut

sub set_voltage_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_voltage_callback_period()

Returns the period as set by :func:`SetVoltageCallbackPeriod`.

=cut

sub get_voltage_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_power_callback_period()

Sets the period in ms with which the :func:`Power` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Power` is only triggered if the power has changed since the
last triggering.

The default value is 0.

=cut

sub set_power_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_POWER_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_power_callback_period()

Returns the period as set by :func:`GetPowerCallbackPeriod`.

=cut

sub get_power_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_POWER_CALLBACK_PERIOD, [], '', 'L');
}

=item set_current_callback_threshold()

Sets the thresholds for the :func:`CurrentReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the current is *outside* the min and max values"
 "'i'",    "Callback is triggered when the current is *inside* the min and max values"
 "'<'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the current is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_current_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_current_callback_threshold()

Returns the threshold as set by :func:`SetCurrentCallbackThreshold`.

=cut

sub get_current_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_voltage_callback_threshold()

Sets the thresholds for the :func:`VoltageReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
 "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
 "'<'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_voltage_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_voltage_callback_threshold()

Returns the threshold as set by :func:`SetVoltageCallbackThreshold`.

=cut

sub get_voltage_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_power_callback_threshold()

Sets the thresholds for the :func:`PowerReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the power is *outside* the min and max values"
 "'i'",    "Callback is triggered when the power is *inside* the min and max values"
 "'<'",    "Callback is triggered when the power is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the power is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_power_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_POWER_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

=item get_power_callback_threshold()

Returns the threshold as set by :func:`SetPowerCallbackThreshold`.

=cut

sub get_power_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_POWER_CALLBACK_THRESHOLD, [], '', 'a l l');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`CurrentReached`,
* :func:`VoltageReached`,
* :func:`PowerReached`

are triggered, if the thresholds

* :func:`SetCurrentCallbackThreshold`,
* :func:`SetVoltageCallbackThreshold`,
* :func:`SetPowerCallbackThreshold`

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
