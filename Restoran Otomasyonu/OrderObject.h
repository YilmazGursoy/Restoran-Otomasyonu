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
@property (nonatomic) int unitPrice;
@property (nonatomic) int totalPrice;
@property (nonatomic) int count;
@property (nonatomic) int state;
@property (strong, nonatomic) NSString *productName;

+(OrderObject*)getOrderObjectWithDeskID:(int)deskID andCategoryID:(int)categoryID amdProductName:(NSString*)productName andUnitPrice:(int)unitPrice andTotalPrice:(int)totalPrice andCount:(int)count andState:(int)state;

@end
