
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickServo;
=comment
        Device for controlling up to seven servos
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 14;
use constant CALLBACK_UNDER_VOLTAGE => 26;
use constant CALLBACK_POSITION_REACHED => 27;
use constant CALLBACK_VELOCITY_REACHED => 28;

use constant FUNCTION_ENABLE => 1;
use constant FUNCTION_DISABLE => 2;
use constant FUNCTION_IS_ENABLED => 3;
use constant FUNCTION_SET_POSITION => 4;
use constant FUNCTION_GET_POSITION => 5;
use constant FUNCTION_GET_CURRENT_POSITION => 6;
use constant FUNCTION_SET_VELOCITY => 7;
use constant FUNCTION_GET_VELOCITY => 8;
use constant FUNCTION_GET_CURRENT_VELOCITY => 9;
use constant FUNCTION_SET_ACCELERATION => 10;
use constant FUNCTION_GET_ACCELERATION => 11;
use constant FUNCTION_SET_OUTPUT_VOLTAGE => 12;
use constant FUNCTION_GET_OUTPUT_VOLTAGE => 13;
use constant FUNCTION_SET_PULSE_WIDTH => 14;
use constant FUNCTION_GET_PULSE_WIDTH => 15;
use constant FUNCTION_SET_DEGREE => 16;
use constant FUNCTION_GET_DEGREE => 17;
use constant FUNCTION_SET_PERIOD => 18;
use constant FUNCTION_GET_PERIOD => 19;
use constant FUNCTION_GET_SERVO_CURRENT => 20;
use constant FUNCTION_GET_OVERALL_CURRENT => 21;
use constant FUNCTION_GET_STACK_INPUT_VOLTAGE => 22;
use constant FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => 23;
use constant FUNCTION_SET_MINIMUM_VOLTAGE => 24;
use constant FUNCTION_GET_MINIMUM_VOLTAGE => 25;
use constant FUNCTION_ENABLE_POSITION_REACHED_CALLBACK => 29;
use constant FUNCTION_DISABLE_POSITION_REACHED_CALLBACK => 30;
use constant FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED => 31;
use constant FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK => 32;
use constant FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK => 33;
use constant FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED => 34;
use constant FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => 241;
use constant FUNCTION_GET_CHIP_TEMPERATURE => 242;
use constant FUNCTION_RESET => 243;
use constant FUNCTION_GET_IDENTITY => 255;


sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_ENABLE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_DISABLE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_IS_ENABLED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CURRENT_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CURRENT_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ACCELERATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_ACCELERATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_OUTPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_OUTPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_PULSE_WIDTH => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_PULSE_WIDTH => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEGREE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_DEGREE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_SERVO_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_OVERALL_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_STACK_INPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_MINIMUM_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_MINIMUM_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_UNDER_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_POSITION_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_VELOCITY_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_ENABLE_POSITION_REACHED_CALLBACK => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_DISABLE_POSITION_REACHED_CALLBACK => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CHIP_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_RESET => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_UNDER_VOLTAGE => 'S',
                                                                      &CALLBACK_POSITION_REACHED => 'C s',
                                                                      &CALLBACK_VELOCITY_REACHED => 'C s'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub enable
{
=comment
        Enables a servo (0 to 6). If a servo is enabled, the configured position,
        velocity, acceleration, etc. are applied immediately.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    $self->{super}->send_request($self, &FUNCTION_ENABLE, [$servo_num], 'C', '');
}

sub disable
{
=comment
        Disables a servo (0 to 6). Disabled servos are not driven at all, i.e. a
        disabled servo will not hold its position if a load is applied.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    $self->{super}->send_request($self, &FUNCTION_DISABLE, [$servo_num], 'C', '');
}

sub is_enabled
{
=comment
        Returns *true* if the specified servo is enabled, *false* otherwise.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_ENABLED, [$servo_num], 'C', 'C');
}

sub set_position
{
=comment
        Sets the position in °/100 for the specified servo. 
        
        The default range of the position is -9000 to 9000, but it can be specified
        according to your servo with :func:`SetDegree`.
        
        If you want to control a linear servo or RC brushless motor controller or
        similar with the Servo Brick, you can also define lengths or speeds with
        :func:`SetDegree`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num, $position) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_POSITION, [$servo_num, $position], 'C s', '');
}

sub get_position
{
=comment
        Returns the position of the specified servo as set by :func:`SetPosition`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_POSITION, [$servo_num], 'C', 's');
}

sub get_current_position
{
=comment
        Returns the *current* position of the specified servo. This may not be the
        value of :func:`SetPosition` if the servo is currently approaching a
        position goal.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_POSITION, [$servo_num], 'C', 's');
}

sub set_velocity
{
=comment
        Sets the maximum velocity of the specified servo in °/100s. The velocity
        is accelerated according to the value set by :func:`SetAcceleration`.
        
        The minimum velocity is 0 (no movement) and the maximum velocity is 65535.
        With a value of 65535 the position will be set immediately (no velocity).
        
        The default value is 65535.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num, $velocity) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_VELOCITY, [$servo_num, $velocity], 'C S', '');
}

sub get_velocity
{
=comment
        Returns the velocity of the specified servo as set by :func:`SetVelocity`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_VELOCITY, [$servo_num], 'C', 'S');
}

sub get_current_velocity
{
=comment
        Returns the *current* velocity of the specified servo. This may not be the
        value of :func:`SetVelocity` if the servo is currently approaching a
        velocity goal.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_VELOCITY, [$servo_num], 'C', 'S');
}

sub set_acceleration
{
=comment
        Sets the acceleration of the specified servo in °/100s².
        
        The minimum acceleration is 1 and the maximum acceleration is 65535.
        With a value of 65535 the velocity will be set immediately (no acceleration).
        
        The default value is 65535.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num, $acceleration) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ACCELERATION, [$servo_num, $acceleration], 'C S', '');
}

sub get_acceleration
{
=comment
        Returns the acceleration for the specified servo as set by 
        :func:`SetAcceleration`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ACCELERATION, [$servo_num], 'C', 'S');
}

sub set_output_voltage
{
=comment
        Sets the output voltages with which the servos are driven in mV.
        The minimum output voltage is 2000mV and the maximum output voltage is 
        9000mV.
        
        .. note::
         We recommend that you set this value to the maximum voltage that is
         specified for your servo, most servos achieve their maximum force only
         with high voltages.
        
        The default value is 5000.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $voltage) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_OUTPUT_VOLTAGE, [$voltage], 'S', '');
}

sub get_output_voltage
{
=comment
        Returns the output voltage as specified by :func:`SetOutputVoltage`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_OUTPUT_VOLTAGE, [], '', 'S');
}

sub set_pulse_width
{
=comment
        Sets the minimum and maximum pulse width of the specified servo in µs.
        
        Usually, servos are controlled with a 
        `PWM <http://en.wikipedia.org/wiki/Pulse-width_modulation>`__, whereby the
        length of the pulse controls the position of the servo. Every servo has
        different minimum and maximum pulse widths, these can be specified with
        this function.
        
        If you have a datasheet for your servo that specifies the minimum and
        maximum pulse width, you should set the values accordingly. If your servo
        comes without any datasheet you have to find the values via trial and error.
        
        Both values have a range from 1 to 65535 (unsigned 16-bit integer). The
        minimum must be smaller than the maximum.
        
        The default values are 1000µs (1ms) and 2000µs (2ms) for minimum and 
        maximum pulse width.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_PULSE_WIDTH, [$servo_num, $min, $max], 'C S S', '');
}

sub get_pulse_width
{
=comment
        Returns the minimum and maximum pulse width for the specified servo as set by
        :func:`SetPulseWidth`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_PULSE_WIDTH, [$servo_num], 'C', 'S S');
 }

sub set_degree
{
=comment
        Sets the minimum and maximum degree for the specified servo (by default
        given as °/100).
        
        This only specifies the abstract values between which the minimum and maximum
        pulse width is scaled. For example: If you specify a pulse width of 1000µs
        to 2000µs and a degree range of -90° to 90°, a call of :func:`SetPosition`
        with 0 will result in a pulse width of 1500µs 
        (-90° = 1000µs, 90° = 2000µs, etc.).
        
        Possible usage:
        
        * The datasheet of your servo specifies a range of 200° with the middle position
          at 110°. In this case you can set the minimum to -9000 and the maximum to 11000.
        * You measure a range of 220° on your servo and you don't have or need a middle
          position. In this case you can set the minimum to 0 and the maximum to 22000.
        * You have a linear servo with a drive length of 20cm, In this case you could
          set the minimum to 0 and the maximum to 20000. Now you can set the Position
          with :func:`SetPosition` with a resolution of cm/100. Also the velocity will
          have a resolution of cm/100s and the acceleration will have a resolution of
          cm/100s².
        * You don't care about units and just want the highest possible resolution. In
          this case you should set the minimum to -32767 and the maximum to 32767.
        * You have a brushless motor with a maximum speed of 10000 rpm and want to
          control it with a RC brushless motor controller. In this case you can set the
          minimum to 0 and the maximum to 10000. :func:`SetPosition` now controls the rpm.
        
        Both values have a possible range from -32767 to 32767 
        (signed 16-bit integer). The minimum must be smaller than the maximum.
        
        The default values are -9000 and 9000 for the minimum and maximum degree.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DEGREE, [$servo_num, $min, $max], 'C s s', '');
}

sub get_degree
{
=comment
        Returns the minimum and maximum degree for the specified servo as set by
        :func:`SetDegree`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DEGREE, [$servo_num], 'C', 's s');
 }

sub set_period
{
=comment
        Sets the period of the specified servo in µs.
        
        Usually, servos are controlled with a 
        `PWM <http://en.wikipedia.org/wiki/Pulse-width_modulation>`__. Different
        servos expect PWMs with different periods. Most servos run well with a 
        period of about 20ms.
        
        If your servo comes with a datasheet that specifies a period, you should
        set it accordingly. If you don't have a datasheet and you have no idea
        what the correct period is, the default value (19.5ms) will most likely
        work fine. 
        
        The minimum possible period is 2000µs and the maximum is 65535µs.
        
        The default value is 19.5ms (19500µs).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_PERIOD, [$servo_num, $period], 'C S', '');
}

sub get_period
{
=comment
        Returns the period for the specified servo as set by :func:`SetPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_PERIOD, [$servo_num], 'C', 'S');
}

sub get_servo_current
{
=comment
        Returns the current consumption of the specified servo in mA.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $servo_num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_SERVO_CURRENT, [$servo_num], 'C', 'S');
}

sub get_overall_current
{
=comment
        Returns the current consumption of all servos together in mA.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_OVERALL_CURRENT, [], '', 'S');
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
        given via the black power input connector on the Servo Brick. 
         
        If there is an external input voltage and a stack input voltage, the motors
        will be driven by the external input voltage. If there is only a stack 
        voltage present, the motors will be driven by this voltage.
        
        .. warning::
         This means, if you have a high stack voltage and a low external voltage,
         the motors will be driven with the low external voltage. If you then remove
         the external connection, it will immediately be driven by the high
         stack voltage
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, [], '', 'S');
}

sub set_minimum_voltage
{
=comment
        Sets the minimum voltage in mV, below which the :func:`UnderVoltage` callback
        is triggered. The minimum possible value that works with the Servo Brick is 5V.
        You can use this function to detect the discharge of a battery that is used
        to drive the stepper motor. If you have a fixed power supply, you likely do 
        not need this functionality.
        
        The default value is 5V (5000mV).
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

sub enable_position_reached_callback
{
=comment
        Enables the :func:`PositionReached` callback.
        
        Default is disabled.
        
        .. versionadded:: 2.0.1~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_ENABLE_POSITION_REACHED_CALLBACK, [], '', '');
}

sub disable_position_reached_callback
{
=comment
        Disables the :func:`PositionReached` callback.
        
        Default is disabled.
        
        .. versionadded:: 2.0.1~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_DISABLE_POSITION_REACHED_CALLBACK, [], '', '');
}

sub is_position_reached_callback_enabled
{
=comment
        Returns *true* if :func:`PositionReached` callback is enabled, *false* otherwise.
        
        .. versionadded:: 2.0.1~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED, [], '', 'C');
}

sub enable_velocity_reached_callback
{
=comment
        Enables the :func:`VelocityReached` callback.
        
        Default is disabled.
        
        .. versionadded:: 2.0.1~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK, [], '', '');
}

sub disable_velocity_reached_callback
{
=comment
        Disables the :func:`VelocityReached` callback.
        
        Default is disabled.
        
        .. versionadded:: 2.0.1~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK, [], '', '');
}

sub is_velocity_reached_callback_enabled
{
=comment
        Returns *true* if :func:`VelocityReached` callback is enabled, *false* otherwise.
        
        .. versionadded:: 2.0.1~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED, [], '', 'C');
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
