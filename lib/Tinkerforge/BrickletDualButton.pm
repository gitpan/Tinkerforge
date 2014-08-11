
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

Tinkerforge::BrickletDualButton - Device with two buttons and two LEDs

=cut

package Tinkerforge::BrickletDualButton;

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

This constant is used to identify a Dual Button Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 230;

=item CALLBACK_STATE_CHANGED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STATE_CHANGED callback.

=cut

use constant CALLBACK_STATE_CHANGED => 4;

=item FUNCTION_SET_LED_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_LED_STATE => 1;

=item FUNCTION_GET_LED_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LED_STATE => 2;

=item FUNCTION_GET_BUTTON_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_BUTTON_STATE => 3;

=item FUNCTION_SET_SELECTED_LED_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SELECTED_LED_STATE => 5;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant LED_STATE_AUTO_TOGGLE_ON => 0;
use constant LED_STATE_AUTO_TOGGLE_OFF => 1;
use constant LED_STATE_ON => 2;
use constant LED_STATE_OFF => 3;
use constant BUTTON_STATE_PRESSED => 0;
use constant BUTTON_STATE_RELEASED => 1;
use constant LED_LEFT => 0;
use constant LED_RIGHT => 1;


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

	$self->{response_expected}->{&FUNCTION_SET_LED_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_LED_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_BUTTON_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_STATE_CHANGED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_SELECTED_LED_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_STATE_CHANGED} = 'C C C C';

	bless($self, $class);

	return $self;
}


=item set_led_state()

Sets the state of the LEDs. Possible states are:

* 0 = AutoToggleOn: Enables auto toggle with initially enabled LED.
* 1 = AutoToggleOff: Activates auto toggle with initially disabled LED.
* 2 = On: Enables LED (auto toggle is disabled).
* 3 = Off: Disables LED (auto toggle is disabled).

In auto toggle mode the LED is toggled automatically at each press of a button.

If you just want to set one of the LEDs and don't know the current state
of the other LED, you can get the state with :func:`GetLEDState` or you
can use :func:`SetSelectedLEDState`.

The default value is (1, 1).

=cut

sub set_led_state
{
	my ($self, $led_l, $led_r) = @_;

	$self->_send_request(&FUNCTION_SET_LED_STATE, [$led_l, $led_r], 'C C', '');
}

=item get_led_state()

Returns the current state of the LEDs, as set by :func:`SetLEDState`.

=cut

sub get_led_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_LED_STATE, [], '', 'C C');
}

=item get_button_state()

Returns the current state for both buttons. Possible states are:

* 0 = pressed
* 1 = released

=cut

sub get_button_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_BUTTON_STATE, [], '', 'C C');
}

=item set_selected_led_state()

Sets the state of the selected LED (0 or 1). 

The other LED remains untouched.

=cut

sub set_selected_led_state
{
	my ($self, $led, $state) = @_;

	$self->_send_request(&FUNCTION_SET_SELECTED_LED_STATE, [$led, $state], 'C C', '');
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
