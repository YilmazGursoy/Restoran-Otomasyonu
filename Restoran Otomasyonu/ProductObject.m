//
//  CityObject.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "ProductObject.h"

@implementation ProductObject

+(ProductObject*)getProductObjectWithName:(NSString *)productName andProductDesc:(NSString*)productDesc andPrice:(int)price andState:(int)state andCategoryID:(int)categoryID {

    ProductObject *object = [[ProductObject alloc] init];
    
    object.productName = productName;
    
    object.productDesc = productDesc;
    
    object.price = price;
    
    object.state = state;
    
    object.categoryID = categoryID;

    return object;
    
}


@end
