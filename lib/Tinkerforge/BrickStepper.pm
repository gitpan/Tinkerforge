
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickStepper;
=comment
        Device for controlling stepper motors
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 15;
use constant CALLBACK_UNDER_VOLTAGE => 31;
use constant CALLBACK_POSITION_REACHED => 32;
use constant CALLBACK_ALL_DATA => 40;
use constant CALLBACK_NEW_STATE => 41;

use constant FUNCTION_SET_MAX_VELOCITY => 1;
use constant FUNCTION_GET_MAX_VELOCITY => 2;
use constant FUNCTION_GET_CURRENT_VELOCITY => 3;
use constant FUNCTION_SET_SPEED_RAMPING => 4;
use constant FUNCTION_GET_SPEED_RAMPING => 5;
use constant FUNCTION_FULL_BRAKE => 6;
use constant FUNCTION_SET_CURRENT_POSITION => 7;
use constant FUNCTION_GET_CURRENT_POSITION => 8;
use constant FUNCTION_SET_TARGET_POSITION => 9;
use constant FUNCTION_GET_TARGET_POSITION => 10;
use constant FUNCTION_SET_STEPS => 11;
use constant FUNCTION_GET_STEPS => 12;
use constant FUNCTION_GET_REMAINING_STEPS => 13;
use constant FUNCTION_SET_STEP_MODE => 14;
use constant FUNCTION_GET_STEP_MODE => 15;
use constant FUNCTION_DRIVE_FORWARD => 16;
use constant FUNCTION_DRIVE_BACKWARD => 17;
use constant FUNCTION_STOP => 18;
use constant FUNCTION_GET_STACK_INPUT_VOLTAGE => 19;
use constant FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => 20;
use constant FUNCTION_GET_CURRENT_CONSUMPTION => 21;
use constant FUNCTION_SET_MOTOR_CURRENT => 22;
use constant FUNCTION_GET_MOTOR_CURRENT => 23;
use constant FUNCTION_ENABLE => 24;
use constant FUNCTION_DISABLE => 25;
use constant FUNCTION_IS_ENABLED => 26;
use constant FUNCTION_SET_DECAY => 27;
use constant FUNCTION_GET_DECAY => 28;
use constant FUNCTION_SET_MINIMUM_VOLTAGE => 29;
use constant FUNCTION_GET_MINIMUM_VOLTAGE => 30;
use constant FUNCTION_SET_SYNC_RECT => 33;
use constant FUNCTION_IS_SYNC_RECT => 34;
use constant FUNCTION_SET_TIME_BASE => 35;
use constant FUNCTION_GET_TIME_BASE => 36;
use constant FUNCTION_GET_ALL_DATA => 37;
use constant FUNCTION_SET_ALL_DATA_PERIOD => 38;
use constant FUNCTION_GET_ALL_DATA_PERIOD => 39;
use constant FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => 241;
use constant FUNCTION_GET_CHIP_TEMPERATURE => 242;
use constant FUNCTION_RESET => 243;
use constant FUNCTION_GET_IDENTITY => 255;

use constant STEP_MODE_FULL_STEP => 1;
use constant STEP_MODE_HALF_STEP => 2;
use constant STEP_MODE_QUARTER_STEP => 4;
use constant STEP_MODE_EIGHTH_STEP => 8;
use constant STATE_STOP => 1;
use constant STATE_ACCELERATION => 2;
use constant STATE_RUN => 3;
use constant STATE_DEACCELERATION => 4;
use constant STATE_DIRECTION_CHANGE_TO_FORWARD => 5;
use constant STATE_DIRECTION_CHANGE_TO_BACKWARD => 6;

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_SET_MAX_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_MAX_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CURRENT_VELOCITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_SPEED_RAMPING => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_SPEED_RAMPING => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_FULL_BRAKE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_SET_CURRENT_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CURRENT_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_TARGET_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_TARGET_POSITION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STEPS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_STEPS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_REMAINING_STEPS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STEP_MODE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_STEP_MODE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_DRIVE_FORWARD => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_DRIVE_BACKWARD => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_STOP => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_STACK_INPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CURRENT_CONSUMPTION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_MOTOR_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_MOTOR_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_ENABLE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_DISABLE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_IS_ENABLED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DECAY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_DECAY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_MINIMUM_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_MINIMUM_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_UNDER_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_POSITION_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_SET_SYNC_RECT => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_IS_SYNC_RECT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_TIME_BASE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_TIME_BASE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_ALL_DATA => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ALL_DATA_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_ALL_DATA_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_ALL_DATA => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_NEW_STATE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CHIP_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_RESET => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_UNDER_VOLTAGE => 'S',
                                                                      &CALLBACK_POSITION_REACHED => 'l',
                                                                      &CALLBACK_ALL_DATA => 'S l l S S S',
                                                                      &CALLBACK_NEW_STATE => 'C C'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub set_max_velocity
{
=comment
        Sets the maximum velocity of the stepper motor in steps per second.
        This function does *not* start the motor, it merely sets the maximum
        velocity the stepper motor is accelerated to. To get the motor running use
        either :func:`SetTargetPosition`, :func:`SetSteps`, :func:`DriveForward` or
        :func:`DriveBackward`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $velocity) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MAX_VELOCITY, [$velocity], 'S', '');
}

sub get_max_velocity
{
=comment
        Returns the velocity as set by :func:`SetMaxVelocity`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MAX_VELOCITY, [], '', 'S');
}

sub get_current_velocity
{
=comment
        Returns the *current* velocity of the stepper motor in steps per second.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_VELOCITY, [], '', 'S');
}

sub set_speed_ramping
{
=comment
        Sets the acceleration and deacceleration of the stepper motor. The values
        are given in *steps/s²*. An acceleration of 1000 means, that
        every second the velocity is increased by 1000 *steps/s*.
        
        For example: If the current velocity is 0 and you want to accelerate to a
        velocity of 8000 *steps/s* in 10 seconds, you should set an acceleration
        of 800 *steps/s²*.
        
        An acceleration/deacceleration of 0 means instantaneous
        acceleration/deacceleration (not recommended)
        
        The default value is 1000 for both
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $acceleration, $deacceleration) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_SPEED_RAMPING, [$acceleration, $deacceleration], 'S S', '');
}

sub get_speed_ramping
{
=comment
        Returns the acceleration and deacceleration as set by 
        :func:`SetSpeedRamping`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_SPEED_RAMPING, [], '', 'S S');
 }

sub full_brake
{
=comment
        Executes an active full brake. 
         
        .. warning::
         This function is for emergency purposes,
         where an immediate brake is necessary. Depending on the current velocity and
         the strength of the motor, a full brake can be quite violent.
        
        Call :func:`Stop` if you just want to stop the motor.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_FULL_BRAKE, [], '', '');
}

sub set_current_position
{
=comment
        Sets the current steps of the internal step counter. This can be used to
        set the current position to 0 when some kind of starting position
        is reached (e.g. when a CNC machine reaches a corner).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $position) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CURRENT_POSITION, [$position], 'l', '');
}

sub get_current_position
{
=comment
        Returns the current position of the stepper motor in steps. On startup
        the position is 0. The steps are counted with all possible driving
        functions (:func:`SetTargetPosition`, :func:`SetSteps`, :func:`DriveForward` or
        :func:`DriveBackward`). It also is possible to reset the steps to 0 or
        set them to any other desired value with :func:`SetCurrentPosition`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CURRENT_POSITION, [], '', 'l');
}

sub set_target_position
{
=comment
        Sets the target position of the stepper motor in steps. For example,
        if the current position of the motor is 500 and :func:`SetTargetPosition` is
        called with 1000, the stepper motor will drive 500 steps forward. It will
        use the velocity, acceleration and deacceleration as set by
        :func:`SetMaxVelocity` and :func:`SetSpeedRamping`.
        
        A call of :func:`SetTargetPosition` with the parameter *x* is equivalent to
        a call of :func:`SetSteps` with the parameter 
        (*x* - :func:`GetCurrentPosition`).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $position) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_TARGET_POSITION, [$position], 'l', '');
}

sub get_target_position
{
=comment
        Returns the last target position as set by :func:`SetTargetPosition`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_TARGET_POSITION, [], '', 'l');
}

sub set_steps
{
=comment
        Sets the number of steps the stepper motor should run. Positive values
        will drive the motor forward and negative values backward. 
        The velocity, acceleration and deacceleration as set by
        :func:`SetMaxVelocity` and :func:`SetSpeedRamping` will be used.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $steps) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STEPS, [$steps], 'l', '');
}

sub get_steps
{
=comment
        Returns the last steps as set by :func:`SetSteps`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STEPS, [], '', 'l');
}

sub get_remaining_steps
{
=comment
        Returns the remaining steps of the last call of :func:`SetSteps`.
        For example, if :func:`SetSteps` is called with 2000 and 
        :func:`GetRemainingSteps` is called after the motor has run for 500 steps,
        it will return 1500.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_REMAINING_STEPS, [], '', 'l');
}

sub set_step_mode
{
=comment
        Sets the step mode of the stepper motor. Possible values are:
        
        * Full Step = 1
        * Half Step = 2
        * Quarter Step = 4
        * Eighth Step = 8
        
        A higher value will increase the resolution and
        decrease the torque of the stepper motor.
        
        The default value is 8 (Eighth Step).
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $mode) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STEP_MODE, [$mode], 'C', '');
}

sub get_step_mode
{
=comment
        Returns the step mode as set by :func:`SetStepMode`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STEP_MODE, [], '', 'C');
}

sub drive_forward
{
=comment
        Drives the stepper motor forward until :func:`DriveBackward` or
        :func:`Stop` is called. The velocity, acceleration and deacceleration as 
        set by :func:`SetMaxVelocity` and :func:`SetSpeedRamping` will be used.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_DRIVE_FORWARD, [], '', '');
}

sub drive_backward
{
=comment
        Drives the stepper motor backward until :func:`DriveForward` or
        :func:`Stop` is triggered. The velocity, acceleration and deacceleration as
        set by :func:`SetMaxVelocity` and :func:`SetSpeedRamping` will be used.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_DRIVE_BACKWARD, [], '', '');
}

sub stop
{
=comment
        Stops the stepper motor with the deacceleration as set by 
        :func:`SetSpeedRamping`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_STOP, [], '', '');
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
        given via the black power input connector on the Stepper Brick. 
         
        If there is an external input voltage and a stack input voltage, the motor
        will be driven by the external input voltage. If there is only a stack 
        voltage present, the motor will be driven by this voltage.
        
        .. warning::
         This means, if you have a high stack voltage and a low external voltage,
         the motor will be driven with the low external voltage. If you then remove
         the external connection, it will immediately be driven by the high
         stack voltage
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

sub set_motor_current
{
=comment
        Sets the current in mA with which the motor will be driven.
        The minimum value is 100mA, the maximum value 2291mA and the 
        default value is 800mA.
        
        .. warning::
         Do not set this value above the specifications of your stepper motor.
         Otherwise it may damage your motor.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $current) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MOTOR_CURRENT, [$current], 'S', '');
}

sub get_motor_current
{
=comment
        Returns the current as set by :func:`SetMotorCurrent`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MOTOR_CURRENT, [], '', 'S');
}

sub enable
{
=comment
        Enables the driver chip. The driver parameters can be configured (maximum velocity,
        acceleration, etc) before it is enabled.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_ENABLE, [], '', '');
}

sub disable
{
=comment
        Disables the driver chip. The configurations are kept (maximum velocity,
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

sub set_decay
{
=comment
        Sets the decay mode of the stepper motor. The possible value range is
        between 0 and 65535. A value of 0 sets the fast decay mode, a value of
        65535 sets the slow decay mode and a value in between sets the mixed
        decay mode.
        
        Changing the decay mode is only possible if synchronous rectification
        is enabled (see :func:`SetSyncRect`).
        
        For a good explanation of the different decay modes see 
        `this <http://ebldc.com/?p=86/>`__ blog post by Avayan.
        
        A good decay mode is unfortunately different for every motor. The best
        way to work out a good decay mode for your stepper motor, if you can't
        measure the current with an oscilloscope, is to listen to the sound of
        the motor. If the value is too low, you often hear a high pitched 
        sound and if it is too high you can often hear a humming sound.
        
        Generally, fast decay mode (small value) will be noisier but also
        allow higher motor speeds.
        
        The default value is 10000.
        
        .. note::
         There is unfortunately no formula to calculate a perfect decay
         mode for a given stepper motor. If you have problems with loud noises
         or the maximum motor speed is too slow, you should try to tinker with
         the decay value
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $decay) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DECAY, [$decay], 'S', '');
}

sub get_decay
{
=comment
        Returns the decay mode as set by :func:`SetDecay`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DECAY, [], '', 'S');
}

sub set_minimum_voltage
{
=comment
        Sets the minimum voltage in mV, below which the :func:`UnderVoltage` callback
        is triggered. The minimum possible value that works with the Stepper Brick is 8V.
        You can use this function to detect the discharge of a battery that is used
        to drive the stepper motor. If you have a fixed power supply, you likely do 
        not need this functionality.
        
        The default value is 8V.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $voltage) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MINIMUM_VOLTAGE, [$voltage], 'S', '');
}

sub get_minimum_voltage
{
=comment
        Returns the minimum voltage as set by :func:`SetMinimumVoltage`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MINIMUM_VOLTAGE, [], '', 'S');
}

sub set_sync_rect
{
=comment
        Turns synchronous rectification on or off (*true* or *false*).
        
        With synchronous rectification on, the decay can be changed
        (see :func:`SetDecay`). Without synchronous rectification fast
        decay is used.
        
        For an explanation of synchronous rectification see 
        `here <http://en.wikipedia.org/wiki/Active_rectification>`__.
        
        .. warning::
         If you want to use high speeds (> 10000 steps/s) for a large 
         stepper motor with a large inductivity we strongly
         suggest that you disable synchronous rectification. Otherwise the
         Brick may not be able to cope with the load and overheat.
        
        The default value is *false*.
        
        .. versionadded:: 1.1.4~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $sync_rect) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_SYNC_RECT, [$sync_rect], 'C', '');
}

sub is_sync_rect
{
=comment
        Returns *true* if synchronous rectification is enabled, *false* otherwise.
        
        .. versionadded:: 1.1.4~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_SYNC_RECT, [], '', 'C');
}

sub set_time_base
{
=comment
        Sets the time base of the velocity and the acceleration of the stepper brick
        (in seconds).
        
        For example, if you want to make one step every 1.5 seconds, you can set 
        the time base to 15 and the velocity to 10. Now the velocity is 
        10steps/15s = 1steps/1.5s.
        
        The default value is 1.
        
        .. versionadded:: 1.1.6~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $time_base) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_TIME_BASE, [$time_base], 'L', '');
}

sub get_time_base
{
=comment
        Returns the time base as set by :func:`SetTimeBase`.
        
        .. versionadded:: 1.1.6~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_TIME_BASE, [], '', 'L');
}

sub get_all_data
{
=comment
        Returns the following parameters: The current velocity,
        the current position, the remaining steps, the stack voltage, the external
        voltage and the current consumption of the stepper motor.
        
        There is also a callback for this function, see :func:`AllData`.
        
        .. versionadded:: 1.1.6~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ALL_DATA, [], '', 'S l l S S S');
 }

sub set_all_data_period
{
=comment
        Sets the period in ms with which the :func:`AllData` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        .. versionadded:: 1.1.6~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ALL_DATA_PERIOD, [$period], 'L', '');
}

sub get_all_data_period
{
=comment
        Returns the period as set by :func:`SetAllDataPeriod`.
        
        .. versionadded:: 1.1.6~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ALL_DATA_PERIOD, [], '', 'L');
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
        
        .. versionadded:: 1.1.4~(Firmware)
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
        
        .. versionadded:: 1.1.4~(Firmware)
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
