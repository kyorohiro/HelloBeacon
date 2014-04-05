//
//  HelloBeaconDiscover.m
//  HelloBeaconDiscover
//
//  Created by jieguang on 2014/04/06.
//  Copyright (c) 2014年 kiyohiro. All rights reserved.
//

#import "HelloBeaconDiscover.h"

@implementation HelloBeaconDiscover
- (id)init
{
    self.mManager = [[CBCentralManager alloc] initWithDelegate:self queue: nil];
    return self;
};

- (void)startDiscoverBeacon
{
    [self.mManager scanForPeripheralsWithServices:nil options:nil];
};

- (void)stopDiscoverBeacon
{
    [self.mManager stopScan];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    NSLog(@"didDiscoverPeripheral rssi=%d %@",RSSI.intValue, peripheral.name);
    if(advertisementData == nil) {
        return;
    }
    
    for(id key in [advertisementData keyEnumerator]) {
        NSLog(@"key=%@,value=%@", key, [advertisementData valueForKey:key]);
        NSMutableData *advertisement = [advertisementData valueForKey:key];
        if([advertisement length]>25)
        {
            Byte* buffer = (Byte*)[advertisement bytes];
            NSMutableString *builder = [[NSMutableString alloc] init];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[4]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[5]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[6]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[7]]];
            [builder appendString:@"-"];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[8]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[9]]];
            [builder appendString:@"-"];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[10]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[11]]];
            [builder appendString:@"-"];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[12]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[13]]];
            [builder appendString:@"-"];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[14]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[15]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[16]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[17]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[18]]];
            [builder appendString:[NSString stringWithFormat:@"%x", buffer[19]]];
            NSLog(@"===uuid=%d", (int)[advertisement length]);
            NSLog(@"===uuid=%@", builder);

            int major = ((buffer[20]&0xFF)<<8) | (buffer[21]&0xFF);
            int minor = ((buffer[22]&0xFF)<<8) | (buffer[23]&0xFF);
            int measuredPower = buffer[24];
            NSLog(@"===major=%d", major);
            NSLog(@"===minor=%d", minor);
            NSLog(@"===measuredPower=%d", measuredPower);

        }
    }
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    NSLog(@"centralManagerDidUpdateState");
}
@end
