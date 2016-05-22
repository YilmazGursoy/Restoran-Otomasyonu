//
//  OrderObject.h
//  
//
//  Created by Most Wanted on 06/05/16.
//
//

#import <Foundation/Foundation.h>

@interface OrderObject : NSObject

@property (nonatomic) int deskID;
@property (nonatomic) int categoryID;
@property (nonatomic) double unitPrice;
@property (nonatomic) double totalPrice;
@property (nonatomic) int count;
@property (nonatomic) int state;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString* objectID;

+(OrderObject*)getOrderObjectWithDeskID:(int)deskID andCategoryID:(int)categoryID andProductName:(NSString*)productName andUnitPrice:(double)unitPrice andTotalPrice:(double)totalPrice andCount:(int)count andState:(int)state andFinallyObjectID:(NSString*)objectID;

+(OrderObject*)getOrderObjectWithDeskID:(int)deskID andCategoryID:(int)categoryID andProductName:(NSString*)productName andUnitPrice:(double)unitPrice andTotalPrice:(double)totalPrice andCount:(int)count andState:(int)state;

@end
