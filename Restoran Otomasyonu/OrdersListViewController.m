//
//  OrdersListViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 22/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "OrdersListViewController.h"
#import "OrdersTableViewCell.h"
#import "Helper.h"


@interface OrdersListViewController ()

@property (strong, nonatomic) NSArray *allOrders;

@end

@implementation OrdersListViewController

-(instancetype)initWithhDeskNumber:(int)deskNumber {

    if( self ) {
    
        self.deskNumber = deskNumber;
    
    }
    
    return self;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    OrderHelper *sendRequest = [[OrderHelper alloc] initWithDelegate:self];
    [sendRequest sendOrderRequestWithDeskID:self.deskNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ordersDoneButtonPressed:(UIButton *)sender {
    
    DailyListServer *server = [[DailyListServer alloc] initWithDelegate:self];
    
    double totalPrice = 0;
    
    for( OrderObject *object in self.allOrders ) {
    
        totalPrice = totalPrice + object.totalPrice;
        
    }
    
    [server sendDailyListObjectFromClientToParseBackend:[ListObject getListObjectWithDeskID:self.deskNumber andTotalPrice:totalPrice andDate:[Helper getDateFormatLikeDDMMYYYY] andHour:[Helper getHourFormatLikeHHMM]]];
    
    OrderServer *order = [[OrderServer alloc]initWithDelegate:self];
    
    [order deleteAllOrderWithDeskNumber:self.deskNumber];
    
    [self.navigationController popViewControllerAnimated:true];
    
}


#pragma mark - UITableViewDelegate-DataSource


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrdersTableViewCell *cell = [OrdersTableViewCell cellForTableView:tableView];
    
    OrderObject *order = self.allOrders[indexPath.row];
    
    [cell setupCellWithUsingOrderObject:order];

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.allOrders.count;
}

#pragma mark - OrderHelperDelegate

-(void)getAllOrderObject:(NSArray *)orders{

    self.allOrders = orders;
    [self.tableView reloadData];

}


@end
