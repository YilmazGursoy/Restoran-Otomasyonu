//
//  MainViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 07/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "MainViewController.h"
#import "DailyListTableViewCell.h"


@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dailyTotalPrice;
@property (weak, nonatomic) IBOutlet UITableView *dailyListTableView;
@property (strong, nonatomic) NSMutableArray *dailyListObjects;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dailyListTableView.delegate = self;
    self.dailyListTableView.dataSource = self;
    
    DailyListHelper *listHelper = [[DailyListHelper alloc] initWithDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deskButtonPressed:(UIButton *)sender {

    

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

-(void)getAllDailyListObjects:(NSArray *)allDailyList {

    self.dailyListObjects = [allDailyList mutableCopy];
    [self.dailyListTableView reloadData];
}

@end
