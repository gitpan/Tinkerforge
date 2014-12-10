
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

Tinkerforge::BrickletPiezoBuzzer - Device for controlling a piezo buzzer

=cut

package Tinkerforge::BrickletPiezoBuzzer;

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

This constant is used to identify a Piezo Buzzer Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 214;

=item CALLBACK_BEEP_FINISHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_BEEP_FINISHED callback.

=cut

use constant CALLBACK_BEEP_FINISHED => 3;

=item CALLBACK_MORSE_CODE_FINISHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MORSE_CODE_FINISHED callback.

=cut

use constant CALLBACK_MORSE_CODE_FINISHED => 4;

=item FUNCTION_BEEP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_BEEP => 1;

=item FUNCTION_MORSE_CODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_MORSE_CODE => 2;

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

	$self->{response_expected}->{&FUNCTION_BEEP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_MORSE_CODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&CALLBACK_BEEP_FINISHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_MORSE_CODE_FINISHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_BEEP_FINISHED} = '';
	$self->{callback_formats}->{&CALLBACK_MORSE_CODE_FINISHED} = '';

	bless($self, $class);

	return $self;
}


=item beep()

Beeps with the duration in ms. For example: If you set a value of 1000,
the piezo buzzer will beep for one second.

=cut

sub beep
{
	my ($self, $duration) = @_;

	$self->_send_request(&FUNCTION_BEEP, [$duration], 'L', '');
}

=item morse_code()

Sets morse code that will be played by the piezo buzzer. The morse code
is given as a string consisting of "." (dot), "-" (minus) and " " (space)
for *dits*, *dahs* and *pauses*. Every other character is ignored.

For example: If you set the string "...---...", the piezo buzzer will beep
nine times with the durations "short short short long long long short 
short short".

The maximum string size is 60.

=cut

sub morse_code
{
	my ($self, $morse) = @_;

	$self->_send_request(&FUNCTION_MORSE_CODE, [$morse], 'Z60', '');
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
