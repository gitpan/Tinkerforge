
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

Tinkerforge::BrickletMoisture - Device for sensing Moisture

=cut

package Tinkerforge::BrickletMoisture;

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

This constant is used to identify a Moisture Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 232;

=item CALLBACK_MOISTURE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MOISTURE callback.

=cut

use constant CALLBACK_MOISTURE => 8;

=item CALLBACK_MOISTURE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MOISTURE_REACHED callback.

=cut

use constant CALLBACK_MOISTURE_REACHED => 9;

=item FUNCTION_GET_MOISTURE_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOISTURE_VALUE => 1;

=item FUNCTION_SET_MOISTURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOISTURE_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_MOISTURE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOISTURE_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD => 5;

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

=item FUNCTION_SET_MOVING_AVERAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOVING_AVERAGE => 10;

=item FUNCTION_GET_MOVING_AVERAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOVING_AVERAGE => 11;

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

	$self->{response_expected}->{&FUNCTION_GET_MOISTURE_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MOISTURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MOISTURE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_MOISTURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_MOISTURE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_MOVING_AVERAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MOVING_AVERAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_MOISTURE} = 'S';
	$self->{callback_formats}->{&CALLBACK_MOISTURE_REACHED} = 'S';

	bless($self, $class);

	return $self;
}


=item get_moisture_value()

Returns the current moisture value. The value has a range of
0 to 4095. A small value corresponds to little moisture, a big
value corresponds to much moisture.

If you want to get the moisture value periodically, it is recommended 
to use the callback :func:`Moisture` and set the period with 
:func:`SetMoistureCallbackPeriod`.

=cut

sub get_moisture_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOISTURE_VALUE, [], '', 'S');
}

=item set_moisture_callback_period()

Sets the period in ms with which the :func:`Moisture` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Moisture` is only triggered if the moisture value has changed since the
last triggering.

The default value is 0.

=cut

sub set_moisture_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_MOISTURE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_moisture_callback_period()

Returns the period as set by :func:`SetMoistureCallbackPeriod`.

=cut

sub get_moisture_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOISTURE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_moisture_callback_threshold()

Sets the thresholds for the :func:`MoistureReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the moisture value is *outside* the min and max values"
 "'i'",    "Callback is triggered when the moisture value is *inside* the min and max values"
 "'<'",    "Callback is triggered when the moisture value is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the moisture value is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

=cut

sub set_moisture_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_moisture_callback_threshold()

Returns the threshold as set by :func:`SetMoistureCallbackThreshold`.

=cut

sub get_moisture_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`MoistureReached`

is triggered, if the threshold

* :func:`SetMoistureCallbackThreshold`

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

=item set_moving_average()

Sets the length of a `moving averaging <http://en.wikipedia.org/wiki/Moving_average>`__ 
for the moisture value.

Setting the length to 0 will turn the averaging completely off. With less
averaging, there is more noise on the data.

The range for the averaging is 0-100.

The default value is 100.

=cut

sub set_moving_average
{
	my ($self, $average) = @_;

	$self->_send_request(&FUNCTION_SET_MOVING_AVERAGE, [$average], 'C', '');
}

=item get_moving_average()

Returns the length moving average as set by :func:`SetMovingAverage`.

=cut

sub get_moving_average
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOVING_AVERAGE, [], '', 'C');
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
