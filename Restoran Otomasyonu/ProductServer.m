//
//  ProductServer.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "ProductServer.h"

@implementation ProductServer

-(instancetype)initWithDelegate:(id<ProductServerDelegate>)delegate{
    
    if( self ) {
        self.delegate = delegate;
        [self sendRequestToGetAllProducts];
    }
    
    return self;
}

-(void)sendRequestToGetAllProducts {
    
    PFQuery *query = [PFQuery queryWithClassName:@"urunler"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if( !error ) {
            
            [self.delegate getAllProductObjectsRequestSucceed:objects];
            
        }
        else {
            
            NSLog(@"Error ----- -(void)sendRequestToGetAllProducts");
            
        }
        
    }];
    
    
}



@end
