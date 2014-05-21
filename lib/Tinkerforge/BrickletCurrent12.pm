
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

Tinkerforge::BrickletCurrent12 - Device for sensing current of up to 12.5A

=cut

package Tinkerforge::BrickletCurrent12;

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

This constant is used to identify a Current12 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 23;

=item CALLBACK_CURRENT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT callback.

=cut

use constant CALLBACK_CURRENT => 15;

=item CALLBACK_ANALOG_VALUE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE callback.

=cut

use constant CALLBACK_ANALOG_VALUE => 16;

=item CALLBACK_CURRENT_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT_REACHED callback.

=cut

use constant CALLBACK_CURRENT_REACHED => 17;

=item CALLBACK_ANALOG_VALUE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANALOG_VALUE_REACHED callback.

=cut

use constant CALLBACK_ANALOG_VALUE_REACHED => 18;

=item CALLBACK_OVER_CURRENT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_OVER_CURRENT callback.

=cut

use constant CALLBACK_OVER_CURRENT => 19;

=item FUNCTION_GET_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT => 1;

=item FUNCTION_CALIBRATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CALIBRATE => 2;

=item FUNCTION_IS_OVER_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_OVER_CURRENT => 3;

=item FUNCTION_GET_ANALOG_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANALOG_VALUE => 4;

=item FUNCTION_SET_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_CALLBACK_PERIOD => 5;

=item FUNCTION_GET_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CALLBACK_PERIOD => 6;

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

=item FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => 9;

=item FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => 10;

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

	$self->{response_expected}->{&FUNCTION_GET_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_CALIBRATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_OVER_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_CURRENT_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANALOG_VALUE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_OVER_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_CURRENT} = 's';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE} = 'S';
	$self->{callback_formats}->{&CALLBACK_CURRENT_REACHED} = 's';
	$self->{callback_formats}->{&CALLBACK_ANALOG_VALUE_REACHED} = 'S';
	$self->{callback_formats}->{&CALLBACK_OVER_CURRENT} = '';

	bless($self, $class);

	return $self;
}


=item get_current()

Returns the current of the sensor. The value is in mA
and between -12500mA and 12500mA.

If you want to get the current periodically, it is recommended to use the
callback :func:`Current` and set the period with 
:func:`SetCurrentCallbackPeriod`.

=cut

sub get_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT, [], '', 's');
}

=item calibrate()

Calibrates the 0 value of the sensor. You have to call this function
when there is no current present. 

The zero point of the current sensor
is depending on the exact properties of the analog-to-digital converter,
the length of the Bricklet cable and the temperature. Thus, if you change
the Brick or the environment in which the Bricklet is used, you might
have to recalibrate.

The resulting calibration will be saved on the EEPROM of the Current
Bricklet.

=cut

sub calibrate
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_CALIBRATE, [], '', '');
}

=item is_over_current()

Returns *true* if more than 12.5A were measured.

.. note::
 To reset this value you have to power cycle the Bricklet.

=cut

sub is_over_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_OVER_CURRENT, [], '', 'C');
}

=item get_analog_value()

Returns the value as read by a 12-bit analog-to-digital converter.
The value is between 0 and 4095.

.. note::
 The value returned by :func:`GetCurrent` is averaged over several samples
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

	$self->_send_request(&FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

=item get_current_callback_threshold()

Returns the threshold as set by :func:`SetCurrentCallbackThreshold`.

=cut

sub get_current_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, [], '', 'a s s');
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

* :func:`CurrentReached`,
* :func:`AnalogValueReached`

are triggered, if the thresholds

* :func:`SetCurrentCallbackThreshold`,
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
