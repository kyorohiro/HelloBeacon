#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <IOBluetooth/IOBluetooth.h>
#import <AVFoundation/AVFoundation.h>

@interface HelloBeaconDiscover : NSObject<CBCentralManagerDelegate>
@property CBCentralManager *mManager;
- (void)startDiscoverBeacon;
@end
