
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickDC;
=comment
        Device for controlling DC motors
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 11;
use constant CALLBACK_UNDER_VOLTAGE => 21;
use constant CALLBACK_EMERGENCY_SHUTDOWN => 22;
use constant CALLBACK_VELOCITY_REACHED => 23;
use constant CALLBACK_CURRENT_VELOCITY => 24;

use constant FUNCTION_SET_VELOCITY => 1;
use constant FUNCTION_GET_VELOCITY => 2;
use constant FUNCTION_GET_CURRENT_VELOCITY => 3;
use constant FUNCTION_SET_ACCELERATION => 4;
use constant FUNCTION_GET_ACCELERATION => 5;
use constant FUNCTION_SET_PWM_FREQUENCY => 6;
use constant FUNCTION_GET_PWM_FREQUENCY => 7;
use constant FUNCTION_FULL_BRAKE => 8;
use constant FUNCTION_GET_STACK_INPUT_VOLTAGE => 9;
use constant FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => 10;
use constant FUNCTION_GET_CURRENT_CONSUMPTION => 11;
use constant FUNCTION_ENABLE => 12;
use constant FUNCTION_DISABLE => 13;
use constant FUNCTION_IS_ENABLED => 14;
use constant FUNCTION_SET_MINIMUM_VOLTAGE => 15;
use constant FUNCTION_GET_MINIMUM_VOLTAGE => 16;
use constant FUNCTION_SET_DRIVE_MODE => 17;
use constant FUNCTION_GET_DRIVE_MODE => 18;
use constant FUNCTION_SET_CURRENT_VELOCITY_PERIOD => 19;
use constant FUNCTION_GET_CURRENT_VELOCITY_PERIOD => 20;
use constant FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => 241;
use constant FUNCTION_GET_CHIP_TEMPERATURE => 242;
use constant FUNCTION_RESET => 243;
use constant FUNCTION_GET_IDENTITY => 255;

use constant DRIVE_MODE_DRIVE_BRAKE => 0;
use constant DRIVE_MODE_DRIVE_COAST => 1;

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_SET_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CURRENT_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ACCELERATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_ACCELERATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_PWM_FREQUENCY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_PWM_FREQUENCY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_FULL_BRAKE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_STACK_INPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CURRENT_CONSUMPTION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_ENABLE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_DISABLE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_IS_ENABLED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_MINIMUM_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_MINIMUM_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DRIVE_MODE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_DRIVE_MODE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CURRENT_VELOCITY_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_CURRENT_VELOCITY_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_UNDER_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_EMERGENCY_SHUTDOWN => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_VELOCITY_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_CURRENT_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CHIP_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_RESET => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_UNDER_VOLTAGE => 'S',
                                                                      &CALLBACK_EMERGENCY_SHUTDOWN => '',
                                                                      &CALLBACK_VELOCITY_REACHED => 's',
                                                                      &CALLBACK_CURRENT_VELOCITY => 's'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub set_velocity
{
=comment
        Sets the velocity of the motor. Whereas -32767 is full speed backward,
        0 is stop and 32767 is full speed forward. Depending on the
        acceleration (see :func:`SetAcceleration`), the motor is not immediately
        brought to the velocity but smoothly accelerated.
        
        The velocity describes the duty cycle of the PWM with which the motor is
        controlled, e.g. a velocity of 3277 sets a PWM with a 10% duty cycle.
        You can not only control the duty cycle of the PWM but also the frequency,
        see :func:`SetPWMFrequency`.
        
        The default velocity is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $velocity) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_VELOCITY, [$velocity], 's', '');
}

sub get_velocity
{
=comment
        Returns the velocity as set by :func:`SetVelocity`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VELOCITY, [], '', 's');
}

sub get_current_velocity
{
=comment
        Returns the *current* velocity of the motor. This value is different
        from :func:`GetVelocity` whenever the motor is currently accelerating
        to a goal set by :func:`SetVelocity`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_VELOCITY, [], '', 's');
}

sub set_acceleration
{
=comment
        Sets the acceleration of the motor. It is given in *velocity/s*. An
        acceleration of 10000 means, that every second the velocity is increased
        by 10000 (or about 30% duty cycle).
        
        For example: If the current velocity is 0 and you want to accelerate to a
        velocity of 16000 (about 50% duty cycle) in 10 seconds, you should set
        an acceleration of 1600.
        
        If acceleration is set to 0, there is no speed ramping, i.e. a new velocity
        is immediately given to the motor.
        
        The default acceleration is 10000.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $acceleration) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ACCELERATION, [$acceleration], 'S', '');
}

sub get_acceleration
{
=comment
        Returns the acceleration as set by :func:`SetAcceleration`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ACCELERATION, [], '', 'S');
}

sub set_pwm_frequency
{
=comment
        Sets the frequency (in Hz) of the PWM with which the motor is driven.
        The possible range of the frequency is 1-20000Hz. Often a high frequency
        is less noisy and the motor runs smoother. However, with a low frequency
        there are less switches and therefore fewer switching losses. Also with
        most motors lower frequencies enable higher torque.
        
        If you have no idea what all this means, just ignore this function and use
        the default frequency, it will very likely work fine.
        
        The default frequency is 15 kHz.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $frequency) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_PWM_FREQUENCY, [$frequency], 'S', '');
}

sub get_pwm_frequency
{
=comment
        Returns the PWM frequency (in Hz) as set by :func:`SetPWMFrequency`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_PWM_FREQUENCY, [], '', 'S');
}

sub full_brake
{
=comment
        Executes an active full brake.
        
        .. warning::
         This function is for emergency purposes,
         where an immediate brake is necessary. Depending on the current velocity and
         the strength of the motor, a full brake can be quite violent.
        
        Call :func:`SetVelocity` with 0 if you just want to stop the motor.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_FULL_BRAKE, [], '', '');
}

sub get_stack_input_voltage
{
=comment
        Returns the stack input voltage in mV. The stack input voltage is the
        voltage that is supplied via the stack, i.e. it is given by a
        Step-Down or Step-Up Power Supply.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_INPUT_VOLTAGE, [], '', 'S');
}

sub get_external_input_voltage
{
=comment
        Returns the external input voltage in mV. The external input voltage is
        given via the black power input connector on the DC Brick.
        
        If there is an external input voltage and a stack input voltage, the motor
        will be driven by the external input voltage. If there is only a stack
        voltage present, the motor will be driven by this voltage.
        
        .. warning::
         This means, if you have a high stack voltage and a low external voltage,
         the motor will be driven with the low external voltage. If you then remove
         the external connection, it will immediately be driven by the high
         stack voltage.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, [], '', 'S');
}

sub get_current_consumption
{
=comment
        Returns the current consumption of the motor in mA.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_CONSUMPTION, [], '', 'S');
}

sub enable
{
=comment
        Enables the driver chip. The driver parameters can be configured (velocity,
        acceleration, etc) before it is enabled.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_ENABLE, [], '', '');
}

sub disable
{
=comment
        Disables the driver chip. The configurations are kept (velocity,
        acceleration, etc) but the motor is not driven until it is enabled again.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_DISABLE, [], '', '');
}

sub is_enabled
{
=comment
        Returns *true* if the driver chip is enabled, *false* otherwise.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_ENABLED, [], '', 'C');
}

sub set_minimum_voltage
{
=comment
        Sets the minimum voltage in mV, below which the :func:`UnderVoltage` callback
        is triggered. The minimum possible value that works with the DC Brick is 5V.
        You can use this function to detect the discharge of a battery that is used
        to drive the motor. If you have a fixed power supply, you likely do not need
        this functionality.
        
        The default value is 5V.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $voltage) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MINIMUM_VOLTAGE, [$voltage], 'S', '');
}

sub get_minimum_voltage
{
=comment
        Returns the minimum voltage as set by :func:`SetMinimumVoltage`
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MINIMUM_VOLTAGE, [], '', 'S');
}

sub set_drive_mode
{
=comment
        Sets the drive mode. Possible modes are:
        
        * 0 = Drive/Brake
        * 1 = Drive/Coast
        
        These modes are different kinds of motor controls.
        
        In Drive/Brake mode, the motor is always either driving or braking. There
        is no freewheeling. Advantages are: A more linear correlation between
        PWM and velocity, more exact accelerations and the possibility to drive
        with slower velocities.
        
        In Drive/Coast mode, the motor is always either driving or freewheeling.
        Advantages are: Less current consumption and less demands on the motor and
        driver chip.
        
        The default value is 0 = Drive/Brake.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $mode) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DRIVE_MODE, [$mode], 'C', '');
}

sub get_drive_mode
{
=comment
        Returns the drive mode, as set by :func:`SetDriveMode`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DRIVE_MODE, [], '', 'C');
}

sub set_current_velocity_period
{
=comment
        Sets a period in ms with which the :func:`CurrentVelocity` callback is triggered.
        A period of 0 turns the callback off.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CURRENT_VELOCITY_PERIOD, [$period], 'S', '');
}

sub get_current_velocity_period
{
=comment
        Returns the period as set by :func:`SetCurrentVelocityPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_VELOCITY_PERIOD, [], '', 'S');
}

sub get_protocol1_bricklet_name
{
=comment
        Returns the firmware and protocol version and the name of the Bricklet for a
        given port.
        
        This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
        plugins.
        
        .. versionadded:: 2.0.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $port) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, [$port], 'a', 'C C3 Z40');
 }

sub get_chip_temperature
{
=comment
        Returns the temperature in °C/10 as measured inside the microcontroller. The
        value returned is not the ambient temperature!
        
        The temperature is only proportional to the real temperature and it has an
        accuracy of +-15%. Practically it is only useful as an indicator for
        temperature changes.
        
        .. versionadded:: 1.1.3~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIP_TEMPERATURE, [], '', 's');
}

sub reset
{
=comment
        Calling this function will reset the Brick. Calling this function
        on a Brick inside of a stack will reset the whole stack.
        
        After a reset you have to create new device objects,
        calling functions on the existing ones will result in
        undefined behavior!
        
        .. versionadded:: 1.1.3~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_RESET, [], '', '');
}

sub get_identity
{
=comment
        Returns the UID, the UID where the Brick is connected to, 
        the position, the hardware and firmware version as well as the
        device identifier.
        
        The position can be '0'-'8' (stack position).
        
        The device identifier numbers can be found :ref:`here <device_identifier>`.
        |device_identifier_constant|
        
        .. versionadded:: 2.0.0~(Firmware)
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
