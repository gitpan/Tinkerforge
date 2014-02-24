
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletIndustrialDual020mA;
=comment
        Device for sensing two currents between 0 and 20mA (IEC 60381-1)
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 228;
use constant CALLBACK_CURRENT => 10;
use constant CALLBACK_CURRENT_REACHED => 11;

use constant FUNCTION_GET_CURRENT => 1;
use constant FUNCTION_SET_CURRENT_CALLBACK_PERIOD => 2;
use constant FUNCTION_GET_CURRENT_CALLBACK_PERIOD => 3;
use constant FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => 4;
use constant FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => 5;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 6;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 7;
use constant FUNCTION_SET_SAMPLE_RATE => 8;
use constant FUNCTION_GET_SAMPLE_RATE => 9;
use constant FUNCTION_GET_IDENTITY => 255;

use constant THRESHOLD_OPTION_OFF => 'x';
use constant THRESHOLD_OPTION_OUTSIDE => 'o';
use constant THRESHOLD_OPTION_INSIDE => 'i';
use constant THRESHOLD_OPTION_SMALLER => '<';
use constant THRESHOLD_OPTION_GREATER => '>';
use constant SAMPLE_RATE_240_SPS => 0;
use constant SAMPLE_RATE_60_SPS => 1;
use constant SAMPLE_RATE_15_SPS => 2;
use constant SAMPLE_RATE_4_SPS => 3;

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_GET_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CURRENT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_CURRENT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_SAMPLE_RATE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_SAMPLE_RATE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_CURRENT_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_CURRENT => 'C l',
                                                                      &CALLBACK_CURRENT_REACHED => 'C l'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_current
{
=comment
        Returns the current of the specified sensor (0 or 1). The value is in nA
        and between 0nA and 22505322nA (22.5mA).
        
        It is possible to detect if an IEC 60381-1 compatible sensor is connected
        and if it works probably.
        
        If the returned current is below 4mA, there is likely no sensor connected
        or the sensor may be defect. If the returned current is over 20mA, there might
        be a short circuit or the sensor may be defect.
        
        If you want to get the current periodically, it is recommended to use the
        callback :func:`Current` and set the period with 
        :func:`SetCurrentCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $sensor) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT, [$sensor], 'C', 'l');
}

sub set_current_callback_period
{
=comment
        Sets the period in ms with which the :func:`Current` callback is triggered
        periodically for the given sensor. A value of 0 turns the callback off.
        
        :func:`Current` is only triggered if the current has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $sensor, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CURRENT_CALLBACK_PERIOD, [$sensor, $period], 'C L', '');
}

sub get_current_callback_period
{
=comment
        Returns the period as set by :func:`SetCurrentCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $sensor) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_CALLBACK_PERIOD, [$sensor], 'C', 'L');
}

sub set_current_callback_threshold
{
=comment
        Sets the thresholds for the :func:`CurrentReached` callback for the given
        sensor.
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the current is *outside* the min and max values"
         "'i'",    "Callback is triggered when the current is *inside* the min and max values"
         "'<'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $sensor, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, [$sensor, $option, $min, $max], 'C a l l', '');
}

sub get_current_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetCurrentCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $sensor) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, [$sensor], 'C', 'a l l');
 }

sub set_debounce_period
{
=comment
        Sets the period in ms with which the threshold callback
        
        * :func:`CurrentReached`
        
        is triggered, if the threshold
        
        * :func:`SetCurrentCallbackThreshold`
        
        keeps being reached.
        
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

sub set_sample_rate
{
=comment
        Sets the sample rate to either 240, 60, 15 or 4 samples per second.
        The resolution for the rates is 12, 14, 16 and 18 bit respectively.
        
        .. csv-table::
         :header: "Value", "Description"
         :widths: 10, 100
        
         "0",    "240 samples per second, 12 bit resolution"
         "1",    "60 samples per second, 14 bit resolution"
         "2",    "15 samples per second, 16 bit resolution"
         "3",    "4 samples per second, 18 bit resolution"
        
        The default value is 3: 4 samples per second with 18 bit resolution.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $rate) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_SAMPLE_RATE, [$rate], 'C', '');
}

sub get_sample_rate
{
=comment
        Returns the sample rate as set by :func:`SetSampleRate`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_SAMPLE_RATE, [], '', 'C');
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
