
#############################################################
# This file was automatically generated on 2014-05-21.      #
#                                                           #
# Bindings Version 2.1.0                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

=pod

=encoding utf8

=head1 NAME

Tinkerforge::BrickServo - Device for controlling up to seven servos

=cut

package Tinkerforge::BrickServo;

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

This constant is used to identify a Servo Brick.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 14;

=item CALLBACK_UNDER_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_UNDER_VOLTAGE callback.

=cut

use constant CALLBACK_UNDER_VOLTAGE => 26;

=item CALLBACK_POSITION_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_POSITION_REACHED callback.

=cut

use constant CALLBACK_POSITION_REACHED => 27;

=item CALLBACK_VELOCITY_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_VELOCITY_REACHED callback.

=cut

use constant CALLBACK_VELOCITY_REACHED => 28;

=item FUNCTION_ENABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE => 1;

=item FUNCTION_DISABLE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE => 2;

=item FUNCTION_IS_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_ENABLED => 3;

=item FUNCTION_SET_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_POSITION => 4;

=item FUNCTION_GET_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_POSITION => 5;

=item FUNCTION_GET_CURRENT_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_POSITION => 6;

=item FUNCTION_SET_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_VELOCITY => 7;

=item FUNCTION_GET_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_VELOCITY => 8;

=item FUNCTION_GET_CURRENT_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CURRENT_VELOCITY => 9;

=item FUNCTION_SET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION => 10;

=item FUNCTION_GET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION => 11;

=item FUNCTION_SET_OUTPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_OUTPUT_VOLTAGE => 12;

=item FUNCTION_GET_OUTPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_OUTPUT_VOLTAGE => 13;

=item FUNCTION_SET_PULSE_WIDTH

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PULSE_WIDTH => 14;

=item FUNCTION_GET_PULSE_WIDTH

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PULSE_WIDTH => 15;

=item FUNCTION_SET_DEGREE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEGREE => 16;

=item FUNCTION_GET_DEGREE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEGREE => 17;

=item FUNCTION_SET_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PERIOD => 18;

=item FUNCTION_GET_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PERIOD => 19;

=item FUNCTION_GET_SERVO_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_SERVO_CURRENT => 20;

=item FUNCTION_GET_OVERALL_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_OVERALL_CURRENT => 21;

=item FUNCTION_GET_STACK_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_INPUT_VOLTAGE => 22;

=item FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE => 23;

=item FUNCTION_SET_MINIMUM_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MINIMUM_VOLTAGE => 24;

=item FUNCTION_GET_MINIMUM_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MINIMUM_VOLTAGE => 25;

=item FUNCTION_ENABLE_POSITION_REACHED_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE_POSITION_REACHED_CALLBACK => 29;

=item FUNCTION_DISABLE_POSITION_REACHED_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE_POSITION_REACHED_CALLBACK => 30;

=item FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED => 31;

=item FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK => 32;

=item FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK => 33;

=item FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED => 34;

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

	$self->{response_expected}->{&FUNCTION_ENABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_DISABLE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CURRENT_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_OUTPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_OUTPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PULSE_WIDTH} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PULSE_WIDTH} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEGREE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_DEGREE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_SERVO_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_OVERALL_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MINIMUM_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MINIMUM_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_UNDER_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_POSITION_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_VELOCITY_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_ENABLE_POSITION_REACHED_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_DISABLE_POSITION_REACHED_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_UNDER_VOLTAGE} = 'S';
	$self->{callback_formats}->{&CALLBACK_POSITION_REACHED} = 'C s';
	$self->{callback_formats}->{&CALLBACK_VELOCITY_REACHED} = 'C s';

	bless($self, $class);

	return $self;
}


=item enable()

Enables a servo (0 to 6). If a servo is enabled, the configured position,
velocity, acceleration, etc. are applied immediately.

=cut

sub enable
{
	my ($self, $servo_num) = @_;

	$self->_send_request(&FUNCTION_ENABLE, [$servo_num], 'C', '');
}

=item disable()

Disables a servo (0 to 6). Disabled servos are not driven at all, i.e. a
disabled servo will not hold its position if a load is applied.

=cut

sub disable
{
	my ($self, $servo_num) = @_;

	$self->_send_request(&FUNCTION_DISABLE, [$servo_num], 'C', '');
}

=item is_enabled()

Returns *true* if the specified servo is enabled, *false* otherwise.

=cut

sub is_enabled
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_IS_ENABLED, [$servo_num], 'C', 'C');
}

=item set_position()

Sets the position in °/100 for the specified servo. 

The default range of the position is -9000 to 9000, but it can be specified
according to your servo with :func:`SetDegree`.

If you want to control a linear servo or RC brushless motor controller or
similar with the Servo Brick, you can also define lengths or speeds with
:func:`SetDegree`.

=cut

sub set_position
{
	my ($self, $servo_num, $position) = @_;

	$self->_send_request(&FUNCTION_SET_POSITION, [$servo_num, $position], 'C s', '');
}

=item get_position()

Returns the position of the specified servo as set by :func:`SetPosition`.

=cut

sub get_position
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_POSITION, [$servo_num], 'C', 's');
}

=item get_current_position()

Returns the *current* position of the specified servo. This may not be the
value of :func:`SetPosition` if the servo is currently approaching a
position goal.

=cut

sub get_current_position
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_POSITION, [$servo_num], 'C', 's');
}

=item set_velocity()

Sets the maximum velocity of the specified servo in °/100s. The velocity
is accelerated according to the value set by :func:`SetAcceleration`.

The minimum velocity is 0 (no movement) and the maximum velocity is 65535.
With a value of 65535 the position will be set immediately (no velocity).

The default value is 65535.

=cut

sub set_velocity
{
	my ($self, $servo_num, $velocity) = @_;

	$self->_send_request(&FUNCTION_SET_VELOCITY, [$servo_num, $velocity], 'C S', '');
}

=item get_velocity()

Returns the velocity of the specified servo as set by :func:`SetVelocity`.

=cut

sub get_velocity
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_VELOCITY, [$servo_num], 'C', 'S');
}

=item get_current_velocity()

Returns the *current* velocity of the specified servo. This may not be the
value of :func:`SetVelocity` if the servo is currently approaching a
velocity goal.

=cut

sub get_current_velocity
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_CURRENT_VELOCITY, [$servo_num], 'C', 'S');
}

=item set_acceleration()

Sets the acceleration of the specified servo in °/100s².

The minimum acceleration is 1 and the maximum acceleration is 65535.
With a value of 65535 the velocity will be set immediately (no acceleration).

The default value is 65535.

=cut

sub set_acceleration
{
	my ($self, $servo_num, $acceleration) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION, [$servo_num, $acceleration], 'C S', '');
}

=item get_acceleration()

Returns the acceleration for the specified servo as set by 
:func:`SetAcceleration`.

=cut

sub get_acceleration
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION, [$servo_num], 'C', 'S');
}

=item set_output_voltage()

Sets the output voltages with which the servos are driven in mV.
The minimum output voltage is 2000mV and the maximum output voltage is 
9000mV.

.. note::
 We recommend that you set this value to the maximum voltage that is
 specified for your servo, most servos achieve their maximum force only
 with high voltages.

The default value is 5000.

=cut

sub set_output_voltage
{
	my ($self, $voltage) = @_;

	$self->_send_request(&FUNCTION_SET_OUTPUT_VOLTAGE, [$voltage], 'S', '');
}

=item get_output_voltage()

Returns the output voltage as specified by :func:`SetOutputVoltage`.

=cut

sub get_output_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_OUTPUT_VOLTAGE, [], '', 'S');
}

=item set_pulse_width()

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

sub set_pulse_width
{
	my ($self, $servo_num, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_PULSE_WIDTH, [$servo_num, $min, $max], 'C S S', '');
}

=item get_pulse_width()

Returns the minimum and maximum pulse width for the specified servo as set by
:func:`SetPulseWidth`.

=cut

sub get_pulse_width
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_PULSE_WIDTH, [$servo_num], 'C', 'S S');
}

=item set_degree()

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

sub set_degree
{
	my ($self, $servo_num, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_DEGREE, [$servo_num, $min, $max], 'C s s', '');
}

=item get_degree()

Returns the minimum and maximum degree for the specified servo as set by
:func:`SetDegree`.

=cut

sub get_degree
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_DEGREE, [$servo_num], 'C', 's s');
}

=item set_period()

Sets the period of the specified servo in µs.

Usually, servos are controlled with a 
`PWM <http://en.wikipedia.org/wiki/Pulse-width_modulation>`__. Different
servos expect PWMs with different periods. Most servos run well with a 
period of about 20ms.

If your servo comes with a datasheet that specifies a period, you should
set it accordingly. If you don't have a datasheet and you have no idea
what the correct period is, the default value (19.5ms) will most likely
work fine. 

The minimum possible period is 1µs and the maximum is 65535µs.

The default value is 19.5ms (19500µs).

=cut

sub set_period
{
	my ($self, $servo_num, $period) = @_;

	$self->_send_request(&FUNCTION_SET_PERIOD, [$servo_num, $period], 'C S', '');
}

=item get_period()

Returns the period for the specified servo as set by :func:`SetPeriod`.

=cut

sub get_period
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_PERIOD, [$servo_num], 'C', 'S');
}

=item get_servo_current()

Returns the current consumption of the specified servo in mA.

=cut

sub get_servo_current
{
	my ($self, $servo_num) = @_;

	return $self->_send_request(&FUNCTION_GET_SERVO_CURRENT, [$servo_num], 'C', 'S');
}

=item get_overall_current()

Returns the current consumption of all servos together in mA.

=cut

sub get_overall_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_OVERALL_CURRENT, [], '', 'S');
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

sub get_external_input_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, [], '', 'S');
}

=item set_minimum_voltage()

Sets the minimum voltage in mV, below which the :func:`UnderVoltage` callback
is triggered. The minimum possible value that works with the Servo Brick is 5V.
You can use this function to detect the discharge of a battery that is used
to drive the stepper motor. If you have a fixed power supply, you likely do 
not need this functionality.

The default value is 5V (5000mV).

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

=item enable_position_reached_callback()

Enables the :func:`PositionReached` callback.

Default is disabled.

.. versionadded:: 2.0.1~(Firmware)

=cut

sub enable_position_reached_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE_POSITION_REACHED_CALLBACK, [], '', '');
}

=item disable_position_reached_callback()

Disables the :func:`PositionReached` callback.

Default is disabled.

.. versionadded:: 2.0.1~(Firmware)

=cut

sub disable_position_reached_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE_POSITION_REACHED_CALLBACK, [], '', '');
}

=item is_position_reached_callback_enabled()

Returns *true* if :func:`PositionReached` callback is enabled, *false* otherwise.

.. versionadded:: 2.0.1~(Firmware)

=cut

sub is_position_reached_callback_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED, [], '', 'C');
}

=item enable_velocity_reached_callback()

Enables the :func:`VelocityReached` callback.

Default is disabled.

.. versionadded:: 2.0.1~(Firmware)

=cut

sub enable_velocity_reached_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK, [], '', '');
}

=item disable_velocity_reached_callback()

Disables the :func:`VelocityReached` callback.

Default is disabled.

.. versionadded:: 2.0.1~(Firmware)

=cut

sub disable_velocity_reached_callback
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK, [], '', '');
}

=item is_velocity_reached_callback_enabled()

Returns *true* if :func:`VelocityReached` callback is enabled, *false* otherwise.

.. versionadded:: 2.0.1~(Firmware)

=cut

sub is_velocity_reached_callback_enabled
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED, [], '', 'C');
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
