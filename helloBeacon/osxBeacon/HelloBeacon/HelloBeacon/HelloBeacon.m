#import "HelloBeacon.h"

@implementation HelloBeacon


- (id)initWithUUID:(NSString *)uuid major:(uint16_t)major minor:(uint16_t)minor measuredPower:(int8_t)power
{
    self = [super init];
    self.mUuid = uuid;
    self.mMajor = major;
    self.mMinor = minor;
    self.mMeasuredPower = power;
    return self;
}

- (void)startBeacon
{
    self.manager = [[CBPeripheralManager alloc] initWithDelegate:self queue: nil];
}

- (NSDictionary *)createAdvertisementData
{
    NSString *beaconKey = @"kCBAdvDataAppleBeaconKey";
    unsigned char uuidAsBytes[21] = {0};
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:self.mUuid];

    [uuid getUUIDBytes:(unsigned char *)&uuidAsBytes];
    
    uuidAsBytes[16] = (unsigned char)(self.mMajor >> 8);
    uuidAsBytes[17] = (unsigned char)(self.mMajor & 0xFF);
    
    uuidAsBytes[18] = (unsigned char)(self.mMinor >> 8);
    uuidAsBytes[19] = (unsigned char)(self.mMinor & 0xFF);
    
    uuidAsBytes[20] = self.mMeasuredPower;
    
    NSMutableData *advertisement = [NSMutableData dataWithBytes:uuidAsBytes length:21];
    
    return [NSDictionary dictionaryWithObject:advertisement forKey:beaconKey];
}

- (void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error
{
    NSLog(@"---peripheralManagerDidStartAdvertising");
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    NSLog(@"---peripheralManagerDidUpdateState()");
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        [peripheral startAdvertising:[self createAdvertisementData]];
    }
}
@end