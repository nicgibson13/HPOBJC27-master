//
//  NGCharacter.m
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Nic Gibson on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "NGCharacter.h"

static NSString * const nameKey = @"name";
static NSString * const wandKey = @"wand";
static NSString * const houseKey = @"house";
static NSString * const bloodStatusKey = @"bloodStatus";
static NSString * const deathEaterKey = @"deathEater";

@implementation NGCharacter

- (instancetype)initWithName:(NSString *)name wand:(NSString *)wand house:(NSString *)house bloodStatus:(NSString *)bloodstatus deathEater:(bool)deatheater
{
    self = [super init];
    if (self)
    {
        _name = name;
        _wand = wand;
        _house = house;
        _bloodStatus = bloodstatus;
        _deathEater = deatheater;
    }
    return self;
}

@end

@implementation NGCharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[nameKey];
    NSString *wand = dictionary[wandKey];
    NSString *house = dictionary[houseKey];
    NSString *bloodStatus = dictionary[bloodStatusKey];
    BOOL deathEater = [dictionary[deathEaterKey] boolValue];
    
    // Initialize a character with the values from the keys we described.
    return [self initWithName:name wand:wand house:house bloodStatus:bloodStatus deathEater:deathEater];
}

@end
