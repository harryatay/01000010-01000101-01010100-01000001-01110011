//
//  ViewController.h
//  QU!Z
//
//  Created by Harry Atay on 15/07/2014.
//  Copyright (c) 2014 Harry Atay. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Social;

@interface ViewController : UIViewController <UIActionSheetDelegate>

- (IBAction)wrongAnswer;

- (IBAction)reset;

- (IBAction)wrongAnswerLevelTwo;

- (IBAction)wrongAnswerLevelThree;

- (IBAction)social:(id)sender;

- (IBAction)scoreLevelThree:(id)sender;

- (IBAction)questionThirtyHint:(id)sender;

@end
