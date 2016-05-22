//
//  ProductHelper.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "ProductHelper.h"
#import "ProductObject.h"


@implementation ProductHelper 

-(instancetype)initWithDelegate:(id<ProductHelperDelegate>)delegate {
    
    if( self ) {
        
        self.delegate = delegate;
        [self sendProductRequest];
    }
    
    return self;
}

-(void)sendProductRequest{
    
    ProductServer *server = [[ProductServer alloc]initWithDelegate:self];
    
}

-(void)getAllProductObjectsRequestSucceed:(NSArray *)allList{

    NSMutableArray *allProductObjects = [[NSMutableArray alloc]init];
    if( allList.count > 0 ) {
        
        for( NSDictionary *dictionary in allList ) {
            
            [allProductObjects addObject:[ProductObject getProductObjectWithName:dictionary[@"urunad"] andProductDesc:dictionary[@"aciklama"] andPrice:[dictionary[@"fiyat"] doubleValue] andState:[dictionary[@"durum"] intValue] andCategoryID:[dictionary[@"kategoriid"] intValue]]];
        }
        
        [self.delegate getAllProductObject:allProductObjects];
        
    } else {
        
        NSLog(@"Error --- ListArrayObject.count <= 0 ---- -(void)getAllProductObjectsRequestSucceed:(NSArray *)allList{");
        
    }

}


@end
