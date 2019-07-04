//
//  NGCharacterController.m
//  HPOBJC_ClimbAfternoon_27
//
//  Created by Nic Gibson on 7/4/19.
//  Copyright © 2019 RYAN GREENBURG. All rights reserved.
//

#import "NGCharacterController.h"

static NSString * const baseURLString = @"https://www.potterapi.com/v1/";
static NSString * const characterString = @"character";
static NSString * const apiKeyString = @"key";
static NSString * const apiKeyValue = @"$2a$10$2RF1hLCoO1UyKIgiUxdkUeKd3uAK.J7J0kj36minrLmvksbQt5OwC";

@implementation NGCharacterController

+(instancetype)sharedInstance
{
    // Make sure an instance of NGCharacterController does not already exist
    static NGCharacterController *sharedInstance = nil;
    // Dispatch the creation to a group, run it once, keep the token
    static dispatch_once_t onceToken;
    // Checks the token, if it exists, return out of the function
    dispatch_once(&onceToken, ^{
        // Init the shared instance
        sharedInstance = [NGCharacterController new];
    });
    // Return the shared instance
    return sharedInstance;
}

// Fetch function implementation
- (void)fetchCharacters:(void (^)(NSArray<NGCharacter *> *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *characterURL = [baseURL URLByAppendingPathComponent:characterString];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:characterURL resolvingAgainstBaseURL:true];
    
    // Add query
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:apiKeyString value:apiKeyValue];
    urlComponents.queryItems = @[apiKey];
    //Final URL
    NSURL *finalURL = urlComponents.URL;
    NSLog(@"%@",finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (data)
        {
            
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
                completion(nil);
                return;
            }
            // Temporary Array
            NSMutableArray *charactersArray = [NSMutableArray new];
            
            // Loop through the dictionaries found
            for (NSDictionary *characterDictionary in topLevelDictionary)
            {
                // Init the character from the dictionary found
                NGCharacter *character = [[NGCharacter alloc] initWithDictionary:characterDictionary];
                // Append the init character to the temp array
                [charactersArray addObject:character];
                // Complete with the temp array
                completion(charactersArray);
            }
        }
    }] resume];
}

@end
