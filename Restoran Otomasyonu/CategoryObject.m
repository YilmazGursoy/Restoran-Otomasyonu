//
//  CategoryObject.m
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "CategoryObject.h"

@implementation CategoryObject


+(CategoryObject*)getCategoryWithDesc:(NSString*)categoryDesc andCategoryState:(int)categoryState andCategoryID:(int)categoryID {


    CategoryObject *object = [[CategoryObject alloc] init];

    object.categoryDesc = categoryDesc;
    
    object.state = categoryState;
    
    object.categoryID = categoryID;
    
    return object;

}

@end
