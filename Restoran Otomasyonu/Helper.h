//
//  Helper.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 21/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderObject.h"
#import "ProductObject.h"


@interface Helper : NSObject

+(OrderObject*)changeProductObjectToOrderObject:(ProductObject*)productObject andDeskNumber:(int)deskNumber andTextFieldCount:(NSString*)insideMeatCountTextFieldText;

+(NSString*)getDateFormatLikeDDMMYYYY;
+(NSString*)getHourFormatLikeHHMM;
@end
