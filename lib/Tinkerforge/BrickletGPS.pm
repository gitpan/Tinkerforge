
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickletGPS;
=comment
        Device for receiving GPS position
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 222;
use constant CALLBACK_COORDINATES => 17;
use constant CALLBACK_STATUS => 18;
use constant CALLBACK_ALTITUDE => 19;
use constant CALLBACK_MOTION => 20;
use constant CALLBACK_DATE_TIME => 21;

use constant FUNCTION_GET_COORDINATES => 1;
use constant FUNCTION_GET_STATUS => 2;
use constant FUNCTION_GET_ALTITUDE => 3;
use constant FUNCTION_GET_MOTION => 4;
use constant FUNCTION_GET_DATE_TIME => 5;
use constant FUNCTION_RESTART => 6;
use constant FUNCTION_SET_COORDINATES_CALLBACK_PERIOD => 7;
use constant FUNCTION_GET_COORDINATES_CALLBACK_PERIOD => 8;
use constant FUNCTION_SET_STATUS_CALLBACK_PERIOD => 9;
use constant FUNCTION_GET_STATUS_CALLBACK_PERIOD => 10;
use constant FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD => 11;
use constant FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD => 12;
use constant FUNCTION_SET_MOTION_CALLBACK_PERIOD => 13;
use constant FUNCTION_GET_MOTION_CALLBACK_PERIOD => 14;
use constant FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD => 15;
use constant FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD => 16;
use constant FUNCTION_GET_IDENTITY => 255;

use constant FIX_NO_FIX => 1;
use constant FIX_2D_FIX => 2;
use constant FIX_3D_FIX => 3;
use constant RESTART_TYPE_HOT_START => 0;
use constant RESTART_TYPE_WARM_START => 1;
use constant RESTART_TYPE_COLD_START => 2;
use constant RESTART_TYPE_FACTORY_RESET => 3;

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 0],
                                     response_expected => shared_clone({&FUNCTION_GET_COORDINATES => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_STATUS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_ALTITUDE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_MOTION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_DATE_TIME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_RESTART => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_SET_COORDINATES_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_COORDINATES_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STATUS_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_STATUS_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_MOTION_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_MOTION_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_COORDINATES => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_STATUS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_ALTITUDE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_MOTION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_DATE_TIME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_COORDINATES => 'L a L a S S S S',
                                                                      &CALLBACK_STATUS => 'C C C',
                                                                      &CALLBACK_ALTITUDE => 'L L',
                                                                      &CALLBACK_MOTION => 'L L',
                                                                      &CALLBACK_DATE_TIME => 'L L'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_coordinates
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_COORDINATES, [], '', 'L a L a S S S S');
 }

sub get_status
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STATUS, [], '', 'C C C');
 }

sub get_altitude
{
=comment
        Returns the current altitude and corresponding geoidal separation.
        
        Both values are given in cm.
        
        This data is only valid if there is currently a fix as indicated by
        :func:`GetStatus`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ALTITUDE, [], '', 'L L');
 }

sub get_motion
{
=comment
        Returns the current course and speed. Course is given in hundredths degree
        and speed is given in hundredths km/h. A course of 0° means the Bricklet is
        traveling north bound and 90° means it is traveling east bound.
        
        Please note that this only returns useful values if an actual movement
        is present.
        
        This data is only valid if there is currently a fix as indicated by
        :func:`GetStatus`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MOTION, [], '', 'L L');
 }

sub get_date_time
{
=comment
        Returns the current date and time. The date is
        given in the format ``ddmmyy`` and the time is given
        in the format ``hhmmss.sss``. For example, 140713 means
        14.05.13 as date and 195923568 means 19:59:23.568 as time.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DATE_TIME, [], '', 'L L');
 }

sub restart
{
=comment
        Restarts the GPS Bricklet, the following restart types are available:
        
        .. csv-table::
         :header: "Value", "Description"
         :widths: 10, 100
        
         "0", "Hot start (use all available data in the NV store)"
         "1", "Warm start (don't use ephemeris at restart)"
         "2", "Cold start (don't use time, position, almanacs and ephemeris at restart)"
         "3", "Factory reset (clear all system/user configurations at restart)"
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $restart_type) = @_;

    $self->{super}->send_request($self, &FUNCTION_RESTART, [$restart_type], 'C', '');
}

sub set_coordinates_callback_period
{
=comment
        Sets the period in ms with which the :func:`Coordinates` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Coordinates` is only triggered if the coordinates changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_COORDINATES_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_coordinates_callback_period
{
=comment
        Returns the period as set by :func:`SetCoordinatesCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_COORDINATES_CALLBACK_PERIOD, [], '', 'L');
}

sub set_status_callback_period
{
=comment
        Sets the period in ms with which the :func:`Status` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Status` is only triggered if the status changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STATUS_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_status_callback_period
{
=comment
        Returns the period as set by :func:`SetStatusCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STATUS_CALLBACK_PERIOD, [], '', 'L');
}

sub set_altitude_callback_period
{
=comment
        Sets the period in ms with which the :func:`Altitude` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Altitude` is only triggered if the altitude changed since the
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

sub set_motion_callback_period
{
=comment
        Sets the period in ms with which the :func:`Motion` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`Motion` is only triggered if the motion changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_MOTION_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_motion_callback_period
{
=comment
        Returns the period as set by :func:`SetMotionCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_MOTION_CALLBACK_PERIOD, [], '', 'L');
}

sub set_date_time_callback_period
{
=comment
        Sets the period in ms with which the :func:`DateTime` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`DateTime` is only triggered if the date or time changed since the
        last triggering.
        
        The default value is 0.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_date_time_callback_period
{
=comment
        Returns the period as set by :func:`SetDateTimeCallbackPeriod`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD, [], '', 'L');
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
