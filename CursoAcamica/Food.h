//
//  Food.h
//  CursoAcamica
//
//  Created by Juan Pablo Ospina Herrera on 3/27/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *foodDescription;
@property (nonatomic, strong) NSString *imageName;

- (void) name:(NSString*) parameter1 anotherName:(NSString*) parameter2;
+ (BOOL) canBeInstanced;

@end
