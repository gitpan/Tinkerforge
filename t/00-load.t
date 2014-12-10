#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 54;

BEGIN {
    use_ok( 'Tinkerforge' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::IPConnection' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::Device' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::Error' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickDC' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickIMU' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickMaster' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickRED' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickServo' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickStepper' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletAmbientLight' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletAnalogIn' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletAnalogOut' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletBarometer' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletColor' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletCurrent12' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletCurrent25' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletDistanceIR' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletDistanceUS' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletDualButton' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletDualRelay' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletGPS' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletHallEffect' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletHumidity' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletIndustrialDigitalIn4' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletIndustrialDigitalOut4' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletIndustrialDual020mA' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletIndustrialQuadRelay' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletIO16' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletIO4' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletJoystick' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletLCD16x2' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletLCD20x4' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletLEDStrip' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletLine' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletLinearPoti' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletMoisture' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletMotionDetector' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletMultiTouch' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletNFCRFID' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletPiezoBuzzer' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletPiezoSpeaker' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletPTC' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletRemoteSwitch' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletRotaryEncoder' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletRotaryPoti' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletSegmentDisplay4x7' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletSolidStateRelay' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletSoundIntensity' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletTemperature' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletTemperatureIR' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletTilt' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletVoltage' ) || print "Bail out!\n";
    use_ok( 'Tinkerforge::BrickletVoltageCurrent' ) || print "Bail out!\n";
}

diag( "Testing Tinkerforge $Tinkerforge::VERSION, Perl $], $^X" );
