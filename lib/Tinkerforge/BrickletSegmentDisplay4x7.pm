
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

Tinkerforge::BrickletSegmentDisplay4x7 - Device for controling four 7-segment displays

=cut

package Tinkerforge::BrickletSegmentDisplay4x7;

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

This constant is used to identify a Segment Display 4x7 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 237;

=item CALLBACK_COUNTER_FINISHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_COUNTER_FINISHED callback.

=cut

use constant CALLBACK_COUNTER_FINISHED => 5;

=item FUNCTION_SET_SEGMENTS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SEGMENTS => 1;

=item FUNCTION_GET_SEGMENTS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SEGMENTS => 2;

=item FUNCTION_START_COUNTER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_START_COUNTER => 3;

=item FUNCTION_GET_COUNTER_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COUNTER_VALUE => 4;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;


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

	$self->{response_expected}->{&FUNCTION_SET_SEGMENTS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_SEGMENTS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_START_COUNTER} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_COUNTER_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_COUNTER_FINISHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_COUNTER_FINISHED} = '';

	bless($self, $class);

	return $self;
}


=item set_segments()

The 7-segment display can be set with bitmaps. Every bit controls one
segment:

.. image:: /Images/Bricklets/bricklet_segment_display_4x7_bit_order.png
   :scale: 100 %
   :alt: Bit order of one segment
   :align: center

For example to set a "5" you would want to activate segments 0, 2, 3, 5 and 6.
This is represented by the number 0b01101101 = 0x6d = 109.

The brightness can be set between 0 (dark) and 7 (bright). The colon
parameter turns the colon of the display on or off.

=cut

sub set_segments
{
	my ($self, $segments, $brightness, $colon) = @_;

	$self->_send_request(&FUNCTION_SET_SEGMENTS, [$segments, $brightness, $colon], 'C4 C C', '');
}

=item get_segments()

Returns the segment, brightness and color data as set by 
:func:`SetSegments`.

=cut

sub get_segments
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_SEGMENTS, [], '', 'C4 C C');
}

=item start_counter()

Starts a counter with the *from* value that counts to the *to*
value with the each step incremented by *increment*.
The *length* of the increment is given in ms.

Example: If you set *from* to 0, *to* to 100, *increment* to 1 and
*length* to 1000, a counter that goes from 0 to 100 with 1 second
pause between each increment will be started.

The maximum values for *from*, *to* and *increment* is 9999, 
the minimum value is -999.

You can stop the counter at every time by calling :func:`SetSegments`.

=cut

sub start_counter
{
	my ($self, $value_from, $value_to, $increment, $length) = @_;

	$self->_send_request(&FUNCTION_START_COUNTER, [$value_from, $value_to, $increment, $length], 's s s L', '');
}

=item get_counter_value()

Returns the counter value that is currently shown on the display.

If there is no counter running a 0 will be returned.

=cut

sub get_counter_value
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COUNTER_VALUE, [], '', 'S');
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
