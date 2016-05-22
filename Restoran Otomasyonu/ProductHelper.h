//
//  ProductHelper.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductServer.h"

@protocol ProductHelperDelegate <NSObject>

@required

-(void)getAllProductObject:(NSArray*)products;



@end



@interface ProductHelper : NSObject < ProductHelperDelegate, ProductServerDelegate >

@property (strong, nonatomic) id<ProductHelperDelegate> delegate;

-(instancetype)initWithDelegate:(id<ProductHelperDelegate>) delegate;

@end
