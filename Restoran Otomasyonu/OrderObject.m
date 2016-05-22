//
//  OrderObject.m
//  
//
//  Created by Most Wanted on 06/05/16.
//
//

#import "OrderObject.h"

@implementation OrderObject



+(OrderObject*)getOrderObjectWithDeskID:(int)deskID andCategoryID:(int)categoryID andProductName:(NSString*)productName andUnitPrice:(double)unitPrice andTotalPrice:(double)totalPrice andCount:(int)count andState:(int)state andFinallyObjectID:(NSString*)objectID{

    OrderObject *object = [[OrderObject alloc] init];

    [object setDeskID:deskID];
    
    [object setCategoryID:categoryID];
    
    [object setProductName:productName];
    
    [object setUnitPrice:unitPrice];
    
    [object setTotalPrice:totalPrice];
    
    [object setCount:count];
    
    [object setState:state];
    
    [object setObjectID:objectID];
    
    return object;
    
}

+(OrderObject*)getOrderObjectWithDeskID:(int)deskID andCategoryID:(int)categoryID andProductName:(NSString*)productName andUnitPrice:(double)unitPrice andTotalPrice:(double)totalPrice andCount:(int)count andState:(int)state {

    OrderObject *object = [[OrderObject alloc] init];
    
    [object setDeskID:deskID];
    
    [object setCategoryID:categoryID];
    
    [object setProductName:productName];
    
    [object setUnitPrice:unitPrice];
    
    [object setTotalPrice:totalPrice];
    
    [object setCount:count];
    
    [object setState:state];
    
    return object;

}


@end
