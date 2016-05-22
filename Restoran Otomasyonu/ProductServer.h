//
//  ProductServer.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"

@protocol ProductServerDelegate <NSObject>

@required

-(void)getAllProductObjectsRequestSucceed:(NSArray*)allList;

@end

@interface ProductServer : Server < ProductServerDelegate >

@property (strong, nonatomic) id<ProductServerDelegate> delegate;

-(instancetype)initWithDelegate:(id<ProductServerDelegate>) delegate;

@end
