
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletTemperatureIR;
=comment
        Device for non-contact temperature sensing
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 217;
use constant CALLBACK_AMBIENT_TEMPERATURE => 15;
use constant CALLBACK_OBJECT_TEMPERATURE => 16;
use constant CALLBACK_AMBIENT_TEMPERATURE_REACHED => 17;
use constant CALLBACK_OBJECT_TEMPERATURE_REACHED => 18;

use constant FUNCTION_GET_AMBIENT_TEMPERATURE => 1;
use constant FUNCTION_GET_OBJECT_TEMPERATURE => 2;
use constant FUNCTION_SET_EMISSIVITY => 3;
use constant FUNCTION_GET_EMISSIVITY => 4;
use constant FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD => 5;
use constant FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD => 6;
use constant FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD => 7;
use constant FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD => 8;
use constant FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD => 9;
use constant FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD => 10;
use constant FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD => 11;
use constant FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD => 12;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 13;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 14;
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
                                     response_expected => shared_clone({&FUNCTION_GET_AMBIENT_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_OBJECT_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EMISSIVITY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_EMISSIVITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_AMBIENT_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_OBJECT_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_AMBIENT_TEMPERATURE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_OBJECT_TEMPERATURE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_AMBIENT_TEMPERATURE => 's',
                                                                      &CALLBACK_OBJECT_TEMPERATURE => 's',
                                                                      &CALLBACK_AMBIENT_TEMPERATURE_REACHED => 's',
                                                                      &CALLBACK_OBJECT_TEMPERATURE_REACHED => 's'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_ambient_temperature
{
=comment
        Returns the ambient temperature of the sensor. The value
        has a range of -400 to 1250 and is given in °C/10,
        e.g. a value of 423 means that an ambient temperature of 42.3 °C is 
        measured.
        
        If you want to get the ambient temperature periodically, it is recommended 
        to use the callback :func:`AmbientTemperature` and set the period with 
        :func:`SetAmbientTemperatureCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AMBIENT_TEMPERATURE, [], '', 's');
}

sub get_object_temperature
{
=comment
        Returns the object temperature of the sensor, i.e. the temperature
        of the surface of the object the sensor is aimed at. The value
        has a range of -700 to 3800 and is given in °C/10,
        e.g. a value of 3001 means that a temperature of 300.1 °C is measured
        on the surface of the object.
        
        The temperature of different materials is dependent on their `emissivity 
        <http://en.wikipedia.org/wiki/Emissivity>`__. The emissivity of the material
        can be set with :func:`SetEmissivity`.
        
        If you want to get the object temperature periodically, it is recommended 
        to use the callback :func:`ObjectTemperature` and set the period with 
        :func:`SetObjectTemperatureCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_OBJECT_TEMPERATURE, [], '', 's');
}

sub set_emissivity
{
=comment
        Sets the `emissivity <http://en.wikipedia.org/wiki/Emissivity>`__ that is
        used to calculate the surface temperature as returned by 
        :func:`GetObjectTemperature`. 
        
        The emissivity is usually given as a value between 0.0 and 1.0. A list of
        emissivities of different materials can be found 
        `here <http://www.infrared-thermography.com/material.htm>`__.
        
        The parameter of :func:`SetEmissivity` has to be given with a factor of
        65535 (16-bit). For example: An emissivity of 0.1 can be set with the
        value 6553, an emissivity of 0.5 with the value 32767 and so on.
        
        .. note::
         If you need a precise measurement for the object temperature, it is
         absolutely crucial that you also provide a precise emissivity.
        
        The default emissivity is 1.0 (value of 65535) and the minimum emissivity the
        sensor can handle is 0.1 (value of 6553).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $emissivity) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_EMISSIVITY, [$emissivity], 'S', '');
}

sub get_emissivity
{
=comment
        Returns the emissivity as set by :func:`SetEmissivity`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EMISSIVITY, [], '', 'S');
}

sub set_ambient_temperature_callback_period
{
=comment
        Sets the period in ms with which the :func:`AmbientTemperature` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`AmbientTemperature` is only triggered if the temperature has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_ambient_temperature_callback_period
{
=comment
        Returns the period as set by :func:`SetAmbientTemperatureCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_object_temperature_callback_period
{
=comment
        Sets the period in ms with which the :func:`ObjectTemperature` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`ObjectTemperature` is only triggered if the temperature has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_object_temperature_callback_period
{
=comment
        Returns the period as set by :func:`SetObjectTemperatureCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_ambient_temperature_callback_threshold
{
=comment
        Sets the thresholds for the :func:`AmbientTemperatureReached` callback. 
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the ambient temperature is *outside* the min and max values"
         "'i'",    "Callback is triggered when the ambient temperature is *inside* the min and max values"
         "'<'",    "Callback is triggered when the ambient temperature is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the ambient temperature is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

sub get_ambient_temperature_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetAmbientTemperatureCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, [], '', 'a s s');
 }

sub set_object_temperature_callback_threshold
{
=comment
        Sets the thresholds for the :func:`ObjectTemperatureReached` callback. 
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the object temperature is *outside* the min and max values"
         "'i'",    "Callback is triggered when the object temperature is *inside* the min and max values"
         "'<'",    "Callback is triggered when the object temperature is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the object temperature is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a s s', '');
}

sub get_object_temperature_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetObjectTemperatureCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, [], '', 'a s s');
 }

sub set_debounce_period
{
=comment
        Sets the period in ms with which the threshold callbacks
        
        * :func:`AmbientTemperatureReached`,
        * :func:`ObjectTemperatureReached`
        
        are triggered, if the thresholds
        
        * :func:`SetAmbientTemperatureCallbackThreshold`,
        * :func:`SetObjectTemperatureCallbackThreshold`
        
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
