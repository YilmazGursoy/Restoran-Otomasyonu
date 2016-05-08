//
//  ListObject.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListObject : NSObject

@property (nonatomic) int deskID;

@property (nonatomic) double totalPrice;

@property (strong, nonatomic) NSString *date;

@property (strong, nonatomic) NSString *hour;

+(ListObject*)getListObjectWithDeskID:(int)deskID andTotalPrice:(double)totalPrice andDate:(NSString*)date andHour:(NSString*)hour;

@end
