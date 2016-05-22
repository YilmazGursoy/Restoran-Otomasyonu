//
//  CategoryHelper.h
//  Rehberim
//
//  Created by Most Wanted on 28/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryServer.h"
#import "CategoryObject.h"


@protocol CategoryHelperDelegate <NSObject>

@required

-(void)getAllCategoriesObject:(NSArray*)insideCategories;



@end


@interface CategoryHelper : NSObject <CategoryDelegate,CategoryHelperDelegate>

@property (strong, nonatomic) id<CategoryHelperDelegate> delegate;


-(instancetype)initWithDelegate:(id<CategoryHelperDelegate>)delegate;

@end
