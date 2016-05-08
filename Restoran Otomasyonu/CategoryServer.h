//
//  CategoryServer.h
//  Rehberim
//
//  Created by Most Wanted on 28/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Server.h"

@protocol CategoryDelegate <NSObject>

@required

-(void)getAllCategoryRequestSucceed:(NSArray*)allList;

@end


@interface CategoryServer : Server < CategoryDelegate >

@property (strong, nonatomic) id<CategoryDelegate> delegate;


-(instancetype)initWithDelegate:(id<CategoryDelegate>)delegate;

@end