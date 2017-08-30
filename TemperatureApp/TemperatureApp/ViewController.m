//
//  ViewController.m
//  TemperatureApp
//
//  Created by pavan krishna on 22/02/17.
//  Copyright © 2017 KSU. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <AFHTTPSessionManager.h>

static NSString * const kAPIUrl = @"http://api.openweathermap.org/data/2.5/weather?id=4276614&appid=0f7e07a9d99396dcf15d793331c720b8";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    int result = 0;
    
    result = 2;
    
//    [self.temperatureLabel setText:@(result).stringValue];
//    [self.temperatureLabel setText:[NSString stringWithFormat:@"%d",result]];

    // Do any additional setup after loading the view, typically from a nib.
    [self doApiCall];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doApiCall;
{

    // 2.0 code
//    NSURL *url = [NSURL URLWithString:kAPIUrl];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    operation.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"responseObject:%@",responseObject);
//        
//        NSDictionary *mainDictionary = [responseObject objectForKey:@"main"];
//        
//        NSString *temperatureinCelsius = [NSString stringWithFormat:@"%@ºc",[mainDictionary objectForKey:@"temp"]];
//        
//        [self.temperatureLabel setText:temperatureinCelsius];
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"error:%@",error);
//
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
//                                                            message:[error localizedDescription]
//                                                           delegate:nil
//                                                  cancelButtonTitle:@"Ok"
//                                                  otherButtonTitles:nil];
//        [alertView show];
//    }];
//    
//    [operation start];
    
    
    // 3.0 code
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *params = @{@"email": @"dilip@kent.edu",
                             @"password": @"123456"};
    
    [manager POST:@"http://parkapps.kent.edu/ksu-cco/ios/login_check.php" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
         NSLog(@"JSON: %@", responseObject);
//        [[self navigationController] pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>]
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
    
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    
//    [manager GET:kAPIUrl parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//                NSLog(@"responseObject:%@",responseObject);
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//                NSLog(@"error:%@",error);
//        
//    }];
}

-(void)parseJSONSData;
{
    
}




@end
