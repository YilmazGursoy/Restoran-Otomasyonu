//
//  DailyListServer.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 08/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"

@protocol DailyListServerDelegate <NSObject>

@required

-(void)getDailyListObjectsFromServerClass:(NSArray*)allDatas;

@end


@interface DailyListServer : Server <DailyListServerDelegate>

@property (strong, nonatomic) id<DailyListServerDelegate> delegate;

-(instancetype)initWithDelegate:(id<DailyListServerDelegate>) delegate;

@end
