
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletHallEffect;
=comment
        Device that detects presence of magnetic field via hall effect
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 240;
use constant CALLBACK_EDGE_COUNT => 10;

use constant FUNCTION_GET_VALUE => 1;
use constant FUNCTION_GET_EDGE_COUNT => 2;
use constant FUNCTION_SET_EDGE_COUNT_CONFIG => 3;
use constant FUNCTION_GET_EDGE_COUNT_CONFIG => 4;
use constant FUNCTION_SET_EDGE_INTERRUPT => 5;
use constant FUNCTION_GET_EDGE_INTERRUPT => 6;
use constant FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD => 7;
use constant FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD => 8;
use constant FUNCTION_EDGE_INTERRUPT => 9;
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
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_GET_VALUE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_EDGE_COUNT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EDGE_COUNT_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_EDGE_COUNT_CONFIG => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EDGE_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_EDGE_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_EDGE_INTERRUPT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_EDGE_COUNT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({                                                                      &CALLBACK_EDGE_COUNT => 'L C'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_value
{
=comment
        Returns *true* if a magnetic field of 35 Gauss (3.5mT) or greater is detected.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VALUE, [], '', 'C');
}

sub get_edge_count
{
=comment
        Returns the current value of the edge counter. You can configure
        edge type (rising, falling, both) that is counted with
        :func:`SetEdgeCountConfig`.
        
        If you set the reset counter to *true*, the count is set back to 0
        directly after it is read.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $reset_counter) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EDGE_COUNT, [$reset_counter], 'C', 'L');
}

sub set_edge_count_config
{
=comment
        The edge type parameter configures if rising edges, falling edges or 
        both are counted. Possible edge types are:
        
        * 0 = rising (default)
        * 1 = falling
        * 2 = both
        
        A magnetic field of 35 Gauss (3.5mT) or greater causes a falling edge and a
        magnetic field of 25 Gauss (2.5mT) or smaller causes a rising edge.
        
        If a magnet comes near the Bricklet the signal goes low (falling edge), if
        a magnet is removed from the vicinity the signal goes high (rising edge).
        
        The debounce time is given in ms.
        
        Configuring an edge counter resets its value to 0.
        
        If you don't know what any of this means, just leave it at default. The
        default configuration is very likely OK for you.
        
        Default values: 0 (edge type) and 100ms (debounce time)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $edge_type, $debounce) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_EDGE_COUNT_CONFIG, [$edge_type, $debounce], 'C C', '');
}

sub get_edge_count_config
{
=comment
        Returns the edge type and debounce time as set by :func:`SetEdgeCountConfig`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EDGE_COUNT_CONFIG, [], '', 'C C');
 }

sub set_edge_interrupt
{
=comment
        Sets the number of edges until an interrupt is invoked.
        
        If *edges* is set to n, an interrupt is invoked for every n-th detected edge.
        
        If *edges* is set to 0, the interrupt is disabled.
        
        Default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $edges) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_EDGE_INTERRUPT, [$edges], 'L', '');
}

sub get_edge_interrupt
{
=comment
        Returns the edges as set by :func:`SetEdgeInterrupt`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EDGE_INTERRUPT, [], '', 'L');
}

sub set_edge_count_callback_period
{
=comment
        Sets the period in ms with which the :func:`EdgeCount` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`EdgeCount` is only triggered if the edge count has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_edge_count_callback_period
{
=comment
        Returns the period as set by :func:`SetEdgeCountCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD, [], '', 'L');
}

sub edge_interrupt
{
=comment
        This callback is triggered every n-th count, as configured with
        :func:`SetEdgeInterrupt`. The parameters are the
        current count and the current value (see :func:`GetValue` and :func:`GetEdgeCount`).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_EDGE_INTERRUPT, [], '', 'L C');
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
