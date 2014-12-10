
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

Tinkerforge::BrickletAnalogOut - Device for output of voltage between 0 and 5V

=cut

package Tinkerforge::BrickletAnalogOut;

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

This constant is used to identify a Analog Out Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 220;


=item FUNCTION_SET_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VOLTAGE => 1;

=item FUNCTION_GET_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VOLTAGE => 2;

=item FUNCTION_SET_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MODE => 3;

=item FUNCTION_GET_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MODE => 4;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant MODE_ANALOG_VALUE => 0;
use constant MODE_1K_TO_GROUND => 1;
use constant MODE_100K_TO_GROUND => 2;
use constant MODE_500K_TO_GROUND => 3;


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

	$self->{response_expected}->{&FUNCTION_SET_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;



	bless($self, $class);

	return $self;
}


=item set_voltage()

Sets the voltage in mV. The possible range is 0V to 5V (0-5000).
Calling this function will set the mode to 0 (see :func:`SetMode`).

The default value is 0 (with mode 1).

=cut

sub set_voltage
{
	my ($self, $voltage) = @_;

	$self->_send_request(&FUNCTION_SET_VOLTAGE, [$voltage], 'S', '');
}

=item get_voltage()

Returns the voltage as set by :func:`SetVoltage`.

=cut

sub get_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VOLTAGE, [], '', 'S');
}

=item set_mode()

Sets the mode of the analog value. Possible modes:

* 0: Normal Mode (Analog value as set by :func:`SetVoltage` is applied)
* 1: 1k Ohm resistor to ground
* 2: 100k Ohm resistor to ground
* 3: 500k Ohm resistor to ground

Setting the mode to 0 will result in an output voltage of 0. You can jump
to a higher output voltage directly by calling :func:`SetVoltage`.

The default mode is 1.

=cut

sub set_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_MODE, [$mode], 'C', '');
}

=item get_mode()

Returns the mode as set by :func:`SetMode`.

=cut

sub get_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MODE, [], '', 'C');
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
