
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

Tinkerforge::BrickletIndustrialDual020mA - Device for sensing two currents between 0 and 20mA (IEC 60381-1)

=cut

package Tinkerforge::BrickletIndustrialDual020mA;

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

This constant is used to identify a Industrial Dual 0-20mA Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 228;

=item CALLBACK_CURRENT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT callback.

=cut

use constant CALLBACK_CURRENT => 10;

=item CALLBACK_CURRENT_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT_REACHED callback.

=cut

use constant CALLBACK_CURRENT_REACHED => 11;

=item FUNCTION_GET_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT => 1;

=item FUNCTION_SET_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_CALLBACK_PERIOD => 2;

=item FUNCTION_GET_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CALLBACK_PERIOD => 3;

=item FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => 4;

=item FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => 5;

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

=item FUNCTION_SET_SAMPLE_RATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SAMPLE_RATE => 8;

=item FUNCTION_GET_SAMPLE_RATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SAMPLE_RATE => 9;

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
use constant SAMPLE_RATE_240_SPS => 0;
use constant SAMPLE_RATE_60_SPS => 1;
use constant SAMPLE_RATE_15_SPS => 2;
use constant SAMPLE_RATE_4_SPS => 3;


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
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_SAMPLE_RATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_SAMPLE_RATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_CURRENT_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_CURRENT} = 'C l';
	$self->{callback_formats}->{&CALLBACK_CURRENT_REACHED} = 'C l';

	bless($self, $class);

	return $self;
}


=item get_current()

Returns the current of the specified sensor (0 or 1). The value is in nA
and between 0nA and 22505322nA (22.5mA).

It is possible to detect if an IEC 60381-1 compatible sensor is connected
and if it works probably.

If the returned current is below 4mA, there is likely no sensor connected
or the sensor may be defect. If the returned current is over 20mA, there might
be a short circuit or the sensor may be defect.

If you want to get the current periodically, it is recommended to use the
callback :func:`Current` and set the period with 
:func:`SetCurrentCallbackPeriod`.

=cut

sub get_current
{
	my ($self, $sensor) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT, [$sensor], 'C', 'l');
}

=item set_current_callback_period()

Sets the period in ms with which the :func:`Current` callback is triggered
periodically for the given sensor. A value of 0 turns the callback off.

:func:`Current` is only triggered if the current has changed since the
last triggering.

The default value is 0.

=cut

sub set_current_callback_period
{
	my ($self, $sensor, $period) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT_CALLBACK_PERIOD, [$sensor, $period], 'C L', '');
}

=item get_current_callback_period()

Returns the period as set by :func:`SetCurrentCallbackPeriod`.

=cut

sub get_current_callback_period
{
	my ($self, $sensor) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_CALLBACK_PERIOD, [$sensor], 'C', 'L');
}

=item set_current_callback_threshold()

Sets the thresholds for the :func:`CurrentReached` callback for the given
sensor.

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
	my ($self, $sensor, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, [$sensor, $option, $min, $max], 'C a l l', '');
}

=item get_current_callback_threshold()

Returns the threshold as set by :func:`SetCurrentCallbackThreshold`.

=cut

sub get_current_callback_threshold
{
	my ($self, $sensor) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, [$sensor], 'C', 'a l l');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callback

* :func:`CurrentReached`

is triggered, if the threshold

* :func:`SetCurrentCallbackThreshold`

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

=item set_sample_rate()

Sets the sample rate to either 240, 60, 15 or 4 samples per second.
The resolution for the rates is 12, 14, 16 and 18 bit respectively.

.. csv-table::
 :header: "Value", "Description"
 :widths: 10, 100

 "0",    "240 samples per second, 12 bit resolution"
 "1",    "60 samples per second, 14 bit resolution"
 "2",    "15 samples per second, 16 bit resolution"
 "3",    "4 samples per second, 18 bit resolution"

The default value is 3: 4 samples per second with 18 bit resolution.

=cut

sub set_sample_rate
{
	my ($self, $rate) = @_;

	$self->_send_request(&FUNCTION_SET_SAMPLE_RATE, [$rate], 'C', '');
}

=item get_sample_rate()

Returns the sample rate as set by :func:`SetSampleRate`.

=cut

sub get_sample_rate
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_SAMPLE_RATE, [], '', 'C');
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
