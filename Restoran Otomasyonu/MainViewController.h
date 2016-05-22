//
//  MainViewController.h
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "BaseViewController.h"
#import "DailyListHelper.h"
#import "ListObject.h"
#import "DailyListServer.h"
#import "OrderObject.h"
#import "OrderHelper.h"

@interface MainViewController : BaseViewController < UITableViewDelegate, UITableViewDataSource , DailyListHelperDelegate, DailyListServerDelegate, OrderHelperDelegate>
@property (weak, nonatomic) IBOutlet UIButton *desk1;
@property (weak, nonatomic) IBOutlet UIButton *desk2;
@property (weak, nonatomic) IBOutlet UIButton *desk3;
@property (weak, nonatomic) IBOutlet UIButton *desk4;
@property (weak, nonatomic) IBOutlet UIButton *desk5;
@property (weak, nonatomic) IBOutlet UIButton *desk6;
@property (weak, nonatomic) IBOutlet UIButton *desk7;
@property (weak, nonatomic) IBOutlet UIButton *desk8;
@property (weak, nonatomic) IBOutlet UIButton *desk9;
@property (weak, nonatomic) IBOutlet UIButton *desk10;
@property (weak, nonatomic) IBOutlet UIButton *desk11;
@property (weak, nonatomic) IBOutlet UIButton *desk12;
@end
