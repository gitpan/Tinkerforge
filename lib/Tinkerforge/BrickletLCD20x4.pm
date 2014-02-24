
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletLCD20x4;
=comment
        Device for controlling a LCD with 4 lines a 20 characters
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 212;
use constant CALLBACK_BUTTON_PRESSED => 9;
use constant CALLBACK_BUTTON_RELEASED => 10;

use constant FUNCTION_WRITE_LINE => 1;
use constant FUNCTION_CLEAR_DISPLAY => 2;
use constant FUNCTION_BACKLIGHT_ON => 3;
use constant FUNCTION_BACKLIGHT_OFF => 4;
use constant FUNCTION_IS_BACKLIGHT_ON => 5;
use constant FUNCTION_SET_CONFIG => 6;
use constant FUNCTION_GET_CONFIG => 7;
use constant FUNCTION_IS_BUTTON_PRESSED => 8;
use constant FUNCTION_SET_CUSTOM_CHARACTER => 11;
use constant FUNCTION_GET_CUSTOM_CHARACTER => 12;
use constant FUNCTION_SET_DEFAULT_TEXT => 13;
use constant FUNCTION_GET_DEFAULT_TEXT => 14;
use constant FUNCTION_SET_DEFAULT_TEXT_COUNTER => 15;
use constant FUNCTION_GET_DEFAULT_TEXT_COUNTER => 16;
use constant FUNCTION_GET_IDENTITY => 255;


sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_WRITE_LINE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_CLEAR_DISPLAY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_BACKLIGHT_ON => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_BACKLIGHT_OFF => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_IS_BACKLIGHT_ON => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_IS_BUTTON_PRESSED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_BUTTON_PRESSED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_BUTTON_RELEASED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_CUSTOM_CHARACTER => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CUSTOM_CHARACTER => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEFAULT_TEXT => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_DEFAULT_TEXT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEFAULT_TEXT_COUNTER => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_DEFAULT_TEXT_COUNTER => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_BUTTON_PRESSED => 'C',
                                                                      &CALLBACK_BUTTON_RELEASED => 'C'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub write_line
{
=comment
        Writes text to a specific line (0 to 3) with a specific position 
        (0 to 19). The text can have a maximum of 20 characters.
        
        For example: (0, 7, "Hello") will write *Hello* in the middle of the
        first line of the display.
        
        The display uses a special charset that includes all ASCII characters except
        backslash and tilde. The LCD charset also includes several other non-ASCII characters, see
        the `charset specification <https://github.com/Tinkerforge/lcd-20x4-bricklet/raw/master/datasheets/standard_charset.pdf>`__
        for details. The Unicode example above shows how to specify non-ASCII characters
        and how to translate from Unicode to the LCD charset.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $line, $position, $text) = @_;

    $self->{super}->send_request($self, &FUNCTION_WRITE_LINE, [$line, $position, $text], 'C C Z20', '');
}

sub clear_display
{
=comment
        Deletes all characters from the display.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_CLEAR_DISPLAY, [], '', '');
}

sub backlight_on
{
=comment
        Turns the backlight on.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_BACKLIGHT_ON, [], '', '');
}

sub backlight_off
{
=comment
        Turns the backlight off.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_BACKLIGHT_OFF, [], '', '');
}

sub is_backlight_on
{
=comment
        Returns *true* if the backlight is on and *false* otherwise.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_BACKLIGHT_ON, [], '', 'C');
}

sub set_config
{
=comment
        Configures if the cursor (shown as "_") should be visible and if it
        should be blinking (shown as a blinking block). The cursor position
        is one character behind the the last text written with 
        :func:`WriteLine`.
        
        The default is (*false*, *false*).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $cursor, $blinking) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CONFIG, [$cursor, $blinking], 'C C', '');
}

sub get_config
{
=comment
        Returns the configuration as set by :func:`SetConfig`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CONFIG, [], '', 'C C');
 }

sub is_button_pressed
{
=comment
        Returns *true* if the button (0 to 2 or 0 to 3 with hardware version >= 1.2) 
        is pressed. If you want to react
        on button presses and releases it is recommended to use the
        :func:`ButtonPressed` and :func:`ButtonReleased` callbacks.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $button) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_BUTTON_PRESSED, [$button], 'C', 'C');
}

sub set_custom_character
{
=comment
        The LCD 20x4 Bricklet can store up to 8 custom characters. The characters
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
        
        You can play around with the custom characters in Brick Viewer version
        since 2.0.1.
        
        Custom characters are stored by the LCD in RAM, so they have to be set
        after each startup.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $index, $character) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CUSTOM_CHARACTER, [$index, $character], 'C C8', '');
}

sub get_custom_character
{
=comment
        Returns the custom character for a given index, as set with
        :func:`SetCustomCharacter`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $index) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CUSTOM_CHARACTER, [$index], 'C', 'C8');
}

sub set_default_text
{
=comment
        Sets the default text for lines 0-3. The max number of characters
        per line is 20.
        
        The default text is shown on the LCD, if the default text counter
        expires, see :func:`SetDefaultTextCounter`.
        
        .. versionadded:: 2.0.2~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $line, $text) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DEFAULT_TEXT, [$line, $text], 'C Z20', '');
}

sub get_default_text
{
=comment
        Returns the default text for a given line (0-3) as set by
        :func:`SetDefaultText`.
        
        .. versionadded:: 2.0.2~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $line) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DEFAULT_TEXT, [$line], 'C', 'Z20');
}

sub set_default_text_counter
{
=comment
        Sets the default text counter in ms. This counter is decremented each
        ms by the LCD firmware. If the counter reaches 0, the default text
        (see :func:`SetDefaultText`) is shown on the LCD.
        
        This functionality can be used to show a default text if the controlling
        program crashes or the connection is interrupted.
        
        A possible approach is to call :func:`SetDefaultTextCounter` every
        minute with the parameter 1000*60*2 (2 minutes). In this case the
        default text will be shown no later than 2 minutes after the
        controlling program crashes.
        
        A negative counter turns the default text functionality off.
        
        The default is -1.
        
        .. versionadded:: 2.0.2~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $counter) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DEFAULT_TEXT_COUNTER, [$counter], 'l', '');
}

sub get_default_text_counter
{
=comment
        Returns the current value of the default text counter.
        
        .. versionadded:: 2.0.2~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DEFAULT_TEXT_COUNTER, [], '', 'l');
}

sub get_identity
{
=comment
        Returns the UID, the UID where the Bricklet is connected to, 
        the position, the hardware and firmware version as well as the
        device identifier.
        
        The position can be 'a', 'b', 'c' or 'd'.
        
        The device identifier numbers can be found :ref:`here <device_identifier>`.
        |device_identifier_constant|
        
        .. versionadded:: 2.0.0~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_IDENTITY, [], '', 'Z8 Z8 a C3 C3 S');
 }


sub register_callback
{
=comment
        Registers a callback with ID *id* to the function *callback*.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $id, $callback) = @_;

    $self->{super}->{registered_callbacks}->{$id} = '&'.caller.'::'.$callback;
}

sub get_api_version
{
=comment
        Returns the API version (major, minor, revision) of the bindings for
        this device.
=cut
    my ($self) = @_;

    return $self->{super}->{api_version};
}

sub get_response_expected
{
=comment
        Returns the response expected flag for the function specified by the
        *function_id* parameter. It is *true* if the function is expected to
        send a response, *false* otherwise.

        For getter functions this is enabled by default and cannot be disabled,
        because those functions will always send a response. For callback
        configuration functions it is enabled by default too, but can be
        disabled via the set_response_expected function. For setter functions
        it is disabled by default and can be enabled.

        Enabling the response expected flag for a setter function allows to
        detect timeouts and other error conditions calls of this setter as
        well. The device will then send a response for this purpose. If this
        flag is disabled for a setter function then no response is send and
        errors are silently ignored, because they cannot be detected.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $function_id) = @_;

    if(defined($self->{response_expected}->{$function_id}))
    {
        if($self->{response_expected}->{$function_id} == Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE ||
           $self->{response_expected}->{$function_id} == Tinkerforge::Device->RESPONSE_EXPECTED_TRUE)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        croak(Tinkerforge::Error->new(Tinkerforge::IPConnection->ERROR_INVALID_FUNCTION_ID, "Function ID $function_id is unknown"));
    }
}

sub set_response_expected
{
=comment
        Changes the response expected flag of the function specified by the
        *function_id* parameter. This flag can only be changed for setter
        (default value: *false*) and callback configuration functions
        (default value: *true*). For getter functions it is always enabled
        and callbacks it is always disabled.

        Enabling the response expected flag for a setter function allows to
        detect timeouts and other error conditions calls of this setter as
        well. The device will then send a response for this purpose. If this
        flag is disabled for a setter function then no response is send and
        errors are silently ignored, because they cannot be detected.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $function_id, $response_expected) = @_;

    if(defined($self->{response_expected}->{$function_id}))
    {
        if($response_expected)
        {
            $self->{response_expected}->{$function_id} = Tinkerforge::Device->RESPONSE_EXPECTED_TRUE;
        }
        else
        {  
            $self->{response_expected}->{$function_id} = Tinkerforge::Device->RESPONSE_EXPECTED_FALSE;
        }
    }
    else
    {
        croak(Tinkerforge::Error->new(Tinkerforge::IPConnection->ERROR_INVALID_FUNCTION_ID, "Function ID $function_id is unknown"));
    }
}

sub set_response_expected_all
{
=comment
        Changes the response expected flag for all setter and callback
        configuration functions of this device at once.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $response_expected) = @_;

    foreach my $key (sort keys $self->{response_expected})
    {
        if($response_expected)
        {
            $self->{response_expected}->{$key} = Tinkerforge::Device->RESPONSE_EXPECTED_TRUE;
        }
        else
        {
            $self->{response_expected}->{$key} = Tinkerforge::Device->RESPONSE_EXPECTED_FALSE;
        }
    }
}

1;
