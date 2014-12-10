
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

Tinkerforge::BrickletTilt - Device for sensing tilt and vibration

=cut

package Tinkerforge::BrickletTilt;

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

This constant is used to identify a Tilt Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 239;

=item CALLBACK_TILT_STATE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_TILT_STATE callback.

=cut

use constant CALLBACK_TILT_STATE => 5;

=item FUNCTION_GET_TILT_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TILT_STATE => 1;

=item FUNCTION_ENABLE_TILT_STATE_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE_TILT_STATE_CALLBACK => 2;

=item FUNCTION_DISABLE_TILT_STATE_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE_TILT_STATE_CALLBACK => 3;

=item FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED => 4;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant TILT_STATE_CLOSED => 0;
use constant TILT_STATE_OPEN => 1;
use constant TILT_STATE_CLOSED_VIBRATING => 2;


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

	$self->{response_expected}->{&FUNCTION_GET_TILT_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ENABLE_TILT_STATE_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_DISABLE_TILT_STATE_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_TILT_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_TILT_STATE} = 'C';

	bless($self, $class);

	return $self;
}


=item get_tilt_state()

Returns the current tilt state. The state can either be

* 0 = Closed: The ball in the tilt switch closes the circuit.
* 1 = Open: The ball in the tilt switch does not close the circuit.
* 2 = Closed Vibrating: The tilt switch is in motion (rapid change between open and close).

.. image:: /Images/Bricklets/bricklet_tilt_mechanics.jpg
   :scale: 100 %
   :alt: Tilt states
   :align: center
   :target: ../../_images/Bricklets/bricklet_tilt_mechanics.jpg

=cut

sub get_tilt_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TILT_STATE, [], '', 'C');
}

=item enable_tilt_state_callback()

Enables the :func:`TiltState` callback.

=cut

sub enable_tilt_state_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE_TILT_STATE_CALLBACK, [], '', '');
}

=item disable_tilt_state_callback()

Disables the :func:`TiltState` callback.

=cut

sub disable_tilt_state_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE_TILT_STATE_CALLBACK, [], '', '');
}

=item is_tilt_state_callback_enabled()

Returns *true* if the :func:`TiltState` callback is enabled.

=cut

sub is_tilt_state_callback_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_TILT_STATE_CALLBACK_ENABLED, [], '', 'C');
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
