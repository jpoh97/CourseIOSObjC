//
//  MenuListTableViewController.m
//  CursoAcamica
//
//  Created by Juan Pablo Ospina Herrera on 3/27/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

#import "MenuListTableViewController.h"
#import "Food.h"
#import "FoodTableViewCell.h"

@interface MenuListTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *foods;

@end

@implementation MenuListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self remoteCall];
    
//    Food *spaghetti = [[Food alloc] init];
//    spaghetti.name = @"Spaghetti";
//    spaghetti.foodDescription = @"Spaghetti description";
//    spaghetti.imageName = @"spaghetti.jpg";
//
//    Food *fish = [[Food alloc] init];
//    fish.name = @"Fish";
//    fish.foodDescription = @"Fish description";
//    fish.imageName = @"fish";
//
//    Food *chicken = [[Food alloc] init];
//    chicken.name = @"Chicken";
//    chicken.foodDescription = @"Chicken description";
//    chicken.imageName = @"chicken.jpg";
//
//    self.foods = @[spaghetti, fish, chicken];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Food *food = [self.foods objectAtIndex:indexPath.item];
    
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodCellIdentifier" forIndexPath:indexPath];
    
    [cell setTitle:food.name description:food.foodDescription andImageName:food.imageName];
    
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


#pragma mark - Networking

- (void) remoteCall {
    NSString *url = @"https://api.myjson.com/bins/2f2qi";
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    __weak MenuListTableViewController *weakSelf = self;
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            //Success Response
            if ([response isKindOfClass:[NSHTTPURLResponse class ]]) {
                NSError *jsonError;
                NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                if (!jsonError) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        weakSelf.foods = [[NSMutableArray alloc] init];
                        
                        for (NSDictionary *element in jsonResponse) {
                            Food *food = [[Food alloc] init];
                            food.name = [element objectForKey:@"name"];
                            food.imageName = [element objectForKey:@"foodImage"];
                            food.foodDescription = [element objectForKey:@"foodDescription"];
                            
                            [weakSelf.foods addObject:food];
                        }
                        
                        [weakSelf.tableView reloadData];
                    });
                }
            }
        }
    }];
    
    [dataTask resume];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


typedef void (^simpleBlock)(void);

-(void) genericMethod {
    simpleBlock block = ^{
        NSLog(@"Esto es un bloque", nil);
    };
    block(); 
}

@end
