
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletLEDStrip;
=comment
        Device to control up to 320 RGB LEDs
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 231;
use constant CALLBACK_FRAME_RENDERED => 6;

use constant FUNCTION_SET_RGB_VALUES => 1;
use constant FUNCTION_GET_RGB_VALUES => 2;
use constant FUNCTION_SET_FRAME_DURATION => 3;
use constant FUNCTION_GET_FRAME_DURATION => 4;
use constant FUNCTION_GET_SUPPLY_VOLTAGE => 5;
use constant FUNCTION_SET_CLOCK_FREQUENCY => 7;
use constant FUNCTION_GET_CLOCK_FREQUENCY => 8;
use constant FUNCTION_GET_IDENTITY => 255;


sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 1],
                                     response_expected => shared_clone({&FUNCTION_SET_RGB_VALUES => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_RGB_VALUES => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_FRAME_DURATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_FRAME_DURATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_SUPPLY_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_FRAME_RENDERED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_CLOCK_FREQUENCY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CLOCK_FREQUENCY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({                                                                      &CALLBACK_FRAME_RENDERED => 'S'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub set_rgb_values
{
=comment
        Sets the *rgb* values for the LEDs with the given *length* starting 
        from *index*.
        
        The maximum length is 16, the index goes from 0 to 319 and the rgb values
        have 8 bits each.
        
        Example: If you set
        
        * index to 5,
        * length to 3,
        * r to [255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        * g to [0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] and
        * b to [0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        the LED with index 5 will be red, 6 will be green and 7 will be blue.
        
        .. note:: Depending on the LED circuitry colors can be permuted.
        
        The colors will be transfered to actual LEDs when the next
        frame duration ends, see :func:`SetFrameDuration`.
        
        Generic approach: 
        
        * Set the frame duration to a value that represents
          the number of frames per second you want to achieve. 
        * Set all of the LED colors for one frame.
        * Wait for the :func:`FrameRendered` callback.
        * Set all of the LED colors for next frame.
        * Wait for the :func:`FrameRendered` callback.
        * and so on.
        
        This approach ensures that you can change the LED colors with
        a fixed frame rate.
        
        The actual number of controllable LEDs depends on the number of free
        Bricklet ports. See :ref:`here <led_strip_bricklet_ram_constraints>` for more
        information. A call of :func:`SetRGBValues` with index + length above the
        bounds is ignored completely.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $index, $length, $r, $g, $b) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_RGB_VALUES, [$index, $length, $r, $g, $b], 'S C C16 C16 C16', '');
}

sub get_rgb_values
{
=comment
        Returns the rgb with the given *length* starting from the
        given *index*.
        
        The values are the last values that were set by :func:`SetRGBValues`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $index, $length) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_RGB_VALUES, [$index, $length], 'S C', 'C16 C16 C16');
 }

sub set_frame_duration
{
=comment
        Sets the frame duration in ms.
        
        Example: If you want to achieve 20 frames per second, you should
        set the frame duration to 50ms (50ms * 20 = 1 second). 
        
        For an explanation of the general approach see :func:`SetRGBValues`.
        
        Default value: 100ms (10 frames per second).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $duration) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_FRAME_DURATION, [$duration], 'S', '');
}

sub get_frame_duration
{
=comment
        Returns the frame duration as set by :func:`SetFrameDuration`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_FRAME_DURATION, [], '', 'S');
}

sub get_supply_voltage
{
=comment
        Returns the current supply voltage of the LEDs. The voltage is given in mV.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_SUPPLY_VOLTAGE, [], '', 'S');
}

sub set_clock_frequency
{
=comment
        Sets the frequency of the clock in Hz. The range is 10000Hz (10kHz) up to
        2000000Hz (2MHz).
        
        The Bricklet will choose the nearest achievable frequency, which may
        be off by a few Hz. You can get the exact frequency that is used by
        calling :func:`GetClockFrequency`.
        
        If you have problems with flickering LEDs, they may be bits flipping. You
        can fix this by either making the connection between the LEDs and the
        Bricklet shorter or by reducing the frequency.
        
        With a decreasing frequency your maximum frames per second will decrease
        too.
        
        The default value is 1.66MHz.
        
        .. note::
         The frequency in firmware version 2.0.0 is fixed at 2MHz.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $frequency) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CLOCK_FREQUENCY, [$frequency], 'L', '');
}

sub get_clock_frequency
{
=comment
        Returns the currently used clock frequency.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CLOCK_FREQUENCY, [], '', 'L');
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
