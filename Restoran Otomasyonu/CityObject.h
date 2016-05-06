//
//  CityObject.h
//  Rehberim
//
//  Created by Most Wanted on 27/04/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProductObject : NSObject


@property (nonatomic) int categoryID;
@property (nonatomic) int price;
@property (nonatomic) int state;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productDesc;


+(ProductObject*)getProductObjectWithName:(NSString *)productName andProductDesc:(NSString*)productDesc andPrice:(int)price andState:(int)state andCategoryID:(int)categoryID;

@end
