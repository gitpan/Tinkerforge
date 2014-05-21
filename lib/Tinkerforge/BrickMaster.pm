
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

Tinkerforge::BrickMaster - Device for controlling Stacks and four Bricklets

=cut

package Tinkerforge::BrickMaster;

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

This constant is used to identify a Master Brick.

The get_identity() subroutine and the CALLBACK_ENUMERATE callback of the
IP Connection have a device_identifier parameter to specify the Brick's or
Bricklet's type.

=cut

use constant DEVICE_IDENTIFIER => 13;

=item CALLBACK_STACK_CURRENT

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STACK_CURRENT callback.

=cut

use constant CALLBACK_STACK_CURRENT => 59;

=item CALLBACK_STACK_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STACK_VOLTAGE callback.

=cut

use constant CALLBACK_STACK_VOLTAGE => 60;

=item CALLBACK_USB_VOLTAGE

This constant is used with the register_callback() subroutine to specify
the CALLBACK_USB_VOLTAGE callback.

=cut

use constant CALLBACK_USB_VOLTAGE => 61;

=item CALLBACK_STACK_CURRENT_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STACK_CURRENT_REACHED callback.

=cut

use constant CALLBACK_STACK_CURRENT_REACHED => 62;

=item CALLBACK_STACK_VOLTAGE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_STACK_VOLTAGE_REACHED callback.

=cut

use constant CALLBACK_STACK_VOLTAGE_REACHED => 63;

=item CALLBACK_USB_VOLTAGE_REACHED

This constant is used with the register_callback() subroutine to specify
the CALLBACK_USB_VOLTAGE_REACHED callback.

=cut

use constant CALLBACK_USB_VOLTAGE_REACHED => 64;

=item FUNCTION_GET_STACK_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_VOLTAGE => 1;

=item FUNCTION_GET_STACK_CURRENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_CURRENT => 2;

=item FUNCTION_SET_EXTENSION_TYPE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_EXTENSION_TYPE => 3;

=item FUNCTION_GET_EXTENSION_TYPE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_EXTENSION_TYPE => 4;

=item FUNCTION_IS_CHIBI_PRESENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_CHIBI_PRESENT => 5;

=item FUNCTION_SET_CHIBI_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CHIBI_ADDRESS => 6;

=item FUNCTION_GET_CHIBI_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_ADDRESS => 7;

=item FUNCTION_SET_CHIBI_MASTER_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CHIBI_MASTER_ADDRESS => 8;

=item FUNCTION_GET_CHIBI_MASTER_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_MASTER_ADDRESS => 9;

=item FUNCTION_SET_CHIBI_SLAVE_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CHIBI_SLAVE_ADDRESS => 10;

=item FUNCTION_GET_CHIBI_SLAVE_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_SLAVE_ADDRESS => 11;

=item FUNCTION_GET_CHIBI_SIGNAL_STRENGTH

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_SIGNAL_STRENGTH => 12;

=item FUNCTION_GET_CHIBI_ERROR_LOG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_ERROR_LOG => 13;

=item FUNCTION_SET_CHIBI_FREQUENCY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CHIBI_FREQUENCY => 14;

=item FUNCTION_GET_CHIBI_FREQUENCY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_FREQUENCY => 15;

=item FUNCTION_SET_CHIBI_CHANNEL

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_CHIBI_CHANNEL => 16;

=item FUNCTION_GET_CHIBI_CHANNEL

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_CHIBI_CHANNEL => 17;

=item FUNCTION_IS_RS485_PRESENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_RS485_PRESENT => 18;

=item FUNCTION_SET_RS485_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_RS485_ADDRESS => 19;

=item FUNCTION_GET_RS485_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RS485_ADDRESS => 20;

=item FUNCTION_SET_RS485_SLAVE_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_RS485_SLAVE_ADDRESS => 21;

=item FUNCTION_GET_RS485_SLAVE_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RS485_SLAVE_ADDRESS => 22;

=item FUNCTION_GET_RS485_ERROR_LOG

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RS485_ERROR_LOG => 23;

=item FUNCTION_SET_RS485_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_RS485_CONFIGURATION => 24;

=item FUNCTION_GET_RS485_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_RS485_CONFIGURATION => 25;

=item FUNCTION_IS_WIFI_PRESENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_WIFI_PRESENT => 26;

=item FUNCTION_SET_WIFI_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_CONFIGURATION => 27;

=item FUNCTION_GET_WIFI_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_CONFIGURATION => 28;

=item FUNCTION_SET_WIFI_ENCRYPTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_ENCRYPTION => 29;

=item FUNCTION_GET_WIFI_ENCRYPTION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_ENCRYPTION => 30;

=item FUNCTION_GET_WIFI_STATUS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_STATUS => 31;

=item FUNCTION_REFRESH_WIFI_STATUS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_REFRESH_WIFI_STATUS => 32;

=item FUNCTION_SET_WIFI_CERTIFICATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_CERTIFICATE => 33;

=item FUNCTION_GET_WIFI_CERTIFICATE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_CERTIFICATE => 34;

=item FUNCTION_SET_WIFI_POWER_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_POWER_MODE => 35;

=item FUNCTION_GET_WIFI_POWER_MODE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_POWER_MODE => 36;

=item FUNCTION_GET_WIFI_BUFFER_INFO

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_BUFFER_INFO => 37;

=item FUNCTION_SET_WIFI_REGULATORY_DOMAIN

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_REGULATORY_DOMAIN => 38;

=item FUNCTION_GET_WIFI_REGULATORY_DOMAIN

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_REGULATORY_DOMAIN => 39;

=item FUNCTION_GET_USB_VOLTAGE

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_USB_VOLTAGE => 40;

=item FUNCTION_SET_LONG_WIFI_KEY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_LONG_WIFI_KEY => 41;

=item FUNCTION_GET_LONG_WIFI_KEY

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_LONG_WIFI_KEY => 42;

=item FUNCTION_SET_WIFI_HOSTNAME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_HOSTNAME => 43;

=item FUNCTION_GET_WIFI_HOSTNAME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_HOSTNAME => 44;

=item FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD => 45;

=item FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD => 46;

=item FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD => 47;

=item FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD => 48;

=item FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD => 49;

=item FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD => 50;

=item FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD => 51;

=item FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD => 52;

=item FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD => 53;

=item FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD => 54;

=item FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD => 55;

=item FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD => 56;

=item FUNCTION_SET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_DEBOUNCE_PERIOD => 57;

=item FUNCTION_GET_DEBOUNCE_PERIOD

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_DEBOUNCE_PERIOD => 58;

=item FUNCTION_IS_ETHERNET_PRESENT

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_IS_ETHERNET_PRESENT => 65;

=item FUNCTION_SET_ETHERNET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ETHERNET_CONFIGURATION => 66;

=item FUNCTION_GET_ETHERNET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ETHERNET_CONFIGURATION => 67;

=item FUNCTION_GET_ETHERNET_STATUS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ETHERNET_STATUS => 68;

=item FUNCTION_SET_ETHERNET_HOSTNAME

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ETHERNET_HOSTNAME => 69;

=item FUNCTION_SET_ETHERNET_MAC_ADDRESS

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ETHERNET_MAC_ADDRESS => 70;

=item FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION => 71;

=item FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION => 72;

=item FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET => 73;

=item FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET => 74;

=item FUNCTION_SET_WIFI_AUTHENTICATION_SECRET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_SET_WIFI_AUTHENTICATION_SECRET => 75;

=item FUNCTION_GET_WIFI_AUTHENTICATION_SECRET

This constant is used with the get_response_expected(), set_response_expected()
and set_response_expected_all() subroutines.

=cut

use constant FUNCTION_GET_WIFI_AUTHENTICATION_SECRET => 76;

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
use constant EXTENSION_TYPE_CHIBI => 1;
use constant EXTENSION_TYPE_RS485 => 2;
use constant EXTENSION_TYPE_WIFI => 3;
use constant EXTENSION_TYPE_ETHERNET => 4;
use constant CHIBI_FREQUENCY_OQPSK_868_MHZ => 0;
use constant CHIBI_FREQUENCY_OQPSK_915_MHZ => 1;
use constant CHIBI_FREQUENCY_OQPSK_780_MHZ => 2;
use constant CHIBI_FREQUENCY_BPSK40_915_MHZ => 3;
use constant RS485_PARITY_NONE => 'n';
use constant RS485_PARITY_EVEN => 'e';
use constant RS485_PARITY_ODD => 'o';
use constant WIFI_CONNECTION_DHCP => 0;
use constant WIFI_CONNECTION_STATIC_IP => 1;
use constant WIFI_CONNECTION_ACCESS_POINT_DHCP => 2;
use constant WIFI_CONNECTION_ACCESS_POINT_STATIC_IP => 3;
use constant WIFI_CONNECTION_AD_HOC_DHCP => 4;
use constant WIFI_CONNECTION_AD_HOC_STATIC_IP => 5;
use constant WIFI_ENCRYPTION_WPA_WPA2 => 0;
use constant WIFI_ENCRYPTION_WPA_ENTERPRISE => 1;
use constant WIFI_ENCRYPTION_WEP => 2;
use constant WIFI_ENCRYPTION_NO_ENCRYPTION => 3;
use constant WIFI_EAP_OPTION_OUTER_AUTH_EAP_FAST => 0;
use constant WIFI_EAP_OPTION_OUTER_AUTH_EAP_TLS => 1;
use constant WIFI_EAP_OPTION_OUTER_AUTH_EAP_TTLS => 2;
use constant WIFI_EAP_OPTION_OUTER_AUTH_EAP_PEAP => 3;
use constant WIFI_EAP_OPTION_INNER_AUTH_EAP_MSCHAP => 0;
use constant WIFI_EAP_OPTION_INNER_AUTH_EAP_GTC => 4;
use constant WIFI_EAP_OPTION_CERT_TYPE_CA_CERT => 0;
use constant WIFI_EAP_OPTION_CERT_TYPE_CLIENT_CERT => 8;
use constant WIFI_EAP_OPTION_CERT_TYPE_PRIVATE_KEY => 16;
use constant WIFI_STATE_DISASSOCIATED => 0;
use constant WIFI_STATE_ASSOCIATED => 1;
use constant WIFI_STATE_ASSOCIATING => 2;
use constant WIFI_STATE_ERROR => 3;
use constant WIFI_STATE_NOT_INITIALIZED_YET => 255;
use constant WIFI_POWER_MODE_FULL_SPEED => 0;
use constant WIFI_POWER_MODE_LOW_POWER => 1;
use constant WIFI_DOMAIN_CHANNEL_1TO11 => 0;
use constant WIFI_DOMAIN_CHANNEL_1TO13 => 1;
use constant WIFI_DOMAIN_CHANNEL_1TO14 => 2;
use constant THRESHOLD_OPTION_OFF => 'x';
use constant THRESHOLD_OPTION_OUTSIDE => 'o';
use constant THRESHOLD_OPTION_INSIDE => 'i';
use constant THRESHOLD_OPTION_SMALLER => '<';
use constant THRESHOLD_OPTION_GREATER => '>';
use constant ETHERNET_CONNECTION_DHCP => 0;
use constant ETHERNET_CONNECTION_STATIC_IP => 1;


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

	my $self = Tinkerforge::Device->_new($uid, $ipcon, [2, 0, 3]);

	$self->{response_expected}->{&FUNCTION_GET_STACK_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_EXTENSION_TYPE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_EXTENSION_TYPE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_CHIBI_PRESENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CHIBI_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CHIBI_MASTER_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_MASTER_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CHIBI_SLAVE_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_SLAVE_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_SIGNAL_STRENGTH} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_ERROR_LOG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CHIBI_FREQUENCY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_FREQUENCY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_CHIBI_CHANNEL} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_CHIBI_CHANNEL} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_RS485_PRESENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_RS485_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_RS485_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_RS485_SLAVE_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_RS485_SLAVE_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_RS485_ERROR_LOG} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_RS485_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_RS485_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_IS_WIFI_PRESENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_ENCRYPTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_ENCRYPTION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_STATUS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_REFRESH_WIFI_STATUS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_CERTIFICATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_CERTIFICATE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_POWER_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_POWER_MODE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_BUFFER_INFO} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_REGULATORY_DOMAIN} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_REGULATORY_DOMAIN} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_USB_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_LONG_WIFI_KEY} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_LONG_WIFI_KEY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_HOSTNAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_HOSTNAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_DEBOUNCE_PERIOD} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&CALLBACK_STACK_CURRENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_STACK_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_USB_VOLTAGE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_STACK_CURRENT_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_STACK_VOLTAGE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&CALLBACK_USB_VOLTAGE_REACHED} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_FALSE;
	$self->{response_expected}->{&FUNCTION_IS_ETHERNET_PRESENT} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ETHERNET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ETHERNET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_ETHERNET_STATUS} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ETHERNET_HOSTNAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_ETHERNET_MAC_ADDRESS} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_SET_WIFI_AUTHENTICATION_SECRET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_WIFI_AUTHENTICATION_SECRET} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_PROTOCOL1_BRICKLET_NAME} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_GET_CHIP_TEMPERATURE} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;
	$self->{response_expected}->{&FUNCTION_RESET} = Tinkerforge::Device->_RESPONSE_EXPECTED_FALSE;
	$self->{response_expected}->{&FUNCTION_GET_IDENTITY} = Tinkerforge::Device->_RESPONSE_EXPECTED_ALWAYS_TRUE;

	$self->{callback_formats}->{&CALLBACK_STACK_CURRENT} = 'S';
	$self->{callback_formats}->{&CALLBACK_STACK_VOLTAGE} = 'S';
	$self->{callback_formats}->{&CALLBACK_USB_VOLTAGE} = 'S';
	$self->{callback_formats}->{&CALLBACK_STACK_CURRENT_REACHED} = 'S';
	$self->{callback_formats}->{&CALLBACK_STACK_VOLTAGE_REACHED} = 'S';
	$self->{callback_formats}->{&CALLBACK_USB_VOLTAGE_REACHED} = 'S';

	bless($self, $class);

	return $self;
}


=item get_stack_voltage()

Returns the stack voltage in mV. The stack voltage is the
voltage that is supplied via the stack, i.e. it is given by a 
Step-Down or Step-Up Power Supply.

=cut

sub get_stack_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_VOLTAGE, [], '', 'S');
}

=item get_stack_current()

Returns the stack current in mA. The stack current is the
current that is drawn via the stack, i.e. it is given by a
Step-Down or Step-Up Power Supply.

=cut

sub get_stack_current
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_CURRENT, [], '', 'S');
}

=item set_extension_type()

Writes the extension type to the EEPROM of a specified extension. 
The extension is either 0 or 1 (0 is the on the bottom, 1 is the on on top, 
if only one extension is present use 0).

Possible extension types:

.. csv-table::
 :header: "Type", "Description"
 :widths: 10, 100

 "1",    "Chibi"
 "2",    "RS485"
 "3",    "WIFI"
 "4",    "Ethernet"

The extension type is already set when bought and it can be set with the 
Brick Viewer, it is unlikely that you need this function.

=cut

sub set_extension_type
{
	my ($self, $extension, $exttype) = @_;

	$self->_send_request(&FUNCTION_SET_EXTENSION_TYPE, [$extension, $exttype], 'C L', '');
}

=item get_extension_type()

Returns the type for a given extension as set by :func:`SetExtensionType`.

=cut

sub get_extension_type
{
	my ($self, $extension) = @_;

	return $self->_send_request(&FUNCTION_GET_EXTENSION_TYPE, [$extension], 'C', 'L');
}

=item is_chibi_present()

Returns *true* if a Chibi Extension is available to be used by the Master Brick.

=cut

sub is_chibi_present
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_CHIBI_PRESENT, [], '', 'C');
}

=item set_chibi_address()

Sets the address (1-255) belonging to the Chibi Extension.

It is possible to set the address with the Brick Viewer and it will be 
saved in the EEPROM of the Chibi Extension, it does not
have to be set on every startup.

=cut

sub set_chibi_address
{
	my ($self, $address) = @_;

	$self->_send_request(&FUNCTION_SET_CHIBI_ADDRESS, [$address], 'C', '');
}

=item get_chibi_address()

Returns the address as set by :func:`SetChibiAddress`.

=cut

sub get_chibi_address
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_ADDRESS, [], '', 'C');
}

=item set_chibi_master_address()

Sets the address (1-255) of the Chibi Master. This address is used if the
Chibi Extension is used as slave (i.e. it does not have a USB connection).

It is possible to set the address with the Brick Viewer and it will be 
saved in the EEPROM of the Chibi Extension, it does not
have to be set on every startup.

=cut

sub set_chibi_master_address
{
	my ($self, $address) = @_;

	$self->_send_request(&FUNCTION_SET_CHIBI_MASTER_ADDRESS, [$address], 'C', '');
}

=item get_chibi_master_address()

Returns the address as set by :func:`SetChibiMasterAddress`.

=cut

sub get_chibi_master_address
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_MASTER_ADDRESS, [], '', 'C');
}

=item set_chibi_slave_address()

Sets up to 254 slave addresses. Valid addresses are in range 1-255. 0 has a
special meaning, it is used as list terminator and not allowed as normal slave
address. The address numeration (via num parameter) has to be used
ascending from 0. For example: If you use the Chibi Extension in Master mode
(i.e. the stack has an USB connection) and you want to talk to three other
Chibi stacks with the slave addresses 17, 23, and 42, you should call with
``(0, 17)``, ``(1, 23)``, ``(2, 42)`` and ``(3, 0)``. The last call with
``(3, 0)`` is a list terminator and indicates that the Chibi slave address
list contains 3 addresses in this case.

It is possible to set the addresses with the Brick Viewer, that will take care
of correct address numeration and list termination.

The slave addresses will be saved in the EEPROM of the Chibi Extension, they
don't have to be set on every startup.

=cut

sub set_chibi_slave_address
{
	my ($self, $num, $address) = @_;

	$self->_send_request(&FUNCTION_SET_CHIBI_SLAVE_ADDRESS, [$num, $address], 'C C', '');
}

=item get_chibi_slave_address()

Returns the slave address for a given num as set by
:func:`SetChibiSlaveAddress`.

=cut

sub get_chibi_slave_address
{
	my ($self, $num) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_SLAVE_ADDRESS, [$num], 'C', 'C');
}

=item get_chibi_signal_strength()

Returns the signal strength in dBm. The signal strength updates every time a
packet is received.

=cut

sub get_chibi_signal_strength
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_SIGNAL_STRENGTH, [], '', 'C');
}

=item get_chibi_error_log()

Returns underrun, CRC error, no ACK and overflow error counts of the Chibi
communication. If these errors start rising, it is likely that either the
distance between two Chibi stacks is becoming too big or there are
interferences.

=cut

sub get_chibi_error_log
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_ERROR_LOG, [], '', 'S S S S');
}

=item set_chibi_frequency()

Sets the Chibi frequency range for the Chibi Extension. Possible values are:

.. csv-table::
 :header: "Type", "Description"
 :widths: 10, 100

 "0",    "OQPSK 868MHz (Europe)"
 "1",    "OQPSK 915MHz (US)"
 "2",    "OQPSK 780MHz (China)"
 "3",    "BPSK40 915MHz"

It is possible to set the frequency with the Brick Viewer and it will be 
saved in the EEPROM of the Chibi Extension, it does not
have to be set on every startup.

=cut

sub set_chibi_frequency
{
	my ($self, $frequency) = @_;

	$self->_send_request(&FUNCTION_SET_CHIBI_FREQUENCY, [$frequency], 'C', '');
}

=item get_chibi_frequency()

Returns the frequency value as set by :func:`SetChibiFrequency`.

=cut

sub get_chibi_frequency
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_FREQUENCY, [], '', 'C');
}

=item set_chibi_channel()

Sets the channel used by the Chibi Extension. Possible channels are
different for different frequencies:

.. csv-table::
 :header: "Frequency",             "Possible Channels"
 :widths: 40, 60

 "OQPSK 868MHz (Europe)", "0"
 "OQPSK 915MHz (US)",     "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
 "OQPSK 780MHz (China)",  "0, 1, 2, 3"
 "BPSK40 915MHz",         "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"

It is possible to set the channel with the Brick Viewer and it will be 
saved in the EEPROM of the Chibi Extension, it does not
have to be set on every startup.

=cut

sub set_chibi_channel
{
	my ($self, $channel) = @_;

	$self->_send_request(&FUNCTION_SET_CHIBI_CHANNEL, [$channel], 'C', '');
}

=item get_chibi_channel()

Returns the channel as set by :func:`SetChibiChannel`.

=cut

sub get_chibi_channel
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_CHIBI_CHANNEL, [], '', 'C');
}

=item is_rs485_present()

Returns *true* if a RS485 Extension is available to be used by the Master Brick.

=cut

sub is_rs485_present
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_RS485_PRESENT, [], '', 'C');
}

=item set_rs485_address()

Sets the address (0-255) belonging to the RS485 Extension.

Set to 0 if the RS485 Extension should be the RS485 Master (i.e.
connected to a PC via USB).

It is possible to set the address with the Brick Viewer and it will be 
saved in the EEPROM of the RS485 Extension, it does not
have to be set on every startup.

=cut

sub set_rs485_address
{
	my ($self, $address) = @_;

	$self->_send_request(&FUNCTION_SET_RS485_ADDRESS, [$address], 'C', '');
}

=item get_rs485_address()

Returns the address as set by :func:`SetRS485Address`.

=cut

sub get_rs485_address
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_RS485_ADDRESS, [], '', 'C');
}

=item set_rs485_slave_address()

Sets up to 255 slave addresses. Valid addresses are in range 1-255. 0 has a
special meaning, it is used as list terminator and not allowed as normal slave
address. The address numeration (via ``num`` parameter) has to be used
ascending from 0. For example: If you use the RS485 Extension in Master mode
(i.e. the stack has an USB connection) and you want to talk to three other
RS485 stacks with the addresses 17, 23, and 42, you should call with
``(0, 17)``, ``(1, 23)``, ``(2, 42)`` and ``(3, 0)``. The last call with
``(3, 0)`` is a list terminator and indicates that the RS485 slave address list
contains 3 addresses in this case.

It is possible to set the addresses with the Brick Viewer, that will take care
of correct address numeration and list termination.

The slave addresses will be saved in the EEPROM of the Chibi Extension, they
don't have to be set on every startup.

=cut

sub set_rs485_slave_address
{
	my ($self, $num, $address) = @_;

	$self->_send_request(&FUNCTION_SET_RS485_SLAVE_ADDRESS, [$num, $address], 'C C', '');
}

=item get_rs485_slave_address()

Returns the slave address for a given ``num`` as set by
:func:`SetRS485SlaveAddress`.

=cut

sub get_rs485_slave_address
{
	my ($self, $num) = @_;

	return $self->_send_request(&FUNCTION_GET_RS485_SLAVE_ADDRESS, [$num], 'C', 'C');
}

=item get_rs485_error_log()

Returns CRC error counts of the RS485 communication.
If this counter starts rising, it is likely that the distance
between the RS485 nodes is too big or there is some kind of
interference.

=cut

sub get_rs485_error_log
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_RS485_ERROR_LOG, [], '', 'S');
}

=item set_rs485_configuration()

Sets the configuration of the RS485 Extension. Speed is given in baud. The
Master Brick will try to match the given baud rate as exactly as possible.
The maximum recommended baud rate is 2000000 (2Mbit/s).
Possible values for parity are 'n' (none), 'e' (even) and 'o' (odd).
Possible values for stop bits are 1 and 2.

If your RS485 is unstable (lost messages etc.), the first thing you should
try is to decrease the speed. On very large bus (e.g. 1km), you probably
should use a value in the range of 100000 (100kbit/s).

The values are stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

=cut

sub set_rs485_configuration
{
	my ($self, $speed, $parity, $stopbits) = @_;

	$self->_send_request(&FUNCTION_SET_RS485_CONFIGURATION, [$speed, $parity, $stopbits], 'L a C', '');
}

=item get_rs485_configuration()

Returns the configuration as set by :func:`SetRS485Configuration`.

=cut

sub get_rs485_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_RS485_CONFIGURATION, [], '', 'L a C');
}

=item is_wifi_present()

Returns *true* if a WIFI Extension is available to be used by the Master Brick.

=cut

sub is_wifi_present
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_WIFI_PRESENT, [], '', 'C');
}

=item set_wifi_configuration()

Sets the configuration of the WIFI Extension. The ``ssid`` can have a max length
of 32 characters. Possible values for ``connection`` are:

.. csv-table::
 :header: "Value", "Description"
 :widths: 10, 90

 "0", "DHCP"
 "1", "Static IP"
 "2", "Access Point: DHCP"
 "3", "Access Point: Static IP"
 "4", "Ad Hoc: DHCP"
 "5", "Ad Hoc: Static IP"

If you set ``connection`` to one of the static IP options then you have to
supply ``ip``, ``subnet_mask`` and ``gateway`` as an array of size 4 (first
element of the array is the least significant byte of the address). If
``connection`` is set to one of the DHCP options then ``ip``, ``subnet_mask``
and ``gateway`` are ignored, you can set them to 0.

The last parameter is the port that your program will connect to. The
default port, that is used by brickd, is 4223.

The values are stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

It is recommended to use the Brick Viewer to set the WIFI configuration.

=cut

sub set_wifi_configuration
{
	my ($self, $ssid, $connection, $ip, $subnet_mask, $gateway, $port) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_CONFIGURATION, [$ssid, $connection, $ip, $subnet_mask, $gateway, $port], 'Z32 C C4 C4 C4 S', '');
}

=item get_wifi_configuration()

Returns the configuration as set by :func:`SetWifiConfiguration`.

=cut

sub get_wifi_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_CONFIGURATION, [], '', 'Z32 C C4 C4 C4 S');
}

=item set_wifi_encryption()

Sets the encryption of the WIFI Extension. The first parameter is the
type of the encryption. Possible values are:

.. csv-table::
 :header: "Value", "Description"
 :widths: 10, 90

 "0", "WPA/WPA2"
 "1", "WPA Enterprise (EAP-FAST, EAP-TLS, EAP-TTLS, PEAP)"
 "2", "WEP"
 "3", "No Encryption"

The ``key`` has a max length of 50 characters and is used if ``encryption``
is set to 0 or 2 (WPA/WPA2 or WEP). Otherwise the value is ignored.

For WPA/WPA2 the key has to be at least 8 characters long. If you want to set
a key with more than 50 characters, see :func:`SetLongWifiKey`.

For WEP the key has to be either 10 or 26 hexadecimal digits long. It is
possible to set the WEP ``key_index`` (1-4). If you don't know your
``key_index``, it is likely 1.

If you choose WPA Enterprise as encryption, you have to set ``eap_options`` and
the length of the certificates (for other encryption types these parameters
are ignored). The certificate length are given in byte and the certificates
themselves can be set with :func:`SetWifiCertificate`. ``eap_options`` consist
of the outer authentication (bits 1-2), inner authentication (bit 3) and
certificate type (bits 4-5):

.. csv-table::
 :header: "Option", "Bits", "Description"
 :widths: 20, 10, 70

 "outer authentication", "1-2", "0=EAP-FAST, 1=EAP-TLS, 2=EAP-TTLS, 3=EAP-PEAP"
 "inner authentication", "3", "0=EAP-MSCHAP, 1=EAP-GTC"
 "certificate type", "4-5", "0=CA Certificate, 1=Client Certificate, 2=Private Key"

Example for EAP-TTLS + EAP-GTC + Private Key: ``option = 2 | (1 << 2) | (2 << 3)``.

The values are stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

It is recommended to use the Brick Viewer to set the WIFI encryption.

=cut

sub set_wifi_encryption
{
	my ($self, $encryption, $key, $key_index, $eap_options, $ca_certificate_length, $client_certificate_length, $private_key_length) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_ENCRYPTION, [$encryption, $key, $key_index, $eap_options, $ca_certificate_length, $client_certificate_length, $private_key_length], 'C Z50 C C S S S', '');
}

=item get_wifi_encryption()

Returns the encryption as set by :func:`SetWifiEncryption`.

=cut

sub get_wifi_encryption
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_ENCRYPTION, [], '', 'C Z50 C C S S S');
}

=item get_wifi_status()

Returns the status of the WIFI Extension. The ``state`` is updated automatically,
all of the other parameters are updated on startup and every time
:func:`RefreshWifiStatus` is called.

Possible states are:

.. csv-table::
 :header: "State", "Description"
 :widths: 10, 90

 "0", "Disassociated"
 "1", "Associated"
 "2", "Associating"
 "3", "Error"
 "255", "Not initialized yet"

=cut

sub get_wifi_status
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_STATUS, [], '', 'C6 C6 C s C4 C4 C4 L L C');
}

=item refresh_wifi_status()

Refreshes the WIFI status (see :func:`GetWifiStatus`). To read the status
of the WIFI module, the Master Brick has to change from data mode to
command mode and back. This transaction and the readout itself is
unfortunately time consuming. This means, that it might take some ms
until the stack with attached WIFI Extension reacts again after this
function is called.

=cut

sub refresh_wifi_status
{
	my ($self) = @_;

	$self->_send_request(&FUNCTION_REFRESH_WIFI_STATUS, [], '', '');
}

=item set_wifi_certificate()

This function is used to set the certificate as well as password and username
for WPA Enterprise. To set the username use index 0xFFFF,
to set the password use index 0xFFFE. The max length of username and 
password is 32.

The certificate is written in chunks of size 32 and the index is used as
the index of the chunk. ``data_length`` should nearly always be 32. Only
the last chunk can have a length that is not equal to 32.

The starting index of the CA Certificate is 0, of the Client Certificate
10000 and for the Private Key 20000. Maximum sizes are 1312, 1312 and
4320 byte respectively.

The values are stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after uploading the certificate.

It is recommended to use the Brick Viewer to set the certificate, username
and password.

=cut

sub set_wifi_certificate
{
	my ($self, $index, $data, $data_length) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_CERTIFICATE, [$index, $data, $data_length], 'S C32 C', '');
}

=item get_wifi_certificate()

Returns the certificate for a given index as set by :func:`SetWifiCertificate`.

=cut

sub get_wifi_certificate
{
	my ($self, $index) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_CERTIFICATE, [$index], 'S', 'C32 C');
}

=item set_wifi_power_mode()

Sets the power mode of the WIFI Extension. Possible modes are:

.. csv-table::
 :header: "Mode", "Description"
 :widths: 10, 90

 "0", "Full Speed (high power consumption, high throughput)"
 "1", "Low Power (low power consumption, low throughput)"

The default value is 0 (Full Speed).

=cut

sub set_wifi_power_mode
{
	my ($self, $mode) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_POWER_MODE, [$mode], 'C', '');
}

=item get_wifi_power_mode()

Returns the power mode as set by :func:`SetWifiPowerMode`.

=cut

sub get_wifi_power_mode
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_POWER_MODE, [], '', 'C');
}

=item get_wifi_buffer_info()

Returns informations about the WIFI receive buffer. The WIFI
receive buffer has a max size of 1500 byte and if data is transfered
too fast, it might overflow.

The return values are the number of overflows, the low watermark 
(i.e. the smallest number of bytes that were free in the buffer) and
the bytes that are currently used.

You should always try to keep the buffer empty, otherwise you will
have a permanent latency. A good rule of thumb is, that you can transfer
1000 messages per second without problems.

Try to not send more then 50 messages at a time without any kind of
break between them.

=cut

sub get_wifi_buffer_info
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_BUFFER_INFO, [], '', 'L S S');
}

=item set_wifi_regulatory_domain()

Sets the regulatory domain of the WIFI Extension. Possible domains are:

.. csv-table::
 :header: "Domain", "Description"
 :widths: 10, 90

 "0", "FCC: Channel 1-11 (N/S America, Australia, New Zealand)"
 "1", "ETSI: Channel 1-13 (Europe, Middle East, Africa)"
 "2", "TELEC: Channel 1-14 (Japan)"

The default value is 1 (ETSI).

=cut

sub set_wifi_regulatory_domain
{
	my ($self, $domain) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_REGULATORY_DOMAIN, [$domain], 'C', '');
}

=item get_wifi_regulatory_domain()

Returns the regulatory domain as set by :func:`SetWifiRegulatoryDomain`.

=cut

sub get_wifi_regulatory_domain
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_REGULATORY_DOMAIN, [], '', 'C');
}

=item get_usb_voltage()

Returns the USB voltage in mV.

=cut

sub get_usb_voltage
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_USB_VOLTAGE, [], '', 'S');
}

=item set_long_wifi_key()

Sets a long WIFI key (up to 63 chars, at least 8 chars) for WPA encryption.
This key will be used
if the key in :func:`SetWifiEncryption` is set to "-". In the old protocol,
a payload of size 63 was not possible, so the maximum key length was 50 chars.

With the new protocol this is possible, since we didn't want to break API,
this function was added additionally.

.. versionadded:: 2.0.2~(Firmware)

=cut

sub set_long_wifi_key
{
	my ($self, $key) = @_;

	$self->_send_request(&FUNCTION_SET_LONG_WIFI_KEY, [$key], 'Z64', '');
}

=item get_long_wifi_key()

Returns the encryption key as set by :func:`SetLongWifiKey`.

.. versionadded:: 2.0.2~(Firmware)

=cut

sub get_long_wifi_key
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_LONG_WIFI_KEY, [], '', 'Z64');
}

=item set_wifi_hostname()

Sets the hostname of the WIFI Extension. The hostname will be displayed 
by access points as the hostname in the DHCP clients table.

Setting an empty String will restore the default hostname.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_wifi_hostname
{
	my ($self, $hostname) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_HOSTNAME, [$hostname], 'Z16', '');
}

=item get_wifi_hostname()

Returns the hostname as set by :func:`GetWifiHostname`.

An empty String means, that the default hostname is used.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_wifi_hostname
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_HOSTNAME, [], '', 'Z16');
}

=item set_stack_current_callback_period()

Sets the period in ms with which the :func:`StackCurrent` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`StackCurrent` is only triggered if the current has changed since the
last triggering.

The default value is 0.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_stack_current_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_stack_current_callback_period()

Returns the period as set by :func:`SetCurrentCallbackPeriod`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_stack_current_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD, [], '', 'L');
}

=item set_stack_voltage_callback_period()

Sets the period in ms with which the :func:`StackVoltage` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`StackVoltage` is only triggered if the voltage has changed since the
last triggering.

The default value is 0.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_stack_voltage_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_stack_voltage_callback_period()

Returns the period as set by :func:`SetStackVoltageCallbackPeriod`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_stack_voltage_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_usb_voltage_callback_period()

Sets the period in ms with which the :func:`USBVoltage` callback is triggered
periodically. A value of 0 turns the callback off.

:func:`USBVoltage` is only triggered if the voltage has changed since the
last triggering.

The default value is 0.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_usb_voltage_callback_period
{
	my ($self, $period) = @_;

	$self->_send_request(&FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD, [$period], 'L', '');
}

=item get_usb_voltage_callback_period()

Returns the period as set by :func:`SetUSBVoltageCallbackPeriod`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_usb_voltage_callback_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD, [], '', 'L');
}

=item set_stack_current_callback_threshold()

Sets the thresholds for the :func:`StackCurrentReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the current is *outside* the min and max values"
 "'i'",    "Callback is triggered when the current is *inside* the min and max values"
 "'<'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the current is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_stack_current_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_stack_current_callback_threshold()

Returns the threshold as set by :func:`SetStackCurrentCallbackThreshold`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_stack_current_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_stack_voltage_callback_threshold()

Sets the thresholds for the :func:`StackStackVoltageReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
 "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
 "'<'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_stack_voltage_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_stack_voltage_callback_threshold()

Returns the threshold as set by :func:`SetStackVoltageCallbackThreshold`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_stack_voltage_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_usb_voltage_callback_threshold()

Sets the thresholds for the :func:`USBVoltageReached` callback. 

The following options are possible:

.. csv-table::
 :header: "Option", "Description"
 :widths: 10, 100

 "'x'",    "Callback is turned off"
 "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
 "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
 "'<'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
 "'>'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"

The default value is ('x', 0, 0).

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_usb_voltage_callback_threshold
{
	my ($self, $option, $min, $max) = @_;

	$self->_send_request(&FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

=item get_usb_voltage_callback_threshold()

Returns the threshold as set by :func:`SetUSBVoltageCallbackThreshold`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_usb_voltage_callback_threshold
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD, [], '', 'a S S');
}

=item set_debounce_period()

Sets the period in ms with which the threshold callbacks

* :func:`StackCurrentReached`,
* :func:`StackVoltageReached`,
* :func:`USBVoltageReached`

are triggered, if the thresholds

* :func:`SetStackCurrentCallbackThreshold`,
* :func:`SetStackVoltageCallbackThreshold`,
* :func:`SetUSBVoltageCallbackThreshold`

keep being reached.

The default value is 100.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub set_debounce_period
{
	my ($self, $debounce) = @_;

	$self->_send_request(&FUNCTION_SET_DEBOUNCE_PERIOD, [$debounce], 'L', '');
}

=item get_debounce_period()

Returns the debounce period as set by :func:`SetDebouncePeriod`.

.. versionadded:: 2.0.5~(Firmware)

=cut

sub get_debounce_period
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_DEBOUNCE_PERIOD, [], '', 'L');
}

=item is_ethernet_present()

Returns *true* if a Ethernet Extension is available to be used by the Master
Brick.

.. versionadded:: 2.1.0~(Firmware)

=cut

sub is_ethernet_present
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_IS_ETHERNET_PRESENT, [], '', 'C');
}

=item set_ethernet_configuration()

Sets the configuration of the Ethernet Extension. Possible values for
``connection`` are:

.. csv-table::
 :header: "Value", "Description"
 :widths: 10, 90

 "0", "DHCP"
 "1", "Static IP"

If you set ``connection`` to static IP options then you have to supply ``ip``,
``subnet_mask`` and ``gateway`` as an array of size 4 (first element of the
array is the least significant byte of the address). If ``connection`` is set
to the DHCP options then ``ip``, ``subnet_mask`` and ``gateway`` are ignored,
you can set them to 0.

The last parameter is the port that your program will connect to. The
default port, that is used by brickd, is 4223.

The values are stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

It is recommended to use the Brick Viewer to set the Ethernet configuration.

.. versionadded:: 2.1.0~(Firmware)

=cut

sub set_ethernet_configuration
{
	my ($self, $connection, $ip, $subnet_mask, $gateway, $port) = @_;

	$self->_send_request(&FUNCTION_SET_ETHERNET_CONFIGURATION, [$connection, $ip, $subnet_mask, $gateway, $port], 'C C4 C4 C4 S', '');
}

=item get_ethernet_configuration()

Returns the configuration as set by :func:`SetEthernetConfiguration`.

.. versionadded:: 2.1.0~(Firmware)

=cut

sub get_ethernet_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ETHERNET_CONFIGURATION, [], '', 'C C4 C4 C4 S');
}

=item get_ethernet_status()

Returns the status of the Ethernet Extension.

``mac_address``, ``ip``, ``subnet_mask`` and ``gateway`` are given as an array.
The first element of the array is the least significant byte of the address.

``rx_count`` and ``tx_count`` are the number of bytes that have been
received/send since last restart.

``hostname`` is the currently used hostname.

.. versionadded:: 2.1.0~(Firmware)

=cut

sub get_ethernet_status
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ETHERNET_STATUS, [], '', 'C6 C4 C4 C4 L L Z32');
}

=item set_ethernet_hostname()

Sets the hostname of the Ethernet Extension. The hostname will be displayed 
by access points as the hostname in the DHCP clients table.

Setting an empty String will restore the default hostname.

The current hostname can be discovered with :func:`GetEthernetStatus`.

.. versionadded:: 2.1.0~(Firmware)

=cut

sub set_ethernet_hostname
{
	my ($self, $hostname) = @_;

	$self->_send_request(&FUNCTION_SET_ETHERNET_HOSTNAME, [$hostname], 'Z32', '');
}

=item set_ethernet_mac_address()

Sets the MAC address of the Ethernet Extension. The Ethernet Extension should
come configured with a valid MAC address, that is also written on a
sticker of the extension itself.

The MAC address can be read out again with :func:`GetEthernetStatus`.

.. versionadded:: 2.1.0~(Firmware)

=cut

sub set_ethernet_mac_address
{
	my ($self, $mac_address) = @_;

	$self->_send_request(&FUNCTION_SET_ETHERNET_MAC_ADDRESS, [$mac_address], 'C6', '');
}

=item set_ethernet_websocket_configuration()

Sets the Ethernet WebSocket configuration. The first parameter sets the number of socket
connections that are reserved for WebSockets. The range is 0-7. The connections
are shared with the plain sockets. Example: If you set the connections to 3,
there will be 3 WebSocket and 4 plain socket connections available.

The second parameter is the port for the WebSocket connections. The port can
not be the same as the port for the plain socket connections.

The values are stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

It is recommended to use the Brick Viewer to set the Ethernet configuration.

The default values are 3 for the socket connections and 4280 for the port.

.. versionadded:: 2.2.0~(Firmware)

=cut

sub set_ethernet_websocket_configuration
{
	my ($self, $sockets, $port) = @_;

	$self->_send_request(&FUNCTION_SET_ETHERNET_WEBSOCKET_CONFIGURATION, [$sockets, $port], 'C S', '');
}

=item get_ethernet_websocket_configuration()

Returns the configuration as set by :func:`SetEthernetConfiguration`.

.. versionadded:: 2.2.0~(Firmware)

=cut

sub get_ethernet_websocket_configuration
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ETHERNET_WEBSOCKET_CONFIGURATION, [], '', 'C S');
}

=item set_ethernet_authentication_secret()

Sets the Ethernet authentication secret. The secret can be a string of up to 64
characters. An empty string disables the authentication.

See the :ref:`authentication tutorial <tutorial_authentication>` for more
information.

The secret is stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

It is recommended to use the Brick Viewer to set the Ethernet authentication secret.

The default value is an empty string (authentication disabled).

.. versionadded:: 2.2.0~(Firmware)

=cut

sub set_ethernet_authentication_secret
{
	my ($self, $secret) = @_;

	$self->_send_request(&FUNCTION_SET_ETHERNET_AUTHENTICATION_SECRET, [$secret], 'Z64', '');
}

=item get_ethernet_authentication_secret()

Returns the authentication secret as set by :func:`SetEthernetAuthenticationSecret`.

.. versionadded:: 2.2.0~(Firmware)

=cut

sub get_ethernet_authentication_secret
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_ETHERNET_AUTHENTICATION_SECRET, [], '', 'Z64');
}

=item set_wifi_authentication_secret()

Sets the WIFI authentication secret. The secret can be a string of up to 64
characters. An empty string disables the authentication.

See the :ref:`authentication tutorial <tutorial_authentication>` for more
information.

The secret is stored in the EEPROM and only applied on startup. That means
you have to restart the Master Brick after configuration.

It is recommended to use the Brick Viewer to set the WIFI authentication secret.

The default value is an empty string (authentication disabled).

.. versionadded:: 2.2.0~(Firmware)

=cut

sub set_wifi_authentication_secret
{
	my ($self, $secret) = @_;

	$self->_send_request(&FUNCTION_SET_WIFI_AUTHENTICATION_SECRET, [$secret], 'Z64', '');
}

=item get_wifi_authentication_secret()

Returns the authentication secret as set by :func:`SetWifiAuthenticationSecret`.

.. versionadded:: 2.2.0~(Firmware)

=cut

sub get_wifi_authentication_secret
{
	my ($self) = @_;

	return $self->_send_request(&FUNCTION_GET_WIFI_AUTHENTICATION_SECRET, [], '', 'Z64');
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
