#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)onPushStartDiscover:(id)sender
{
    self.mBeaconDiscover = [[HelloBeaconDiscover alloc] init];
    [self.mBeaconDiscover startDiscoverBeacon];
}

@end
