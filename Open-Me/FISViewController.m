//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UIView *buttonsContainer;
@property (strong, nonatomic) IBOutlet UIButton *oneButton;
@property (strong, nonatomic) IBOutlet UIButton *twoButton;
@property (strong, nonatomic) IBOutlet UIButton *threeButton;
@property (strong, nonatomic) IBOutlet UIButton *fourButton;
@property (strong, nonatomic) IBOutlet UIButton *fiveButton;
@property (strong, nonatomic) IBOutlet UIButton *sixButton;
@property (strong, nonatomic) IBOutlet UIButton *sevenButton;
@property (strong, nonatomic) IBOutlet UIButton *eightButton;
@property (strong, nonatomic) IBOutlet UIButton *nineButton;
@property (strong, nonatomic) IBOutlet UIButton *zeroButton;
@property (strong, nonatomic) IBOutlet UIButton *divideButton;
@property (strong, nonatomic) IBOutlet UIButton *multiplyButton;
@property (strong, nonatomic) IBOutlet UIButton *subtractionButton;
@property (strong, nonatomic) IBOutlet UIButton *additionButton;
@property (strong, nonatomic) IBOutlet UIButton *equalButton;
@property (strong, nonatomic) IBOutlet UIButton *decimalButton;
@property (strong, nonatomic) NSDictionary *viewsDictionary;
@property (weak, nonatomic) IBOutlet UIView *textFieldContainer;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewsDictionary = @{ @"oneButton": self.oneButton,
                              @"twoButton": self.twoButton,
                              @"threeButton": self.threeButton,
                              @"fourButton": self.fourButton,
                              @"fiveButton": self.fiveButton,
                              @"sixButton": self.sixButton,
                              @"sevenButton": self.sevenButton,
                              @"eightButton": self.eightButton,
                              @"nineButton": self.nineButton,
                              @"zeroButton": self.zeroButton,
                              @"divideButton": self.divideButton,
                              @"subtractButton": self.subtractionButton,
                              @"additionButton": self.additionButton,
                              @"equalButton": self.equalButton,
                              @"decimalButton": self.decimalButton,
                              @"buttonsContainer": self.buttonsContainer,
                              @"textField": self.textField,
                              @"textFieldContainer": self.textFieldContainer
                             };
    
    [self.view removeConstraints:self.view.constraints];
    for (UIView *view in self.viewsDictionary.allValues)
    {
        [self removeIBConstraintsFromView:view];
    }
    
    [self addContainerConstraints];
    [self addButtonConstraints];
    [self addTextFieldConstraints];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)addContainerConstraints
{
    NSArray *hTextContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[textFieldContainer]|" options:0 metrics:nil views:self.viewsDictionary];
    [self.view addConstraints:hTextContainerConstraints];
    
    NSArray *hButtonContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[buttonsContainer]|" options:0 metrics:nil views:self.viewsDictionary];
    [self.view addConstraints:hButtonContainerConstraints];
    
    NSArray *vContainerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[textFieldContainer][buttonsContainer(==textFieldContainer)]|" options:0 metrics:nil views:self.viewsDictionary];
    [self.view addConstraints:vContainerConstraints];
}

-(void)addButtonConstraints
{
//    NSArray *hFirstRowConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[oneButton][twoButton(==oneButton)][threeButton(==oneButton)][divideButton(==oneButton)]|" options:0 metrics:nil views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:hFirstRowConstraints];
//    NSArray *vFirstRowConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[oneButton][fourButton(oneButton)][sevenButton(oneButton)][zeroButton(oneButton)]|" options:0 metrics:nil views:self.viewsDictionary];
//    [self.buttonsContainer addConstraints:vFirstRowConstraints];
    
    [self addButtonRowConstraintsForViews:@[ self.oneButton, self.twoButton, self.threeButton, self.divideButton]];
    [self addButtonRowConstraintsForViews:@[ self.fourButton, self.fiveButton, self.sixButton, self.multiplyButton]];
    [self addButtonRowConstraintsForViews:@[ self.sevenButton, self.eightButton, self.nineButton, self.subtractionButton]];
    [self addButtonRowConstraintsForViews:@[ self.zeroButton, self.decimalButton, self.equalButton, self.additionButton]];
    
    [self addButtonColumnConstraintsForViews:@[ self.oneButton, self.fourButton, self.sevenButton, self.zeroButton]];
    [self addButtonColumnConstraintsForViews:@[ self.twoButton, self.fiveButton, self.eightButton, self.decimalButton]];
    [self addButtonColumnConstraintsForViews:@[ self.threeButton, self.sixButton, self.nineButton, self.equalButton]];
    [self addButtonColumnConstraintsForViews:@[ self.divideButton, self.multiplyButton, self.subtractionButton, self.additionButton]];
}

-(void)addButtonRowConstraintsForViews:(NSArray *)views
{
    NSDictionary *localViewDictionary = @{  @"view1": views[0],
                                            @"view2": views[1],
                                            @"view3": views[2],
                                            @"view4": views[3]  };
    
    NSArray *rowConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[view1][view2(==view1)][view3(==view1)][view4(==view1)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:localViewDictionary];
    [self.buttonsContainer addConstraints:rowConstraints];
}

-(void)addButtonColumnConstraintsForViews:(NSArray *)views
{
    NSDictionary *localViewDictionary = @{  @"view1": views[0],
                                            @"view2": views[1],
                                            @"view3": views[2],
                                            @"view4": views[3]  };
    
    NSArray *columnConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view1][view2(==view1)][view3(==view1)][view4(==view1)]|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:localViewDictionary];
    [self.buttonsContainer addConstraints:columnConstraints];
}

-(void)addTextFieldConstraints
{
    NSArray *vTextFieldConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(myPadding)-[textField]" options:0 metrics:@{ @"myPadding": @30 } views:self.viewsDictionary];
    [self.textFieldContainer addConstraints:vTextFieldConstraints];
    
    NSArray *hTextFieldConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20.0-[textField]-20.0-|" options:0 metrics:nil views:self.viewsDictionary];
    [self.textFieldContainer addConstraints:hTextFieldConstraints];
}

-(void)removeIBConstraintsFromView:(UIView *)view
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view removeConstraints:view.constraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
