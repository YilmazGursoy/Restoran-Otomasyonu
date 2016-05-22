//
//  InsideOfDeskViewController.m
//  Restoran Otomasyonu
//
//  Created by Most Wanted on 20/05/16.
//  Copyright © 2016 YilmazGursoy. All rights reserved.
//

#import "InsideOfDeskViewController.h"
#import "DeskInsideTableViewCell.h"
#import "OrdersListViewController.h"
#import "CategoryObject.h"
#import "ProductObject.h"

@interface InsideOfDeskViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *allCategoryNames;
@property (strong, nonatomic) NSArray *allProductObjects;
@property (strong, nonatomic) NSMutableArray *allProducts;

- (IBAction)ordersButtonPressed:(UIButton *)sender;
@property (nonatomic) int deskNumber;

@end

@implementation InsideOfDeskViewController

-(instancetype)initWithDeskNumber:(int)deskNumber{

    if( self ) {
    
        self.deskNumber = deskNumber;
    
    }
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self setupKeyboardNotification];
    
    CategoryHelper *helper = [[CategoryHelper alloc ]initWithDelegate:self];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate/DataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DeskInsideTableViewCell *cell = [DeskInsideTableViewCell cellForTableView:tableView];
    
    NSArray *sectionProducts = self.allProducts[indexPath.section];
    
    ProductObject *object = sectionProducts[indexPath.row];
    
    [cell setupCellWithProductObject:object andDeskNumber:self.deskNumber];
    
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"Section = %d",(int)section);
    
    NSMutableArray *array = self.allProducts[(int)section];
    
    return array.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    CategoryObject *newCategoryObject = self.allCategoryNames[section];
    
    return newCategoryObject.categoryDesc;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.allCategoryNames.count;
}


#pragma mark - CategoryHelperDelegate

-(void)getAllCategoriesObject:(NSArray *)insideCategories{

    if( insideCategories.count > 0 ) {
    
        self.allCategoryNames = insideCategories;
        ProductHelper *proHelper = [[ProductHelper alloc] initWithDelegate:self];
        [self.tableView reloadData];
        
    } else {
    
        [self showAlertWithTitle:@"Dikkat" andDescription:@"Kategori Listesi Boş"];
        
    }
    
}

#pragma mark - ProductHelperDelegate

-(void)getAllProductObject:(NSArray *)products{
    
    self.allProducts = [[NSMutableArray alloc] init];
    
    if(products.count > 0) {
    
    for (int i = 1  ; i <= self.allCategoryNames.count; i++) {
        
        NSMutableArray *category = [[NSMutableArray alloc]init];
        
        for( ProductObject *object in products ) {
        
            if( object.categoryID == i ) {
            
                [category addObject:object];
                
            }
        
        }
        
        [self.allProducts addObject:category];
    
    }
        [self.tableView reloadData];
    } else {
    
        [self showAlertWithTitle:@"Dikkat" andDescription:@"Product Sayisinda hata cikti"];
        
    }

}

-(void)setupKeyboardNotification {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

}

#pragma mark - HelperFunctions

- (void)keyboardWillShow:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets;
    if (UIInterfaceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation])) {
        contentInsets = UIEdgeInsetsMake(0.0, 0.0, (keyboardSize.height), 0.0);
    } else {
        contentInsets = UIEdgeInsetsMake(0.0, 0.0, (keyboardSize.width), 0.0);
    }
    
    self.tableView.contentInset = contentInsets;
    self.tableView.scrollIndicatorInsets = contentInsets;
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    self.tableView.contentInset = UIEdgeInsetsZero;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}

- (IBAction)ordersButtonPressed:(UIButton *)sender {
    
    OrdersListViewController *order = [[OrdersListViewController alloc] initWithhDeskNumber:self.deskNumber];
    
    [self.navigationController pushViewController:order animated:true];
    
}
@end
