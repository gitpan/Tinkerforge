
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

Tinkerforge::BrickletGPS - Device for receiving GPS position

=cut

package Tinkerforge::BrickletGPS;

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

This constant is used to identify a GPS Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 222;

=item CALLBACK_COORDINATES

This constant is used with the register_callback() subroutine to specify
the CALLBACK_COORDINATES callback.

=cut

use constant CALLBACK_COORDINATES => 17;

=item CALLBACK_STATUS

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STATUS callback.

=cut

use constant CALLBACK_STATUS => 18;

=item CALLBACK_ALTITUDE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ALTITUDE callback.

=cut

use constant CALLBACK_ALTITUDE => 19;

=item CALLBACK_MOTION

This constant is used with the register_callback() subroutine to specify
the CALLBACK_MOTION callback.

=cut

use constant CALLBACK_MOTION => 20;

=item CALLBACK_DATE_TIME

This constant is used with the register_callback() subroutine to specify
the CALLBACK_DATE_TIME callback.

=cut

use constant CALLBACK_DATE_TIME => 21;

=item FUNCTION_GET_COORDINATES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COORDINATES => 1;

=item FUNCTION_GET_STATUS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STATUS => 2;

=item FUNCTION_GET_ALTITUDE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALTITUDE => 3;

=item FUNCTION_GET_MOTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOTION => 4;

=item FUNCTION_GET_DATE_TIME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DATE_TIME => 5;

=item FUNCTION_RESTART

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_RESTART => 6;

=item FUNCTION_SET_COORDINATES_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_COORDINATES_CALLBACK_PERIOD => 7;

=item FUNCTION_GET_COORDINATES_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_COORDINATES_CALLBACK_PERIOD => 8;

=item FUNCTION_SET_STATUS_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STATUS_CALLBACK_PERIOD => 9;

=item FUNCTION_GET_STATUS_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STATUS_CALLBACK_PERIOD => 10;

=item FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD => 11;

=item FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD => 12;

=item FUNCTION_SET_MOTION_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_MOTION_CALLBACK_PERIOD => 13;

=item FUNCTION_GET_MOTION_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_MOTION_CALLBACK_PERIOD => 14;

=item FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD => 15;

=item FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD => 16;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant FIX_NO_FIX => 1;
use constant FIX_2D_FIX => 2;
use constant FIX_3D_FIX => 3;
use constant RESTART_TYPE_HOT_START => 0;
use constant RESTART_TYPE_WARM_START => 1;
use constant RESTART_TYPE_COLD_START => 2;
use constant RESTART_TYPE_FACTORY_RESET => 3;


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

	$self->{response_expected}->{&FUNCTION_GET_COORDINATES} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STATUS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALTITUDE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MOTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DATE_TIME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESTART} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_COORDINATES_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_COORDINATES_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STATUS_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STATUS_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_MOTION_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_MOTION_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_COORDINATES} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_STATUS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ALTITUDE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_MOTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_DATE_TIME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_COORDINATES} = 'L a L a S S S S';
	$self->{callback_formats}->{&CALLBACK_STATUS} = 'C C C';
	$self->{callback_formats}->{&CALLBACK_ALTITUDE} = 'L L';
	$self->{callback_formats}->{&CALLBACK_MOTION} = 'L L';
	$self->{callback_formats}->{&CALLBACK_DATE_TIME} = 'L L';

	bless($self, $class);

	return $self;
}


=item get_coordinates()

Returns the GPS coordinates. Latitude and longitude are given in the
``DD.dddddd°`` format, the value 57123468 means 57.123468°.
The parameter ``ns`` and ``ew`` are the cardinal directions for
latitude and longitude. Possible values for ``ns`` and ``ew`` are 'N', 'S', 'E'
and 'W' (north, south, east and west).

PDOP, HDOP and VDOP are the dilution of precision (DOP) values. They specify
the additional multiplicative effect of GPS satellite geometry on GPS 
precision. See 
`here <http://en.wikipedia.org/wiki/Dilution_of_precision_(GPS)>`__
for more information. The values are give in hundredths.

EPE is the "Estimated Position Error". The EPE is given in cm. This is not the
absolute maximum error, it is the error with a specific confidence. See
`here <http://www.nps.gov/gis/gps/WhatisEPE.html>`__ for more information.

This data is only valid if there is currently a fix as indicated by
:func:`GetStatus`.

=cut

sub get_coordinates
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COORDINATES, [], '', 'L a L a S S S S');
}

=item get_status()

Returns the current fix status, the number of satellites that are in view and
the number of satellites that are currently used.

Possible fix status values can be:

.. csv-table::
 :header: "Value", "Description"
 :widths: 10, 100

 "1", "No Fix, :func:`GetCoordinates` and :func:`GetAltitude` return invalid data"
 "2", "2D Fix, only :func:`GetCoordinates` returns valid data"
 "3", "3D Fix, :func:`GetCoordinates` and :func:`GetAltitude` return valid data"

There is also a :ref:`blue LED <gps_bricklet_fix_led>` on the Bricklet that
indicates the fix status.

=cut

sub get_status
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STATUS, [], '', 'C C C');
}

=item get_altitude()

Returns the current altitude and corresponding geoidal separation.

Both values are given in cm.

This data is only valid if there is currently a fix as indicated by
:func:`GetStatus`.

=cut

sub get_altitude
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALTITUDE, [], '', 'L L');
}

=item get_motion()

Returns the current course and speed. Course is given in hundredths degree
and speed is given in hundredths km/h. A course of 0° means the Bricklet is
traveling north bound and 90° means it is traveling east bound.

Please note that this only returns useful values if an actual movement
is present.

This data is only valid if there is currently a fix as indicated by
:func:`GetStatus`.

=cut

sub get_motion
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOTION, [], '', 'L L');
}

=item get_date_time()

Returns the current date and time. The date is
given in the format ``ddmmyy`` and the time is given
in the format ``hhmmss.sss``. For example, 140713 means
14.05.13 as date and 195923568 means 19:59:23.568 as time.

=cut

sub get_date_time
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DATE_TIME, [], '', 'L L');
}

=item restart()

Restarts the GPS Bricklet, the following restart types are available:

.. csv-table::
 :header: "Value", "Description"
 :widths: 10, 100

 "0", "Hot start (use all available data in the NV store)"
 "1", "Warm start (don't use ephemeris at restart)"
 "2", "Cold start (don't use time, position, almanacs and ephemeris at restart)"
 "3", "Factory reset (clear all system/user configurations at restart)"

=cut

sub restart
{
	my ($self, $restart_type) = @_;

	$self->_send_request(&FUNCTION_RESTART, [$restart_type], 'C', '');
}

=item set_coordinates_callback_period()

Sets the period in ms with which the :func:`Coordinates` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Coordinates` is only triggered if the coordinates changed since the
last triggering.

The default value is 0.

=cut

sub set_coordinates_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_COORDINATES_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_coordinates_callback_period()

Returns the period as set by :func:`SetCoordinatesCallbackPeriod`.

=cut

sub get_coordinates_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_COORDINATES_CALLBACK_PERIOD, [], '', 'L');
}

=item set_status_callback_period()

Sets the period in ms with which the :func:`Status` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Status` is only triggered if the status changed since the
last triggering.

The default value is 0.

=cut

sub set_status_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_STATUS_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_status_callback_period()

Returns the period as set by :func:`SetStatusCallbackPeriod`.

=cut

sub get_status_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STATUS_CALLBACK_PERIOD, [], '', 'L');
}

=item set_altitude_callback_period()

Sets the period in ms with which the :func:`Altitude` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Altitude` is only triggered if the altitude changed since the
last triggering.

The default value is 0.

=cut

sub set_altitude_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_altitude_callback_period()

Returns the period as set by :func:`SetAltitudeCallbackPeriod`.

=cut

sub get_altitude_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_motion_callback_period()

Sets the period in ms with which the :func:`Motion` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`Motion` is only triggered if the motion changed since the
last triggering.

The default value is 0.

=cut

sub set_motion_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_MOTION_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_motion_callback_period()

Returns the period as set by :func:`SetMotionCallbackPeriod`.

=cut

sub get_motion_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_MOTION_CALLBACK_PERIOD, [], '', 'L');
}

=item set_date_time_callback_period()

Sets the period in ms with which the :func:`DateTime` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`DateTime` is only triggered if the date or time changed since the
last triggering.

The default value is 0.

=cut

sub set_date_time_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_date_time_callback_period()

Returns the period as set by :func:`SetDateTimeCallbackPeriod`.

=cut

sub get_date_time_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD, [], '', 'L');
}

=item get_identity()

Returns the UID, the UID where the Bricklet is connected to, 
the position, the hardware and firmware version as well as the
device identifier.

The position can be 'a', 'b', 'c' or 'd'.

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
