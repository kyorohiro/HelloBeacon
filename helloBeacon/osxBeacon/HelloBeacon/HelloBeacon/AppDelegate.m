#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"applicationDidFinishLaunching()");
}


- (IBAction)onPushStartBeacon:(id)sender {
    NSLog(@"pushed start button %@", [self.mUUIDField stringValue]);

    NSString* uuid = self.mUUIDField.stringValue;
    int major = (int)self.mMajor.integerValue;
    int minor = (int)self.mMinor.integerValue;
    int measuredPower = (int)self.mmeasuredPower.integerValue;
    
    self.mBeacon =
    [[HelloBeacon alloc] initWithUUID:uuid major:major minor:minor measuredPower:measuredPower];
    [self.mBeacon startBeacon];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"exitRegion() %@", region.identifier);
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    NSLog(@"applicationShouldTerminateAfterLastWindowClosed");
    return YES;
}



@end
