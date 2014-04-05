#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>
#import <CoreLocation/CoreLocation.h>


@interface HelloBeacon : NSObject<CBPeripheralManagerDelegate>

@property NSString* mUuid;
@property uint16_t mMajor;
@property uint16_t mMinor;
@property int16_t mMeasuredPower;
@property CBPeripheralManager *manager;

- (id)initWithUUID:(NSString*)uuid major:(uint16_t)major minor:(uint16_t)minor measuredPower:(int8_t)power;
- (NSDictionary *)createAdvertisementData;
- (void) startBeacon;

@end
