
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletIO4;
=comment
        Device for controlling up to 4 general purpose input/output pins
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 29;
use constant CALLBACK_INTERRUPT => 9;
use constant CALLBACK_MONOFLOP_DONE => 12;

use constant FUNCTION_SET_VALUE => 1;
use constant FUNCTION_GET_VALUE => 2;
use constant FUNCTION_SET_CONFIGURATION => 3;
use constant FUNCTION_GET_CONFIGURATION => 4;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 5;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 6;
use constant FUNCTION_SET_INTERRUPT => 7;
use constant FUNCTION_GET_INTERRUPT => 8;
use constant FUNCTION_SET_MONOFLOP => 10;
use constant FUNCTION_GET_MONOFLOP => 11;
use constant FUNCTION_SET_SELECTED_VALUES => 13;
use constant FUNCTION_GET_EDGE_COUNT => 14;
use constant FUNCTION_SET_EDGE_COUNT_CONFIG => 15;
use constant FUNCTION_GET_EDGE_COUNT_CONFIG => 16;
use constant FUNCTION_GET_IDENTITY => 255;

use constant DIRECTION_IN => 'i';
use constant DIRECTION_OUT => 'o';
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
                                     response_expected => shared_clone({&FUNCTION_SET_VALUE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_VALUE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_MONOFLOP => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_MONOFLOP => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_MONOFLOP_DONE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_SELECTED_VALUES => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_EDGE_COUNT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EDGE_COUNT_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_EDGE_COUNT_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_INTERRUPT => 'C C',
                                                                      &CALLBACK_MONOFLOP_DONE => 'C C'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub set_value
{
=comment
        Sets the output value (high or low) with a bitmask (4bit). A 1 in the bitmask
        means high and a 0 in the bitmask means low.
        
        For example: The value 3 or 0b0011 will turn the pins 0-1 high and the
        pins 2-3 low.
        
        .. note::
         This function does nothing for pins that are configured as input.
         Pull-up resistors can be switched on with :func:`SetConfiguration`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $value_mask) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_VALUE, [$value_mask], 'C', '');
}

sub get_value
{
=comment
        Returns a bitmask of the values that are currently measured.
        This function works if the pin is configured to input
        as well as if it is configured to output.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VALUE, [], '', 'C');
}

sub set_configuration
{
=comment
        Configures the value and direction of the specified pins. Possible directions
        are 'i' and 'o' for input and output.
        
        If the direction is configured as output, the value is either high or low
        (set as *true* or *false*).
        
        If the direction is configured as input, the value is either pull-up or
        default (set as *true* or *false*).
        
        For example:
        
        * (15, 'i', true) or (0b1111, 'i', true) will set all pins of as input pull-up.
        * (8, 'i', false) or (0b1000, 'i', false) will set pin 3 of as input default (floating if nothing is connected).
        * (3, 'o', false) or (0b0011, 'o', false) will set pins 0 and 1 as output low.
        * (4, 'o', true) or (0b0100, 'o', true) will set pin 2 of as output high.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $selection_mask, $direction, $value) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CONFIGURATION, [$selection_mask, $direction, $value], 'C a C', '');
}

sub get_configuration
{
=comment
        Returns a value bitmask and a direction bitmask. A 1 in the direction bitmask
        means input and a 0 in the bitmask means output.
        
        For example: A return value of (3, 5) or (0b0011, 0b0101) for direction and
        value means that:
        
        * pin 0 is configured as input pull-up,
        * pin 1 is configured as input default,
        * pin 2 is configured as output high and
        * pin 3 is are configured as output low.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CONFIGURATION, [], '', 'C C');
 }

sub set_debounce_period
{
=comment
        Sets the debounce period of the :func:`Interrupt` callback in ms.
        
        For example: If you set this value to 100, you will get the interrupt
        maximal every 100ms. This is necessary if something that bounces is
        connected to the IO-4 Bricklet, such as a button.
        
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
        
        For example: An interrupt bitmask of 10 or 0b1010 will enable the interrupt for
        pins 1 and 3.
        
        The interrupt is delivered with the callback :func:`Interrupt`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $interrupt_mask) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_INTERRUPT, [$interrupt_mask], 'C', '');
}

sub get_interrupt
{
=comment
        Returns the interrupt bitmask as set by :func:`SetInterrupt`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_INTERRUPT, [], '', 'C');
}

sub set_monoflop
{
=comment
        Configures a monoflop of the pins specified by the first parameter as 4 bit
        long bitmask. The specified pins must be configured for output. Non-output
        pins will be ignored.
        
        The second parameter is a bitmask with the desired value of the specified
        output pins. A 1 in the bitmask means high and a 0 in the bitmask means low.
        
        The third parameter indicates the time (in ms) that the pins should hold
        the value.
        
        If this function is called with the parameters (9, 1, 1500) or
        (0b1001, 0b0001, 1500): Pin 0 will get high and pin 3 will get low. In 1.5s pin
        0 will get low and pin 3 will get high again.
        
        A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
        have a RS485 bus and an IO-4 Bricklet connected to one of the slave
        stacks. You can now call this function every second, with a time parameter
        of two seconds and pin 0 set to high. Pin 0 will be high all the time. If now
        the RS485 connection is lost, then pin 0 will get low in at most two seconds.
        
        .. versionadded:: 1.1.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $selection_mask, $value_mask, $time) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MONOFLOP, [$selection_mask, $value_mask, $time], 'C C L', '');
}

sub get_monoflop
{
=comment
        Returns (for the given pin) the current value and the time as set by
        :func:`SetMonoflop` as well as the remaining time until the value flips.
        
        If the timer is not running currently, the remaining time will be returned
        as 0.
        
        .. versionadded:: 1.1.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $pin) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MONOFLOP, [$pin], 'C', 'C L L');
 }

sub set_selected_values
{
=comment
        Sets the output value (high or low) with a bitmask, according to
        the selection mask. The bitmask is 4 bit long, *true* refers to high 
        and *false* refers to low.
        
        For example: The parameters (9, 4) or (0b0110, 0b0100) will turn
        pin 1 low and pin 2 high, pin 0 and 3 will remain untouched.
        
        .. note::
         This function does nothing for pins that are configured as input.
         Pull-up resistors can be switched on with :func:`SetConfiguration`.
        
        .. versionadded:: 2.0.0~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $selection_mask, $value_mask) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_SELECTED_VALUES, [$selection_mask, $value_mask], 'C C', '');
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
        Configures the edge counter for the selected pins.
        
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

    $self->{super}->send_request($self, &FUNCTION_SET_EDGE_COUNT_CONFIG, [$selection_mask, $edge_type, $debounce], 'C C C', '');
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
