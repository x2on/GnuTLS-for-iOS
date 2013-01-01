//
//  GnuTLS_for_iOSAppDelegate.m
//  GnuTLS-for-iOS
//
//  Created by Felix Schulze on 01.02.11.
//  Copyright 2010 Felix Schulze. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.


#import "GnuTLS_for_iOSAppDelegate.h"
#import "VersionHelper.h"
#include <gnutls/openssl.h>

@implementation GnuTLS_for_iOSAppDelegate

@synthesize window, textField, md5TextField;

#pragma mark -
#pragma mark OpenSSL

- (IBAction)calculateMD5:(id)sender
{
	/** Calculate MD5*/
	NSString *string =  textField.text;
    unsigned char *inStrg = (unsigned char*)[[string dataUsingEncoding:NSASCIIStringEncoding] bytes];
    unsigned long lngth = [string length];
	unsigned char result[MD5_DIGEST_LENGTH];
	NSMutableString *outStrg = [NSMutableString string];
	
    MD5(inStrg, lngth, result);
	
    unsigned int i;
    for (i = 0; i < MD5_DIGEST_LENGTH; i++)
    {
        [outStrg appendFormat:@"%02x", result[i]];
    }
	md5TextField.text = outStrg;
	
	//Hide Keyboard after calculation
	[textField resignFirstResponder];
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (IBAction)showInfo {
    NSString *message = [NSString stringWithFormat:@"GnuTLS-Version: %@\nlibgcrypt-Version: %@\nlibgpg-error-Version: %@\n\nLicense: See include/*/LICENSE\n\nCopyright 2011-2013 by Felix Schulze\n http://www.felixschulze.de",[VersionHelper gnutlsVersion], [VersionHelper libgcryptVersion], [VersionHelper libgpgerrorVersion]];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"GnuTLS-for-iOS" message:message delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
	
	[alert show];
	[alert release];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
