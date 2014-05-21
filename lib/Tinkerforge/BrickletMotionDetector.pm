
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

Tinkerforge::BrickletMotionDetector - Device that reads out PIR motion detector

=cut

package Tinkerforge::BrickletMotionDetector;

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

This constant is used to identify a Motion Detector Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 233;

=item CALLBACK_MOTION_DETECTED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MOTION_DETECTED callback.

=cut

use constant CALLBACK_MOTION_DETECTED => 2;

=item CALLBACK_DETECTION_CYCLE_ENDED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_DETECTION_CYCLE_ENDED callback.

=cut

use constant CALLBACK_DETECTION_CYCLE_ENDED => 3;

=item FUNCTION_GET_MOTION_DETECTED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOTION_DETECTED => 1;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant MOTION_NOT_DETECTED => 0;
use constant MOTION_DETECTED => 1;


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

	$self->{response_expected}->{&FUNCTION_GET_MOTION_DETECTED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_MOTION_DETECTED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_DETECTION_CYCLE_ENDED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_MOTION_DETECTED} = '';
	$self->{callback_formats}->{&CALLBACK_DETECTION_CYCLE_ENDED} = '';

	bless($self, $class);

	return $self;
}


=item get_motion_detected()

Returns 1 if a motion was detected. How long this returns 1 after a motion
was detected can be adjusted with one of the small potentiometers on the
Motion Detector Bricklet, see :ref:`here
<motion_detector_bricklet_sensitivity_delay_block_time>`.

There is also a blue LED on the Bricklet that is on as long as the Bricklet is
in the "motion detected" state.

=cut

sub get_motion_detected
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOTION_DETECTED, [], '', 'C');
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
