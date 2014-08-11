
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

Tinkerforge::BrickletColor - Device for measuring color (RGB value), illuminance and color temperature

=cut

package Tinkerforge::BrickletColor;

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

This constant is used to identify a Color Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 243;

=item CALLBACK_COLOR

This constant is used with the register_callback() subroutine to specify
the CALLBACK_COLOR callback.

=cut

use constant CALLBACK_COLOR => 8;

=item CALLBACK_COLOR_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_COLOR_REACHED callback.

=cut

use constant CALLBACK_COLOR_REACHED => 9;

=item CALLBACK_ILLUMINANCE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ILLUMINANCE callback.

=cut

use constant CALLBACK_ILLUMINANCE => 21;

=item CALLBACK_COLOR_TEMPERATURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_COLOR_TEMPERATURE callback.

=cut

use constant CALLBACK_COLOR_TEMPERATURE => 22;

=item FUNCTION_GET_COLOR

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COLOR => 1;

=item FUNCTION_SET_COLOR_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_COLOR_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_COLOR_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COLOR_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_COLOR_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_COLOR_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_COLOR_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COLOR_CALLBACK_THRESHOLD => 5;

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

=item FUNCTION_LIGHT_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LIGHT_ON => 10;

=item FUNCTION_LIGHT_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LIGHT_OFF => 11;

=item FUNCTION_IS_LIGHT_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_LIGHT_ON => 12;

=item FUNCTION_SET_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIG => 13;

=item FUNCTION_GET_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIG => 14;

=item FUNCTION_GET_ILLUMINANCE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ILLUMINANCE => 15;

=item FUNCTION_GET_COLOR_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COLOR_TEMPERATURE => 16;

=item FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD => 17;

=item FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD => 18;

=item FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD => 19;

=item FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD => 20;

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
use constant LIGHT_ON => 0;
use constant LIGHT_OFF => 1;
use constant GAIN_1X => 0;
use constant GAIN_4X => 1;
use constant GAIN_16X => 2;
use constant GAIN_60X => 3;
use constant INTEGRATION_TIME_2MS => 0;
use constant INTEGRATION_TIME_24MS => 1;
use constant INTEGRATION_TIME_101MS => 2;
use constant INTEGRATION_TIME_154MS => 3;
use constant INTEGRATION_TIME_700MS => 4;


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

	$self->{response_expected}->{&FUNCTION_GET_COLOR} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_COLOR_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_COLOR_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_COLOR_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_COLOR_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_COLOR} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_COLOR_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_LIGHT_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_LIGHT_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_LIGHT_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ILLUMINANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_COLOR_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ILLUMINANCE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_COLOR_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_COLOR} = 'S S S S';
	$self->{callback_formats}->{&CALLBACK_COLOR_REACHED} = 'S S S S';
	$self->{callback_formats}->{&CALLBACK_ILLUMINANCE} = 'L';
	$self->{callback_formats}->{&CALLBACK_COLOR_TEMPERATURE} = 'S';

	bless($self, $class);

	return $self;
}


=item get_color()

Returns the measured color of the sensor. The values
have a range of 0 to 65535.

The red (r), green (g), blue (b) and clear (c) colors are measured
with four different photodiodes that are responsive at different
wavelengths:

.. image:: /Images/Bricklets/bricklet_color_wavelength_chart_600.jpg
   :scale: 100 %
   :alt: Chart Responsivity / Wavelength
   :align: center
   :target: ../../_images/Bricklets/bricklet_color_wavelength_chart_600.jpg

If you want to get the color periodically, it is recommended 
to use the callback :func:`Color` and set the period with 
:func:`SetColorCallbackPeriod`.

=cut

sub get_color
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COLOR, [], '', 'S S S S');
}

=item set_color_callback_period()

Sets the period in ms with which the :func:`Color` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Color` is only triggered if the color has changed since the
last triggering.

The default value is 0.

=cut

sub set_color_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_COLOR_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_color_callback_period()

Returns the period as set by :func:`SetColorCallbackPeriod`.

=cut

sub get_color_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COLOR_CALLBACK_PERIOD, [], '', 'L');
}

=item set_color_callback_threshold()

Sets the thresholds for the :func:`ColorReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
 "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
 "'<'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"

The default value is ('x', 0, 0, 0, 0, 0, 0, 0, 0).

=cut

sub set_color_callback_threshold
{
	my ($self, $option, $min_r, $max_r, $min_g, $max_g, $min_b, $max_b, $min_c, $max_c) = @_;

	$self->_send_request(&FUNCTION_SET_COLOR_CALLBACK_THRESHOLD, [$option, $min_r, $max_r, $min_g, $max_g, $min_b, $max_b, $min_c, $max_c], 'a S S S S S S S S', '');
}

=item get_color_callback_threshold()

Returns the threshold as set by :func:`SetColorCallbackThreshold`.

=cut

sub get_color_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COLOR_CALLBACK_THRESHOLD, [], '', 'a S S S S S S S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`ColorReached`

is triggered, if the threshold

* :func:`SetColorCallbackThreshold`

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

=item light_on()

Turns the LED on.

=cut

sub light_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LIGHT_ON, [], '', '');
}

=item light_off()

Turns the LED off.

=cut

sub light_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LIGHT_OFF, [], '', '');
}

=item is_light_on()

Returns *true* if the backlight is on and *false* otherwise.

=cut

sub is_light_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_LIGHT_ON, [], '', 'C');
}

=item set_config()

Sets the configuration of the sensor. Gain and integration time
can be configured in this way.

For configuring the gain:

* 0: 1x Gain
* 1: 4x Gain
* 2: 16x Gain
* 3: 60x Gain

For configuring the integration time:

* 0: 2.4ms
* 1: 24ms
* 2: 101ms
* 3: 154ms
* 4: 700ms

Increasing the gain enables the sensor to detect a
color from a higher distance.

The integration time provides a trade-off between conversion time
and accuracy. With a longer integration time the values read will
be more accurate but it will take longer time to get the conversion
results.

The default values are 60x gain and 154ms integration time.

=cut

sub set_config
{
	my ($self, $gain, $integration_time) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIG, [$gain, $integration_time], 'C C', '');
}

=item get_config()

Returns the configuration as set by :func:`SetConfig`.

=cut

sub get_config
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIG, [], '', 'C C');
}

=item get_illuminance()

Returns the illuminance affected by the gain and integration time as
set by :func:`SetConfig`. To get the illuminance in Lux apply this formula::

 lux = illuminance * 700 / gain / integration_time

To get a correct illuminance measurement make sure that the color
values themself are not saturated. The color value (R, G or B)
is saturated if it is equal to the maximum value of 65535.
In that case you have to reduce the gain, see :func:`SetConfig`.

=cut

sub get_illuminance
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ILLUMINANCE, [], '', 'L');
}

=item get_color_temperature()

Returns the color temperature in Kelvin.

To get a correct color temperature measurement make sure that the color
values themself are not saturated. The color value (R, G or B)
is saturated if it is equal to the maximum value of 65535.
In that case you have to reduce the gain, see :func:`SetConfig`.

=cut

sub get_color_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COLOR_TEMPERATURE, [], '', 'S');
}

=item set_illuminance_callback_period()

Sets the period in ms with which the :func:`Illuminance` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Illuminance` is only triggered if the illuminance has changed since the
last triggering.

The default value is 0.

=cut

sub set_illuminance_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_illuminance_callback_period()

Returns the period as set by :func:`SetIlluminanceCallbackPeriod`.

=cut

sub get_illuminance_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_color_temperature_callback_period()

Sets the period in ms with which the :func:`ColorTemperature` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`ColorTemperature` is only triggered if the color temperature has changed since the
last triggering.

The default value is 0.

=cut

sub set_color_temperature_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_color_temperature_callback_period()

Returns the period as set by :func:`SetColorTemperatureCallbackPeriod`.

=cut

sub get_color_temperature_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD, [], '', 'L');
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
