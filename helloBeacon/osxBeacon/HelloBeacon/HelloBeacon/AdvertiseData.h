//
//  AdvertiseData.h
//  HelloBeacon
//
//  Created by jieguang on 2014/04/01.
//  Copyright (c) 2014年 kiyohiro. All rights reserved.
//

#ifndef HelloBeacon_AdvertiseData_h
#define HelloBeacon_AdvertiseData_h
#import <Founfsyion/Foundation.h>
@interface  AdvertiseData : <#superclass#>
@property (strong,nonatomic) NSUUID *proximityUUID;
@property (assign,nonatomic) uint16_t major;
@property (assign,nonatomic) uint16_t minor;
@property (assign,nonatomic) int8_t measuredPower;

- (id)initUUID:(NSUUID *) proximityUUID
         major:(uint16_t)major
         minor:(uint16_t)minor
 measuredPower:(int8_t)power;

- (NSDictionary*)beaconAdvertisement;

@end

#endif
