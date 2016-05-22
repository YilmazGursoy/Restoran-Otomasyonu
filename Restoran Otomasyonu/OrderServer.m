//
//  OrderServer.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 21/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "OrderServer.h"

@implementation OrderServer

-(instancetype)initWithDelegate:(id<OrderServerDelegate>)delegate{
    
    if( self ) {
        self.delegate = delegate;
    }
    
    return self;
}

-(void)sendOrdersDataFromClientToParseBackend:(OrderObject*)orderObject{

    PFObject *object = [PFObject objectWithClassName:@"siparis"];
    
    [object setObject:@(orderObject.deskID) forKey:@"masaid"];
    
    [object setObject:@(orderObject.categoryID) forKey:@"kategoriid"];
    
    [object setObject:orderObject.productName forKey:@"urunad"];
    
    [object setObject:@(orderObject.unitPrice) forKey:@"birimfiyat"];
    
    [object setObject:@(orderObject.totalPrice) forKey:@"fiyat"];
    
    [object setObject:@(orderObject.count) forKey:@"adet"];
    
    [object setObject:@(orderObject.state) forKey:@"durum"];
    
    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if( error ) {
        
            NSLog(@"There is an error SendingOrderList -- -(void)sendOrdersDataFromClientToParseBackend:(OrderObject*)orderObject");
            [self.delegate sendingOrderRequestAnswerIsSucceded:false];
            
        } else {
        
            [self.delegate sendingOrderRequestAnswerIsSucceded:true];
        
        }
        
    }];
    

}

-(void)sendRequestToGetAllOrdersWithDeskID:(int)deskID {
    
    PFQuery *query = [PFQuery queryWithClassName:@"siparis"];
    
    [query whereKey:@"masaid" equalTo:@(deskID)];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if( !error ) {
            
            [self.delegate getAllOrderObjectsRequestSucceed:objects];
            
        }
        else {
            
            NSLog(@"Error ------(void)sendRequestToGetAllOrders");
            
        }
        
    }];
    
    
}

-(void)deleteOrderWithOrderObject:(OrderObject*)deletingObject{

    PFQuery *query = [PFQuery queryWithClassName:@"siparis"];
    PFObject *object = [query getObjectWithId:deletingObject.objectID];
    
    [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        
        if( error ) {
        
            NSLog(@"There is an Error");
            [self.delegate sendingOrderRequestAnswerIsSucceded:false];
            
        } else {
        
            [self.delegate sendingOrderRequestAnswerIsSucceded:true];
        
        }
        
    }];

}

-(void)deleteAllOrderWithDeskNumber:(int)deskNumber {

    PFQuery *query = [PFQuery queryWithClassName:@"siparis"];
    
    [query whereKey:@"masaid" equalTo:@(deskNumber)];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
       
        if( !error ) {
        
            for( PFObject *deletingObject in objects ) {
            
                [deletingObject deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                
                    if(  error ) {
                    
                        NSLog(@"Object deleting is Failed");
                    
                    } else {
                    
                        NSLog(@"Object deleting is succeeded");
                    
                    }
                    
                }];
            
            }
        
        
        }
        
    }];
    


}

@end
