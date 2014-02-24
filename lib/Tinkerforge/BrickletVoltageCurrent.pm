
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletVoltageCurrent;
=comment
        Device for high precision sensing of voltage and current
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 227;
use constant CALLBACK_CURRENT => 22;
use constant CALLBACK_VOLTAGE => 23;
use constant CALLBACK_POWER => 24;
use constant CALLBACK_CURRENT_REACHED => 25;
use constant CALLBACK_VOLTAGE_REACHED => 26;
use constant CALLBACK_POWER_REACHED => 27;

use constant FUNCTION_GET_CURRENT => 1;
use constant FUNCTION_GET_VOLTAGE => 2;
use constant FUNCTION_GET_POWER => 3;
use constant FUNCTION_SET_CONFIGURATION => 4;
use constant FUNCTION_GET_CONFIGURATION => 5;
use constant FUNCTION_SET_CALIBRATION => 6;
use constant FUNCTION_GET_CALIBRATION => 7;
use constant FUNCTION_SET_CURRENT_CALLBACK_PERIOD => 8;
use constant FUNCTION_GET_CURRENT_CALLBACK_PERIOD => 9;
use constant FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD => 10;
use constant FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD => 11;
use constant FUNCTION_SET_POWER_CALLBACK_PERIOD => 12;
use constant FUNCTION_GET_POWER_CALLBACK_PERIOD => 13;
use constant FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => 14;
use constant FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => 15;
use constant FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD => 16;
use constant FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD => 17;
use constant FUNCTION_SET_POWER_CALLBACK_THRESHOLD => 18;
use constant FUNCTION_GET_POWER_CALLBACK_THRESHOLD => 19;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 20;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 21;
use constant FUNCTION_GET_IDENTITY => 255;

use constant AVERAGING_1 => 0;
use constant AVERAGING_4 => 1;
use constant AVERAGING_16 => 2;
use constant AVERAGING_64 => 3;
use constant AVERAGING_128 => 4;
use constant AVERAGING_256 => 5;
use constant AVERAGING_512 => 6;
use constant AVERAGING_1024 => 7;
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
                                     response_expected => shared_clone({&FUNCTION_GET_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_POWER => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CALIBRATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CALIBRATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CURRENT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_CURRENT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_POWER_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_POWER_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_POWER_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_POWER_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_POWER => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_CURRENT_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_VOLTAGE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_POWER_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_CURRENT => 'l',
                                                                      &CALLBACK_VOLTAGE => 'l',
                                                                      &CALLBACK_POWER => 'l',
                                                                      &CALLBACK_CURRENT_REACHED => 'l',
                                                                      &CALLBACK_VOLTAGE_REACHED => 'l',
                                                                      &CALLBACK_POWER_REACHED => 'l'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_current
{
=comment
        Returns the current. The value is in mA
        and between -20000mA and 20000mA.
        
        If you want to get the current periodically, it is recommended to use the
        callback :func:`Current` and set the period with 
        :func:`SetCurrentCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT, [], '', 'l');
}

sub get_voltage
{
=comment
        Returns the voltage. The value is in mV
        and between 0mV and 36000mV.
        
        If you want to get the voltage periodically, it is recommended to use the
        callback :func:`Voltage` and set the period with 
        :func:`SetVoltageCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VOLTAGE, [], '', 'l');
}

sub get_power
{
=comment
        Returns the power. The value is in mW
        and between 0mV and 720000mW.
        
        If you want to get the power periodically, it is recommended to use the
        callback :func:`Power` and set the period with 
        :func:`SetPowerCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_POWER, [], '', 'l');
}

sub set_configuration
{
=comment
        Sets the configuration of the Voltage/Current Bricklet. It is
        possible to configure number of averages as well as
        voltage and current conversion time.
        
        Averaging:
        
        .. csv-table::
         :header: "Value", "Number of Averages"
         :widths: 20, 20
        
         "0",    "1"
         "1",    "4"
         "2",    "16"
         "3",    "64"
         "4",    "128"
         "5",    "256"
         "6",    "512"
         ">=7",  "1024"
        
        Voltage/Current conversion:
        
        .. csv-table::
         :header: "Value", "Conversion time"
         :widths: 20, 20
        
         "0",    "140µs"
         "1",    "204µs"
         "2",    "332µs"
         "3",    "588µs"
         "4",    "1.1ms"
         "5",    "2.116ms"
         "6",    "4.156ms"
         ">=7",  "8.244ms"
        
        The default values are 3, 4 and 4 (64, 1.1ms, 1.1ms) for averaging, voltage 
        conversion and current conversion.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $averaging, $voltage_conversion_time, $current_conversion_time) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CONFIGURATION, [$averaging, $voltage_conversion_time, $current_conversion_time], 'C C C', '');
}

sub get_configuration
{
=comment
        Returns the configuration as set by :func:`SetConfiguration`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CONFIGURATION, [], '', 'C C C');
 }

sub set_calibration
{
=comment
        Since the shunt resistor that is used to measure the current is not
        perfectly precise, it needs to be calibrated by a multiplier and
        divisor if a very precise reading is needed.
        
        For example, if you are expecting a measurement of 1000mA and you
        are measuring 1023mA, you can calibrate the Voltage/Current Bricklet 
        by setting the multiplier to 1000 and the divisor to 1023.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $gain_multiplier, $gain_divisor) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CALIBRATION, [$gain_multiplier, $gain_divisor], 'S S', '');
}

sub get_calibration
{
=comment
        Returns the calibration as set by :func:`SetCalibration`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CALIBRATION, [], '', 'S S');
 }

sub set_current_callback_period
{
=comment
        Sets the period in ms with which the :func:`Current` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Current` is only triggered if the current has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CURRENT_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_current_callback_period
{
=comment
        Returns the period as set by :func:`SetCurrentCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_CALLBACK_PERIOD, [], '', 'L');
}

sub set_voltage_callback_period
{
=comment
        Sets the period in ms with which the :func:`Voltage` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Voltage` is only triggered if the voltage has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_voltage_callback_period
{
=comment
        Returns the period as set by :func:`SetVoltageCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_power_callback_period
{
=comment
        Sets the period in ms with which the :func:`Power` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Power` is only triggered if the power has changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_POWER_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_power_callback_period
{
=comment
        Returns the period as set by :func:`GetPowerCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_POWER_CALLBACK_PERIOD, [], '', 'L');
}

sub set_current_callback_threshold
{
=comment
        Sets the thresholds for the :func:`CurrentReached` callback. 
        
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

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

sub get_current_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetCurrentCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, [], '', 'a l l');
 }

sub set_voltage_callback_threshold
{
=comment
        Sets the thresholds for the :func:`VoltageReached` callback. 
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
         "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
         "'<'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

sub get_voltage_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetVoltageCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, [], '', 'a l l');
 }

sub set_power_callback_threshold
{
=comment
        Sets the thresholds for the :func:`PowerReached` callback. 
        
        The following options are possible:
        
        .. csv-table::
         :header: "Option", "Description"
         :widths: 10, 100
        
         "'x'",    "Callback is turned off"
         "'o'",    "Callback is triggered when the power is *outside* the min and max values"
         "'i'",    "Callback is triggered when the power is *inside* the min and max values"
         "'<'",    "Callback is triggered when the power is smaller than the min value (max is ignored)"
         "'>'",    "Callback is triggered when the power is greater than the min value (max is ignored)"
        
        The default value is ('x', 0, 0).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_POWER_CALLBACK_THRESHOLD, [$option, $min, $max], 'a l l', '');
}

sub get_power_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetPowerCallbackThreshold`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_POWER_CALLBACK_THRESHOLD, [], '', 'a l l');
 }

sub set_debounce_period
{
=comment
        Sets the period in ms with which the threshold callbacks
        
        * :func:`CurrentReached`,
        * :func:`VoltageReached`,
        * :func:`PowerReached`
        
        are triggered, if the thresholds
        
        * :func:`SetCurrentCallbackThreshold`,
        * :func:`SetVoltageCallbackThreshold`,
        * :func:`SetPowerCallbackThreshold`
        
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
