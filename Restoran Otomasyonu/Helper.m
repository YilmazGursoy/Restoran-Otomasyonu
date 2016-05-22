//
//  Helper.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 21/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(OrderObject*)changeProductObjectToOrderObject:(ProductObject*)productObject andDeskNumber:(int)deskNumber andTextFieldCount:(NSString*)insideMeatCountTextFieldText{

    OrderObject *changingOrderObject = [OrderObject getOrderObjectWithDeskID:deskNumber
                            andCategoryID:productObject.categoryID
                           andProductName:productObject.productName
                             andUnitPrice:productObject.price
                            andTotalPrice:productObject.price * insideMeatCountTextFieldText.intValue
                                 andCount:insideMeatCountTextFieldText.intValue andState:productObject.state];
    
    return changingOrderObject;
    
}


+(NSString*)getDateFormatLikeDDMMYYYY {

    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger day = [components day];
    NSInteger month = [components month];
    NSInteger year = [components year];

    return [NSString stringWithFormat:@"%ld/%ld/%ld",(long)day,month,year];
}
+(NSString*)getHourFormatLikeHHMM {

    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    return [NSString stringWithFormat:@"%ld:%ld",hour,minute];
}

@end
