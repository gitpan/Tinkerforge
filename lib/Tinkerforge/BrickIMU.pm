
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

Tinkerforge::BrickIMU - Device for sensing acceleration, magnetic field and angular velocity

=cut

package Tinkerforge::BrickIMU;

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

This constant is used to identify a IMU Brick.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 16;

=item CALLBACK_ACCELERATION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ACCELERATION callback.

=cut

use constant CALLBACK_ACCELERATION => 31;

=item CALLBACK_MAGNETIC_FIELD

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MAGNETIC_FIELD callback.

=cut

use constant CALLBACK_MAGNETIC_FIELD => 32;

=item CALLBACK_ANGULAR_VELOCITY

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ANGULAR_VELOCITY callback.

=cut

use constant CALLBACK_ANGULAR_VELOCITY => 33;

=item CALLBACK_ALL_DATA

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ALL_DATA callback.

=cut

use constant CALLBACK_ALL_DATA => 34;

=item CALLBACK_ORIENTATION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ORIENTATION callback.

=cut

use constant CALLBACK_ORIENTATION => 35;

=item CALLBACK_QUATERNION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_QUATERNION callback.

=cut

use constant CALLBACK_QUATERNION => 36;

=item FUNCTION_GET_ACCELERATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION => 1;

=item FUNCTION_GET_MAGNETIC_FIELD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MAGNETIC_FIELD => 2;

=item FUNCTION_GET_ANGULAR_VELOCITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANGULAR_VELOCITY => 3;

=item FUNCTION_GET_ALL_DATA

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALL_DATA => 4;

=item FUNCTION_GET_ORIENTATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ORIENTATION => 5;

=item FUNCTION_GET_QUATERNION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_QUATERNION => 6;

=item FUNCTION_GET_IMU_TEMPERATURE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IMU_TEMPERATURE => 7;

=item FUNCTION_LEDS_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LEDS_ON => 8;

=item FUNCTION_LEDS_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_LEDS_OFF => 9;

=item FUNCTION_ARE_LEDS_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ARE_LEDS_ON => 10;

=item FUNCTION_SET_ACCELERATION_RANGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION_RANGE => 11;

=item FUNCTION_GET_ACCELERATION_RANGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION_RANGE => 12;

=item FUNCTION_SET_MAGNETOMETER_RANGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MAGNETOMETER_RANGE => 13;

=item FUNCTION_GET_MAGNETOMETER_RANGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MAGNETOMETER_RANGE => 14;

=item FUNCTION_SET_CONVERGENCE_SPEED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CONVERGENCE_SPEED => 15;

=item FUNCTION_GET_CONVERGENCE_SPEED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CONVERGENCE_SPEED => 16;

=item FUNCTION_SET_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CALIBRATION => 17;

=item FUNCTION_GET_CALIBRATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CALIBRATION => 18;

=item FUNCTION_SET_ACCELERATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ACCELERATION_PERIOD => 19;

=item FUNCTION_GET_ACCELERATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ACCELERATION_PERIOD => 20;

=item FUNCTION_SET_MAGNETIC_FIELD_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MAGNETIC_FIELD_PERIOD => 21;

=item FUNCTION_GET_MAGNETIC_FIELD_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MAGNETIC_FIELD_PERIOD => 22;

=item FUNCTION_SET_ANGULAR_VELOCITY_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ANGULAR_VELOCITY_PERIOD => 23;

=item FUNCTION_GET_ANGULAR_VELOCITY_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ANGULAR_VELOCITY_PERIOD => 24;

=item FUNCTION_SET_ALL_DATA_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ALL_DATA_PERIOD => 25;

=item FUNCTION_GET_ALL_DATA_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALL_DATA_PERIOD => 26;

=item FUNCTION_SET_ORIENTATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ORIENTATION_PERIOD => 27;

=item FUNCTION_GET_ORIENTATION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ORIENTATION_PERIOD => 28;

=item FUNCTION_SET_QUATERNION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_QUATERNION_PERIOD => 29;

=item FUNCTION_GET_QUATERNION_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_QUATERNION_PERIOD => 30;

=item FUNCTION_ORIENTATION_CALCULATION_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ORIENTATION_CALCULATION_ON => 37;

=item FUNCTION_ORIENTATION_CALCULATION_OFF

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ORIENTATION_CALCULATION_OFF => 38;

=item FUNCTION_IS_ORIENTATION_CALCULATION_ON

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_ORIENTATION_CALCULATION_ON => 39;

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
use constant CALIBRATION_TYPE_ACCELEROMETER_GAIN => 0;
use constant CALIBRATION_TYPE_ACCELEROMETER_BIAS => 1;
use constant CALIBRATION_TYPE_MAGNETOMETER_GAIN => 2;
use constant CALIBRATION_TYPE_MAGNETOMETER_BIAS => 3;
use constant CALIBRATION_TYPE_GYROSCOPE_GAIN => 4;
use constant CALIBRATION_TYPE_GYROSCOPE_BIAS => 5;


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

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 1]);

	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MAGNETIC_FIELD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANGULAR_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALL_DATA} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ORIENTATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_QUATERNION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_IMU_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_LEDS_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_LEDS_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_ARE_LEDS_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION_RANGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION_RANGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MAGNETOMETER_RANGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_MAGNETOMETER_RANGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CONVERGENCE_SPEED} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CONVERGENCE_SPEED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CALIBRATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ACCELERATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ACCELERATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MAGNETIC_FIELD_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MAGNETIC_FIELD_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ANGULAR_VELOCITY_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ANGULAR_VELOCITY_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ALL_DATA_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALL_DATA_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ORIENTATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ORIENTATION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_QUATERNION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_QUATERNION_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ACCELERATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_MAGNETIC_FIELD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ANGULAR_VELOCITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ALL_DATA} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ORIENTATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_QUATERNION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_ORIENTATION_CALCULATION_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_ORIENTATION_CALCULATION_OFF} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_ORIENTATION_CALCULATION_ON} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_ACCELERATION} = 's s s';
	$self->{callback_formats}->{&CALLBACK_MAGNETIC_FIELD} = 's s s';
	$self->{callback_formats}->{&CALLBACK_ANGULAR_VELOCITY} = 's s s';
	$self->{callback_formats}->{&CALLBACK_ALL_DATA} = 's s s s s s s s s s';
	$self->{callback_formats}->{&CALLBACK_ORIENTATION} = 's s s';
	$self->{callback_formats}->{&CALLBACK_QUATERNION} = 'f f f f';

	bless($self, $class);

	return $self;
}


=item get_acceleration()

Returns the calibrated acceleration from the accelerometer for the 
x, y and z axis in mG (G/1000, 1G = 9.80605m/s²).

If you want to get the acceleration periodically, it is recommended 
to use the callback :func:`Acceleration` and set the period with 
:func:`SetAccelerationPeriod`.

=cut

sub get_acceleration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION, [], '', 's s s');
}

=item get_magnetic_field()

Returns the calibrated magnetic field from the magnetometer for the 
x, y and z axis in mG (Milligauss or Nanotesla).

If you want to get the magnetic field periodically, it is recommended 
to use the callback :func:`MagneticField` and set the period with 
:func:`SetMagneticFieldPeriod`.

=cut

sub get_magnetic_field
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MAGNETIC_FIELD, [], '', 's s s');
}

=item get_angular_velocity()

Returns the calibrated angular velocity from the gyroscope for the 
x, y and z axis in °/14.375s (you have to divide by 14.375 to
get the value in °/s).

If you want to get the angular velocity periodically, it is recommended 
to use the callback :func:`AngularVelocity` and set the period with 
:func:`SetAngularVelocityPeriod`.

=cut

sub get_angular_velocity
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANGULAR_VELOCITY, [], '', 's s s');
}

=item get_all_data()

Returns the data from :func:`GetAcceleration`, :func:`GetMagneticField` 
and :func:`GetAngularVelocity` as well as the temperature of the IMU Brick.

The temperature is given in °C/100.

If you want to get the data periodically, it is recommended 
to use the callback :func:`AllData` and set the period with 
:func:`SetAllDataPeriod`.

=cut

sub get_all_data
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALL_DATA, [], '', 's s s s s s s s s s');
}

=item get_orientation()

Returns the current orientation (roll, pitch, yaw) of the IMU Brick as Euler
angles in one-hundredth degree. Note that Euler angles always experience a
`gimbal lock <http://en.wikipedia.org/wiki/Gimbal_lock>`__.

We recommend that you use quaternions instead.

The order to sequence in which the orientation values should be applied is 
roll, yaw, pitch. 

If you want to get the orientation periodically, it is recommended 
to use the callback :func:`Orientation` and set the period with 
:func:`SetOrientationPeriod`.

=cut

sub get_orientation
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ORIENTATION, [], '', 's s s');
}

=item get_quaternion()

Returns the current orientation (x, y, z, w) of the IMU as 
`quaternions <http://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation>`__.

You can go from quaternions to Euler angles with the following formula::

 xAngle = atan2(2*y*w - 2*x*z, 1 - 2*y*y - 2*z*z)
 yAngle = atan2(2*x*w - 2*y*z, 1 - 2*x*x - 2*z*z)
 zAngle =  asin(2*x*y + 2*z*w)

This process is not reversible, because of the 
`gimbal lock <http://en.wikipedia.org/wiki/Gimbal_lock>`__.

It is also possible to calculate independent angles. You can calculate 
yaw, pitch and roll in a right-handed vehicle coordinate system according to DIN70000
with::

 yaw   =  atan2(2*x*y + 2*w*z, w*w + x*x - y*y - z*z)
 pitch = -asin(2*w*y - 2*x*z)
 roll  = -atan2(2*y*z + 2*w*x, -w*w + x*x + y*y - z*z))

Converting the quaternions to an OpenGL transformation matrix is
possible with the following formula::

 matrix = [[1 - 2*(y*y + z*z),     2*(x*y - w*z),     2*(x*z + w*y), 0],
           [    2*(x*y + w*z), 1 - 2*(x*x + z*z),     2*(y*z - w*x), 0],
           [    2*(x*z - w*y),     2*(y*z + w*x), 1 - 2*(x*x + y*y), 0],
           [                0,                 0,                 0, 1]]

If you want to get the quaternions periodically, it is recommended 
to use the callback :func:`Quaternion` and set the period with 
:func:`SetQuaternionPeriod`.

=cut

sub get_quaternion
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_QUATERNION, [], '', 'f f f f');
}

=item get_imu_temperature()

Returns the temperature of the IMU Brick. The temperature is given in 
°C/100.

=cut

sub get_imu_temperature
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_IMU_TEMPERATURE, [], '', 's');
}

=item leds_on()

Turns the orientation and direction LEDs of the IMU Brick on.

=cut

sub leds_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LEDS_ON, [], '', '');
}

=item leds_off()

Turns the orientation and direction LEDs of the IMU Brick off.

=cut

sub leds_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_LEDS_OFF, [], '', '');
}

=item are_leds_on()

Returns *true* if the orientation and direction LEDs of the IMU Brick
are on, *false* otherwise.

=cut

sub are_leds_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_ARE_LEDS_ON, [], '', 'C');
}

=item set_acceleration_range()

Not implemented yet.

=cut

sub set_acceleration_range
{
	my ($self, $range) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION_RANGE, [$range], 'C', '');
}

=item get_acceleration_range()

Not implemented yet.

=cut

sub get_acceleration_range
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION_RANGE, [], '', 'C');
}

=item set_magnetometer_range()

Not implemented yet.

=cut

sub set_magnetometer_range
{
	my ($self, $range) = @_;

	$self->_send_request(&FUNCTION_SET_MAGNETOMETER_RANGE, [$range], 'C', '');
}

=item get_magnetometer_range()

Not implemented yet.

=cut

sub get_magnetometer_range
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MAGNETOMETER_RANGE, [], '', 'C');
}

=item set_convergence_speed()

Sets the convergence speed of the IMU Brick in °/s. The convergence speed 
determines how the different sensor measurements are fused.

If the orientation of the IMU Brick is off by 10° and the convergence speed is 
set to 20°/s, it will take 0.5s until the orientation is corrected. However,
if the correct orientation is reached and the convergence speed is too high,
the orientation will fluctuate with the fluctuations of the accelerometer and
the magnetometer.

If you set the convergence speed to 0, practically only the gyroscope is used
to calculate the orientation. This gives very smooth movements, but errors of the
gyroscope will not be corrected. If you set the convergence speed to something
above 500, practically only the magnetometer and the accelerometer are used to
calculate the orientation. In this case the movements are abrupt and the values
will fluctuate, but there won't be any errors that accumulate over time.

In an application with high angular velocities, we recommend a high convergence
speed, so the errors of the gyroscope can be corrected fast. In applications with
only slow movements we recommend a low convergence speed. You can change the
convergence speed on the fly. So it is possible (and recommended) to increase 
the convergence speed before an abrupt movement and decrease it afterwards 
again.

You might want to play around with the convergence speed in the Brick Viewer to
get a feeling for a good value for your application.

The default value is 30.

=cut

sub set_convergence_speed
{
	my ($self, $speed) = @_;

	$self->_send_request(&FUNCTION_SET_CONVERGENCE_SPEED, [$speed], 'S', '');
}

=item get_convergence_speed()

Returns the convergence speed as set by :func:`SetConvergenceSpeed`.

=cut

sub get_convergence_speed
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CONVERGENCE_SPEED, [], '', 'S');
}

=item set_calibration()

There are several different types that can be calibrated:

.. csv-table::
 :header: "Type", "Description", "Values"
 :widths: 10, 30, 110

 "0",    "Accelerometer Gain", "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
 "1",    "Accelerometer Bias", "``[bias x, bias y, bias z, 0, 0, 0, 0, 0, 0, 0]``"
 "2",    "Magnetometer Gain",  "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
 "3",    "Magnetometer Bias",  "``[bias x, bias y, bias z, 0, 0, 0, 0, 0, 0, 0]``"
 "4",    "Gyroscope Gain",     "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
 "5",    "Gyroscope Bias",     "``[bias xl, bias yl, bias zl, temp l, bias xh, bias yh, bias zh, temp h, 0, 0]``"

The calibration via gain and bias is done with the following formula::

 new_value = (bias + orig_value) * gain_mul / gain_div

If you really want to write your own calibration software, please keep
in mind that you first have to undo the old calibration (set bias to 0 and
gain to 1/1) and that you have to average over several thousand values
to obtain a usable result in the end.

The gyroscope bias is highly dependent on the temperature, so you have to
calibrate the bias two times with different temperatures. The values ``xl``,
``yl``, ``zl`` and ``temp l`` are the bias for ``x``, ``y``, ``z`` and the
corresponding temperature for a low temperature. The values ``xh``, ``yh``,
``zh`` and ``temp h`` are the same for a high temperatures. The temperature
difference should be at least 5°C. If you have a temperature where the
IMU Brick is mostly used, you should use this temperature for one of the
sampling points.

.. note::
 We highly recommend that you use the Brick Viewer to calibrate your
 IMU Brick.

=cut

sub set_calibration
{
	my ($self, $typ, $data) = @_;

	$self->_send_request(&FUNCTION_SET_CALIBRATION, [$typ, $data], 'C s10', '');
}

=item get_calibration()

Returns the calibration for a given type as set by :func:`SetCalibration`.

=cut

sub get_calibration
{
	my ($self, $typ) = @_;

	return $self->_send_request(&FUNCTION_GET_CALIBRATION, [$typ], 'C', 's10');
}

=item set_acceleration_period()

Sets the period in ms with which the :func:`Acceleration` callback is triggered
periodically. A value of 0 turns the callback off.

The default value is 0.

=cut

sub set_acceleration_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ACCELERATION_PERIOD, [$period], 'L', '');
}

=item get_acceleration_period()

Returns the period as set by :func:`SetAccelerationPeriod`.

=cut

sub get_acceleration_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ACCELERATION_PERIOD, [], '', 'L');
}

=item set_magnetic_field_period()

Sets the period in ms with which the :func:`MagneticField` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_magnetic_field_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_MAGNETIC_FIELD_PERIOD, [$period], 'L', '');
}

=item get_magnetic_field_period()

Returns the period as set by :func:`SetMagneticFieldPeriod`.

=cut

sub get_magnetic_field_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MAGNETIC_FIELD_PERIOD, [], '', 'L');
}

=item set_angular_velocity_period()

Sets the period in ms with which the :func:`AngularVelocity` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_angular_velocity_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ANGULAR_VELOCITY_PERIOD, [$period], 'L', '');
}

=item get_angular_velocity_period()

Returns the period as set by :func:`SetAngularVelocityPeriod`.

=cut

sub get_angular_velocity_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ANGULAR_VELOCITY_PERIOD, [], '', 'L');
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

=item set_orientation_period()

Sets the period in ms with which the :func:`Orientation` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_orientation_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ORIENTATION_PERIOD, [$period], 'L', '');
}

=item get_orientation_period()

Returns the period as set by :func:`SetOrientationPeriod`.

=cut

sub get_orientation_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ORIENTATION_PERIOD, [], '', 'L');
}

=item set_quaternion_period()

Sets the period in ms with which the :func:`Quaternion` callback is triggered
periodically. A value of 0 turns the callback off.

=cut

sub set_quaternion_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_QUATERNION_PERIOD, [$period], 'L', '');
}

=item get_quaternion_period()

Returns the period as set by :func:`SetQuaternionPeriod`.

=cut

sub get_quaternion_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_QUATERNION_PERIOD, [], '', 'L');
}

=item orientation_calculation_on()

Turns the orientation calculation of the IMU Brick on.

As default the calculation is on.

.. versionadded:: 2.0.2~(Firmware)

=cut

sub orientation_calculation_on
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ORIENTATION_CALCULATION_ON, [], '', '');
}

=item orientation_calculation_off()

Turns the orientation calculation of the IMU Brick off.

If the calculation is off, :func:`GetOrientation` will return
the last calculated value until the calculation is turned on again.

The trigonometric functions that are needed to calculate the orientation 
are very expensive. We recommend to turn the orientation calculation
off if the orientation is not needed, to free calculation time for the
sensor fusion algorithm.

As default the calculation is on.

.. versionadded:: 2.0.2~(Firmware)

=cut

sub orientation_calculation_off
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_ORIENTATION_CALCULATION_OFF, [], '', '');
}

=item is_orientation_calculation_on()

Returns *true* if the orientation calculation of the IMU Brick
is on, *false* otherwise.

.. versionadded:: 2.0.2~(Firmware)

=cut

sub is_orientation_calculation_on
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_ORIENTATION_CALCULATION_ON, [], '', 'C');
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
