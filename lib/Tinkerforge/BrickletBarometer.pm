
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletBarometer;
=comment
        Device for sensing air pressure and altitude changes
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 221;
use constant CALLBACK_AIR_PRESSURE => 15;
use constant CALLBACK_ALTITUDE => 16;
use constant CALLBACK_AIR_PRESSURE_REACHED => 17;
use constant CALLBACK_ALTITUDE_REACHED => 18;

use constant FUNCTION_GET_AIR_PRESSURE => 1;
use constant FUNCTION_GET_ALTITUDE => 2;
use constant FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD => 3;
use constant FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD => 4;
use constant FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD => 5;
use constant FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD => 6;
use constant FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD => 7;
use constant FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD => 8;
use constant FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD => 9;
use constant FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD => 10;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 11;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 12;
use constant FUNCTION_SET_REFERENCE_AIR_PRESSURE => 13;
use constant FUNCTION_GET_CHIP_TEMPERATURE => 14;
use constant FUNCTION_GET_REFERENCE_AIR_PRESSURE => 19;
use constant FUNCTION_SET_AVERAGING => 20;
use constant FUNCTION_GET_AVERAGING => 21;
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
                                     api_version => [2, 0, 1],
                                     response_expected => shared_clone({&FUNCTION_GET_AIR_PRESSURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_ALTITUDE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_REFERENCE_AIR_PRESSURE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CHIP_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_AIR_PRESSURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_ALTITUDE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_AIR_PRESSURE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_ALTITUDE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_REFERENCE_AIR_PRESSURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_AVERAGING => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_AVERAGING => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_AIR_PRESSURE => 'l',
                                                                      &CALLBACK_ALTITUDE => 'l',
                                                                      &CALLBACK_AIR_PRESSURE_REACHED => 'l',
                                                                      &CALLBACK_ALTITUDE_REACHED => 'l'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_air_pressure
{
=comment
        Returns the air pressure of the air pressure sensor. The value
        has a range of 10000 to 1200000 and is given in mbar/1000, i.e. a value
        of 1001092 means that an air pressure of 1001.092 mbar is measured.
        
        If you want to get the air pressure periodically, it is recommended to use the
        callback :func:`AirPressure` and set the period with
        :func:`SetAirPressureCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AIR_PRESSURE, [], '', 'l');
}

sub get_altitude
{
=comment
        Returns the relative altitude of the air pressure sensor. The value is given in
        cm and is calculated based on the difference between the current air pressure
        and the reference air pressure that can be set with :func:`SetReferenceAirPressure`.
        
        If you want to get the altitude periodically, it is recommended to use the
        callback :func:`Altitude` and set the period with
        :func:`SetAltitudeCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ALTITUDE, [], '', 'l');
}

sub set_air_pressure_callback_period
{
=comment
        Sets the period in ms with which the :func:`AirPressure` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`AirPressure` is only triggered if the air pressure has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_air_pressure_callback_period
{
=comment
        Returns the period as set by :func:`SetAirPressureCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_altitude_callback_period
{
=comment
        Sets the period in ms with which the :func:`Altitude` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Altitude` is only triggered if the altitude has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_altitude_callback_period
{
=comment
        Returns the period as set by :func:`SetAltitudeCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_air_pressure_callback_threshold
{
=comment
        Sets the thresholds for the :func:`AirPressureReached` callback.
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the air pressure is *outside* the min and max values"
         "'i'",    "Callback is triggered when the air pressure is *inside* the min and max values"
         "'<'",    "Callback is triggered when the air pressure is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the air pressure is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

sub get_air_pressure_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetAirPressureCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD, [], '', 'a l l');
 }

sub set_altitude_callback_threshold
{
=comment
        Sets the thresholds for the :func:`AltitudeReached` callback.
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the altitude is *outside* the min and max values"
         "'i'",    "Callback is triggered when the altitude is *inside* the min and max values"
         "'<'",    "Callback is triggered when the altitude is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the altitude is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

sub get_altitude_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetAltitudeCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD, [], '', 'a l l');
 }

sub set_debounce_period
{
=comment
        Sets the period in ms with which the threshold callbacks
        
        * :func:`AirPressureReached`,
        * :func:`AltitudeReached`
        
        are triggered, if the thresholds
        
        * :func:`SetAirPressureCallbackThreshold`,
        * :func:`SetAltitudeCallbackThreshold`
        
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

sub set_reference_air_pressure
{
=comment
        Sets the reference air pressure in mbar/1000 for the altitude calculation.
        Setting the reference to the current air pressure results in a calculated
        altitude of 0cm. Passing 0 is a shortcut for passing the current air pressure as
        reference.
        
        Well known reference values are the Q codes
        `QNH <http://en.wikipedia.org/wiki/QNH>`__ and
        `QFE <http://en.wikipedia.org/wiki/Mean_sea_level_pressure#Mean_sea_level_pressure>`__
        used in aviation.
        
        The default value is 1013.25mbar.
        
        .. versionadded:: 1.1.0~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $air_pressure) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_REFERENCE_AIR_PRESSURE, [$air_pressure], 'l', '');
}

sub get_chip_temperature
{
=comment
        Returns the temperature of the air pressure sensor. The value
        has a range of -4000 to 8500 and is given in °C/100, i.e. a value
        of 2007 means that a temperature of 20.07 °C is measured.
        
        This temperature is used internally for temperature compensation of the air
        pressure measurement. It is not as accurate as the temperature measured by the
        :ref:`temperature_bricklet` or the :ref:`temperature_ir_bricklet`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIP_TEMPERATURE, [], '', 's');
}

sub get_reference_air_pressure
{
=comment
        Returns the reference air pressure as set by :func:`SetReferenceAirPressure`.
        
        .. versionadded:: 1.1.0~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_REFERENCE_AIR_PRESSURE, [], '', 'l');
}

sub set_averaging
{
=comment
        Sets the different averaging parameters. It is possible to set
        the length of a normal averaging for the temperature and pressure,
        as well as an additional length of a 
        `moving average <http://en.wikipedia.org/wiki/Moving_average>`__ 
        for the pressure. The moving average is calculated from the normal 
        averages.  There is no moving average for the temperature.
        
        The maximum length for the pressure average is 10, for the
        temperature average is 255 and for the moving average is 25.
        
        Setting the all three parameters to 0 will turn the averaging
        completely off. If the averaging is off, there is lots of noise
        on the data, but the data is without delay. Thus we recommend
        to turn the averaging off if the Barometer Bricklet data is
        to be used for sensor fusion with other sensors.
        
        The default values are 10 for the normal averages and 25 for the
        moving average.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $moving_average_pressure, $average_pressure, $average_temperature) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_AVERAGING, [$moving_average_pressure, $average_pressure, $average_temperature], 'C C C', '');
}

sub get_averaging
{
=comment
        Returns the averaging configuration as set by :func:`SetAveraging`.
        
        .. versionadded:: 2.0.1~(Plugin)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_AVERAGING, [], '', 'C C C');
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
