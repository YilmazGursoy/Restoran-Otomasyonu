//
//  OrderServer.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 21/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"
#import "OrderObject.h"

@protocol OrderServerDelegate <NSObject>

@required

-(void)getAllOrderObjectsRequestSucceed:(NSArray*)allOrderList;
-(void)sendingOrderRequestAnswerIsSucceded:(BOOL)isSucceeded;

@end


@interface OrderServer : Server < OrderServerDelegate >

@property (strong, nonatomic) id < OrderServerDelegate > delegate;

-(instancetype)initWithDelegate:(id<OrderServerDelegate>) delegate;

-(void)sendRequestToGetAllOrdersWithDeskID:(int)deskID;

-(void)sendOrdersDataFromClientToParseBackend:(OrderObject*)orderObject;

-(void)deleteOrderWithOrderObject:(OrderObject*)deletingObject;

-(void)deleteAllOrderWithDeskNumber:(int)deskNumber;

@end
