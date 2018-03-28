//
//  ViewController.m
//  CursoAcamica
//
//  Created by Juan Pablo Ospina Herrera on 3/27/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSDictionary *dictionary = @{@"key1": @"obj1", @"key2": @"obj2", @"key3": @"obj3"};
    NSMutableDictionary *mutDictionary = [NSMutableDictionary dictionaryWithDictionary:@{@"key1": @"obj1", @"key2": @"obj2", @"key3": @"obj3"}];
    
    [mutDictionary setObject:@"obj3" forKey:@"key3"];
    
    [mutDictionary removeObjectForKey:@"key3"];
    
    NSString *value1 = [mutDictionary objectForKey:@"key1"];
    NSString *otherValue = mutDictionary[@"key1"];
    
    for (id key in mutDictionary) {
        NSLog(@"%@", mutDictionary[key]);
    }
    
    [mutDictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
    
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
//    NSArray *foods = @[spaghetti, fish, chicken];
//
//    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:@"self.name" ascending:YES];
//    NSArray* descriptors = @[descriptor];
//    NSArray* sortedArray = [foods sortedArrayUsingDescriptors:descriptors];
//
//    for (Food *f in sortedArray) {
//        NSLog(@"%@", f.name);
//    }
    
//    self.array = [NSMutableArray arrayWithArray:@[@"one", @"two", @"three"]];
//
//    BOOL isOneInArray = [self isItemInArray:@"one"];
//    BOOL isTwoInArray = [self isItemInArray:@"one"];
//
//    [self sortArray];
    
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.textField.text = @"Hello world";

//    NSArray *array = [NSArray array];
//    NSArray *anotherArray = @[@"one" , @"two"];
//    NSMutableArray *mutArray = [NSMutableArray arrayWithArray:@[@"one", @"two", @"three"]];
//    [mutArray addObject:@"four"];
//    [mutArray removeObject:@"three"];
//    [mutArray removeLastObject];
//
//    for (NSString *item in mutArray) {
//        NSLog(@"%@", item);
//    }
//
//    [mutArray enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
//        NSLog(@"%@", obj);
//    }];
    
//    [Food canBeInstanced];
//    Food *food = [[Food alloc] init];
//    [food name:@"param1" anotherName:@"param2"];

//    Food *food = [[Food alloc] init];
//    Food *food2 = [Food new];
//
//    int counter;
//    NSString *message = @"hello";
}


- (BOOL) isItemInArray:(NSString*) item {
    if([self.array containsObject:item]) {
        return YES;
    }
    return NO;
}

- (BOOL) isItemInArrayUsingIndexOf:(NSString*) item {
    NSUInteger index = [self.array indexOfObject:item];
    if (index == NSNotFound) {
        return NO;
    }
    return YES;
}

- (void) sortArray {
    
    self.array = [NSMutableArray arrayWithArray:@[@1,@2,@6,@4,@3]];
    
    //1
    [self.array sortUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
        if (obj1 < obj2) {
            return NSOrderedAscending;
        } else if (obj2 == obj1) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSArray* sortedArray = [self.array sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
        if (obj1 < obj2) {
            return NSOrderedAscending;
        } else if (obj2 == obj1) {
            return NSOrderedSame;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"%@", self.array);
    NSLog(@"%@", sortedArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTestMethod:(id)sender {
    self.imageView.backgroundColor = [UIColor greenColor];
}


@end
