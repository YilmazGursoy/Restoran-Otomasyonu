//
//  CategoryObject.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CategoryObject : NSObject

@property (strong, nonatomic) NSString *categoryDesc;

@property (nonatomic) int state;

@property (nonatomic) int categoryID;

+(CategoryObject*)getCategory:(NSString*)categoryDesc andCategoryState:(int)categoryState andCategoryID:(int)categoryID;

@end
