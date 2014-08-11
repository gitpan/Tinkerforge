
#############################################################
# This file was automatically generated on 2014-08-11.      #
#                                                           #
# Bindings Version 2.1.2                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickDC - Device for controlling DC motors

=cut

package Tinkerforge::BrickDC;

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

This constant is used to identify a DC Brick.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 11;

=item CALLBACK_UNDER_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_UNDER_VOLTAGE callback.

=cut

use constant CALLBACK_UNDER_VOLTAGE => 21;

=item CALLBACK_EMERGENCY_SHUTDOWN

This constant is used with the register_callback() subroutine to specify
the CALLBACK_EMERGENCY_SHUTDOWN callback.

=cut

use constant CALLBACK_EMERGENCY_SHUTDOWN => 22;

=item CALLBACK_VELOCITY_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VELOCITY_REACHED callback.

=cut

use constant CALLBACK_VELOCITY_REACHED => 23;

=item CALLBACK_CURRENT_VELOCITY

This constant is used with the register_callback() subroutine to specify
the CALLBACK_CURRENT_VELOCITY callback.

=cut

use constant CALLBACK_CURRENT_VELOCITY => 24;

=item FUNCTION_SET_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VELOCITY => 1;

=item FUNCTION_GET_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VELOCITY => 2;

=item FUNCTION_GET_CURRENT_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_VELOCITY => 3;

=item FUNCTION_SET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION => 4;

=item FUNCTION_GET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION => 5;

=item FUNCTION_SET_PWM_FREQUENCY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PWM_FREQUENCY => 6;

=item FUNCTION_GET_PWM_FREQUENCY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PWM_FREQUENCY => 7;

=item FUNCTION_FULL_BRAKE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_FULL_BRAKE => 8;

=item FUNCTION_GET_STACK_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_INPUT_VOLTAGE => 9;

=item FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => 10;

=item FUNCTION_GET_CURRENT_CONSUMPTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_CONSUMPTION => 11;

=item FUNCTION_ENABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE => 12;

=item FUNCTION_DISABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE => 13;

=item FUNCTION_IS_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_ENABLED => 14;

=item FUNCTION_SET_MINIMUM_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MINIMUM_VOLTAGE => 15;

=item FUNCTION_GET_MINIMUM_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MINIMUM_VOLTAGE => 16;

=item FUNCTION_SET_DRIVE_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DRIVE_MODE => 17;

=item FUNCTION_GET_DRIVE_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DRIVE_MODE => 18;

=item FUNCTION_SET_CURRENT_VELOCITY_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CURRENT_VELOCITY_PERIOD => 19;

=item FUNCTION_GET_CURRENT_VELOCITY_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_VELOCITY_PERIOD => 20;

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
use constant DRIVE_MODE_DRIVE_BRAKE => 0;
use constant DRIVE_MODE_DRIVE_COAST => 1;


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

	$self->{response_expected}->{&FUNCTION_SET_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PWM_FREQUENCY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PWM_FREQUENCY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_FULL_BRAKE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_CONSUMPTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ENABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DISABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MINIMUM_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MINIMUM_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DRIVE_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_DRIVE_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CURRENT_VELOCITY_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_VELOCITY_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_UNDER_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_EMERGENCY_SHUTDOWN} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VELOCITY_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_CURRENT_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_UNDER_VOLTAGE} = 'S';
	$self->{callback_formats}->{&CALLBACK_EMERGENCY_SHUTDOWN} = '';
	$self->{callback_formats}->{&CALLBACK_VELOCITY_REACHED} = 's';
	$self->{callback_formats}->{&CALLBACK_CURRENT_VELOCITY} = 's';

	bless($self, $class);

	return $self;
}


=item set_velocity()

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

sub set_velocity
{
	my ($self, $velocity) = @_;

	$self->_send_request(&FUNCTION_SET_VELOCITY, [$velocity], 's', '');
}

=item get_velocity()

Returns the velocity as set by :func:`SetVelocity`.

=cut

sub get_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_VELOCITY, [], '', 's');
}

=item get_current_velocity()

Returns the *current* velocity of the motor. This value is different
from :func:`GetVelocity` whenever the motor is currently accelerating
to a goal set by :func:`SetVelocity`.

=cut

sub get_current_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_VELOCITY, [], '', 's');
}

=item set_acceleration()

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

sub set_acceleration
{
	my ($self, $acceleration) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION, [$acceleration], 'S', '');
}

=item get_acceleration()

Returns the acceleration as set by :func:`SetAcceleration`.

=cut

sub get_acceleration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION, [], '', 'S');
}

=item set_pwm_frequency()

Sets the frequency (in Hz) of the PWM with which the motor is driven.
The possible range of the frequency is 1-20000Hz. Often a high frequency
is less noisy and the motor runs smoother. However, with a low frequency
there are less switches and therefore fewer switching losses. Also with
most motors lower frequencies enable higher torque.

If you have no idea what all this means, just ignore this function and use
the default frequency, it will very likely work fine.

The default frequency is 15 kHz.

=cut

sub set_pwm_frequency
{
	my ($self, $frequency) = @_;

	$self->_send_request(&FUNCTION_SET_PWM_FREQUENCY, [$frequency], 'S', '');
}

=item get_pwm_frequency()

Returns the PWM frequency (in Hz) as set by :func:`SetPWMFrequency`.

=cut

sub get_pwm_frequency
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_PWM_FREQUENCY, [], '', 'S');
}

=item full_brake()

Executes an active full brake.

.. warning::
 This function is for emergency purposes,
 where an immediate brake is necessary. Depending on the current velocity and
 the strength of the motor, a full brake can be quite violent.

Call :func:`SetVelocity` with 0 if you just want to stop the motor.

=cut

sub full_brake
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_FULL_BRAKE, [], '', '');
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

=item enable()

Enables the driver chip. The driver parameters can be configured (velocity,
acceleration, etc) before it is enabled.

=cut

sub enable
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE, [], '', '');
}

=item disable()

Disables the driver chip. The configurations are kept (velocity,
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

=item set_minimum_voltage()

Sets the minimum voltage in mV, below which the :func:`UnderVoltage` callback
is triggered. The minimum possible value that works with the DC Brick is 5V.
You can use this function to detect the discharge of a battery that is used
to drive the motor. If you have a fixed power supply, you likely do not need
this functionality.

The default value is 5V.

=cut

sub set_minimum_voltage
{
	my ($self, $voltage) = @_;

	$self->_send_request(&FUNCTION_SET_MINIMUM_VOLTAGE, [$voltage], 'S', '');
}

=item get_minimum_voltage()

Returns the minimum voltage as set by :func:`SetMinimumVoltage`

=cut

sub get_minimum_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MINIMUM_VOLTAGE, [], '', 'S');
}

=item set_drive_mode()

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

sub set_drive_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_DRIVE_MODE, [$mode], 'C', '');
}

=item get_drive_mode()

Returns the drive mode, as set by :func:`SetDriveMode`.

=cut

sub get_drive_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DRIVE_MODE, [], '', 'C');
}

=item set_current_velocity_period()

Sets a period in ms with which the :func:`CurrentVelocity` callback is triggered.
A period of 0 turns the callback off.

The default value is 0.

=cut

sub set_current_velocity_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_CURRENT_VELOCITY_PERIOD, [$period], 'S', '');
}

=item get_current_velocity_period()

Returns the period as set by :func:`SetCurrentVelocityPeriod`.

=cut

sub get_current_velocity_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_VELOCITY_PERIOD, [], '', 'S');
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
