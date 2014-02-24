
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletDistanceUS;
=comment
        Device for sensing distance via ultrasound
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 229;
use constant CALLBACK_DISTANCE => 8;
use constant CALLBACK_DISTANCE_REACHED => 9;

use constant FUNCTION_GET_DISTANCE_VALUE => 1;
use constant FUNCTION_SET_DISTANCE_CALLBACK_PERIOD => 2;
use constant FUNCTION_GET_DISTANCE_CALLBACK_PERIOD => 3;
use constant FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD => 4;
use constant FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD => 5;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 6;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 7;
use constant FUNCTION_SET_MOVING_AVERAGE => 10;
use constant FUNCTION_GET_MOVING_AVERAGE => 11;
use constant FUNCTION_GET_IDENTITY => 255;

use constant THRESHOLD_OPTION_OFF => 'x';
use constant THRESHOLD_OPTION_OUTSIDE => 'o';
use constant THRESHOLD_OPTION_INSIDE => 'i';
use constant THRESHOLD_OPTION_SMALLER => '<';
use constant THRESHOLD_OPTION_GREATER => '>';

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_GET_DISTANCE_VALUE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DISTANCE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DISTANCE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_DISTANCE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_DISTANCE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_MOVING_AVERAGE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_MOVING_AVERAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_DISTANCE => 'S',
                                                                      &CALLBACK_DISTANCE_REACHED => 'S'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_distance_value
{
=comment
        Returns the current distance value measured by the sensor. The value has a
        range of 0 to 4095. A small value corresponds to a small distance, a big
        value corresponds to a big distance. The relation between the measured distance
        value and the actual distance is affected by the 5V supply voltage (deviations
        in the supply voltage result in deviations in the distance values) and is
        non-linear (resolution is bigger at close range).
        
        If you want to get the distance value periodically, it is recommended to
        use the callback :func:`Distance` and set the period with 
        :func:`SetDistanceCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DISTANCE_VALUE, [], '', 'S');
}

sub set_distance_callback_period
{
=comment
        Sets the period in ms with which the :func:`Distance` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Distance` is only triggered if the distance value has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_distance_callback_period
{
=comment
        Returns the period as set by :func:`SetDistanceCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_distance_callback_threshold
{
=comment
        Sets the thresholds for the :func:`DistanceReached` callback. 
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the distance value is *outside* the min and max values"
         "'i'",    "Callback is triggered when the distance value is *inside* the min and max values"
         "'<'",    "Callback is triggered when the distance value is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the distance value is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

sub get_distance_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetDistanceCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, [], '', 'a s s');
 }

sub set_debounce_period
{
=comment
        Sets the period in ms with which the threshold callbacks
        
        * :func:`DistanceReached`,
        
        are triggered, if the thresholds
        
        * :func:`SetDistanceCallbackThreshold`,
        
        keep being reached.
        
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

sub set_moving_average
{
=comment
        Sets the length of a `moving averaging <http://en.wikipedia.org/wiki/Moving_average>`__ 
        for the distance value.
        
        Setting the length to 0 will turn the averaging completely off. With less
        averaging, there is more noise on the data.
        
        The range for the averaging is 0-100.
        
        The default value is 20.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $average) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MOVING_AVERAGE, [$average], 'C', '');
}

sub get_moving_average
{
=comment
        Returns the length moving average as set by :func:`SetMovingAverage`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MOVING_AVERAGE, [], '', 'C');
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
