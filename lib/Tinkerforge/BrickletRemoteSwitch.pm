
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletRemoteSwitch;
=comment
        Device that controls mains switches remotely
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 235;
use constant CALLBACK_SWITCHING_DONE => 3;

use constant FUNCTION_SWITCH_SOCKET => 1;
use constant FUNCTION_GET_SWITCHING_STATE => 2;
use constant FUNCTION_SET_REPEATS => 4;
use constant FUNCTION_GET_REPEATS => 5;
use constant FUNCTION_SWITCH_SOCKET_A => 6;
use constant FUNCTION_SWITCH_SOCKET_B => 7;
use constant FUNCTION_DIM_SOCKET_B => 8;
use constant FUNCTION_SWITCH_SOCKET_C => 9;
use constant FUNCTION_GET_IDENTITY => 255;

use constant SWITCH_TO_OFF => 0;
use constant SWITCH_TO_ON => 1;
use constant SWITCHING_STATE_READY => 0;
use constant SWITCHING_STATE_BUSY => 1;

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 1],
                                     response_expected => shared_clone({&FUNCTION_SWITCH_SOCKET => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_SWITCHING_STATE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_SWITCHING_DONE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_REPEATS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_REPEATS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SWITCH_SOCKET_A => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_SWITCH_SOCKET_B => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_DIM_SOCKET_B => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_SWITCH_SOCKET_C => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({                                                                      &CALLBACK_SWITCHING_DONE => ''})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub switch_socket
{
=comment
        This function is deprecated, use :func:`SwitchSocketA` instead.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $house_code, $receiver_code, $switch_to) = @_;

    $self->{super}->send_request($self, &FUNCTION_SWITCH_SOCKET, [$house_code, $receiver_code, $switch_to], 'C C C', '');
}

sub get_switching_state
{
=comment
        Returns the current switching state. If the current state is busy, the
        Bricklet is currently sending a code to switch a socket. It will not
        accept any calls of :func:`SwitchSocket` until the state changes to ready.
        
        How long the switching takes is dependent on the number of repeats, see
        :func:`SetRepeats`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_SWITCHING_STATE, [], '', 'C');
}

sub set_repeats
{
=comment
        Sets the number of times the code is send when of the :func:`SwitchSocket`
        functions is called. The repeats basically correspond to the amount of time
        that a button of the remote is pressed.
        
        Some dimmers are controlled by the length of a button pressed,
        this can be simulated by increasing the repeats.
        
        The default value is 5.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $repeats) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_REPEATS, [$repeats], 'C', '');
}

sub get_repeats
{
=comment
        Returns the number of repeats as set by :func:`SetRepeats`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_REPEATS, [], '', 'C');
}

sub switch_socket_a
{
=comment
        To switch a type A socket you have to give the house code, receiver code and the
        state (on or off) you want to switch to.
        
        The house code and receiver code have a range of 0 to 31 (5bit).
        
        A detailed description on how you can figure out the house and receiver code
        can be found :ref:`here <remote_switch_bricklet_type_a_house_and_receiver_code>`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $house_code, $receiver_code, $switch_to) = @_;

    $self->{super}->send_request($self, &FUNCTION_SWITCH_SOCKET_A, [$house_code, $receiver_code, $switch_to], 'C C C', '');
}

sub switch_socket_b
{
=comment
        To switch a type B socket you have to give the address, unit and the state
        (on or off) you want to switch to.
        
        The address has a range of 0 to 67108863 (26bit) and the unit has a range
        of 0 to 15 (4bit). To switch all devices with the same address use 255 for
        the unit.
        
        A detailed description on how you can teach a socket the address and unit can
        be found :ref:`here <remote_switch_bricklet_type_b_address_and_unit>`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $address, $unit, $switch_to) = @_;

    $self->{super}->send_request($self, &FUNCTION_SWITCH_SOCKET_B, [$address, $unit, $switch_to], 'L C C', '');
}

sub dim_socket_b
{
=comment
        To control a type B dimmer you have to give the address, unit and the
        dim value you want to set the dimmer to.
        
        The address has a range of 0 to 67108863 (26bit), the unit and the dim value
        has a range of 0 to 15 (4bit).
        
        A detailed description on how you can teach a dimmer the address and unit can
        be found :ref:`here <remote_switch_bricklet_type_b_address_and_unit>`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $address, $unit, $dim_value) = @_;

    $self->{super}->send_request($self, &FUNCTION_DIM_SOCKET_B, [$address, $unit, $dim_value], 'L C C', '');
}

sub switch_socket_c
{
=comment
        To switch a type C socket you have to give the system code, device code and the
        state (on or off) you want to switch to.
        
        The system code has a range of 'A' to 'P' (4bit) and the device code has a
        range of 1 to 16 (4bit).
        
        A detailed description on how you can figure out the system and device code
        can be found :ref:`here <remote_switch_bricklet_type_c_system_and_device_code>`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $system_code, $device_code, $switch_to) = @_;

    $self->{super}->send_request($self, &FUNCTION_SWITCH_SOCKET_C, [$system_code, $device_code, $switch_to], 'a C C', '');
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
