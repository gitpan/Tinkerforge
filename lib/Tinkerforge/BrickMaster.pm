
#############################################################
# This file was automatically generated on 2014-02-24.      #
#                                                           #
# Bindings Version 2.0.1                                    #
#                                                           #
# If you have a bugfix for this file and want to commit it, #
# please fix the bug in the generator. You can find a link  #
# to the generator git on tinkerforge.com                   #
#############################################################

package Tinkerforge::BrickMaster;
=comment
        Device for controlling Stacks and four Bricklets
=cut

use Tinkerforge::Device;
use Tinkerforge::IPConnection;
use Tinkerforge::Error;
use strict;
use warnings;
use Carp;
use threads;
use threads::shared;

use constant DEVICE_IDENTIFIER => 13;
use constant CALLBACK_STACK_CURRENT => 59;
use constant CALLBACK_STACK_VOLTAGE => 60;
use constant CALLBACK_USB_VOLTAGE => 61;
use constant CALLBACK_STACK_CURRENT_REACHED => 62;
use constant CALLBACK_STACK_VOLTAGE_REACHED => 63;
use constant CALLBACK_USB_VOLTAGE_REACHED => 64;

use constant FUNCTION_GET_STACK_VOLTAGE => 1;
use constant FUNCTION_GET_STACK_CURRENT => 2;
use constant FUNCTION_SET_EXTENSION_TYPE => 3;
use constant FUNCTION_GET_EXTENSION_TYPE => 4;
use constant FUNCTION_IS_CHIBI_PRESENT => 5;
use constant FUNCTION_SET_CHIBI_ADDRESS => 6;
use constant FUNCTION_GET_CHIBI_ADDRESS => 7;
use constant FUNCTION_SET_CHIBI_MASTER_ADDRESS => 8;
use constant FUNCTION_GET_CHIBI_MASTER_ADDRESS => 9;
use constant FUNCTION_SET_CHIBI_SLAVE_ADDRESS => 10;
use constant FUNCTION_GET_CHIBI_SLAVE_ADDRESS => 11;
use constant FUNCTION_GET_CHIBI_SIGNAL_STRENGTH => 12;
use constant FUNCTION_GET_CHIBI_ERROR_LOG => 13;
use constant FUNCTION_SET_CHIBI_FREQUENCY => 14;
use constant FUNCTION_GET_CHIBI_FREQUENCY => 15;
use constant FUNCTION_SET_CHIBI_CHANNEL => 16;
use constant FUNCTION_GET_CHIBI_CHANNEL => 17;
use constant FUNCTION_IS_RS485_PRESENT => 18;
use constant FUNCTION_SET_RS485_ADDRESS => 19;
use constant FUNCTION_GET_RS485_ADDRESS => 20;
use constant FUNCTION_SET_RS485_SLAVE_ADDRESS => 21;
use constant FUNCTION_GET_RS485_SLAVE_ADDRESS => 22;
use constant FUNCTION_GET_RS485_ERROR_LOG => 23;
use constant FUNCTION_SET_RS485_CONFIGURATION => 24;
use constant FUNCTION_GET_RS485_CONFIGURATION => 25;
use constant FUNCTION_IS_WIFI_PRESENT => 26;
use constant FUNCTION_SET_WIFI_CONFIGURATION => 27;
use constant FUNCTION_GET_WIFI_CONFIGURATION => 28;
use constant FUNCTION_SET_WIFI_ENCRYPTION => 29;
use constant FUNCTION_GET_WIFI_ENCRYPTION => 30;
use constant FUNCTION_GET_WIFI_STATUS => 31;
use constant FUNCTION_REFRESH_WIFI_STATUS => 32;
use constant FUNCTION_SET_WIFI_CERTIFICATE => 33;
use constant FUNCTION_GET_WIFI_CERTIFICATE => 34;
use constant FUNCTION_SET_WIFI_POWER_MODE => 35;
use constant FUNCTION_GET_WIFI_POWER_MODE => 36;
use constant FUNCTION_GET_WIFI_BUFFER_INFO => 37;
use constant FUNCTION_SET_WIFI_REGULATORY_DOMAIN => 38;
use constant FUNCTION_GET_WIFI_REGULATORY_DOMAIN => 39;
use constant FUNCTION_GET_USB_VOLTAGE => 40;
use constant FUNCTION_SET_LONG_WIFI_KEY => 41;
use constant FUNCTION_GET_LONG_WIFI_KEY => 42;
use constant FUNCTION_SET_WIFI_HOSTNAME => 43;
use constant FUNCTION_GET_WIFI_HOSTNAME => 44;
use constant FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD => 45;
use constant FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD => 46;
use constant FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD => 47;
use constant FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD => 48;
use constant FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD => 49;
use constant FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD => 50;
use constant FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD => 51;
use constant FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD => 52;
use constant FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD => 53;
use constant FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD => 54;
use constant FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD => 55;
use constant FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD => 56;
use constant FUNCTION_SET_DEBOUNCE_PERIOD => 57;
use constant FUNCTION_GET_DEBOUNCE_PERIOD => 58;
use constant FUNCTION_IS_ETHERNET_PRESENT => 65;
use constant FUNCTION_SET_ETHERNET_CONFIGURATION => 66;
use constant FUNCTION_GET_ETHERNET_CONFIGURATION => 67;
use constant FUNCTION_GET_ETHERNET_STATUS => 68;
use constant FUNCTION_SET_ETHERNET_HOSTNAME => 69;
use constant FUNCTION_SET_ETHERNET_MAC_ADDRESS => 70;
use constant FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => 241;
use constant FUNCTION_GET_CHIP_TEMPERATURE => 242;
use constant FUNCTION_RESET => 243;
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

sub new
{
=comment
        Creates an object with the unique device ID *uid* and adds it to
        the IP Connection *ipcon*.
=cut
    my ($class, $uid, $ipcon) = @_;

    my $self :shared = shared_clone({super => shared_clone(Tinkerforge::Device->new($uid, $ipcon)),
                                     api_version => [2, 0, 2],
                                     response_expected => shared_clone({&FUNCTION_GET_STACK_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_STACK_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_EXTENSION_TYPE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_EXTENSION_TYPE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_IS_CHIBI_PRESENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CHIBI_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CHIBI_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CHIBI_MASTER_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CHIBI_MASTER_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CHIBI_SLAVE_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CHIBI_SLAVE_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CHIBI_SIGNAL_STRENGTH => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CHIBI_ERROR_LOG => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CHIBI_FREQUENCY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CHIBI_FREQUENCY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_CHIBI_CHANNEL => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_CHIBI_CHANNEL => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_IS_RS485_PRESENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_RS485_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_RS485_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_RS485_SLAVE_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_RS485_SLAVE_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_RS485_ERROR_LOG => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_RS485_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_RS485_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_IS_WIFI_PRESENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_WIFI_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_WIFI_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_WIFI_ENCRYPTION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_WIFI_ENCRYPTION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_WIFI_STATUS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_REFRESH_WIFI_STATUS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_SET_WIFI_CERTIFICATE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_WIFI_CERTIFICATE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_WIFI_POWER_MODE => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_WIFI_POWER_MODE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_WIFI_BUFFER_INFO => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_WIFI_REGULATORY_DOMAIN => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_WIFI_REGULATORY_DOMAIN => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_USB_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_LONG_WIFI_KEY => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_LONG_WIFI_KEY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_WIFI_HOSTNAME => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_WIFI_HOSTNAME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_TRUE,
                                                                        &FUNCTION_GET_DEBOUNCE_PERIOD => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &CALLBACK_STACK_CURRENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_STACK_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_USB_VOLTAGE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_STACK_CURRENT_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_STACK_VOLTAGE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &CALLBACK_USB_VOLTAGE_REACHED => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_FALSE,
                                                                        &FUNCTION_IS_ETHERNET_PRESENT => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ETHERNET_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_ETHERNET_CONFIGURATION => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_ETHERNET_STATUS => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_SET_ETHERNET_HOSTNAME => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_SET_ETHERNET_MAC_ADDRESS => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_PROTOCOL1_BRICKLET_NAME => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_GET_CHIP_TEMPERATURE => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE,
                                                                        &FUNCTION_RESET => Tinkerforge::Device->RESPONSE_EXPECTED_FALSE,
                                                                        &FUNCTION_GET_IDENTITY => Tinkerforge::Device->RESPONSE_EXPECTED_ALWAYS_TRUE}),
                                    callback_formats => shared_clone({&CALLBACK_STACK_CURRENT => 'S',
                                                                      &CALLBACK_STACK_VOLTAGE => 'S',
                                                                      &CALLBACK_USB_VOLTAGE => 'S',
                                                                      &CALLBACK_STACK_CURRENT_REACHED => 'S',
                                                                      &CALLBACK_STACK_VOLTAGE_REACHED => 'S',
                                                                      &CALLBACK_USB_VOLTAGE_REACHED => 'S'})});

    $self->{super}->{ipcon}->{devices}->{$self->{super}->{uid}} = $self;

    $self->{super}->{api_version} = $self->{api_version};

    bless($self, $class);

    return $self;
}

sub get_stack_voltage
{
=comment
        Returns the stack voltage in mV. The stack voltage is the
        voltage that is supplied via the stack, i.e. it is given by a 
        Step-Down or Step-Up Power Supply.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_VOLTAGE, [], '', 'S');
}

sub get_stack_current
{
=comment
        Returns the stack current in mA. The stack current is the
        current that is drawn via the stack, i.e. it is given by a
        Step-Down or Step-Up Power Supply.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_CURRENT, [], '', 'S');
}

sub set_extension_type
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $extension, $exttype) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_EXTENSION_TYPE, [$extension, $exttype], 'C L', '');
}

sub get_extension_type
{
=comment
        Returns the type for a given extension as set by :func:`SetExtensionType`.
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $extension) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_EXTENSION_TYPE, [$extension], 'C', 'L');
}

sub is_chibi_present
{
=comment
        Returns *true* if a Chibi Extension is available to be used by the Master Brick.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_CHIBI_PRESENT, [], '', 'C');
}

sub set_chibi_address
{
=comment
        Sets the address (1-255) belonging to the Chibi Extension.
        
        It is possible to set the address with the Brick Viewer and it will be 
        saved in the EEPROM of the Chibi Extension, it does not
        have to be set on every startup.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $address) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CHIBI_ADDRESS, [$address], 'C', '');
}

sub get_chibi_address
{
=comment
        Returns the address as set by :func:`SetChibiAddress`.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_ADDRESS, [], '', 'C');
}

sub set_chibi_master_address
{
=comment
        Sets the address (1-255) of the Chibi Master. This address is used if the
        Chibi Extension is used as slave (i.e. it does not have a USB connection).
        
        It is possible to set the address with the Brick Viewer and it will be 
        saved in the EEPROM of the Chibi Extension, it does not
        have to be set on every startup.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $address) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CHIBI_MASTER_ADDRESS, [$address], 'C', '');
}

sub get_chibi_master_address
{
=comment
        Returns the address as set by :func:`SetChibiMasterAddress`.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_MASTER_ADDRESS, [], '', 'C');
}

sub set_chibi_slave_address
{
=comment
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
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $num, $address) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CHIBI_SLAVE_ADDRESS, [$num, $address], 'C C', '');
}

sub get_chibi_slave_address
{
=comment
        Returns the slave address for a given num as set by
        :func:`SetChibiSlaveAddress`.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_SLAVE_ADDRESS, [$num], 'C', 'C');
}

sub get_chibi_signal_strength
{
=comment
        Returns the signal strength in dBm. The signal strength updates every time a
        packet is received.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_SIGNAL_STRENGTH, [], '', 'C');
}

sub get_chibi_error_log
{
=comment
        Returns underrun, CRC error, no ACK and overflow error counts of the Chibi
        communication. If these errors start rising, it is likely that either the
        distance between two Chibi stacks is becoming too big or there are
        interferences.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_ERROR_LOG, [], '', 'S S S S');
 }

sub set_chibi_frequency
{
=comment
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
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $frequency) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CHIBI_FREQUENCY, [$frequency], 'C', '');
}

sub get_chibi_frequency
{
=comment
        Returns the frequency value as set by :func:`SetChibiFrequency`.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_FREQUENCY, [], '', 'C');
}

sub set_chibi_channel
{
=comment
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
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $channel) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_CHIBI_CHANNEL, [$channel], 'C', '');
}

sub get_chibi_channel
{
=comment
        Returns the channel as set by :func:`SetChibiChannel`.
        
        .. versionadded:: 1.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_CHIBI_CHANNEL, [], '', 'C');
}

sub is_rs485_present
{
=comment
        Returns *true* if a RS485 Extension is available to be used by the Master Brick.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_RS485_PRESENT, [], '', 'C');
}

sub set_rs485_address
{
=comment
        Sets the address (0-255) belonging to the RS485 Extension.
        
        Set to 0 if the RS485 Extension should be the RS485 Master (i.e.
        connected to a PC via USB).
        
        It is possible to set the address with the Brick Viewer and it will be 
        saved in the EEPROM of the RS485 Extension, it does not
        have to be set on every startup.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $address) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_RS485_ADDRESS, [$address], 'C', '');
}

sub get_rs485_address
{
=comment
        Returns the address as set by :func:`SetRS485Address`.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_RS485_ADDRESS, [], '', 'C');
}

sub set_rs485_slave_address
{
=comment
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
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $num, $address) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_RS485_SLAVE_ADDRESS, [$num, $address], 'C C', '');
}

sub get_rs485_slave_address
{
=comment
        Returns the slave address for a given ``num`` as set by
        :func:`SetRS485SlaveAddress`.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $num) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_RS485_SLAVE_ADDRESS, [$num], 'C', 'C');
}

sub get_rs485_error_log
{
=comment
        Returns CRC error counts of the RS485 communication.
        If this counter starts rising, it is likely that the distance
        between the RS485 nodes is too big or there is some kind of
        interference.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_RS485_ERROR_LOG, [], '', 'S');
}

sub set_rs485_configuration
{
=comment
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
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $speed, $parity, $stopbits) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_RS485_CONFIGURATION, [$speed, $parity, $stopbits], 'L a C', '');
}

sub get_rs485_configuration
{
=comment
        Returns the configuration as set by :func:`SetRS485Configuration`.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_RS485_CONFIGURATION, [], '', 'L a C');
 }

sub is_wifi_present
{
=comment
        Returns *true* if a WIFI Extension is available to be used by the Master Brick.
        
        .. versionadded:: 1.2.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_WIFI_PRESENT, [], '', 'C');
}

sub set_wifi_configuration
{
=comment
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
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $ssid, $connection, $ip, $subnet_mask, $gateway, $port) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_WIFI_CONFIGURATION, [$ssid, $connection, $ip, $subnet_mask, $gateway, $port], 'Z32 C C4 C4 C4 S', '');
}

sub get_wifi_configuration
{
=comment
        Returns the configuration as set by :func:`SetWifiConfiguration`.
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_CONFIGURATION, [], '', 'Z32 C C4 C4 C4 S');
 }

sub set_wifi_encryption
{
=comment
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
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $encryption, $key, $key_index, $eap_options, $ca_certificate_length, $client_certificate_length, $private_key_length) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_WIFI_ENCRYPTION, [$encryption, $key, $key_index, $eap_options, $ca_certificate_length, $client_certificate_length, $private_key_length], 'C Z50 C C S S S', '');
}

sub get_wifi_encryption
{
=comment
        Returns the encryption as set by :func:`SetWifiEncryption`.
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_ENCRYPTION, [], '', 'C Z50 C C S S S');
 }

sub get_wifi_status
{
=comment
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
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_STATUS, [], '', 'C6 C6 C s C4 C4 C4 L L C');
 }

sub refresh_wifi_status
{
=comment
        Refreshes the WIFI status (see :func:`GetWifiStatus`). To read the status
        of the WIFI module, the Master Brick has to change from data mode to
        command mode and back. This transaction and the readout itself is
        unfortunately time consuming. This means, that it might take some ms
        until the stack with attached WIFI Extension reacts again after this
        function is called.
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    $self->{super}->send_request($self, &FUNCTION_REFRESH_WIFI_STATUS, [], '', '');
}

sub set_wifi_certificate
{
=comment
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
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $index, $data, $data_length) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_WIFI_CERTIFICATE, [$index, $data, $data_length], 'S C32 C', '');
}

sub get_wifi_certificate
{
=comment
        Returns the certificate for a given index as set by :func:`SetWifiCertificate`.
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $index) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_CERTIFICATE, [$index], 'S', 'C32 C');
 }

sub set_wifi_power_mode
{
=comment
        Sets the power mode of the WIFI Extension. Possible modes are:
        
        .. csv-table::
         :header: "Mode", "Description"
         :widths: 10, 90
        
         "0", "Full Speed (high power consumption, high throughput)"
         "1", "Low Power (low power consumption, low throughput)"
        
        The default value is 0 (Full Speed).
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $mode) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_WIFI_POWER_MODE, [$mode], 'C', '');
}

sub get_wifi_power_mode
{
=comment
        Returns the power mode as set by :func:`SetWifiPowerMode`.
        
        .. versionadded:: 1.3.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_POWER_MODE, [], '', 'C');
}

sub get_wifi_buffer_info
{
=comment
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
        
        .. versionadded:: 1.3.2~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_BUFFER_INFO, [], '', 'L S S');
 }

sub set_wifi_regulatory_domain
{
=comment
        Sets the regulatory domain of the WIFI Extension. Possible domains are:
        
        .. csv-table::
         :header: "Domain", "Description"
         :widths: 10, 90
        
         "0", "FCC: Channel 1-11 (N/S America, Australia, New Zealand)"
         "1", "ETSI: Channel 1-13 (Europe, Middle East, Africa)"
         "2", "TELEC: Channel 1-14 (Japan)"
        
        The default value is 1 (ETSI).
        
        .. versionadded:: 1.3.4~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $domain) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_WIFI_REGULATORY_DOMAIN, [$domain], 'C', '');
}

sub get_wifi_regulatory_domain
{
=comment
        Returns the regulatory domain as set by :func:`SetWifiRegulatoryDomain`.
        
        .. versionadded:: 1.3.4~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_REGULATORY_DOMAIN, [], '', 'C');
}

sub get_usb_voltage
{
=comment
        Returns the USB voltage in mV.
        
        .. versionadded:: 1.3.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_USB_VOLTAGE, [], '', 'S');
}

sub set_long_wifi_key
{
=comment
        Sets a long WIFI key (up to 63 chars, at least 8 chars) for WPA encryption.
        This key will be used
        if the key in :func:`SetWifiEncryption` is set to "-". In the old protocol,
        a payload of size 63 was not possible, so the maximum key length was 50 chars.
        
        With the new protocol this is possible, since we didn't want to break API,
        this function was added additionally.
        
        .. versionadded:: 2.0.2~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $key) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_LONG_WIFI_KEY, [$key], 'Z64', '');
}

sub get_long_wifi_key
{
=comment
        Returns the encryption key as set by :func:`SetLongWifiKey`.
        
        .. versionadded:: 2.0.2~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_LONG_WIFI_KEY, [], '', 'Z64');
}

sub set_wifi_hostname
{
=comment
        Sets the hostname of the WIFI Extension. The hostname will be displayed 
        by access points as the hostname in the DHCP clients table.
        
        Setting an empty String will restore the default hostname.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $hostname) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_WIFI_HOSTNAME, [$hostname], 'Z16', '');
}

sub get_wifi_hostname
{
=comment
        Returns the hostname as set by :func:`GetWifiHostname`.
        
        An empty String means, that the default hostname is used.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_WIFI_HOSTNAME, [], '', 'Z16');
}

sub set_stack_current_callback_period
{
=comment
        Sets the period in ms with which the :func:`StackCurrent` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`StackCurrent` is only triggered if the current has changed since the
        last triggering.
        
        The default value is 0.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STACK_CURRENT_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_stack_current_callback_period
{
=comment
        Returns the period as set by :func:`SetCurrentCallbackPeriod`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_CURRENT_CALLBACK_PERIOD, [], '', 'L');
}

sub set_stack_voltage_callback_period
{
=comment
        Sets the period in ms with which the :func:`StackVoltage` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`StackVoltage` is only triggered if the voltage has changed since the
        last triggering.
        
        The default value is 0.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STACK_VOLTAGE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_stack_voltage_callback_period
{
=comment
        Returns the period as set by :func:`SetStackVoltageCallbackPeriod`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_VOLTAGE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_usb_voltage_callback_period
{
=comment
        Sets the period in ms with which the :func:`USBVoltage` callback is triggered
        periodically. A value of 0 turns the callback off.
        
        :func:`USBVoltage` is only triggered if the voltage has changed since the
        last triggering.
        
        The default value is 0.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $period) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_USB_VOLTAGE_CALLBACK_PERIOD, [$period], 'L', '');
}

sub get_usb_voltage_callback_period
{
=comment
        Returns the period as set by :func:`SetUSBVoltageCallbackPeriod`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_USB_VOLTAGE_CALLBACK_PERIOD, [], '', 'L');
}

sub set_stack_current_callback_threshold
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STACK_CURRENT_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

sub get_stack_current_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetStackCurrentCallbackThreshold`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_CURRENT_CALLBACK_THRESHOLD, [], '', 'a S S');
 }

sub set_stack_voltage_callback_threshold
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_STACK_VOLTAGE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

sub get_stack_voltage_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetStackVoltageCallbackThreshold`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_STACK_VOLTAGE_CALLBACK_THRESHOLD, [], '', 'a S S');
 }

sub set_usb_voltage_callback_threshold
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $option, $min, $max) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_USB_VOLTAGE_CALLBACK_THRESHOLD, [$option, $min, $max], 'a S S', '');
}

sub get_usb_voltage_callback_threshold
{
=comment
        Returns the threshold as set by :func:`SetUSBVoltageCallbackThreshold`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_USB_VOLTAGE_CALLBACK_THRESHOLD, [], '', 'a S S');
 }

sub set_debounce_period
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $debounce) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_DEBOUNCE_PERIOD, [$debounce], 'L', '');
}

sub get_debounce_period
{
=comment
        Returns the debounce period as set by :func:`SetDebouncePeriod`.
        
        .. versionadded:: 2.0.5~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_DEBOUNCE_PERIOD, [], '', 'L');
}

sub is_ethernet_present
{
=comment
        Returns *true* if a Ethernet Extension is available to be used by the Master
        Brick.
        
        .. versionadded:: 2.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_IS_ETHERNET_PRESENT, [], '', 'C');
}

sub set_ethernet_configuration
{
=comment
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
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $connection, $ip, $subnet_mask, $gateway, $port) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ETHERNET_CONFIGURATION, [$connection, $ip, $subnet_mask, $gateway, $port], 'C C4 C4 C4 S', '');
}

sub get_ethernet_configuration
{
=comment
        Returns the configuration as set by :func:`SetEthernetConfiguration`.
        
        .. versionadded:: 2.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ETHERNET_CONFIGURATION, [], '', 'C C4 C4 C4 S');
 }

sub get_ethernet_status
{
=comment
        Returns the status of the Ethernet Extension.
        
        ``mac_address``, ``ip``, ``subnet_mask`` and ``gateway`` are given as an array.
        The first element of the array is the least significant byte of the address.
        
        ``rx_count`` and ``tx_count`` are the number of bytes that have been
        received/send since last restart.
        
        ``hostname`` is the currently used hostname.
        
        .. versionadded:: 2.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self) = @_;

    return $self->{super}->send_request($self, &FUNCTION_GET_ETHERNET_STATUS, [], '', 'C6 C4 C4 C4 L L Z32');
 }

sub set_ethernet_hostname
{
=comment
        Sets the hostname of the Ethernet Extension. The hostname will be displayed 
        by access points as the hostname in the DHCP clients table.
        
        Setting an empty String will restore the default hostname.
        
        The current hostname can be discovered with :func:`GetEthernetStatus`.
        
        .. versionadded:: 2.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $hostname) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ETHERNET_HOSTNAME, [$hostname], 'Z32', '');
}

sub set_ethernet_mac_address
{
=comment
        Sets the MAC address of the Ethernet Extension. The Ethernet Extension should
        come configured with a valid MAC address, that is also written on a
        sticker of the extension itself.
        
        The MAC address can be read out again with :func:`GetEthernetStatus`.
        
        .. versionadded:: 2.1.0~(Firmware)
=cut
    lock($Tinkerforge::Device::DEVICE_LOCK);

    my ($self, $mac_address) = @_;

    $self->{super}->send_request($self, &FUNCTION_SET_ETHERNET_MAC_ADDRESS, [$mac_address], 'C6', '');
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
        
        .. versionadded:: 1.2.1~(Firmware)
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
        
        .. versionadded:: 1.2.1~(Firmware)
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
