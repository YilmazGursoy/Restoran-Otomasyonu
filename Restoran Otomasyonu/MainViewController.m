//
//  MainViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "MainViewController.h"
#import "DailyListTableViewCell.h"
#import "InsideOfDeskViewController.h"
#import "OrdersListViewController.h"



@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;

@property (weak, nonatomic) IBOutlet UILabel *dailyTotalPrice;
@property (weak, nonatomic) IBOutlet UITableView *dailyListTableView;
@property (strong, nonatomic) NSMutableArray *dailyListObjects;
@property (strong, nonatomic) NSArray *allDesks;

@end

@implementation MainViewController

static int deskNumber = 1;

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear: animated];
    
    [self setupDeskIsDeskEmptyOrNot];
    
    DailyListHelper *listHelper = [[DailyListHelper alloc] initWithDelegate:self];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usernameLabel setText:[Server getUsername]];
    
    self.allDesks = @[_desk1,_desk2,_desk3,_desk4,_desk5,_desk6,_desk7,_desk8,_desk9,_desk10,_desk11,_desk12];
    
    self.dailyListTableView.delegate = self;
    
    self.dailyListTableView.dataSource = self;
    
    [self setupDeskIsDeskEmptyOrNot];
    
    DailyListHelper *listHelper = [[DailyListHelper alloc] initWithDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource-UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dailyListObjects.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DailyListTableViewCell *cell = [DailyListTableViewCell cellForTableView:tableView];
    
    ListObject *listObject = self.dailyListObjects[indexPath.row];
    
    [cell setupCellWithListObject:listObject];
    
    return cell;
    
}

#pragma mark - DailyListHelperDelegateMethods

-(void)getAllDailyListObjects:(NSArray *)allDailyList {

    self.dailyListObjects = [allDailyList mutableCopy];
    double totalPrice = 0 ;
    for( ListObject *objet in allDailyList ) {
        totalPrice = totalPrice + objet.totalPrice;
    }
    [self.dailyTotalPrice setText:[NSString stringWithFormat:@"%.2f",totalPrice]];
    [self.dailyListTableView reloadData];
}


#pragma mark - DailyListServerDelegateMethods

-(void)isDeletedAllDailyListDatas:(BOOL)isDeleted{

    if( isDeleted ) {
    
        [self showAlertWithTitle:@"Uyarı" andDescription:@"Günlük Birikim Tablosu Temizlenmiştir"];
        self.dailyListObjects = nil;
        [self.dailyTotalPrice setText:@""];
        [self.dailyListTableView reloadData];
        
        
    } else {
        
        [self showAlertWithTitle:@"Uyarı" andDescription:@"Günlük Birikim Tablosu temizlenirken bir hata oluştu"];
        
    }
    
}

#pragma mark - UIButtons

- (IBAction)deskButtonPressed:(UIButton *)sender {
    
    InsideOfDeskViewController *VC = [[InsideOfDeskViewController alloc] initWithDeskNumber:sender.currentTitle.intValue];
    
    [self.navigationController pushViewController:VC animated:true];
    
}

- (IBAction)dayFinishedButtonPressed:(UIButton *)sender {
    
    DailyListServer *dailyListServer = [[DailyListServer alloc] initWithDelegate:self];
    [dailyListServer deleteListParseBackendData];
    
}

#pragma mark - HelperMethods

-(void)setupDeskIsDeskEmptyOrNot{

    
    if( deskNumber <= 12 ) {
    
        OrderHelper *sendOrderRequestForDeskIsEmptyOrNot = [[OrderHelper alloc]initWithDelegate:self];
        
        [sendOrderRequestForDeskIsEmptyOrNot sendOrderRequestWithDeskID:deskNumber];
    
    } else {
    
        deskNumber = 1;
        
    }
    
}

-(void)getAllOrderObject:(NSArray *)orders{

    if( orders.count>0 ) {
    
        [self changeDeskBackgroundToFull:deskNumber];
        
    } else {
    
        [self changeDeskBackgroundColorToEmpty:deskNumber];
    
    }

}

-(void)changeDeskBackgroundToFull:(int)deskID{
    
    [self.allDesks[deskID-1] setBackgroundColor:[UIColor redColor]];
    deskNumber += 1;
    [self setupDeskIsDeskEmptyOrNot];
}

-(void)changeDeskBackgroundColorToEmpty:(int)deskID{

    [self.allDesks[deskID-1] setBackgroundColor:[UIColor colorWithRed:0.0 green:163.0 blue:160.0 alpha:1.0]];
    deskNumber += 1;
    [self setupDeskIsDeskEmptyOrNot];

}
- (IBAction)logOutButtonPressed:(UIButton *)sender {
    
    [Server userLogOut];
    
    [self.navigationController popViewControllerAnimated:true];
    
}


@end
