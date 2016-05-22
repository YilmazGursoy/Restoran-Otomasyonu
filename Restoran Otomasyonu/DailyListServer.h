//
//  DailyListServer.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 08/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "Server.h"
#import "ListObject.h"

@protocol DailyListServerDelegate <NSObject>

@required

-(void)getDailyListObjectsFromServerClass:(NSArray*)allDatas;
-(void)isDeletedAllDailyListDatas:(BOOL)isDeleted;

@end


@interface DailyListServer : Server <DailyListServerDelegate>

@property (strong, nonatomic) id<DailyListServerDelegate> delegate;

-(instancetype)initWithDelegate:(id<DailyListServerDelegate>) delegate;

-(void)deleteListParseBackendData;

-(void)sendRequestToAllDailyListDatas;

-(void)sendDailyListObjectFromClientToParseBackend:(ListObject*)listObject;

@end
