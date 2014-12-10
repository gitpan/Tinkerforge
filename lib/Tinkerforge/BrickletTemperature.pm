
#############################################################
# This file was automatically generated on 2014-12-10.      #
#                                                           #
# Bindings Version 2.1.3                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickletTemperature - Device for sensing Temperature

=cut

package Tinkerforge::BrickletTemperature;

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

This constant is used to identify a Temperature Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 216;

=item CALLBACK_TEMPERATURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TEMPERATURE callback.

=cut

use constant CALLBACK_TEMPERATURE => 8;

=item CALLBACK_TEMPERATURE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TEMPERATURE_REACHED callback.

=cut

use constant CALLBACK_TEMPERATURE_REACHED => 9;

=item FUNCTION_GET_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE => 1;

=item FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD => 5;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 6;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 7;

=item FUNCTION_SET_I2C_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_I2C_MODE => 10;

=item FUNCTION_GET_I2C_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_I2C_MODE => 11;

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
use constant I2C_MODE_FAST => 0;
use constant I2C_MODE_SLOW => 1;


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
	$self->{response_expected}->{&FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_TEMPERATURE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_I2C_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_I2C_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_TEMPERATURE} = 's';
	$self->{callback_formats}->{&CALLBACK_TEMPERATURE_REACHED} = 's';

	bless($self, $class);

	return $self;
}


=item get_temperature()

Returns the temperature of the sensor. The value
has a range of -2500 to 8500 and is given in °C/100,
e.g. a value of 4223 means that a temperature of 42.23 °C is measured.

If you want to get the temperature periodically, it is recommended 
to use the callback :func:`Temperature` and set the period with 
:func:`SetTemperatureCallbackPeriod`.

=cut

sub get_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE, [], '', 's');
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

	$self->_send_request(&FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_temperature_callback_threshold()

Returns the threshold as set by :func:`SetTemperatureCallbackThreshold`.

=cut

sub get_temperature_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, [], '', 'a s s');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`TemperatureReached`

is triggered, if the threshold

* :func:`SetTemperatureCallbackThreshold`

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

=item set_i2c_mode()

Sets the I2C mode. Possible modes are:

* 0: Fast (400kHz, default)
* 1: Slow (100kHz)

If you have problems with obvious outliers in the
Temperature Bricklet measurements, they may be caused by EMI issues.
In this case it may be helpful to lower the I2C speed.

It is however not recommended to lower the I2C speed in applications where
a high throughput needs to be achieved.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub set_i2c_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_I2C_MODE, [$mode], 'C', '');
}

=item get_i2c_mode()

Returns the I2C mode as set by :func:`SetI2CMode`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub get_i2c_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_I2C_MODE, [], '', 'C');
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
