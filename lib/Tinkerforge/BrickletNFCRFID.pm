
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

Tinkerforge::BrickletNFCRFID - Device that can read and write NFC and RFID tags

=cut

package Tinkerforge::BrickletNFCRFID;

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

This constant is used to identify a NFC/RFID Bricklet.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 246;

=item CALLBACK_STATE_CHANGED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STATE_CHANGED callback.

=cut

use constant CALLBACK_STATE_CHANGED => 8;

=item FUNCTION_REQUEST_TAG_ID

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_REQUEST_TAG_ID => 1;

=item FUNCTION_GET_TAG_ID

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_TAG_ID => 2;

=item FUNCTION_GET_STATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STATE => 3;

=item FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE => 4;

=item FUNCTION_WRITE_PAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_WRITE_PAGE => 5;

=item FUNCTION_REQUEST_PAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_REQUEST_PAGE => 6;

=item FUNCTION_GET_PAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_PAGE => 7;

=item FUNCTION_GET_IDENTITY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_IDENTITY => 255;
use constant TAG_TYPE_MIFARE_CLASSIC => 0;
use constant TAG_TYPE_TYPE1 => 1;
use constant TAG_TYPE_TYPE2 => 2;
use constant STATE_INITIALIZATION => 0;
use constant STATE_IDLE => 128;
use constant STATE_ERROR => 192;
use constant STATE_REQUEST_TAG_ID => 2;
use constant STATE_REQUEST_TAG_ID_READY => 130;
use constant STATE_REQUEST_TAG_ID_ERROR => 194;
use constant STATE_AUTHENTICATING_MIFARE_CLASSIC_PAGE => 3;
use constant STATE_AUTHENTICATING_MIFARE_CLASSIC_PAGE_READY => 131;
use constant STATE_AUTHENTICATING_MIFARE_CLASSIC_PAGE_ERROR => 195;
use constant STATE_WRITE_PAGE => 4;
use constant STATE_WRITE_PAGE_READY => 132;
use constant STATE_WRITE_PAGE_ERROR => 196;
use constant STATE_REQUEST_PAGE => 5;
use constant STATE_REQUEST_PAGE_READY => 133;
use constant STATE_REQUEST_PAGE_ERROR => 197;
use constant KEY_A => 0;
use constant KEY_B => 1;


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

	$self->{response_expected}->{&FUNCTION_REQUEST_TAG_ID} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_TAG_ID} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_WRITE_PAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_REQUEST_PAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_PAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_STATE_CHANGED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_STATE_CHANGED} = 'C C';

	bless($self, $class);

	return $self;
}


=item request_tag_id()

To read or write a tag that is in proximity of the NFC/RFID Bricklet you 
first have to call this function with the expected tag type as parameter.
It is no problem if you don't know the tag type. You can cycle through 
the available tag types until the tag gives an answer to the request.

Current the following tag types are supported:

* Mifare Classic
* NFC Forum Type 1
* NFC Forum Type 2

After you call :func:`RequestTagID` the NFC/RFID Bricklet will try to read 
the tag ID from the tag. After this process is done the state will change.
You can either register the :func:`StateChanged` callback or you can poll
:func:`GetState` to find out about the state change.

If the state changes to *RequestTagIDError* it means that either there was 
no tag present or that the tag is of an incompatible type. If the state 
changes to *RequestTagIDReady* it means that a compatible tag was found 
and that the tag ID could be read out. You can now get the tag ID by
calling :func:`GetTagID`.

If two tags are in the proximity of the NFC/RFID Bricklet, this
function will cycle through the tags. To select a specific tag you have
to call :func:`RequestTagID` until the correct tag id is found.

In case of any *Error* state the selection is lost and you have to
start again by calling :func:`RequestTagID`.

=cut

sub request_tag_id
{
	my ($self, $tag_type) = @_;

	$self->_send_request(&FUNCTION_REQUEST_TAG_ID, [$tag_type], 'C', '');
}

=item get_tag_id()

Returns the tag type, tag ID and the length of the tag ID 
(4 or 7 bytes are possible length). This function can only be called if the
NFC/RFID is currently in one of the *Ready* states. The returned ID
is the ID that was saved through the last call of :func:`RequestTagID`.

To get the tag ID of a tag the approach is as follows:

* Call :func:`RequestTagID`
* Wait for state to change to *RequestTagIDReady* (see :func:`GetState` or :func:`StateChanged`)
* Call :func:`GetTagID`

=cut

sub get_tag_id
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_TAG_ID, [], '', 'C C C7');
}

=item get_state()

Returns the current state of the NFC/RFID Bricklet.

On startup the Bricklet will be in the *Initialization* state. The initialization
will only take about 20ms. After that it changes to *Idle*.

The functions of this Bricklet can be called in the *Idle* state and all of
the *Ready* and *Error* states.

Example: If you call :func:`RequestPage`, the state will change to 
*RequestPage* until the reading of the page is finished. Then it will change
to either *RequestPageReady* if it worked or to *RequestPageError* if it
didn't. If the request worked you can get the page by calling :func:`GetPage`.

The same approach is used analogously for the other API functions.

=cut

sub get_state
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STATE, [], '', 'C C');
}

=item authenticate_mifare_classic_page()

Mifare Classic tags use authentication. If you want to read from or write to
a Mifare Classic page you have to authenticate it beforehand.
Each page can be authenticated with two keys (A and B). A new Mifare Classic
tag that has not yet been written to can can be accessed with key number A
and the default key *[0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]*.

The approach to read or write a Mifare Classic page is as follows:

* Call :func:`RequestTagID`
* Wait for state to change to *RequestTagIDReady* (see :func:`GetState` or :func:`StateChanged`)
* Call :func:`GetTagID` and check if tag ID is correct
* Call :func:`AuthenticateMifareClassicPage` with page and key for the page
* Wait for state to change to *AuthenticatingMifareClassicPageReady*
* Call :func:`RequestPage` or :func`WritePage` to read/write page

=cut

sub authenticate_mifare_classic_page
{
	my ($self, $page, $key_number, $key) = @_;

	$self->_send_request(&FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE, [$page, $key_number, $key], 'S C C6', '');
}

=item write_page()

Writes 16 bytes starting from the given page. How many pages are written
depends on the tag type. The page sizes are as follows:

* Mifare Classic page size: 16 byte (1 page is written)
* NFC Forum Type 1 page size: 8 byte (2 pages are written)
* NFC Forum Type 2 page size: 4 byte (4 pages are written)

The general approach for writing to a tag is as follows:

* Call :func:`RequestTagID`
* Wait for state to change to *RequestTagIDReady* (see :func:`GetState` or :func:`StateChanged`)
* Call :func:`GetTagID` and check if tag ID is correct
* Call :func:`WritePage` with page number and data
* Wait for state to change to *WritePageReady*

If you use a Mifare Classic tag you have to authenticate a page before you
can write to it. See :func:`AuthenticateMifareClassicPage`.

=cut

sub write_page
{
	my ($self, $page, $data) = @_;

	$self->_send_request(&FUNCTION_WRITE_PAGE, [$page, $data], 'S C16', '');
}

=item request_page()

Reads 16 bytes starting from the given page and stores them into a buffer. 
The buffer can then be read out with :func:`GetPage`.
How many pages are read depends on the tag type. The page sizes are 
as follows:

* Mifare Classic page size: 16 byte (one page is read)
* NFC Forum Type 1 page size: 8 byte (two pages are read)
* NFC Forum Type 2 page size: 4 byte (four pages are read)

The general approach for reading a tag is as follows:

* Call :func:`RequestTagID`
* Wait for state to change to *RequestTagIDReady* (see :func:`GetState` or :func:`StateChanged`)
* Call :func:`GetTagID` and check if tag ID is correct
* Call :func:`RequestPage` with page number
* Wait for state to change to *RequestPageReady*
* Call :func:`GetPage` to retrieve the page from the buffer

If you use a Mifare Classic tag you have to authenticate a page before you
can read it. See :func:`AuthenticateMifareClassicPage`.

=cut

sub request_page
{
	my ($self, $page) = @_;

	$self->_send_request(&FUNCTION_REQUEST_PAGE, [$page], 'S', '');
}

=item get_page()

Returns 16 bytes of data from an internal buffer. To fill the buffer
with specific pages you have to call :func:`RequestPage` beforehand.

=cut

sub get_page
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_PAGE, [], '', 'C16');
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
