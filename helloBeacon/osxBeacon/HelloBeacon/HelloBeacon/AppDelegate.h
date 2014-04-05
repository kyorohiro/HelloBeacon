#import <Cocoa/Cocoa.h>
#import <CoreLocation/CoreLocation.h>
#import <IOBluetooth/IOBluetooth.h>
#import "HelloBeacon.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSTextField *mUUIDField;
@property HelloBeacon *mBeacon;
@property (weak) IBOutlet NSTextField *mMajor;
@property (weak) IBOutlet NSTextField *mMinor;
@property (weak) IBOutlet NSTextField *mmeasuredPower;
@property (assign) IBOutlet NSWindow *window;
@end
