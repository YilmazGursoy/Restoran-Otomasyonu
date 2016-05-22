//
//  OrderHelper.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 21/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderServer.h"
#import "OrderObject.h"

@protocol OrderHelperDelegate <NSObject>

@required

-(void)getAllOrderObject:(NSArray*)orders;

-(void)isSucceeded:(BOOL)isSucceeded;


@end


@interface OrderHelper : NSObject < OrderHelperDelegate, OrderServerDelegate >

@property (strong, nonatomic) id<OrderHelperDelegate> delegate;

-(instancetype)initWithDelegate:(id<OrderHelperDelegate>) delegate;

-(void)sendOrderDataFromClintToParseServer:(OrderObject*)orderObject;

-(void)orderDeleteWithOrderObject:(OrderObject*)deletingObject;

-(void)sendOrderRequestWithDeskID:(int)deskID;

@end
