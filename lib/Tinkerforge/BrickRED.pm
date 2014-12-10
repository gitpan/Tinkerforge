
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

Tinkerforge::BrickRED - Device for running user programs standalone on the stack

=cut

package Tinkerforge::BrickRED;

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

This constant is used to identify a RED Brick.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 17;

=item CALLBACK_ASYNC_FILE_READ

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ASYNC_FILE_READ callback.

=cut

use constant CALLBACK_ASYNC_FILE_READ => 30;

=item CALLBACK_ASYNC_FILE_WRITE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_ASYNC_FILE_WRITE callback.

=cut

use constant CALLBACK_ASYNC_FILE_WRITE => 31;

=item CALLBACK_FILE_EVENTS_OCCURRED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_FILE_EVENTS_OCCURRED callback.

=cut

use constant CALLBACK_FILE_EVENTS_OCCURRED => 32;

=item CALLBACK_PROCESS_STATE_CHANGED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_PROCESS_STATE_CHANGED callback.

=cut

use constant CALLBACK_PROCESS_STATE_CHANGED => 45;

=item CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED callback.

=cut

use constant CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED => 65;

=item CALLBACK_PROGRAM_PROCESS_SPAWNED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_PROGRAM_PROCESS_SPAWNED callback.

=cut

use constant CALLBACK_PROGRAM_PROCESS_SPAWNED => 66;

=item FUNCTION_CREATE_SESSION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CREATE_SESSION => 1;

=item FUNCTION_EXPIRE_SESSION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_EXPIRE_SESSION => 2;

=item FUNCTION_EXPIRE_SESSION_UNCHECKED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_EXPIRE_SESSION_UNCHECKED => 3;

=item FUNCTION_KEEP_SESSION_ALIVE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_KEEP_SESSION_ALIVE => 4;

=item FUNCTION_RELEASE_OBJECT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_RELEASE_OBJECT => 5;

=item FUNCTION_RELEASE_OBJECT_UNCHECKED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_RELEASE_OBJECT_UNCHECKED => 6;

=item FUNCTION_ALLOCATE_STRING

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ALLOCATE_STRING => 7;

=item FUNCTION_TRUNCATE_STRING

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_TRUNCATE_STRING => 8;

=item FUNCTION_GET_STRING_LENGTH

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STRING_LENGTH => 9;

=item FUNCTION_SET_STRING_CHUNK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STRING_CHUNK => 10;

=item FUNCTION_GET_STRING_CHUNK

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STRING_CHUNK => 11;

=item FUNCTION_ALLOCATE_LIST

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ALLOCATE_LIST => 12;

=item FUNCTION_GET_LIST_LENGTH

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LIST_LENGTH => 13;

=item FUNCTION_GET_LIST_ITEM

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LIST_ITEM => 14;

=item FUNCTION_APPEND_TO_LIST

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_APPEND_TO_LIST => 15;

=item FUNCTION_REMOVE_FROM_LIST

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_REMOVE_FROM_LIST => 16;

=item FUNCTION_OPEN_FILE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_OPEN_FILE => 17;

=item FUNCTION_CREATE_PIPE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CREATE_PIPE => 18;

=item FUNCTION_GET_FILE_INFO

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_FILE_INFO => 19;

=item FUNCTION_READ_FILE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_READ_FILE => 20;

=item FUNCTION_READ_FILE_ASYNC

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_READ_FILE_ASYNC => 21;

=item FUNCTION_ABORT_ASYNC_FILE_READ

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_ABORT_ASYNC_FILE_READ => 22;

=item FUNCTION_WRITE_FILE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_WRITE_FILE => 23;

=item FUNCTION_WRITE_FILE_UNCHECKED

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_WRITE_FILE_UNCHECKED => 24;

=item FUNCTION_WRITE_FILE_ASYNC

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_WRITE_FILE_ASYNC => 25;

=item FUNCTION_SET_FILE_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_FILE_POSITION => 26;

=item FUNCTION_GET_FILE_POSITION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_FILE_POSITION => 27;

=item FUNCTION_SET_FILE_EVENTS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_FILE_EVENTS => 28;

=item FUNCTION_GET_FILE_EVENTS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_FILE_EVENTS => 29;

=item FUNCTION_OPEN_DIRECTORY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_OPEN_DIRECTORY => 33;

=item FUNCTION_GET_DIRECTORY_NAME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DIRECTORY_NAME => 34;

=item FUNCTION_GET_NEXT_DIRECTORY_ENTRY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_NEXT_DIRECTORY_ENTRY => 35;

=item FUNCTION_REWIND_DIRECTORY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_REWIND_DIRECTORY => 36;

=item FUNCTION_CREATE_DIRECTORY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CREATE_DIRECTORY => 37;

=item FUNCTION_GET_PROCESSES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROCESSES => 38;

=item FUNCTION_SPAWN_PROCESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SPAWN_PROCESS => 39;

=item FUNCTION_KILL_PROCESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_KILL_PROCESS => 40;

=item FUNCTION_GET_PROCESS_COMMAND

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROCESS_COMMAND => 41;

=item FUNCTION_GET_PROCESS_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROCESS_IDENTITY => 42;

=item FUNCTION_GET_PROCESS_STDIO

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROCESS_STDIO => 43;

=item FUNCTION_GET_PROCESS_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROCESS_STATE => 44;

=item FUNCTION_GET_PROGRAMS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAMS => 46;

=item FUNCTION_DEFINE_PROGRAM

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_DEFINE_PROGRAM => 47;

=item FUNCTION_PURGE_PROGRAM

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_PURGE_PROGRAM => 48;

=item FUNCTION_GET_PROGRAM_IDENTIFIER

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAM_IDENTIFIER => 49;

=item FUNCTION_GET_PROGRAM_ROOT_DIRECTORY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAM_ROOT_DIRECTORY => 50;

=item FUNCTION_SET_PROGRAM_COMMAND

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PROGRAM_COMMAND => 51;

=item FUNCTION_GET_PROGRAM_COMMAND

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAM_COMMAND => 52;

=item FUNCTION_SET_PROGRAM_STDIO_REDIRECTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PROGRAM_STDIO_REDIRECTION => 53;

=item FUNCTION_GET_PROGRAM_STDIO_REDIRECTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAM_STDIO_REDIRECTION => 54;

=item FUNCTION_SET_PROGRAM_SCHEDULE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_PROGRAM_SCHEDULE => 55;

=item FUNCTION_GET_PROGRAM_SCHEDULE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAM_SCHEDULE => 56;

=item FUNCTION_GET_PROGRAM_SCHEDULER_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PROGRAM_SCHEDULER_STATE => 57;

=item FUNCTION_CONTINUE_PROGRAM_SCHEDULE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_CONTINUE_PROGRAM_SCHEDULE => 58;

=item FUNCTION_START_PROGRAM

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_START_PROGRAM => 59;

=item FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS => 60;

=item FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES => 61;

=item FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE => 62;

=item FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE => 63;

=item FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION => 64;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant OBJECT_TYPE_STRING => 0;
use constant OBJECT_TYPE_LIST => 1;
use constant OBJECT_TYPE_FILE => 2;
use constant OBJECT_TYPE_DIRECTORY => 3;
use constant OBJECT_TYPE_PROCESS => 4;
use constant OBJECT_TYPE_PROGRAM => 5;
use constant FILE_FLAG_READ_ONLY => 1;
use constant FILE_FLAG_WRITE_ONLY => 2;
use constant FILE_FLAG_READ_WRITE => 4;
use constant FILE_FLAG_APPEND => 8;
use constant FILE_FLAG_CREATE => 16;
use constant FILE_FLAG_EXCLUSIVE => 32;
use constant FILE_FLAG_NON_BLOCKING => 64;
use constant FILE_FLAG_TRUNCATE => 128;
use constant FILE_FLAG_TEMPORARY => 256;
use constant FILE_FLAG_REPLACE => 512;
use constant FILE_PERMISSION_USER_ALL => 448;
use constant FILE_PERMISSION_USER_READ => 256;
use constant FILE_PERMISSION_USER_WRITE => 128;
use constant FILE_PERMISSION_USER_EXECUTE => 64;
use constant FILE_PERMISSION_GROUP_ALL => 56;
use constant FILE_PERMISSION_GROUP_READ => 32;
use constant FILE_PERMISSION_GROUP_WRITE => 16;
use constant FILE_PERMISSION_GROUP_EXECUTE => 8;
use constant FILE_PERMISSION_OTHERS_ALL => 7;
use constant FILE_PERMISSION_OTHERS_READ => 4;
use constant FILE_PERMISSION_OTHERS_WRITE => 2;
use constant FILE_PERMISSION_OTHERS_EXECUTE => 1;
use constant PIPE_FLAG_NON_BLOCKING_READ => 1;
use constant PIPE_FLAG_NON_BLOCKING_WRITE => 2;
use constant FILE_TYPE_UNKNOWN => 0;
use constant FILE_TYPE_REGULAR => 1;
use constant FILE_TYPE_DIRECTORY => 2;
use constant FILE_TYPE_CHARACTER => 3;
use constant FILE_TYPE_BLOCK => 4;
use constant FILE_TYPE_FIFO => 5;
use constant FILE_TYPE_SYMLINK => 6;
use constant FILE_TYPE_SOCKET => 7;
use constant FILE_TYPE_PIPE => 8;
use constant FILE_ORIGIN_BEGINNING => 0;
use constant FILE_ORIGIN_CURRENT => 1;
use constant FILE_ORIGIN_END => 2;
use constant FILE_EVENT_READABLE => 1;
use constant FILE_EVENT_WRITABLE => 2;
use constant DIRECTORY_ENTRY_TYPE_UNKNOWN => 0;
use constant DIRECTORY_ENTRY_TYPE_REGULAR => 1;
use constant DIRECTORY_ENTRY_TYPE_DIRECTORY => 2;
use constant DIRECTORY_ENTRY_TYPE_CHARACTER => 3;
use constant DIRECTORY_ENTRY_TYPE_BLOCK => 4;
use constant DIRECTORY_ENTRY_TYPE_FIFO => 5;
use constant DIRECTORY_ENTRY_TYPE_SYMLINK => 6;
use constant DIRECTORY_ENTRY_TYPE_SOCKET => 7;
use constant DIRECTORY_FLAG_RECURSIVE => 1;
use constant DIRECTORY_FLAG_EXCLUSIVE => 2;
use constant PROCESS_SIGNAL_INTERRUPT => 2;
use constant PROCESS_SIGNAL_QUIT => 3;
use constant PROCESS_SIGNAL_ABORT => 6;
use constant PROCESS_SIGNAL_KILL => 9;
use constant PROCESS_SIGNAL_USER1 => 10;
use constant PROCESS_SIGNAL_USER2 => 12;
use constant PROCESS_SIGNAL_TERMINATE => 15;
use constant PROCESS_SIGNAL_CONTINUE => 18;
use constant PROCESS_SIGNAL_STOP => 19;
use constant PROCESS_STATE_UNKNOWN => 0;
use constant PROCESS_STATE_RUNNING => 1;
use constant PROCESS_STATE_ERROR => 2;
use constant PROCESS_STATE_EXITED => 3;
use constant PROCESS_STATE_KILLED => 4;
use constant PROCESS_STATE_STOPPED => 5;
use constant PROGRAM_STDIO_REDIRECTION_DEV_NULL => 0;
use constant PROGRAM_STDIO_REDIRECTION_PIPE => 1;
use constant PROGRAM_STDIO_REDIRECTION_FILE => 2;
use constant PROGRAM_STDIO_REDIRECTION_INDIVIDUAL_LOG => 3;
use constant PROGRAM_STDIO_REDIRECTION_CONTINUOUS_LOG => 4;
use constant PROGRAM_STDIO_REDIRECTION_STDOUT => 5;
use constant PROGRAM_START_MODE_NEVER => 0;
use constant PROGRAM_START_MODE_ALWAYS => 1;
use constant PROGRAM_START_MODE_INTERVAL => 2;
use constant PROGRAM_START_MODE_CRON => 3;
use constant PROGRAM_SCHEDULER_STATE_STOPPED => 0;
use constant PROGRAM_SCHEDULER_STATE_RUNNING => 1;


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

	$self->{response_expected}->{&FUNCTION_CREATE_SESSION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_EXPIRE_SESSION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_EXPIRE_SESSION_UNCHECKED} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_KEEP_SESSION_ALIVE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RELEASE_OBJECT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RELEASE_OBJECT_UNCHECKED} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_ALLOCATE_STRING} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_TRUNCATE_STRING} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STRING_LENGTH} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STRING_CHUNK} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STRING_CHUNK} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_ALLOCATE_LIST} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_LIST_LENGTH} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_LIST_ITEM} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_APPEND_TO_LIST} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_REMOVE_FROM_LIST} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_OPEN_FILE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_CREATE_PIPE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_FILE_INFO} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_READ_FILE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_READ_FILE_ASYNC} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_ABORT_ASYNC_FILE_READ} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_WRITE_FILE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_WRITE_FILE_UNCHECKED} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_WRITE_FILE_ASYNC} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_FILE_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_FILE_POSITION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_FILE_EVENTS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_FILE_EVENTS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_ASYNC_FILE_READ} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_ASYNC_FILE_WRITE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_FILE_EVENTS_OCCURRED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_OPEN_DIRECTORY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DIRECTORY_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_NEXT_DIRECTORY_ENTRY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_REWIND_DIRECTORY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_CREATE_DIRECTORY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROCESSES} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SPAWN_PROCESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_KILL_PROCESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROCESS_COMMAND} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROCESS_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROCESS_STDIO} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROCESS_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_PROCESS_STATE_CHANGED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAMS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_DEFINE_PROGRAM} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_PURGE_PROGRAM} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAM_IDENTIFIER} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAM_ROOT_DIRECTORY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PROGRAM_COMMAND} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAM_COMMAND} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PROGRAM_STDIO_REDIRECTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAM_STDIO_REDIRECTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_PROGRAM_SCHEDULE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAM_SCHEDULE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROGRAM_SCHEDULER_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_CONTINUE_PROGRAM_SCHEDULE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_START_PROGRAM} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_PROGRAM_PROCESS_SPAWNED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_ASYNC_FILE_READ} = 'S C C60 C';
	$self->{callback_formats}->{&CALLBACK_ASYNC_FILE_WRITE} = 'S C C';
	$self->{callback_formats}->{&CALLBACK_FILE_EVENTS_OCCURRED} = 'S S';
	$self->{callback_formats}->{&CALLBACK_PROCESS_STATE_CHANGED} = 'S C Q C';
	$self->{callback_formats}->{&CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED} = 'S';
	$self->{callback_formats}->{&CALLBACK_PROGRAM_PROCESS_SPAWNED} = 'S';

	bless($self, $class);

	return $self;
}


=item create_session()



=cut

sub create_session
{
	my ($self, $lifetime) = @_;

	return $self->_send_request(&FUNCTION_CREATE_SESSION, [$lifetime], 'L', 'C S');
}

=item expire_session()



=cut

sub expire_session
{
	my ($self, $session_id) = @_;

	return $self->_send_request(&FUNCTION_EXPIRE_SESSION, [$session_id], 'S', 'C');
}

=item expire_session_unchecked()



=cut

sub expire_session_unchecked
{
	my ($self, $session_id) = @_;

	$self->_send_request(&FUNCTION_EXPIRE_SESSION_UNCHECKED, [$session_id], 'S', '');
}

=item keep_session_alive()



=cut

sub keep_session_alive
{
	my ($self, $session_id, $lifetime) = @_;

	return $self->_send_request(&FUNCTION_KEEP_SESSION_ALIVE, [$session_id, $lifetime], 'S L', 'C');
}

=item release_object()

Decreases the reference count of an object by one and returns the resulting
error code. If the reference count reaches zero the object gets destroyed.

=cut

sub release_object
{
	my ($self, $object_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_RELEASE_OBJECT, [$object_id, $session_id], 'S S', 'C');
}

=item release_object_unchecked()



=cut

sub release_object_unchecked
{
	my ($self, $object_id, $session_id) = @_;

	$self->_send_request(&FUNCTION_RELEASE_OBJECT_UNCHECKED, [$object_id, $session_id], 'S S', '');
}

=item allocate_string()

Allocates a new string object, reserves ``length_to_reserve`` bytes memory
for it and sets up to the first 60 bytes. Set ``length_to_reserve`` to the
length of the string that should be stored in the string object.

Returns the object ID of the new string object and the resulting error code.

=cut

sub allocate_string
{
	my ($self, $length_to_reserve, $buffer, $session_id) = @_;

	return $self->_send_request(&FUNCTION_ALLOCATE_STRING, [$length_to_reserve, $buffer, $session_id], 'L Z58 S', 'C S');
}

=item truncate_string()

Truncates a string object to ``length`` bytes and returns the resulting
error code.

=cut

sub truncate_string
{
	my ($self, $string_id, $length) = @_;

	return $self->_send_request(&FUNCTION_TRUNCATE_STRING, [$string_id, $length], 'S L', 'C');
}

=item get_string_length()

Returns the length of a string object in bytes and the resulting error code.

=cut

sub get_string_length
{
	my ($self, $string_id) = @_;

	return $self->_send_request(&FUNCTION_GET_STRING_LENGTH, [$string_id], 'S', 'C L');
}

=item set_string_chunk()

Sets a chunk of up to 58 bytes in a string object beginning at ``offset``.

Returns the resulting error code.

=cut

sub set_string_chunk
{
	my ($self, $string_id, $offset, $buffer) = @_;

	return $self->_send_request(&FUNCTION_SET_STRING_CHUNK, [$string_id, $offset, $buffer], 'S L Z58', 'C');
}

=item get_string_chunk()

Returns a chunk up to 63 bytes from a string object beginning at ``offset`` and
returns the resulting error code.

=cut

sub get_string_chunk
{
	my ($self, $string_id, $offset) = @_;

	return $self->_send_request(&FUNCTION_GET_STRING_CHUNK, [$string_id, $offset], 'S L', 'C Z63');
}

=item allocate_list()

Allocates a new list object and reserves memory for ``length_to_reserve``
items. Set ``length_to_reserve`` to the number of items that should be stored
in the list object.

Returns the object ID of the new list object and the resulting error code.

When a list object gets destroyed then the reference count of each object in
the list object is decreased by one.

=cut

sub allocate_list
{
	my ($self, $length_to_reserve, $session_id) = @_;

	return $self->_send_request(&FUNCTION_ALLOCATE_LIST, [$length_to_reserve, $session_id], 'S S', 'C S');
}

=item get_list_length()

Returns the length of a list object in items and the resulting error code.

=cut

sub get_list_length
{
	my ($self, $list_id) = @_;

	return $self->_send_request(&FUNCTION_GET_LIST_LENGTH, [$list_id], 'S', 'C S');
}

=item get_list_item()

Returns the object ID and type of the object stored at ``index`` in a list
object and returns the resulting error code.

Possible object types are:

* String = 0
* List = 1
* File = 2
* Directory = 3
* Process = 4
* Program = 5

=cut

sub get_list_item
{
	my ($self, $list_id, $index, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_LIST_ITEM, [$list_id, $index, $session_id], 'S S S', 'C S C');
}

=item append_to_list()

Appends an object to a list object and increases the reference count of the
appended object by one.

Returns the resulting error code.

=cut

sub append_to_list
{
	my ($self, $list_id, $item_object_id) = @_;

	return $self->_send_request(&FUNCTION_APPEND_TO_LIST, [$list_id, $item_object_id], 'S S', 'C');
}

=item remove_from_list()

Removes the object stored at ``index`` from a list object and decreases the
reference count of the removed object by one.

Returns the resulting error code.

=cut

sub remove_from_list
{
	my ($self, $list_id, $index) = @_;

	return $self->_send_request(&FUNCTION_REMOVE_FROM_LIST, [$list_id, $index], 'S S', 'C');
}

=item open_file()

Opens an existing file or creates a new file and allocates a new file object
for it.

FIXME: name has to be absolute

The reference count of the name string object is increased by one. When the
file object gets destroyed then the reference count of the name string object is
decreased by one. Also the name string object is locked and cannot be modified
while the file object holds a reference to it.

The ``flags`` parameter takes a ORed combination of the following possible file
flags (in hexadecimal notation):

* ReadOnly = 0x0001 (O_RDONLY)
* WriteOnly = 0x0002 (O_WRONLY)
* ReadWrite = 0x0004 (O_RDWR)
* Append = 0x0008 (O_APPEND)
* Create = 0x0010 (O_CREAT)
* Exclusive = 0x0020 (O_EXCL)
* NonBlocking = 0x0040 (O_NONBLOCK)
* Truncate = 0x0080 (O_TRUNC)
* Temporary = 0x0100
* Replace = 0x0200

FIXME: explain *Temporary* and *Replace* flag

The ``permissions`` parameter takes a ORed combination of the following
possible file permissions (in octal notation) that match the common UNIX
permission bits:

* UserRead = 00400
* UserWrite = 00200
* UserExecute = 00100
* GroupRead = 00040
* GroupWrite = 00020
* GroupExecute = 00010
* OthersRead = 00004
* OthersWrite = 00002
* OthersExecute = 00001

Returns the object ID of the new file object and the resulting error code.

=cut

sub open_file
{
	my ($self, $name_string_id, $flags, $permissions, $uid, $gid, $session_id) = @_;

	return $self->_send_request(&FUNCTION_OPEN_FILE, [$name_string_id, $flags, $permissions, $uid, $gid, $session_id], 'S L S L L S', 'C S');
}

=item create_pipe()

Creates a new pipe and allocates a new file object for it.

The ``flags`` parameter takes a ORed combination of the following possible
pipe flags (in hexadecimal notation):

* NonBlockingRead = 0x0001
* NonBlockingWrite = 0x0002

The length of the pipe buffer can be specified with the ``length`` parameter
in bytes. If length is set to zero, then the default pipe buffer length is used.

Returns the object ID of the new file object and the resulting error code.

=cut

sub create_pipe
{
	my ($self, $flags, $length, $session_id) = @_;

	return $self->_send_request(&FUNCTION_CREATE_PIPE, [$flags, $length, $session_id], 'L Q S', 'C S');
}

=item get_file_info()

Returns various information about a file and the resulting error code.

Possible file types are:

* Unknown = 0
* Regular = 1
* Directory = 2
* Character = 3
* Block = 4
* FIFO = 5
* Symlink = 6
* Socket = 7
* Pipe = 8

If the file type is *Pipe* then the returned name string object is invalid,
because a pipe has no name. Otherwise the returned name string object was used
to open or create the file object, as passed to :func:`OpenFile`.

The returned flags were used to open or create the file object, as passed to
:func:`OpenFile` or :func:`CreatePipe`. See the respective function for a list
of possible file and pipe flags.

FIXME: everything except flags and length is invalid if file type is *Pipe*

=cut

sub get_file_info
{
	my ($self, $file_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_FILE_INFO, [$file_id, $session_id], 'S S', 'C C S L S L L Q Q Q Q');
}

=item read_file()

Reads up to 62 bytes from a file object.

Returns the bytes read, the actual number of bytes read and the resulting
error code.

If there is not data to be read, either because the file position reached
end-of-file or because there is not data in the pipe, then zero bytes are
returned.

If the file object was created by :func:`OpenFile` without the *NonBlocking*
flag or by :func:`CreatePipe` without the *NonBlockingRead* flag then the
error code *NotSupported* is returned.

=cut

sub read_file
{
	my ($self, $file_id, $length_to_read) = @_;

	return $self->_send_request(&FUNCTION_READ_FILE, [$file_id, $length_to_read], 'S C', 'C C62 C');
}

=item read_file_async()

Reads up to 2\ :sup:`63`\  - 1 bytes from a file object asynchronously.

Reports the bytes read (in 60 byte chunks), the actual number of bytes read and
the resulting error code via the :func:`AsyncFileRead` callback.

If there is not data to be read, either because the file position reached
end-of-file or because there is not data in the pipe, then zero bytes are
reported.

If the file object was created by :func:`OpenFile` without the *NonBlocking*
flag or by :func:`CreatePipe` without the *NonBlockingRead* flag then the error
code *NotSupported* is reported via the :func:`AsyncFileRead` callback.

=cut

sub read_file_async
{
	my ($self, $file_id, $length_to_read) = @_;

	$self->_send_request(&FUNCTION_READ_FILE_ASYNC, [$file_id, $length_to_read], 'S Q', '');
}

=item abort_async_file_read()

Aborts a :func:`ReadFileAsync` operation in progress.

Returns the resulting error code.

On success the :func:`AsyncFileRead` callback will report *OperationAborted*.

=cut

sub abort_async_file_read
{
	my ($self, $file_id) = @_;

	return $self->_send_request(&FUNCTION_ABORT_ASYNC_FILE_READ, [$file_id], 'S', 'C');
}

=item write_file()

Writes up to 61 bytes to a file object.

Returns the actual number of bytes written and the resulting error code.

If the file object was created by :func:`OpenFile` without the *NonBlocking*
flag or by :func:`CreatePipe` without the *NonBlockingWrite* flag then the
error code *NotSupported* is returned.

=cut

sub write_file
{
	my ($self, $file_id, $buffer, $length_to_write) = @_;

	return $self->_send_request(&FUNCTION_WRITE_FILE, [$file_id, $buffer, $length_to_write], 'S C61 C', 'C C');
}

=item write_file_unchecked()

Writes up to 61 bytes to a file object.

Does neither report the actual number of bytes written nor the resulting error
code.

If the file object was created by :func:`OpenFile` without the *NonBlocking*
flag or by :func:`CreatePipe` without the *NonBlockingWrite* flag then the
write operation will fail silently.

=cut

sub write_file_unchecked
{
	my ($self, $file_id, $buffer, $length_to_write) = @_;

	$self->_send_request(&FUNCTION_WRITE_FILE_UNCHECKED, [$file_id, $buffer, $length_to_write], 'S C61 C', '');
}

=item write_file_async()

Writes up to 61 bytes to a file object.

Reports the actual number of bytes written and the resulting error code via the
:func:`AsyncFileWrite` callback.

If the file object was created by :func:`OpenFile` without the *NonBlocking*
flag or by :func:`CreatePipe` without the *NonBlockingWrite* flag then the
error code *NotSupported* is reported via the :func:`AsyncFileWrite` callback.

=cut

sub write_file_async
{
	my ($self, $file_id, $buffer, $length_to_write) = @_;

	$self->_send_request(&FUNCTION_WRITE_FILE_ASYNC, [$file_id, $buffer, $length_to_write], 'S C61 C', '');
}

=item set_file_position()

Set the current seek position of a file object in bytes relative to ``origin``.

Possible file origins are:

* Beginning = 0
* Current = 1
* End = 2

Returns the resulting absolute seek position and error code.

If the file object was created by :func:`CreatePipe` then it has no seek
position and the error code *InvalidSeek* is returned.

=cut

sub set_file_position
{
	my ($self, $file_id, $offset, $origin) = @_;

	return $self->_send_request(&FUNCTION_SET_FILE_POSITION, [$file_id, $offset, $origin], 'S q C', 'C Q');
}

=item get_file_position()

Returns the current seek position of a file object in bytes and returns the
resulting error code.

If the file object was created by :func:`CreatePipe` then it has no seek
position and the error code *InvalidSeek* is returned.

=cut

sub get_file_position
{
	my ($self, $file_id) = @_;

	return $self->_send_request(&FUNCTION_GET_FILE_POSITION, [$file_id], 'S', 'C Q');
}

=item set_file_events()



=cut

sub set_file_events
{
	my ($self, $file_id, $events) = @_;

	return $self->_send_request(&FUNCTION_SET_FILE_EVENTS, [$file_id, $events], 'S S', 'C');
}

=item get_file_events()



=cut

sub get_file_events
{
	my ($self, $file_id) = @_;

	return $self->_send_request(&FUNCTION_GET_FILE_EVENTS, [$file_id], 'S', 'C S');
}

=item open_directory()

Opens an existing directory and allocates a new directory object for it.

FIXME: name has to be absolute

The reference count of the name string object is increased by one. When the
directory object is destroyed then the reference count of the name string
object is decreased by one. Also the name string object is locked and cannot be
modified while the directory object holds a reference to it.

Returns the object ID of the new directory object and the resulting error code.

=cut

sub open_directory
{
	my ($self, $name_string_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_OPEN_DIRECTORY, [$name_string_id, $session_id], 'S S', 'C S');
}

=item get_directory_name()

Returns the name of a directory object, as passed to :func:`OpenDirectory`, and
the resulting error code.

=cut

sub get_directory_name
{
	my ($self, $directory_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_DIRECTORY_NAME, [$directory_id, $session_id], 'S S', 'C S');
}

=item get_next_directory_entry()

Returns the next entry in a directory object and the resulting error code.

If there is not next entry then error code *NoMoreData* is returned. To rewind
a directory object call :func:`RewindDirectory`.

Possible directory entry types are:

* Unknown = 0
* Regular = 1
* Directory = 2
* Character = 3
* Block = 4
* FIFO = 5
* Symlink = 6
* Socket = 7

=cut

sub get_next_directory_entry
{
	my ($self, $directory_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_NEXT_DIRECTORY_ENTRY, [$directory_id, $session_id], 'S S', 'C S C');
}

=item rewind_directory()

Rewinds a directory object and returns the resulting error code.

=cut

sub rewind_directory
{
	my ($self, $directory_id) = @_;

	return $self->_send_request(&FUNCTION_REWIND_DIRECTORY, [$directory_id], 'S', 'C');
}

=item create_directory()

FIXME: name has to be absolute

=cut

sub create_directory
{
	my ($self, $name_string_id, $flags, $permissions, $uid, $gid) = @_;

	return $self->_send_request(&FUNCTION_CREATE_DIRECTORY, [$name_string_id, $flags, $permissions, $uid, $gid], 'S L S L L', 'C');
}

=item get_processes()



=cut

sub get_processes
{
	my ($self, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROCESSES, [$session_id], 'S', 'C S');
}

=item spawn_process()



=cut

sub spawn_process
{
	my ($self, $executable_string_id, $arguments_list_id, $environment_list_id, $working_directory_string_id, $uid, $gid, $stdin_file_id, $stdout_file_id, $stderr_file_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_SPAWN_PROCESS, [$executable_string_id, $arguments_list_id, $environment_list_id, $working_directory_string_id, $uid, $gid, $stdin_file_id, $stdout_file_id, $stderr_file_id, $session_id], 'S S S S L L S S S S', 'C S');
}

=item kill_process()

Sends a UNIX signal to a process object and returns the resulting error code.

Possible UNIX signals are:

* Interrupt = 2
* Quit = 3
* Abort = 6
* Kill = 9
* User1 = 10
* User2 = 12
* Terminate = 15
* Continue =  18
* Stop = 19

=cut

sub kill_process
{
	my ($self, $process_id, $signal) = @_;

	return $self->_send_request(&FUNCTION_KILL_PROCESS, [$process_id, $signal], 'S C', 'C');
}

=item get_process_command()

Returns the executable, arguments, environment and working directory used to
spawn a process object, as passed to :func:`SpawnProcess`, and the resulting
error code.

=cut

sub get_process_command
{
	my ($self, $process_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROCESS_COMMAND, [$process_id, $session_id], 'S S', 'C S S S S');
}

=item get_process_identity()

Returns the process ID and the user and group ID used to spawn a process object,
as passed to :func:`SpawnProcess`, and the resulting error code.

The process ID is only valid if the state is *Running* or *Stopped*, see
:func:`GetProcessState`.

=cut

sub get_process_identity
{
	my ($self, $process_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROCESS_IDENTITY, [$process_id], 'S', 'C L L L');
}

=item get_process_stdio()

Returns the stdin, stdout and stderr files used to spawn a process object, as
passed to :func:`SpawnProcess`, and the resulting error code.

=cut

sub get_process_stdio
{
	my ($self, $process_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROCESS_STDIO, [$process_id, $session_id], 'S S', 'C S S S');
}

=item get_process_state()

Returns the current state, timestamp and exit code of a process object, and
the resulting error code.

Possible process states are:

* Unknown = 0
* Running = 1
* Error = 2
* Exited = 3
* Killed = 4
* Stopped = 5

The timestamp represents the UNIX time since when the process is in its current
state.

The exit code is only valid if the state is *Error*, *Exited*, *Killed* or
*Stopped* and has different meanings depending on the state:

* Error: error code for error occurred while spawning the process (see below)
* Exited: exit status of the process
* Killed: UNIX signal number used to kill the process
* Stopped: UNIX signal number used to stop the process

Possible exit/error codes in *Error* state are:

* InternalError = 125
* CannotExecute = 126
* DoesNotExist = 127

The *CannotExecute* error can be caused by the executable being opened for
writing.

=cut

sub get_process_state
{
	my ($self, $process_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROCESS_STATE, [$process_id], 'S', 'C C Q C');
}

=item get_programs()



=cut

sub get_programs
{
	my ($self, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAMS, [$session_id], 'S', 'C S');
}

=item define_program()



=cut

sub define_program
{
	my ($self, $identifier_string_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_DEFINE_PROGRAM, [$identifier_string_id, $session_id], 'S S', 'C S');
}

=item purge_program()



=cut

sub purge_program
{
	my ($self, $program_id, $cookie) = @_;

	return $self->_send_request(&FUNCTION_PURGE_PROGRAM, [$program_id, $cookie], 'S L', 'C');
}

=item get_program_identifier()



=cut

sub get_program_identifier
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAM_IDENTIFIER, [$program_id, $session_id], 'S S', 'C S');
}

=item get_program_root_directory()

FIXME: root directory is absolute: <home>/programs/<identifier>

=cut

sub get_program_root_directory
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAM_ROOT_DIRECTORY, [$program_id, $session_id], 'S S', 'C S');
}

=item set_program_command()

FIXME: working directory is relative to <home>/programs/<identifier>/bin

=cut

sub set_program_command
{
	my ($self, $program_id, $executable_string_id, $arguments_list_id, $environment_list_id, $working_directory_string_id) = @_;

	return $self->_send_request(&FUNCTION_SET_PROGRAM_COMMAND, [$program_id, $executable_string_id, $arguments_list_id, $environment_list_id, $working_directory_string_id], 'S S S S S', 'C');
}

=item get_program_command()

FIXME: working directory is relative to <home>/programs/<identifier>/bin

=cut

sub get_program_command
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAM_COMMAND, [$program_id, $session_id], 'S S', 'C S S S S');
}

=item set_program_stdio_redirection()

FIXME: stdio file names are relative to <home>/programs/<identifier>/bin

=cut

sub set_program_stdio_redirection
{
	my ($self, $program_id, $stdin_redirection, $stdin_file_name_string_id, $stdout_redirection, $stdout_file_name_string_id, $stderr_redirection, $stderr_file_name_string_id) = @_;

	return $self->_send_request(&FUNCTION_SET_PROGRAM_STDIO_REDIRECTION, [$program_id, $stdin_redirection, $stdin_file_name_string_id, $stdout_redirection, $stdout_file_name_string_id, $stderr_redirection, $stderr_file_name_string_id], 'S C S C S C S', 'C');
}

=item get_program_stdio_redirection()

FIXME: stdio file names are relative to <home>/programs/<identifier>/bin

=cut

sub get_program_stdio_redirection
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAM_STDIO_REDIRECTION, [$program_id, $session_id], 'S S', 'C C S C S C S');
}

=item set_program_schedule()



=cut

sub set_program_schedule
{
	my ($self, $program_id, $start_mode, $continue_after_error, $start_interval, $start_fields_string_id) = @_;

	return $self->_send_request(&FUNCTION_SET_PROGRAM_SCHEDULE, [$program_id, $start_mode, $continue_after_error, $start_interval, $start_fields_string_id], 'S C C L S', 'C');
}

=item get_program_schedule()



=cut

sub get_program_schedule
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAM_SCHEDULE, [$program_id, $session_id], 'S S', 'C C C L S');
}

=item get_program_scheduler_state()

FIXME: message is currently vaild in error-occurred state only

=cut

sub get_program_scheduler_state
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_PROGRAM_SCHEDULER_STATE, [$program_id, $session_id], 'S S', 'C C Q S');
}

=item continue_program_schedule()



=cut

sub continue_program_schedule
{
	my ($self, $program_id) = @_;

	return $self->_send_request(&FUNCTION_CONTINUE_PROGRAM_SCHEDULE, [$program_id], 'S', 'C');
}

=item start_program()



=cut

sub start_program
{
	my ($self, $program_id) = @_;

	return $self->_send_request(&FUNCTION_START_PROGRAM, [$program_id], 'S', 'C');
}

=item get_last_spawned_program_process()



=cut

sub get_last_spawned_program_process
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS, [$program_id, $session_id], 'S S', 'C S Q');
}

=item get_custom_program_option_names()



=cut

sub get_custom_program_option_names
{
	my ($self, $program_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES, [$program_id, $session_id], 'S S', 'C S');
}

=item set_custom_program_option_value()



=cut

sub set_custom_program_option_value
{
	my ($self, $program_id, $name_string_id, $value_string_id) = @_;

	return $self->_send_request(&FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE, [$program_id, $name_string_id, $value_string_id], 'S S S', 'C');
}

=item get_custom_program_option_value()



=cut

sub get_custom_program_option_value
{
	my ($self, $program_id, $name_string_id, $session_id) = @_;

	return $self->_send_request(&FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE, [$program_id, $name_string_id, $session_id], 'S S S', 'C S');
}

=item remove_custom_program_option()



=cut

sub remove_custom_program_option
{
	my ($self, $program_id, $name_string_id) = @_;

	return $self->_send_request(&FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION, [$program_id, $name_string_id], 'S S', 'C');
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
