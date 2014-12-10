
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

Tinkerforge::BrickletLCD16x2 - Device for controlling a LCD with 2 lines a 16 characters

=cut

package Tinkerforge::BrickletLCD16x2;

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

This constant is used to identify a LCD 16x2 Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 211;

=item CALLBACK_BUTTON_PRESSED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_BUTTON_PRESSED callback.

=cut

use constant CALLBACK_BUTTON_PRESSED => 9;

=item CALLBACK_BUTTON_RELEASED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_BUTTON_RELEASED callback.

=cut

use constant CALLBACK_BUTTON_RELEASED => 10;

=item FUNCTION_WRITE_LINE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_WRITE_LINE => 1;

=item FUNCTION_CLEAR_DISPLAY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CLEAR_DISPLAY => 2;

=item FUNCTION_BACKLIGHT_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_BACKLIGHT_ON => 3;

=item FUNCTION_BACKLIGHT_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_BACKLIGHT_OFF => 4;

=item FUNCTION_IS_BACKLIGHT_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_BACKLIGHT_ON => 5;

=item FUNCTION_SET_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONFIG => 6;

=item FUNCTION_GET_CONFIG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONFIG => 7;

=item FUNCTION_IS_BUTTON_PRESSED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_BUTTON_PRESSED => 8;

=item FUNCTION_SET_CUSTOM_CHARACTER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CUSTOM_CHARACTER => 11;

=item FUNCTION_GET_CUSTOM_CHARACTER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CUSTOM_CHARACTER => 12;

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

	$self->{response_expected}->{&FUNCTION_WRITE_LINE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_CLEAR_DISPLAY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_BACKLIGHT_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_BACKLIGHT_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_BACKLIGHT_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONFIG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_BUTTON_PRESSED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_BUTTON_PRESSED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_BUTTON_RELEASED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_CUSTOM_CHARACTER} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CUSTOM_CHARACTER} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_BUTTON_PRESSED} = 'C';
	$self->{callback_formats}->{&CALLBACK_BUTTON_RELEASED} = 'C';

	bless($self, $class);

	return $self;
}


=item write_line()

Writes text to a specific line (0 to 1) with a specific position 
(0 to 15). The text can have a maximum of 16 characters.

For example: (0, 5, "Hello") will write *Hello* in the middle of the
first line of the display.

The display uses a special charset that includes all ASCII characters except
backslash and tilde. The LCD charset also includes several other non-ASCII characters, see
the `charset specification <https://github.com/Tinkerforge/lcd-16x2-bricklet/raw/master/datasheets/standard_charset.pdf>`__
for details. The Unicode example above shows how to specify non-ASCII characters
and how to translate from Unicode to the LCD charset.

=cut

sub write_line
{
	my ($self, $line, $position, $text) = @_;

	$self->_send_request(&FUNCTION_WRITE_LINE, [$line, $position, $text], 'C C Z16', '');
}

=item clear_display()

Deletes all characters from the display.

=cut

sub clear_display
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_CLEAR_DISPLAY, [], '', '');
}

=item backlight_on()

Turns the backlight on.

=cut

sub backlight_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_BACKLIGHT_ON, [], '', '');
}

=item backlight_off()

Turns the backlight off.

=cut

sub backlight_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_BACKLIGHT_OFF, [], '', '');
}

=item is_backlight_on()

Returns *true* if the backlight is on and *false* otherwise.

=cut

sub is_backlight_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_BACKLIGHT_ON, [], '', 'C');
}

=item set_config()

Configures if the cursor (shown as "_") should be visible and if it
should be blinking (shown as a blinking block). The cursor position
is one character behind the the last text written with 
:func:`WriteLine`.

The default is (false, false).

=cut

sub set_config
{
	my ($self, $cursor, $blinking) = @_;

	$self->_send_request(&FUNCTION_SET_CONFIG, [$cursor, $blinking], 'C C', '');
}

=item get_config()

Returns the configuration as set by :func:`SetConfig`.

=cut

sub get_config
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONFIG, [], '', 'C C');
}

=item is_button_pressed()

Returns *true* if the button (0 to 2) is pressed. If you want to react
on button presses and releases it is recommended to use the
:func:`ButtonPressed` and :func:`ButtonReleased` callbacks.

=cut

sub is_button_pressed
{
	my ($self, $button) = @_;

	return $self->_send_request(&FUNCTION_IS_BUTTON_PRESSED, [$button], 'C', 'C');
}

=item set_custom_character()

The LCD 16x2 Bricklet can store up to 8 custom characters. The characters
consist of 5x8 pixels and can be addressed with the index 0-7. To describe
the pixels, the first 5 bits of 8 bytes are used. For example, to make
a custom character "H", you should transfer the following:

* ``character[0] = 0b00010001`` (decimal value 17)
* ``character[1] = 0b00010001`` (decimal value 17)
* ``character[2] = 0b00010001`` (decimal value 17)
* ``character[3] = 0b00011111`` (decimal value 31)
* ``character[4] = 0b00010001`` (decimal value 17)
* ``character[5] = 0b00010001`` (decimal value 17)
* ``character[6] = 0b00010001`` (decimal value 17)
* ``character[7] = 0b00000000`` (decimal value 0)

The characters can later be written with :func:`WriteLine` by using the
characters with the byte representation 8 to 15.

You can play around with the custom characters in Brick Viewer since
version 2.0.1.

Custom characters are stored by the LCD in RAM, so they have to be set
after each startup.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub set_custom_character
{
	my ($self, $index, $character) = @_;

	$self->_send_request(&FUNCTION_SET_CUSTOM_CHARACTER, [$index, $character], 'C C8', '');
}

=item get_custom_character()

Returns the custom character for a given index, as set with
:func:`SetCustomCharacter`.

.. versionadded:: 2.0.1~(Plugin)

=cut

sub get_custom_character
{
	my ($self, $index) = @_;

	return $self->_send_request(&FUNCTION_GET_CUSTOM_CHARACTER, [$index], 'C', 'C8');
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
