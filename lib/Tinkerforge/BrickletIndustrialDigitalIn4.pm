
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletIndustrialDigitalIn4;
=comment
        Device for controlling up to 4 optically coupled digital inputs
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 223;
use constant CALLBACK_INTERRUPT => 9;

use constant FUNCTION_GET_VALUE => 1;
use constant FUNCTION_SET_GROUP => 2;
use constant FUNCTION_GET_GROUP => 3;
use constant FUNCTION_GET_AVAILABLE_FOR_GROUP => 4;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 5;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 6;
use constant FUNCTION_SET_INTERRUPT => 7;
use constant FUNCTION_GET_INTERRUPT => 8;
use constant FUNCTION_GET_EDGE_COUNT => 10;
use constant FUNCTION_SET_EDGE_COUNT_CONFIG => 11;
use constant FUNCTION_GET_EDGE_COUNT_CONFIG => 12;
use constant FUNCTION_GET_IDENTITY => 255;

use constant EDGE_TYPE_RISING => 0;
use constant EDGE_TYPE_FALLING => 1;
use constant EDGE_TYPE_BOTH => 2;

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 1],
                                     response_expected => shared_clone({&FUNCTION_GET_VALUE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_GROUP => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_GROUP => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_AVAILABLE_FOR_GROUP => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_EDGE_COUNT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EDGE_COUNT_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_EDGE_COUNT_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({                                                                      &CALLBACK_INTERRUPT => 'S S'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_value
{
=comment
        Returns the input value with a bitmask. The bitmask is 16bit long, *true*
        refers to high and *false* refers to low.
        
        For example: The value 3 or 0b0011 means that pins 0-1 are high and the other
        pins are low.
        
        If no groups are used (see :func:`SetGroup`), the pins correspond to the
        markings on the Digital In 4 Bricklet.
        
        If groups are used, the pins correspond to the element in the group.
        Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
        pins 8-11 and element 4 pins 12-15.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VALUE, [], '', 'S');
}

sub set_group
{
=comment
        Sets a group of Digital In 4 Bricklets that should work together. You can
        find Bricklets that can be grouped together with :func:`GetAvailableForGroup`.
        
        The group consists of 4 elements. Element 1 in the group will get pins 0-3,
        element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.
        
        Each element can either be one of the ports ('a' to 'd') or 'n' if it should
        not be used.
        
        For example: If you have two Digital In 4 Bricklets connected to port A and
        port B respectively, you could call with ``['a', 'b', 'n', 'n']``.
        
        Now the pins on the Digital In 4 on port A are assigned to 0-3 and the
        pins on the Digital In 4 on port B are assigned to 4-7. It is now possible
        to call :func:`GetValue` and read out two Bricklets at the same time.
        
        Changing the group configuration resets all edge counter configurations
        and values.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $group) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_GROUP, [$group], 'a4', '');
}

sub get_group
{
=comment
        Returns the group as set by :func:`SetGroup`
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_GROUP, [], '', 'a4');
}

sub get_available_for_group
{
=comment
        Returns a bitmask of ports that are available for grouping. For example the
        value 5 or 0b0101 means: Port A and port C are connected to Bricklets that
        can be grouped together.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AVAILABLE_FOR_GROUP, [], '', 'C');
}

sub set_debounce_period
{
=comment
        Sets the debounce period of the :func:`Interrupt` callback in ms.
        
        For example: If you set this value to 100, you will get the interrupt
        maximal every 100ms. This is necessary if something that bounces is
        connected to the Digital In 4 Bricklet, such as a button.
        
        The default value is 100.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $debounce) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DEBOUNCE_PERIOD, [$debounce], 'L', '');
}

sub get_debounce_period
{
=comment
        Returns the debounce period as set by :func:`SetDebouncePeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DEBOUNCE_PERIOD, [], '', 'L');
}

sub set_interrupt
{
=comment
        Sets the pins on which an interrupt is activated with a bitmask.
        Interrupts are triggered on changes of the voltage level of the pin,
        i.e. changes from high to low and low to high.
        
        For example: An interrupt bitmask of 9 or 0b1001 will enable the interrupt for
        pins 0 and 3.
        
        The interrupts use the grouping as set by :func:`SetGroup`.
        
        The interrupt is delivered with the callback :func:`Interrupt`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $interrupt_mask) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_INTERRUPT, [$interrupt_mask], 'S', '');
}

sub get_interrupt
{
=comment
        Returns the interrupt bitmask as set by :func:`SetInterrupt`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_INTERRUPT, [], '', 'S');
}

sub get_edge_count
{
=comment
        Returns the current value of the edge counter for the selected pin. You can
        configure the edges that are counted with :func:`SetEdgeCountConfig`.
        
        If you set the reset counter to *true*, the count is set back to 0
        directly after it is read.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $pin, $reset_counter) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EDGE_COUNT, [$pin, $reset_counter], 'C C', 'L');
}

sub set_edge_count_config
{
=comment
        Configures the edge counter for the selected pins. A bitmask of 9 or 0b1001 will
        enable the edge counter for pins 0 and 3.
        
        The edge type parameter configures if rising edges, falling edges or
        both are counted if the pin is configured for input. Possible edge types are:
        
        * 0 = rising (default)
        * 1 = falling
        * 2 = both
        
        The debounce time is given in ms.
        
        Configuring an edge counter resets its value to 0.
        
        If you don't know what any of this means, just leave it at default. The
        default configuration is very likely OK for you.
        
        Default values: 0 (edge type) and 100ms (debounce time)
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $selection_mask, $edge_type, $debounce) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_EDGE_COUNT_CONFIG, [$selection_mask, $edge_type, $debounce], 'S C C', '');
}

sub get_edge_count_config
{
=comment
        Returns the edge type and debounce time for the selected pin as set by
        :func:`SetEdgeCountConfig`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $pin) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EDGE_COUNT_CONFIG, [$pin], 'C', 'C C');
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
