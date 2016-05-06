
//
//  ListObject.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 06/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "ListObject.h"

@implementation ListObject

+(ListObject*)getListObjectWithDeskID:(int)deskID andTotalPrice:(int)totalPrice andDate:(NSString*)date andHour:(NSString*)hour {
    
    ListObject *object = [[ListObject alloc] init];
    
    [object setDeskID:deskID];
    
    [object setTotalPrice:totalPrice];
    
    [object setDate:date];
    
    [object setHour:hour];
    
    return object;

}

@end
