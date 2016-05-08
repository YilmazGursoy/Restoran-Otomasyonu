//
//  DailyListHelper.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 08/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "DailyListHelper.h"
#import "ListObject.h"


@implementation DailyListHelper

-(instancetype)initWithDelegate:(id<DailyListHelperDelegate>)delegate {

    if( self ) {
        
        self.delegate = delegate;
        [self sendDailyListRequest];
    }
    
    return self;

}

-(void)sendDailyListRequest{
    
    DailyListServer *dailyListObject = [[DailyListServer alloc] initWithDelegate:self];

}


-(void)getDailyListObjectsFromServerClass:(NSArray *)allDatas {
    
    NSMutableArray *allListObjects = [[NSMutableArray alloc]init];
    
    if( allDatas.count <= 0 ) {
    
        NSLog(@"There isnt any allDatasObject");
        NSLog(@"-(void)getDailyListObjectsFromServerClass:(NSArray *)allDatas");
    
    } else {
    
        for( NSDictionary *data in allDatas ) {
        
            [allListObjects addObject:[ListObject getListObjectWithDeskID:[data[@"masaid"] intValue] andTotalPrice:[data[@"tutar"] doubleValue] andDate:data[@"tarih"] andHour:data[@"saat"]]];
        
        }
        
        [self.delegate getAllDailyListObjects:allListObjects];
        
    }
    
}

@end
