
#############################################################
# This file was automatically generated on 2014-12-10.      #
#                                                           #
# Bindings Version 2.1.4                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickStepper - Device for controlling stepper motors

=cut

package Tinkerforge::BrickStepper;

use strict;
use warnings;
use Carp;
use threads;
use threads::shared;
use parent 'Tinkerforge::Device';
use Tinkerforge::IPConnection;
use Tinkerforge::Error;

=head1 CONSTANTS

=over

=item DEVICE_IDENTIFIER

This constant is used to identify a Stepper Brick.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 15;

=item CALLBACK_UNDER_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_UNDER_VOLTAGE callback.

=cut

use constant CALLBACK_UNDER_VOLTAGE => 31;

=item CALLBACK_POSITION_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_POSITION_REACHED callback.

=cut

use constant CALLBACK_POSITION_REACHED => 32;

=item CALLBACK_ALL_DATA

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ALL_DATA callback.

=cut

use constant CALLBACK_ALL_DATA => 40;

=item CALLBACK_NEW_STATE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_NEW_STATE callback.

=cut

use constant CALLBACK_NEW_STATE => 41;

=item FUNCTION_SET_MAX_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MAX_VELOCITY => 1;

=item FUNCTION_GET_MAX_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MAX_VELOCITY => 2;

=item FUNCTION_GET_CURRENT_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_VELOCITY => 3;

=item FUNCTION_SET_SPEED_RAMPING

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SPEED_RAMPING => 4;

=item FUNCTION_GET_SPEED_RAMPING

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SPEED_RAMPING => 5;

=item FUNCTION_FULL_BRAKE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_FULL_BRAKE => 6;

=item FUNCTION_SET_CURRENT_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_POSITION => 7;

=item FUNCTION_GET_CURRENT_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_POSITION => 8;

=item FUNCTION_SET_TARGET_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TARGET_POSITION => 9;

=item FUNCTION_GET_TARGET_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TARGET_POSITION => 10;

=item FUNCTION_SET_STEPS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STEPS => 11;

=item FUNCTION_GET_STEPS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STEPS => 12;

=item FUNCTION_GET_REMAINING_STEPS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_REMAINING_STEPS => 13;

=item FUNCTION_SET_STEP_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STEP_MODE => 14;

=item FUNCTION_GET_STEP_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STEP_MODE => 15;

=item FUNCTION_DRIVE_FORWARD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DRIVE_FORWARD => 16;

=item FUNCTION_DRIVE_BACKWARD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DRIVE_BACKWARD => 17;

=item FUNCTION_STOP

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_STOP => 18;

=item FUNCTION_GET_STACK_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_INPUT_VOLTAGE => 19;

=item FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => 20;

=item FUNCTION_GET_CURRENT_CONSUMPTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CONSUMPTION => 21;

=item FUNCTION_SET_MOTOR_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOTOR_CURRENT => 22;

=item FUNCTION_GET_MOTOR_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOTOR_CURRENT => 23;

=item FUNCTION_ENABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE => 24;

=item FUNCTION_DISABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE => 25;

=item FUNCTION_IS_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_ENABLED => 26;

=item FUNCTION_SET_DECAY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DECAY => 27;

=item FUNCTION_GET_DECAY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DECAY => 28;

=item FUNCTION_SET_MINIMUM_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MINIMUM_VOLTAGE => 29;

=item FUNCTION_GET_MINIMUM_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MINIMUM_VOLTAGE => 30;

=item FUNCTION_SET_SYNC_RECT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_SYNC_RECT => 33;

=item FUNCTION_IS_SYNC_RECT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_SYNC_RECT => 34;

=item FUNCTION_SET_TIME_BASE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_TIME_BASE => 35;

=item FUNCTION_GET_TIME_BASE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TIME_BASE => 36;

=item FUNCTION_GET_ALL_DATA

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALL_DATA => 37;

=item FUNCTION_SET_ALL_DATA_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ALL_DATA_PERIOD => 38;

=item FUNCTION_GET_ALL_DATA_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALL_DATA_PERIOD => 39;

=item FUNCTION_GET_PROTOCOL1_BRICKLET_NAME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => 241;

=item FUNCTION_GET_CHIP_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIP_TEMPERATURE => 242;

=item FUNCTION_RESET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_RESET => 243;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

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


=back

=head1 FUNCTIONS

=over

=item new()

Creates an object with the unique device ID *uid* and adds it to
the IP Connection *ipcon*.

=cut

sub new
{
	my ($class, $uid, $ipcon) = @_;

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 0]);

	$self->{response_expected}->{&FUNCTION_SET_MAX_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MAX_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_SPEED_RAMPING} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_SPEED_RAMPING} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_FULL_BRAKE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_TARGET_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_TARGET_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STEPS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_STEPS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_REMAINING_STEPS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STEP_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_STEP_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_DRIVE_FORWARD} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DRIVE_BACKWARD} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_STOP} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CONSUMPTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MOTOR_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MOTOR_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ENABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DISABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DECAY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_DECAY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MINIMUM_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MINIMUM_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_UNDER_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_POSITION_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_SYNC_RECT} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_SYNC_RECT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_TIME_BASE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_TIME_BASE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALL_DATA} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ALL_DATA_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALL_DATA_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ALL_DATA} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_NEW_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_UNDER_VOLTAGE} = 'S';
	$self->{callback_formats}->{&CALLBACK_POSITION_REACHED} = 'l';
	$self->{callback_formats}->{&CALLBACK_ALL_DATA} = 'S l l S S S';
	$self->{callback_formats}->{&CALLBACK_NEW_STATE} = 'C C';

	bless($self, $class);

	return $self;
}


=item set_max_velocity()

Sets the maximum velocity of the stepper motor in steps per second.
This function does *not* start the motor, it merely sets the maximum
velocity the stepper motor is accelerated to. To get the motor running use
either :func:`SetTargetPosition`, :func:`SetSteps`, :func:`DriveForward` or
:func:`DriveBackward`.

=cut

sub set_max_velocity
{
	my ($self, $velocity) = @_;

	$self->_send_request(&FUNCTION_SET_MAX_VELOCITY, [$velocity], 'S', '');
}

=item get_max_velocity()

Returns the velocity as set by :func:`SetMaxVelocity`.

=cut

sub get_max_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MAX_VELOCITY, [], '', 'S');
}

=item get_current_velocity()

Returns the *current* velocity of the stepper motor in steps per second.

=cut

sub get_current_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_VELOCITY, [], '', 'S');
}

=item set_speed_ramping()

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

sub set_speed_ramping
{
	my ($self, $acceleration, $deacceleration) = @_;

	$self->_send_request(&FUNCTION_SET_SPEED_RAMPING, [$acceleration, $deacceleration], 'S S', '');
}

=item get_speed_ramping()

Returns the acceleration and deacceleration as set by 
:func:`SetSpeedRamping`.

=cut

sub get_speed_ramping
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_SPEED_RAMPING, [], '', 'S S');
}

=item full_brake()

Executes an active full brake. 
 
.. warning::
 This function is for emergency purposes,
 where an immediate brake is necessary. Depending on the current velocity and
 the strength of the motor, a full brake can be quite violent.

Call :func:`Stop` if you just want to stop the motor.

=cut

sub full_brake
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_FULL_BRAKE, [], '', '');
}

=item set_current_position()

Sets the current steps of the internal step counter. This can be used to
set the current position to 0 when some kind of starting position
is reached (e.g. when a CNC machine reaches a corner).

=cut

sub set_current_position
{
	my ($self, $position) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT_POSITION, [$position], 'l', '');
}

=item get_current_position()

Returns the current position of the stepper motor in steps. On startup
the position is 0. The steps are counted with all possible driving
functions (:func:`SetTargetPosition`, :func:`SetSteps`, :func:`DriveForward` or
:func:`DriveBackward`). It also is possible to reset the steps to 0 or
set them to any other desired value with :func:`SetCurrentPosition`.

=cut

sub get_current_position
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_POSITION, [], '', 'l');
}

=item set_target_position()

Sets the target position of the stepper motor in steps. For example,
if the current position of the motor is 500 and :func:`SetTargetPosition` is
called with 1000, the stepper motor will drive 500 steps forward. It will
use the velocity, acceleration and deacceleration as set by
:func:`SetMaxVelocity` and :func:`SetSpeedRamping`.

A call of :func:`SetTargetPosition` with the parameter *x* is equivalent to
a call of :func:`SetSteps` with the parameter 
(*x* - :func:`GetCurrentPosition`).

=cut

sub set_target_position
{
	my ($self, $position) = @_;

	$self->_send_request(&FUNCTION_SET_TARGET_POSITION, [$position], 'l', '');
}

=item get_target_position()

Returns the last target position as set by :func:`SetTargetPosition`.

=cut

sub get_target_position
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TARGET_POSITION, [], '', 'l');
}

=item set_steps()

Sets the number of steps the stepper motor should run. Positive values
will drive the motor forward and negative values backward. 
The velocity, acceleration and deacceleration as set by
:func:`SetMaxVelocity` and :func:`SetSpeedRamping` will be used.

=cut

sub set_steps
{
	my ($self, $steps) = @_;

	$self->_send_request(&FUNCTION_SET_STEPS, [$steps], 'l', '');
}

=item get_steps()

Returns the last steps as set by :func:`SetSteps`.

=cut

sub get_steps
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STEPS, [], '', 'l');
}

=item get_remaining_steps()

Returns the remaining steps of the last call of :func:`SetSteps`.
For example, if :func:`SetSteps` is called with 2000 and 
:func:`GetRemainingSteps` is called after the motor has run for 500 steps,
it will return 1500.

=cut

sub get_remaining_steps
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_REMAINING_STEPS, [], '', 'l');
}

=item set_step_mode()

Sets the step mode of the stepper motor. Possible values are:

* Full Step = 1
* Half Step = 2
* Quarter Step = 4
* Eighth Step = 8

A higher value will increase the resolution and
decrease the torque of the stepper motor.

The default value is 8 (Eighth Step).

=cut

sub set_step_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_STEP_MODE, [$mode], 'C', '');
}

=item get_step_mode()

Returns the step mode as set by :func:`SetStepMode`.

=cut

sub get_step_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STEP_MODE, [], '', 'C');
}

=item drive_forward()

Drives the stepper motor forward until :func:`DriveBackward` or
:func:`Stop` is called. The velocity, acceleration and deacceleration as 
set by :func:`SetMaxVelocity` and :func:`SetSpeedRamping` will be used.

=cut

sub drive_forward
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DRIVE_FORWARD, [], '', '');
}

=item drive_backward()

Drives the stepper motor backward until :func:`DriveForward` or
:func:`Stop` is triggered. The velocity, acceleration and deacceleration as
set by :func:`SetMaxVelocity` and :func:`SetSpeedRamping` will be used.

=cut

sub drive_backward
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DRIVE_BACKWARD, [], '', '');
}

=item stop()

Stops the stepper motor with the deacceleration as set by 
:func:`SetSpeedRamping`.

=cut

sub stop
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_STOP, [], '', '');
}

=item get_stack_input_voltage()

Returns the stack input voltage in mV. The stack input voltage is the
voltage that is supplied via the stack, i.e. it is given by a 
Step-Down or Step-Up Power Supply.

=cut

sub get_stack_input_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_INPUT_VOLTAGE, [], '', 'S');
}

=item get_external_input_voltage()

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

sub get_external_input_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, [], '', 'S');
}

=item get_current_consumption()

Returns the current consumption of the motor in mA.

=cut

sub get_current_consumption
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_CONSUMPTION, [], '', 'S');
}

=item set_motor_current()

Sets the current in mA with which the motor will be driven.
The minimum value is 100mA, the maximum value 2291mA and the 
default value is 800mA.

.. warning::
 Do not set this value above the specifications of your stepper motor.
 Otherwise it may damage your motor.

=cut

sub set_motor_current
{
	my ($self, $current) = @_;

	$self->_send_request(&FUNCTION_SET_MOTOR_CURRENT, [$current], 'S', '');
}

=item get_motor_current()

Returns the current as set by :func:`SetMotorCurrent`.

=cut

sub get_motor_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOTOR_CURRENT, [], '', 'S');
}

=item enable()

Enables the driver chip. The driver parameters can be configured (maximum velocity,
acceleration, etc) before it is enabled.

=cut

sub enable
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE, [], '', '');
}

=item disable()

Disables the driver chip. The configurations are kept (maximum velocity,
acceleration, etc) but the motor is not driven until it is enabled again.

=cut

sub disable
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE, [], '', '');
}

=item is_enabled()

Returns *true* if the driver chip is enabled, *false* otherwise.

=cut

sub is_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_ENABLED, [], '', 'C');
}

=item set_decay()

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

sub set_decay
{
	my ($self, $decay) = @_;

	$self->_send_request(&FUNCTION_SET_DECAY, [$decay], 'S', '');
}

=item get_decay()

Returns the decay mode as set by :func:`SetDecay`.

=cut

sub get_decay
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DECAY, [], '', 'S');
}

=item set_minimum_voltage()

Sets the minimum voltage in mV, below which the :func:`UnderVoltage` callback
is triggered. The minimum possible value that works with the Stepper Brick is 8V.
You can use this function to detect the discharge of a battery that is used
to drive the stepper motor. If you have a fixed power supply, you likely do 
not need this functionality.

The default value is 8V.

=cut

sub set_minimum_voltage
{
	my ($self, $voltage) = @_;

	$self->_send_request(&FUNCTION_SET_MINIMUM_VOLTAGE, [$voltage], 'S', '');
}

=item get_minimum_voltage()

Returns the minimum voltage as set by :func:`SetMinimumVoltage`.

=cut

sub get_minimum_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MINIMUM_VOLTAGE, [], '', 'S');
}

=item set_sync_rect()

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

=cut

sub set_sync_rect
{
	my ($self, $sync_rect) = @_;

	$self->_send_request(&FUNCTION_SET_SYNC_RECT, [$sync_rect], 'C', '');
}

=item is_sync_rect()

Returns *true* if synchronous rectification is enabled, *false* otherwise.

=cut

sub is_sync_rect
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_SYNC_RECT, [], '', 'C');
}

=item set_time_base()

Sets the time base of the velocity and the acceleration of the stepper brick
(in seconds).

For example, if you want to make one step every 1.5 seconds, you can set 
the time base to 15 and the velocity to 10. Now the velocity is 
10steps/15s = 1steps/1.5s.

The default value is 1.

=cut

sub set_time_base
{
	my ($self, $time_base) = @_;

	$self->_send_request(&FUNCTION_SET_TIME_BASE, [$time_base], 'L', '');
}

=item get_time_base()

Returns the time base as set by :func:`SetTimeBase`.

=cut

sub get_time_base
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TIME_BASE, [], '', 'L');
}

=item get_all_data()

Returns the following parameters: The current velocity,
the current position, the remaining steps, the stack voltage, the external
voltage and the current consumption of the stepper motor.

There is also a callback for this function, see :func:`AllData`.

=cut

sub get_all_data
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALL_DATA, [], '', 'S l l S S S');
}

=item set_all_data_period()

Sets the period in ms with which the :func:`AllData` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_all_data_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ALL_DATA_PERIOD, [$period], 'L', '');
}

=item get_all_data_period()

Returns the period as set by :func:`SetAllDataPeriod`.

=cut

sub get_all_data_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALL_DATA_PERIOD, [], '', 'L');
}

=item get_protocol1_bricklet_name()

Returns the firmware and protocol version and the name of the Bricklet for a
given port.

This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
plugins.

=cut

sub get_protocol1_bricklet_name
{
	my ($self, $port) = @_;

	return $self->_send_request(&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, [$port], 'a', 'C C3 Z40');
}

=item get_chip_temperature()

Returns the temperature in °C/10 as measured inside the microcontroller. The
value returned is not the ambient temperature!

The temperature is only proportional to the real temperature and it has an
accuracy of +-15%. Practically it is only useful as an indicator for
temperature changes.

=cut

sub get_chip_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIP_TEMPERATURE, [], '', 's');
}

=item reset()

Calling this function will reset the Brick. Calling this function
on a Brick inside of a stack will reset the whole stack.

After a reset you have to create new device objects,
calling functions on the existing ones will result in
undefined behavior!

=cut

sub reset
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_RESET, [], '', '');
}

=item get_identity()

Returns the UID, the UID where the Brick is connected to, 
the position, the hardware and firmware version as well as the
device identifier.

The position can be '0'-'8' (stack position).

The device identifier numbers can be found :ref:`here <device_identifier>`.
|device_identifier_constant|

=cut

sub get_identity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_IDENTITY, [], '', 'Z8 Z8 a C3 C3 S');
}
=back
=cut

1;
