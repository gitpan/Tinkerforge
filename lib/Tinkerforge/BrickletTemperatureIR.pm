
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

Tinkerforge::BrickletTemperatureIR - Device for non-contact temperature sensing

=cut

package Tinkerforge::BrickletTemperatureIR;

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

This constant is used to identify a Temperature IR Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 217;

=item CALLBACK_AMBIENT_TEMPERATURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_AMBIENT_TEMPERATURE callback.

=cut

use constant CALLBACK_AMBIENT_TEMPERATURE => 15;

=item CALLBACK_OBJECT_TEMPERATURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_OBJECT_TEMPERATURE callback.

=cut

use constant CALLBACK_OBJECT_TEMPERATURE => 16;

=item CALLBACK_AMBIENT_TEMPERATURE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_AMBIENT_TEMPERATURE_REACHED callback.

=cut

use constant CALLBACK_AMBIENT_TEMPERATURE_REACHED => 17;

=item CALLBACK_OBJECT_TEMPERATURE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_OBJECT_TEMPERATURE_REACHED callback.

=cut

use constant CALLBACK_OBJECT_TEMPERATURE_REACHED => 18;

=item FUNCTION_GET_AMBIENT_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AMBIENT_TEMPERATURE => 1;

=item FUNCTION_GET_OBJECT_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_OBJECT_TEMPERATURE => 2;

=item FUNCTION_SET_EMISSIVITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EMISSIVITY => 3;

=item FUNCTION_GET_EMISSIVITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EMISSIVITY => 4;

=item FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD => 6;

=item FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD => 7;

=item FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD => 8;

=item FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD => 10;

=item FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD => 11;

=item FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD => 12;

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

	$self->{response_expected}->{&FUNCTION_GET_AMBIENT_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_OBJECT_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EMISSIVITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EMISSIVITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_AMBIENT_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_OBJECT_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_AMBIENT_TEMPERATURE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_OBJECT_TEMPERATURE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_AMBIENT_TEMPERATURE} = 's';
	$self->{callback_formats}->{&CALLBACK_OBJECT_TEMPERATURE} = 's';
	$self->{callback_formats}->{&CALLBACK_AMBIENT_TEMPERATURE_REACHED} = 's';
	$self->{callback_formats}->{&CALLBACK_OBJECT_TEMPERATURE_REACHED} = 's';

	bless($self, $class);

	return $self;
}


=item get_ambient_temperature()

Returns the ambient temperature of the sensor. The value
has a range of -400 to 1250 and is given in °C/10,
e.g. a value of 423 means that an ambient temperature of 42.3 °C is 
measured.

If you want to get the ambient temperature periodically, it is recommended 
to use the callback :func:`AmbientTemperature` and set the period with 
:func:`SetAmbientTemperatureCallbackPeriod`.

=cut

sub get_ambient_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AMBIENT_TEMPERATURE, [], '', 's');
}

=item get_object_temperature()

Returns the object temperature of the sensor, i.e. the temperature
of the surface of the object the sensor is aimed at. The value
has a range of -700 to 3800 and is given in °C/10,
e.g. a value of 3001 means that a temperature of 300.1 °C is measured
on the surface of the object.

The temperature of different materials is dependent on their `emissivity 
<http://en.wikipedia.org/wiki/Emissivity>`__. The emissivity of the material
can be set with :func:`SetEmissivity`.

If you want to get the object temperature periodically, it is recommended 
to use the callback :func:`ObjectTemperature` and set the period with 
:func:`SetObjectTemperatureCallbackPeriod`.

=cut

sub get_object_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_OBJECT_TEMPERATURE, [], '', 's');
}

=item set_emissivity()

Sets the `emissivity <http://en.wikipedia.org/wiki/Emissivity>`__ that is
used to calculate the surface temperature as returned by 
:func:`GetObjectTemperature`. 

The emissivity is usually given as a value between 0.0 and 1.0. A list of
emissivities of different materials can be found 
`here <http://www.infrared-thermography.com/material.htm>`__.

The parameter of :func:`SetEmissivity` has to be given with a factor of
65535 (16-bit). For example: An emissivity of 0.1 can be set with the
value 6553, an emissivity of 0.5 with the value 32767 and so on.

.. note::
 If you need a precise measurement for the object temperature, it is
 absolutely crucial that you also provide a precise emissivity.

The default emissivity is 1.0 (value of 65535) and the minimum emissivity the
sensor can handle is 0.1 (value of 6553).

=cut

sub set_emissivity
{
	my ($self, $emissivity) = @_;

	$self->_send_request(&FUNCTION_SET_EMISSIVITY, [$emissivity], 'S', '');
}

=item get_emissivity()

Returns the emissivity as set by :func:`SetEmissivity`.

=cut

sub get_emissivity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_EMISSIVITY, [], '', 'S');
}

=item set_ambient_temperature_callback_period()

Sets the period in ms with which the :func:`AmbientTemperature` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`AmbientTemperature` is only triggered if the temperature has changed since the
last triggering.

The default value is 0.

=cut

sub set_ambient_temperature_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_ambient_temperature_callback_period()

Returns the period as set by :func:`SetAmbientTemperatureCallbackPeriod`.

=cut

sub get_ambient_temperature_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_object_temperature_callback_period()

Sets the period in ms with which the :func:`ObjectTemperature` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`ObjectTemperature` is only triggered if the temperature has changed since the
last triggering.

The default value is 0.

=cut

sub set_object_temperature_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_object_temperature_callback_period()

Returns the period as set by :func:`SetObjectTemperatureCallbackPeriod`.

=cut

sub get_object_temperature_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_ambient_temperature_callback_threshold()

Sets the thresholds for the :func:`AmbientTemperatureReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the ambient temperature is *outside* the min and max values"
 "'i'",    "Callback is triggered when the ambient temperature is *inside* the min and max values"
 "'<'",    "Callback is triggered when the ambient temperature is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the ambient temperature is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_ambient_temperature_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_ambient_temperature_callback_threshold()

Returns the threshold as set by :func:`SetAmbientTemperatureCallbackThreshold`.

=cut

sub get_ambient_temperature_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, [], '', 'a s s');
}

=item set_object_temperature_callback_threshold()

Sets the thresholds for the :func:`ObjectTemperatureReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the object temperature is *outside* the min and max values"
 "'i'",    "Callback is triggered when the object temperature is *inside* the min and max values"
 "'<'",    "Callback is triggered when the object temperature is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the object temperature is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_object_temperature_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_object_temperature_callback_threshold()

Returns the threshold as set by :func:`SetObjectTemperatureCallbackThreshold`.

=cut

sub get_object_temperature_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, [], '', 'a s s');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`AmbientTemperatureReached`,
* :func:`ObjectTemperatureReached`

are triggered, if the thresholds

* :func:`SetAmbientTemperatureCallbackThreshold`,
* :func:`SetObjectTemperatureCallbackThreshold`

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
