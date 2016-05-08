//
//  CategoryServer.m
//  Rehberim
//
//  Created by Most Wanted on 28/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//


#import "CategoryServer.h"

@implementation CategoryServer

-(instancetype)initWithDelegate:(id<CategoryDelegate>)delegate{
    
    if( self ) {
        self.delegate = delegate;
        [self sendRequestToGetAllCategories];
    }
    
    return self;
}


-(void)sendRequestToGetAllCategories {
    
    PFQuery *query = [PFQuery queryWithClassName:@"kategoriler"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        if( !error ) {
            
            [self.delegate getAllCategoryRequestSucceed:objects];
            
        }
        else {
            
            NSLog(@"Error ----- -(void)sendRequestToGetAllCategories");
        
        }
        
    }];
    
    
}


@end
