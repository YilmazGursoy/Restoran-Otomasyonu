//
//  OrderHelper.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 21/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "OrderHelper.h"


@implementation OrderHelper

-(instancetype)initWithDelegate:(id<OrderHelperDelegate>)delegate {
    
    if( self ) {
        
        self.delegate = delegate;
    }
    
    return self;

}

-(void)sendOrderDataFromClintToParseServer:(OrderObject*)orderObject {
    
    OrderServer *server = [[OrderServer alloc] initWithDelegate:self];
    [server sendOrdersDataFromClientToParseBackend:orderObject];
    
}

-(void)sendOrderRequestWithDeskID:(int)deskID{
    
    OrderServer *server = [[OrderServer alloc]initWithDelegate:self];
    
    [server sendRequestToGetAllOrdersWithDeskID:deskID];

}

-(void)orderDeleteWithOrderObject:(OrderObject*)deletingObject{

    OrderServer *server = [[OrderServer alloc] initWithDelegate:self];
    
    [server deleteOrderWithOrderObject:deletingObject];
    
}

-(void)getAllOrderObjectsRequestSucceed:(NSArray *)allOrderList{

    NSMutableArray *allOrderObjects = [[NSMutableArray alloc]init];
    
    if( allOrderList.count > 0 ) {
    
        for( PFObject *orderObjectDictionary in allOrderList ) {
            
            [allOrderObjects addObject:[OrderObject getOrderObjectWithDeskID:[orderObjectDictionary[@"masaid"] intValue] andCategoryID:[orderObjectDictionary[@"kategoriid"] intValue] andProductName:orderObjectDictionary[@"urunad"] andUnitPrice:[orderObjectDictionary[@"birimfiyat"] doubleValue] andTotalPrice:[orderObjectDictionary[@"fiyat"] doubleValue] andCount:[orderObjectDictionary[@"adet"] intValue] andState:[orderObjectDictionary[@"durum"] intValue] andFinallyObjectID:orderObjectDictionary.objectId]];
        }
        
        [self.delegate getAllOrderObject:allOrderObjects];
    
    } else {
    
        NSLog(@"Error - -(void)getAllOrderObjectsRequestSucceed:(NSArray *)allOrderList");
        [self.delegate getAllOrderObject:nil];
        
    }
    

}

-(void)sendingOrderRequestAnswerIsSucceded:(BOOL)isSucceeded {

    if( isSucceeded ) {
    
        [self.delegate isSucceeded:true];
    
    } else {
    
        [self.delegate isSucceeded:false];
    
    }

}

@end
