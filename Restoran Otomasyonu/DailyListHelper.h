//
//  DailyListHelper.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 08/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DailyListServer.h"

@protocol DailyListHelperDelegate <NSObject>

@required

-(void)getAllDailyListObjects:(NSArray*)allDailyList;


@end


@interface DailyListHelper : NSObject < DailyListHelperDelegate, DailyListServerDelegate >

@property (strong, nonatomic) id<DailyListHelperDelegate> delegate;

-(instancetype)initWithDelegate:(id<DailyListHelperDelegate>)delegate;

@end
