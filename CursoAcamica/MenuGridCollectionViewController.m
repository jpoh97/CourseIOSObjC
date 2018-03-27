//
//  MenuGridCollectionViewController.m
//  CursoAcamica
//
//  Created by Juan Pablo Ospina Herrera on 3/27/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

#import "MenuGridCollectionViewController.h"
#import "Food.h"
#import "FoodCollectionViewCell.h"

@interface MenuGridCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSArray *foods;

@end

@implementation MenuGridCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    Food *spaghetti = [[Food alloc] init];
    spaghetti.name = @"Spaghetti";
    spaghetti.foodDescription = @"Spaghetti description";
    spaghetti.imageName = @"spaghetti.jpg";
    
    Food *fish = [[Food alloc] init];
    fish.name = @"Fish";
    fish.foodDescription = @"Fish description";
    fish.imageName = @"fish";
    
    Food *chicken = [[Food alloc] init];
    chicken.name = @"Chicken";
    chicken.foodDescription = @"Chicken description";
    chicken.imageName = @"chicken.jpg";
    
    self.foods = @[spaghetti, fish, chicken];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.foods.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Food *food = [self.foods objectAtIndex:indexPath.row];
    
    FoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FoodCellIdentifier2" forIndexPath:indexPath];
    
    // Configure the cell
    
    [cell setTitle:food.name andImageName:food.imageName];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
